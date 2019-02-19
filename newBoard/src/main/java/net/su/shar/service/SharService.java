package net.su.shar.service;

import java.util.List;

import net.su.shar.vo.SharValueObject;

public interface SharService {
	// 전체 멤버
	public List<SharValueObject> selectMemList(SharValueObject sharVo) throws Exception; 
	
	// 공유 되지 않는 사람 카운트
	public SharValueObject noneSharMemCount(SharValueObject sharVo) throws Exception;
	
	// 공유 임시저장소 List
	public List<SharValueObject> selectDumpList(SharValueObject sharVo) throws Exception; 
	
	// 공유 되지 않은 리스트
	public List<SharValueObject> selectNonSharList(SharValueObject sharVo) throws Exception;
}
