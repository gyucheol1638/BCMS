package net.su.base.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.su.base.service.BaseService;
import net.su.login.vo.MemberValueObject;


@Controller
public class BaseController {
	
	@Resource
	private BaseService baseService;
	
	
	@RequestMapping(value = "/title.do", method={RequestMethod.GET, RequestMethod.POST})
	public String header(MemberValueObject vo, Model model, HttpSession session) throws Exception {
		
		System.out.println("BasicController의 title.do 작동");
		MemberValueObject loginInfo = (MemberValueObject)session.getAttribute("loginInfo");
		model.addAttribute("loginInfo", loginInfo);
		
		return "base/title";
	}
}