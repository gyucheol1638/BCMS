package net.su.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.bcms.vo.CardValueObject;
import net.su.login.dao.MemberDataAccessObject;
import net.su.login.security.Base64Utils;
import net.su.login.vo.CompanyValueObject;
import net.su.login.vo.MemberValueObject;

@Service
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberDataAccessObject MemberDataAccessObject;
	
	Base64Utils base64 = new Base64Utils();//요놈선언
	String encryptKey = "temp11111111111111111111";//key 선언 
	//키값은 무조건 24자리이여야 한듯.
	//Base64Utils.java 파일에서 키값의 길이를 수정하면 될것도 같으나,
	//seed 암호화에서 key값이 원래 24자리가 필요할지도 몰라서 그냥 1로 채움
	//seed + base64 암호화, 복호화
	
	
	
	public List<CompanyValueObject> companylist() throws Exception{
		
		List<CompanyValueObject> companylist = MemberDataAccessObject.companylist();
		
		return companylist;
	}
	
	public List<CompanyValueObject> departlist() throws Exception{
		
		List<CompanyValueObject> departlist = MemberDataAccessObject.departlist();
		
		return departlist;
	}
	
	
	
	//아이디 중복 확인
	public Map<String, Object> idCount (String memId) throws Exception{
		
		int idCount =  MemberDataAccessObject.idCount(memId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("idCount", idCount);
		
		return map;
		
	}
	// 로그인 
	public MemberValueObject loginCheck (MemberValueObject vo) throws Exception{
			
			MemberValueObject mvo = new MemberValueObject();
			
			String W_ORG_FG = vo.getMemPw();
			//암호화 pw
			String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
			vo.setMemPw(EN_ORG_FG);
			
			mvo =  MemberDataAccessObject.loginCheck(vo);
			
		
			
			return mvo;
			
		}
	public void insertMembership (MemberValueObject vo) throws Exception {
		
		String W_ORG_FG = vo.getMemPw();
		//암호화 pw
		String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
		vo.setMemPw(EN_ORG_FG);
		
		
		MemberDataAccessObject.insertMembership(vo);
		
	}
}
