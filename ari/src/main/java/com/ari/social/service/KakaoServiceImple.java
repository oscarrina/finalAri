package com.ari.social.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ari.mapper.MemberMapper;
import com.ari.member.model.MemberDTO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;

@Service
public class KakaoServiceImple implements KakaoService {

	@Autowired
	private MemberMapper mapper;
	private static final String SECRET_KEY = "hcz3QkD7urPS2tpzxzvNRvAFwaVv1ccq";
	 private static final String CLIENT_ID = "3623a44fed0e1055e089acc18ec7aacf";
			
	@Override
	public int getUserInfo(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    int check = 0;
	    try {
	    	
	    	URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        //JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        //JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        String userid = element.getAsJsonObject().get("id").toString();
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("userid", userid);
	        check = mapper.kakaoCheck(userid);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return check;
	}

	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=3623a44fed0e1055e089acc18ec7aacf");
            sb.append("&redirect_uri=http://localhost:9091/oauth/kakao");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            HttpSession session = request.getSession();
            session.setAttribute("userToken", refresh_Token);
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
	}
	@Override
	public boolean KakaoTokenValidator(String token) {
		try {
            Claims claims = Jwts.parser()
                    .setSigningKey(SECRET_KEY)
                    .parseClaimsJws(token)
                    .getBody();

            // 여기서 필요한 유효성 검사를 수행합니다.
            // 예를 들어, 토큰의 만료 여부, 발급자 확인 등을 검사할 수 있습니다.

            // 만료 여부 확인 (exp: 필드에 토큰의 만료 시간이 포함되어 있다고 가정)
            long expirationTimeMillis = claims.get("exp", Long.class) * 1000L; // 초를 밀리초로 변환
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis > expirationTimeMillis) {
                return false; // 토큰이 만료됨
            }

            // 발급자 확인 (iss: 필드에 토큰 발급자 정보가 포함되어 있다고 가정)
            String issuer = claims.get("iss", String.class);
            if (!"https://kauth.kakao.com".equals(issuer)) {
                return false; // 올바른 발급자가 아님
            }

            // 필요한 다른 유효성 검사를 수행할 수 있습니다.

            return true; // 토큰이 유효함
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 토큰 검증 실패
        }
	}

	@Override
	public String renewAccessToken(String userid) throws IOException{
		String kakaoTokenEndpoint = "https://kauth.kakao.com/oauth/token";
        URL url = new URL(kakaoTokenEndpoint);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // HTTP 요청 설정
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        connection.setDoOutput(true);

        String refreshToken = mapper.kakaoToken(userid);
        
        // 요청 본문 작성
        String requestBody = "grant_type=refresh_token" +
                "&client_id=" + CLIENT_ID +
                "&client_secret=" + SECRET_KEY +
                "&refresh_token=" + refreshToken;

        // 요청 전송
        try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
            wr.writeBytes(requestBody);
            wr.flush();
        }

        // 응답 처리
        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            return response.toString();
        } else {
            System.err.println("토큰 갱신 실패: " + responseCode);
            return null;
        }
	}
	@Override
	public int kakaoJoin(MemberDTO dto) throws Exception{
		int result = mapper.kakaoJoin(dto);
		return result;
	}
}
