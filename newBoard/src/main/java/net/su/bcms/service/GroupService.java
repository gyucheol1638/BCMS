package net.su.bcms.service;

import java.util.List;
import net.su.bcms.vo.GroupValueObject; 

public interface GroupService {

	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception; // 그룹명 조회
}
