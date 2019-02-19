package net.su.bcms.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.bcms.vo.GroupValueObject;

@Repository
public class GroupDataAccessObject extends SqlSessionDaoSupport {

	// 그룹명 조회
	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception
	{
	
		List<GroupValueObject> groupList = getSqlSession().selectList("groupMapper.groplist", groupValueObject);
		return groupList;
	}
}
