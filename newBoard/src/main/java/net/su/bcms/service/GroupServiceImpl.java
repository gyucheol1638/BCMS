package net.su.bcms.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.bcms.dao.GroupDataAccessObject;
import net.su.bcms.vo.GroupValueObject;

@Service
public class GroupServiceImpl implements GroupService {

	@Resource
	private GroupDataAccessObject groupDataAccessObject;
	
	// 그룹명 조회
	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception{
		
		List<GroupValueObject> groupList = groupDataAccessObject.gropSelect(groupValueObject);
		
		return groupList;
	}
}
