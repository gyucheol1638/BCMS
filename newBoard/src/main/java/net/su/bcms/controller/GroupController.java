package net.su.bcms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.su.bcms.service.GroupService;
import net.su.bcms.vo.GroupValueObject;
import net.su.login.vo.MemberValueObject;

@Controller
public class GroupController {

	@Resource
	private GroupService groupService;
	 @RequestMapping(value = "/groupListForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String groupListForm(GroupValueObject groupValueObject, Model model, HttpSession session)throws Exception {
		   
		   session.getAttribute("logininfo");
			MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
			groupValueObject.setMemSeq(logininfo.getMemSeq());

		   List<GroupValueObject> groupList = groupService.gropSelect(groupValueObject);
	    	model.addAttribute("groupList", groupList);
	 
//	       List<GroupValueObject> groupWholeList = groupService.groupWholeList(groupValueObject);   	
//	    	model.addAttribute("groupWholeList", groupWholeList);
	    		        
	      return "group/groupListForm";
	   }
	
}
