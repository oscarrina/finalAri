package com.ari.share.service;

import java.util.*;
import com.ari.plan.model.*;
import com.ari.share.model.*;

public interface ShareService {

	public List<PlanTableDTO> planList(String userId) throws Exception;
	
	public List<ShareDTO> shareList() throws Exception;
	
	public List<ShareDTO> shareDetail(int idx) throws Exception;
	
	public int share(ShareDTO dto) throws Exception;
	
	public List<PlanTableDTO> plan(int planIdx) throws Exception;
	
	public int readNum(int idx) throws Exception;
	
	public int shareDel(int idx) throws Exception;
	
	public List<ShareDTO> myShare(String userId) throws Exception;
}
