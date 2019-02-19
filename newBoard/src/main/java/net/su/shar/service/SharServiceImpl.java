package net.su.shar.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.shar.dao.SharDataAccessObject;
import net.su.shar.vo.SharValueObject;

@Service
public class SharServiceImpl implements SharService {
	
	@Resource
	private SharDataAccessObject sharDataAccessObject;
	
	// 전체 멤버
		public List<SharValueObject> selectMemList(SharValueObject sharVo) throws Exception{
			List<SharValueObject> selectMemList  = sharDataAccessObject.selectMemList(sharVo);
			return selectMemList;
		}
	// 공유 되지 않는 사람 카운트
		public SharValueObject noneSharMemCount(SharValueObject sharVo) throws Exception{
//			   if(sharVo.getSharSearchCnd()==2)
//			   {
//				   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
//			   }
			SharValueObject countVo = new SharValueObject();
			countVo.setSharTotalRecordCount(sharDataAccessObject.noneSharMemCount(sharVo));
	        
			return countVo;
		}
		// 공유 임시저장소 List
		public List<SharValueObject> selectDumpList(SharValueObject sharVo) throws Exception{
	         List<SharValueObject> dumpMemList = sharDataAccessObject.selectDumpList(sharVo);
	      return dumpMemList;   
		}
		// 공유 되지 않은 리스트
		public List<SharValueObject> selectNonSharList(SharValueObject sharVo) throws Exception{
//		   if(sharVo.getSharSearchCnd()==2)
//		   {
//			   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
//		   }
		   List<SharValueObject> nonSharMemList = sharDataAccessObject.selectNonSharList(sharVo);
	       return nonSharMemList;   
		}
				
}
