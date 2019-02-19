package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import net.su.bcms.dao.CardDataAccessObject;
import net.su.bcms.vo.CardValueObject;
import net.su.bcms.vo.ComnctnNmeCardValueObject;
import net.su.login.vo.MemberValueObject;

@Service
public class CardServiceImpl implements CardService {

	@Resource
	private CardDataAccessObject cardDao;
	  
	public List<CardValueObject> cardselect(CardValueObject cvo) throws Exception{
		
		int selectNmeCardCount = cardDao.selectNmeCardCount(cvo);
		List<CardValueObject> cardselect = cardDao.cardselect(cvo);
		cvo.setTotalRecordCount(selectNmeCardCount);
		return cardselect;
	}
	//회원 리스트 조회
		public List<MemberValueObject> selectMemList() throws Exception{
			
			List<MemberValueObject> selectMemList = cardDao.selectMemList();
			return selectMemList;
		}
		
	//명함 자격증 목록
		public List<CardValueObject> selectLicnsList() throws Exception{
			
			List<CardValueObject> selectLicnsList = cardDao.selectLicnsList();
			return selectLicnsList;
		}
	
	public void CardInsert(CardValueObject cvo) throws Exception{
		
		cardDao.CardInsert(cvo);
	}
	
	//명함 상세조회 화면
	public CardValueObject selectcardview(CardValueObject cvo) throws Exception{
		
		CardValueObject selectcardview =cardDao.selectcardview(cvo);
		
		return selectcardview;
	}
	//명함 수정완료
	public void updateNmeCard(CardValueObject cvo) throws Exception {
		
		cardDao.updateNmeCard(cvo);
	}
	//명함 삭제완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception{
		
		cardDao.deleteNmeCard(deleteArray);
	}
	//명함 완전삭제완료
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception{
			
		cardDao.deleteNmeCardBin(deleteArray);
	}
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception{
		
		cardDao.recvyNmeCardBin(deleteArray);
	}
	//명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		System.out.println("NmeCardServiceimpl의 selectNmeCardList()작동");
		int selectNmeCardComnctnCount = cardDao.selectNmeCardComnctnCount(comnctnNmeCardValueObject);
		List<ComnctnNmeCardValueObject> selectNmeCardComnctnList = cardDao.selectNmeCardComnctnList(comnctnNmeCardValueObject);
		comnctnNmeCardValueObject.setComnctnTotalRecordCount(selectNmeCardComnctnCount);
		return selectNmeCardComnctnList;
	}
	//커뮤니케이션 등록완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		
		System.out.println("쉼표가뜨는지 확인하는 서비스"+comnctnNmeCardValueObject.getComnctnType());
		cardDao.insertNmeCardComnctn(comnctnNmeCardValueObject);
	}
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception{
		
		cardDao.insertAtnd(atndSeqList, comnctnSeq);
	}
}
