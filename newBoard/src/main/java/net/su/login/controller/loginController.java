package net.su.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import net.su.login.service.MemberService;
import net.su.login.vo.CompanyValueObject;

import net.su.login.vo.MemberValueObject;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class loginController {

@Resource
private MemberService MemberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Value(Model model) throws Exception
	{
//		Map<String, Object> map = HomeService.getValue();
//		model.addAttribute(��value", map.get(��value"));
		return "loginform";
	}
	
	@RequestMapping(value = "/loginform.do", method = RequestMethod.GET)
	public String loginform() throws Exception
	{

		return "loginform";
	}
	//로그인 체크
	@RequestMapping(value = "/memLogin.do", method = RequestMethod.POST)
	public String memLogin(MemberValueObject vo, HttpSession session) throws Exception
	{
		System.out.println("******들어옴?"+vo.getMemId());
		MemberValueObject mvo = MemberService.loginCheck(vo);
		
		
		if(mvo == null) {
			
			return "loginform";
			
		}else {
			
			
			
			session.setAttribute("logininfo", mvo);
			return "redirect:/CardSelect.do";
			
		}
	}
	//로그아웃
	@RequestMapping(value ="/logout.do", method = RequestMethod.GET)
	public String logout() throws Exception
	{

		return "redirect:/loginform.do";
	}
	
	//회원가입화면 폼 이동
	@RequestMapping(value = "/memInsert.do", method = RequestMethod.GET)
	public String memInsert(Model model) throws Exception
	{
		
		List<CompanyValueObject> companylist = MemberService.companylist();
		List<CompanyValueObject> departlist = MemberService.departlist();
		
		model.addAttribute("companylist", companylist);
		model.addAttribute("departlist",  departlist);
		
		return "memberInsert";
				
	}
	//아이디 중복 체크
		@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
		public @ResponseBody Map<String, Object> idCheck(MemberValueObject memvo) throws Exception
		{
			System.out.println(memvo.getMemId()+"%$%%%%%%%%%%%%%%%%%%%%%%%%%%");
			String memId = memvo.getMemId();
			
			Map<String, Object> map = MemberService.idCount(memId);
			
			
			return map;
		}
		
	//회원등록 
	@RequestMapping(value = "/insertMembership.do", method = RequestMethod.POST)
	public String insertMembership(MemberValueObject vo) throws Exception
	{
		System.out.println("회원등록들어오나?");
		
		
		MemberService.insertMembership(vo);
		
		return "memberInsert";
	}
}
