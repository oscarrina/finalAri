package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.reser.model.ReserDTO;

public interface ReserMapper {

	public List<ReserDTO> reserSelect(Map map);
	public int reserTotalCnt(String userId);
	public int reserCancel(int reserIdx);
	public int reserVisitDel(int idx);
	public ReserDTO reserForm(Map map);
	public int reserInsert(ReserDTO dto);
	public int reserVisitInsert(List<ReserDTO> list);
	public String berthInfoName(int idx);
	public ReserDTO ceoCancelSMS(int berthIdx);
	public int reserPayState(int reserIdx);
}
