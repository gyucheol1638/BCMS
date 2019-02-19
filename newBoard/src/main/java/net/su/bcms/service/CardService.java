package net.su.bcms.service;

import net.su.bcms.vo.CardValueObject;
import net.su.bcms.vo.ComnctnNmeCardValueObject;
import net.su.login.vo.MemberValueObject;

import java.util.ArrayList;
import java.util.List;

public interface CardService {

	public List<CardValueObject> cardselect(CardValueObject cvo) throws Exception;  
	
	//회원 리스트 조회
	public List<MemberValueObject> selectMemList() throws Exception;
	
	//명함 자격증 목록
	public List<CardValueObject> selectLicnsList() throws Exception;
	
	public void CardInsert(CardValueObject cvo) throws Exception;  
	
	public CardValueObject selectcardview(CardValueObject cvo) throws Exception;
	
	//명함 수정 완료
	public void updateNmeCard(CardValueObject cvo) throws Exception;
	
	//명함 삭제 완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception;
	
	//명함 완전 삭제 완료
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception;
	
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception;
	
	//커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//커뮤니케이션 등록 완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception;
 }
