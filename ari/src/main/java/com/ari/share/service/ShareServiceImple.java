package com.ari.share.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ari.mapper.ShareMapper;
import com.ari.plan.model.PlanTableDTO;
import com.ari.share.model.ShareDTO;

@Service
public class ShareServiceImple implements ShareService {

	@Autowired
	private ShareMapper mapper;
	
	@Override
	public List<PlanTableDTO> planList(String userId) throws Exception {
		List<PlanTableDTO> plan=mapper.planList(userId);
		return plan;
	}
	
	@Override
	public List<ShareDTO> shareList() throws Exception {
		List<ShareDTO> lists=mapper.shareList();
		return lists;
	}

	@Override
	public int share(ShareDTO dto) {
		int result=0;
		result=mapper.share(dto);
		return result;
	}
	
	@Override
	public List<ShareDTO> shareDetail(int idx) throws Exception {
		List<ShareDTO> list=mapper.shareDetail(idx);
		return list;
	}
	
    @Override
	public List<PlanTableDTO> plan(int planIdx) throws Exception {
		List<PlanTableDTO> list=mapper.plan(planIdx);
		return list;
	}
    
    @Override
    public int readNum(int idx) throws Exception{
    	int result=mapper.readNum(idx);
    	return result;
    }
    
    @Override
    public int shareDel(int idx) throws Exception {
    	int result=mapper.shareDel(idx);
    	return result;
    }
    
    @Override
    public List<ShareDTO> myShare(String userId) throws Exception {
    	List<ShareDTO> list=mapper.myShare(userId);
    	return list;
    }
}
