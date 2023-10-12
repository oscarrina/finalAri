package com.ari.mapper;

import java.util.*;

import com.ari.plan.model.PlanTableDTO;
import com.ari.share.model.*;

public interface ShareMapper {

	public List<PlanTableDTO> planList(String userId);
	
	public List<ShareDTO> shareList();
	
	public List<ShareDTO> shareDetail(int idx);
	
	public int share(ShareDTO dto);
	
	public List<PlanTableDTO> plan(int idx);
	
	public int readNum(int idx);
	
	public int shareDel(int idx);
	
	public List<ShareDTO> myShare(String userId);
}
