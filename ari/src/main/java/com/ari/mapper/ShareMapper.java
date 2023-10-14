package com.ari.mapper;

import java.util.*;

import com.ari.like.model.LikeDTO;
import com.ari.plan.model.PlanTableDTO;
import com.ari.share.model.*;

public interface ShareMapper {

	public List<PlanTableDTO> planList(String userId);
	
	public List<ShareDTO> shareList();
	
	public ShareDTO shareDetail(int idx);
	
	public int share(ShareDTO dto);
	
	public PlanTableDTO plan(int idx);
	
	public int readNum(int idx);
	
	public int shareDel(int idx);
	
	public List<ShareDTO> myShare(String userId);
	
	public int shareLike(LikeDTO dto);
}
