package com.ari.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.reser.model.ReserDTO;
import com.ari.reser.service.ReserService;

import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/")
public class ReserController {

	@Autowired
	private ReserService service;
	
	@GetMapping("reserForm")
	public ModelAndView reserForm(@RequestParam("berthIdx") int berthIdx,
			@RequestParam("idx") int idx,ReserDTO dto,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			HttpServletRequest request) throws ParseException {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String userid = (String) session.getAttribute("sid");
		if(userid == null || userid.equals("")) {
			mav.addObject("msg", "로그인 후 이용바랍니다.");
			mav.addObject("url", "/memberLogin");
			mav.setViewName("msg");
			return mav;
		}
		dto = service.reserForm(berthIdx,idx);
		dto.setReserVisitStart(startDate);
		dto.setReserVisitEnd(endDate);
		dto.setBerthIdx(berthIdx);
		dto.setIdx(idx);
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
        long diffSec = (format1.getTime() - format2.getTime()) / 1000; //초 차이
        long diffDays = diffSec / (24*60*60); //일자수 차이
        dto.setReserPrice(dto.getReserPrice()*(int)diffDays);
		mav.addObject("dto", dto);
		mav.addObject("userid", userid);
		mav.setViewName("reser/reserForm");
		return mav;
	}
	@GetMapping("/pay/success")
	public String paymentResult(
            Model model,
            @RequestParam(value = "orderId") String orderId, //주문번호
            @RequestParam(value = "amount") Integer amount, //총 가격
            @RequestParam(value = "paymentKey") String paymentKey,
            HttpServletRequest req) throws Exception {

		List<ReserDTO> list = new ArrayList<ReserDTO>();
		ReserDTO dto = new ReserDTO();
		HttpSession session = req.getSession();
		int berthIdx = (Integer.parseInt(req.getParameter("berthIdx")));
		int idx = (Integer.parseInt(req.getParameter("idx")));
		dto.setBerthIdx(berthIdx);
		dto.setIdx(idx);
		dto.setReserVisitStart(req.getParameter("reserVisitStart"));
		dto.setReserVisitEnd(req.getParameter("reserVisitEnd"));
		dto.setReserTel(req.getParameter("reserTel"));
		dto.setReserName(req.getParameter("reserName"));
		dto.setUserId((String) session.getAttribute("sid"));
		dto.setReserPaymentKey(paymentKey);
		dto.setReserPrice(amount);
		dto.setBerthInfoName(service.berthInfoName(idx));
		service.reserInsert(dto);
		
		model.addAttribute("berthInfoName", dto.getBerthInfoName());
		model.addAttribute("reserName", dto.getReserName());
		model.addAttribute("reserTel", dto.getReserTel());
		
		String visitStart = req.getParameter("reserVisitStart");
		String visitEnd = req.getParameter("reserVisitEnd");
		LocalDate startDate = LocalDate.parse(visitStart);
        LocalDate endDate = LocalDate.parse(visitEnd);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
        while (!startDate.isAfter(endDate)) {
        	ReserDTO dto2 = new ReserDTO();
        	String visitStartDate = startDate.format(formatter);
            dto2.setBerthIdx(berthIdx);
			dto2.setReserVisit(visitStartDate);
            list.add(dto2);
            startDate = startDate.plusDays(1);
        }
		service.reserVisitInsert(list);
		
        String secretKey = "test_sk_pP2YxJ4K87PyEaAQlWv3RGZwXLOb:";

        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
        String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

        URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Authorization", authorizations);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        JSONObject obj = new JSONObject();
        obj.put("orderId", orderId);
        obj.put("amount", amount);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));

        int code = connection.getResponseCode();
        boolean isSuccess = code == 200 ? true : false;
        model.addAttribute("isSuccess", isSuccess);

        InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
        responseStream.close();
        model.addAttribute("responseStr", jsonObject.toJSONString());

        model.addAttribute("method", (String) jsonObject.get("method"));
        model.addAttribute("orderName", (String) jsonObject.get("orderName"));

        if (((String) jsonObject.get("method")) != null) {
            if (((String) jsonObject.get("method")).equals("카드")) {
                model.addAttribute("cardNumber", (String) ((JSONObject) jsonObject.get("card")).get("number"));
            } else if (((String) jsonObject.get("method")).equals("가상계좌")) {
                model.addAttribute("accountNumber", (String) ((JSONObject) jsonObject.get("virtualAccount")).get("accountNumber"));
            } else if (((String) jsonObject.get("method")).equals("계좌이체")) {
                model.addAttribute("bank", (String) ((JSONObject) jsonObject.get("transfer")).get("bank"));
            } else if (((String) jsonObject.get("method")).equals("휴대폰")) {
                model.addAttribute("customerMobilePhone", (String) ((JSONObject) jsonObject.get("mobilePhone")).get("customerMobilePhone"));
            }
        } else {
            model.addAttribute("code", (String) jsonObject.get("code"));
            model.addAttribute("message", (String) jsonObject.get("message"));
        }

        return "success";
    }
	
	@GetMapping("/pay/fail")
    public String paymentResult(
            Model model,
            @RequestParam(value = "message") String message,
            @RequestParam(value = "code") Integer code
    ) throws Exception {

        model.addAttribute("code", code);
        model.addAttribute("message", message);

        return "fail";
    }
	
	@PostMapping("/reserCancel")
	public ModelAndView reserCancel(@RequestParam("idx")int idx,
			@RequestParam("userType")String userType,@RequestParam("berthIdx")int berthIdx,
			@RequestParam("reserPaymentKey") String reserPaymentKey,
			@RequestParam("reserPrice")int reserPrice,ReserDTO dto
			) {
		ModelAndView mav = new ModelAndView();
		dto = service.ceoCancelSMS(idx);
		int cancelResult = service.reserCancel(idx);
		int delResult = service.reserVisitDel(berthIdx);
		if(cancelResult == 1 && delResult > 0) {
			mav.addObject("msg", "성공");
		}else {
			mav.addObject("msg", "실패");
		}
		mav.setViewName("member/idCheck_ok");

		String apiUrl = "https://api.tosspayments.com/v1/payments/"+reserPaymentKey+"/cancel";
        String apiToken = "dGVzdF9za19wUDJZeEo0Szg3UHlFYUFRbFd2M1JHWndYTE9iOg==";
        String idempotencyKey = "e9b779ed-3541-4b6e-aa95-88f710689a68";
        String cancelReason = "고객 변심";

        // HTTP 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + apiToken);
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Idempotency-Key", idempotencyKey);

        // JSON 형식의 요청 본문 생성
        String requestBody = "{\"cancelReason\":\"" + cancelReason + "\"}";

        // HTTP 요청 엔티티 설정
        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        // RestTemplate을 사용하여 API 호출 (결제 취소)
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);

        service.reserPayState(idx);
		return mav;
	}
}
