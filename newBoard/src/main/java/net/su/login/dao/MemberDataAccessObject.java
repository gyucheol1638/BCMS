package net.su.login.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.su.bcms.vo.CardValueObject;
import net.su.login.vo.CompanyValueObject;
import net.su.login.vo.MemberValueObject;


@Repository
public class MemberDataAccessObject extends SqlSessionDaoSupport{

	@Autowired
	private SqlSession sqlSession;


		
	public List<CompanyValueObject> companylist() throws Exception{
			
		List<CompanyValueObject> companylist = getSqlSession().selectList("memberMapper.companylist");
			
		return companylist;
	}
		
	public List<CompanyValueObject> departlist() throws Exception{
		
		List<CompanyValueObject> departlist = getSqlSession().selectList("memberMapper.departlist");
			

		System.out.println("DataSetController의 title.do 작동"+departlist);
		return departlist;
	}
	

	public int idCount(String memId) throws Exception{
		
		int idCount = getSqlSession().selectOne("memberMapper.idCount", memId);
		
		return idCount;
	}
	
	public MemberValueObject loginCheck (MemberValueObject vo) throws Exception{
			
		
		MemberValueObject mvo = getSqlSession().selectOne("memberMapper.loginCheck", vo);
			
			return mvo;
		}
	
	public void insertMembership (MemberValueObject vo) throws Exception {
		
		getSqlSession().insert("memberMapper.insertMembership", vo);
		
	}
}
