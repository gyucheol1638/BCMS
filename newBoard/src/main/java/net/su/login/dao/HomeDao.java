package net.su.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao extends SqlSessionDaoSupport{

	@Autowired
	private SqlSession sqlSession;


	

}
