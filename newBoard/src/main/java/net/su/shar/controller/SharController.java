package net.su.shar.controller;


import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.su.bcms.service.GroupService;
import net.su.bcms.vo.CardValueObject;
import net.su.bcms.vo.GroupValueObject;
import net.su.login.vo.MemberValueObject;
import net.su.shar.service.SharService;
import net.su.shar.vo.SharValueObject;

@Controller
public class SharController {
	
	@Resource
	private SharService sharService;
	@Resource
	private GroupService groupService;
	
	
	// 공유 화면
		@RequestMapping(value = "/sharForm.do", method={RequestMethod.GET, RequestMethod.POST})
		public String sharForm(Model model, HttpSession session,  SharValueObject sharVo, GroupValueObject groupVo) throws Exception {
			System.out.println("sharController의 sharForm.do 작동");
			sharVo.setGropSeq(groupVo.getGropSeq());
			
			if(session.getAttribute("sharCurrentDat")!=null){
				
				if(!session.getAttribute("sharCurrentDat").equals("no")){
					SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
					sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
					sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
					sharVo.setGropSeq(sharCurrentVo.getGropSeq());
					sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
					sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
				}
			};
			
			session.getAttribute("cardinfo");
			CardValueObject cardinfo = (CardValueObject)session.getAttribute("cardinfo");
			session.getAttribute("logininfo");
			MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
			
			sharVo.setMemSeq(logininfo.getMemSeq());
			sharVo.setNmeCardSeq(cardinfo.getNmeCardSeq());
			List<SharValueObject> allMemList = sharService.selectMemList(sharVo); // 전체 회원
			int selector =1; 
			
			groupVo.setMemSeq(logininfo.getMemSeq());
			List<GroupValueObject> groupList = groupService.gropSelect(groupVo);
			
			model.addAttribute("groupVo", groupVo);  
			model.addAttribute("groupList", groupList);  	
			model.addAttribute("allMemList", allMemList);
			model.addAttribute("sharVo", sharVo);
			model.addAttribute("selector", selector);
			return "shar/sharForm"; 
		}

//공유 화면 내에 테이블 불러오기
	@RequestMapping(value = "/sharTableForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharTableForm(Locale locale,Model model,HttpSession session, SharValueObject sharVo) throws Exception {
		System.out.println("sharController의 sharTableForm.do 작동");
		if(session.getAttribute("sharCurrentDat")!=null){
			if(!session.getAttribute("sharCurrentDat").equals("no")){
			SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
				System.out.println(sharCurrentVo.getSharFirstRecordIndex()+"#####@@#");
				System.out.println("######&&&&&&&&&&&#######"+sharCurrentVo.getGropSeq());
				sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
				sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
				sharVo.setGropSeq(sharCurrentVo.getGropSeq());
				sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
				sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
			}
		};
		session.getAttribute("cardinfo");
		CardValueObject cardinfo = (CardValueObject)session.getAttribute("cardinfo");
		session.getAttribute("logininfo");
		MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
		sharVo.setMemSeq(logininfo.getMemSeq());
		sharVo.setNmeCardSeq(cardinfo.getNmeCardSeq());
		//logger.info("sharTableForm", locale);
		sharVo.setSharTotalRecordCount(sharService.noneSharMemCount(sharVo).getSharTotalRecordCount());// 공유 안 하는 회
		List<SharValueObject> dumpMemList = sharService.selectDumpList(sharVo); //  임시 저장소
		List<SharValueObject> nonSharMemList = sharService.selectNonSharList(sharVo); //  공유 안 하는 회원
		
		model.addAttribute("nonSharMemList", nonSharMemList);
		model.addAttribute("dumpMemList", dumpMemList);
		model.addAttribute("sharVo", sharVo);
		
		
		return "shar/sharTableForm";
	}
}
