package net.su.shar.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.shar.vo.SharValueObject;

@Repository
public class SharDataAccessObject extends SqlSessionDaoSupport  {

	// 전체 멤버
	public List<SharValueObject> selectMemList(SharValueObject sharVo){
		List<SharValueObject> selectMemList = getSqlSession().selectList("sharMapper.selectMemList", sharVo);
		return selectMemList; 
	}
	// 공유 되지 않는 사람 카운트
	public int noneSharMemCount(SharValueObject sharVo){
		int noneSharMemCount = getSqlSession().selectOne("sharMapper.noneSharMemCount", sharVo);
		return noneSharMemCount;
	}

	// 공유 임시저장소 List
	public List<SharValueObject> selectDumpList(SharValueObject sharVo){
		List<SharValueObject> dumpMemList = getSqlSession().selectList("sharMapper.dumpMemList", sharVo);
		return dumpMemList;
	}
	// 공유 되지 않은 리스트
	public List<SharValueObject> selectNonSharList(SharValueObject sharVo){
		List<SharValueObject> nonSharMemList = getSqlSession().selectList("sharMapper.nonSharMemList", sharVo);
		return nonSharMemList;
	}
}
