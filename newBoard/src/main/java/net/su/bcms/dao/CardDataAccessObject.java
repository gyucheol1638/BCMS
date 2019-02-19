package net.su.bcms.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.su.bcms.vo.CardValueObject;
import net.su.bcms.vo.ComnctnNmeCardValueObject;
import net.su.login.vo.MemberValueObject;



@Repository
public class CardDataAccessObject extends SqlSessionDaoSupport{

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<CardValueObject> cardselect(CardValueObject cvo) throws Exception{
		
		List<CardValueObject> cardselect = getSqlSession().selectList("cardMapper.cardselect", cvo);
		
		return cardselect;
	}
	//회원 리스트 조회
	public List<MemberValueObject> selectMemList() throws Exception{
		
		List<MemberValueObject> selectMemList = getSqlSession().selectList("memberMapper.selectMemList");
		return selectMemList;		
	}
	//명함 자격증 목록
	public List<CardValueObject> selectLicnsList() throws Exception{
		
		List<CardValueObject> selectLicnsList =  getSqlSession().selectList("cardMapper.selectLicnsList");
		
		return selectLicnsList;
	}

	//명함레코드 조회
	public int selectNmeCardCount(CardValueObject cvo) throws Exception{
		
		int selectNmeCardCount = getSqlSession().selectOne("cardMapper.selectNmeCardCount", cvo);
		
		return selectNmeCardCount;
	}
	//명함등록
	public void CardInsert(CardValueObject cvo) throws Exception{
		
		getSqlSession().insert("cardMapper.CardInsert", cvo);
	}
	public CardValueObject selectcardview(CardValueObject cvo) throws Exception{
		
		CardValueObject selectcardview = getSqlSession().selectOne("cardMapper.selectcardview", cvo);
		return  selectcardview;
	}
	//명함 수정 완료
		public void updateNmeCard(CardValueObject cvo) throws Exception {
			
			getSqlSession().update("cardMapper.updateNmeCard", cvo);
		}
	//명함 삭제 완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception {
		
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("cardMapper.deleteNmeCard", nmeCardSeq);
		}
	}
	//명함 완전 삭제
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception {
		
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("cardMapper.deleteNmeCardBin", nmeCardSeq);
		}
	}
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception {
		
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("cardMapper.recvyNmeCardBin", nmeCardSeq);
		}
	}
	// 커뮤니케이션 리스트 카운트
	public int selectNmeCardComnctnCount(ComnctnNmeCardValueObject ComnctnNmeCardValueObject) throws Exception {
		
		int selectNmeCardComnctnCount = getSqlSession().selectOne("cardMapper.selectNmeCardComnctnCount", ComnctnNmeCardValueObject);
		return selectNmeCardComnctnCount;
	}
	//명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject ComnctnNmeCardValueObject) throws Exception {
		System.out.println("NmeCardDataAccessObject의 selectNmeCardComnctnList()작동");
		System.out.println(ComnctnNmeCardValueObject.getComnctnType()+"!!!!!!!!!!!!!!!!!!!!!!");
		List<ComnctnNmeCardValueObject> selectComnctnNmeCardList = getSqlSession().selectList("cardMapper.selectNmeCardComnctnList", ComnctnNmeCardValueObject);
		return selectComnctnNmeCardList;
		}
	//커뮤니케이션 등록 완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		
		System.out.println("쉼표가뜨는지 확인하는 Dao"+comnctnNmeCardValueObject.getComnctnType());
		getSqlSession().insert("cardMapper.insertNmeCardComnctn", comnctnNmeCardValueObject);
	}
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception{
		
		for(int i=0; i<atndSeqList.length;i++){
			String atndSeq = atndSeqList[i];
			ComnctnNmeCardValueObject comnctnNmeCardValueObject = new ComnctnNmeCardValueObject();
			comnctnNmeCardValueObject.setComnctnAtnd(atndSeq); //참석자 seq
			comnctnNmeCardValueObject.setComnctnSeq(comnctnSeq); //커뮤니 seq
			getSqlSession().insert("cardMapper.insertAtnd", comnctnNmeCardValueObject);
		}	
	}	
}
