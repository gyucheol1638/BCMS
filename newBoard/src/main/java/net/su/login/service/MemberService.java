package net.su.login.service;

import java.util.List;
import java.util.Map;

import net.su.bcms.vo.CardValueObject;
import net.su.login.vo.CompanyValueObject;
import net.su.login.vo.MemberValueObject;

public interface MemberService  {

	public List<CompanyValueObject> companylist() throws Exception;
	
	public List<CompanyValueObject> departlist() throws Exception;
	
	
	public Map<String, Object> idCount (String memId) throws Exception;
	
	public MemberValueObject loginCheck (MemberValueObject vo) throws Exception;
	
	public void insertMembership (MemberValueObject vo) throws Exception;
}
