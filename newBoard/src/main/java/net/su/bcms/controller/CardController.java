package net.su.bcms.controller;

import java.util.ArrayList;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.su.bcms.service.CardService;
import net.su.bcms.vo.CardValueObject;
import net.su.bcms.vo.ComnctnNmeCardValueObject;
import net.su.login.service.MemberService;
import net.su.login.vo.CompanyValueObject;
import net.su.login.vo.MemberValueObject;

@Controller
public class CardController {
	
	@Resource
	private CardService cardService;

	@Resource
	private MemberService MemberService;
	
	   //명함 조회 화면
	   @RequestMapping(value = "/CardSelect.do", method={RequestMethod.GET, RequestMethod.POST})
		public String CardSelect(ModelMap model, HttpSession session, CardValueObject cvo , MemberValueObject mvo) throws Exception {
		   
		   MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
		   
		   cvo.setCretrSeq(logininfo.getMemSeq());
		   cvo.setNmeCardUseAt("Y");
		   
		   List<CardValueObject> cardselect = cardService.cardselect(cvo);
		   
	       model.addAttribute("cardselect", cardselect);
	       model.addAttribute("CardValueObject", cvo);
	       
	       return "card/CardSelect";
		}
	   
	   //명함등록화면
	   @RequestMapping(value = "/cardinsertform.do", method={RequestMethod.GET, RequestMethod.POST})
			public String cardinsertform(Model model) throws Exception {
			 
		   	List<CompanyValueObject> companylist = MemberService.companylist();
			List<CompanyValueObject> departlist =  MemberService.departlist();
			List<CardValueObject> selectLicnsList = cardService.selectLicnsList();   
			
			model.addAttribute("companylist", companylist);
			model.addAttribute("departlist",  departlist);
			model.addAttribute("selectLicnsList", selectLicnsList);
			
		       return "card/CardInsert";
			}
	   //명함등록 
	   @RequestMapping(value = "/CardnmeInsert.do", method={RequestMethod.GET, RequestMethod.POST})
		public String CardnmeInsert(CardValueObject cvo,HttpSession session) throws Exception {
		 
	   	System.out.println("명함등록 컨트롤러 작동");
	   		
	   	MemberValueObject loginInfo = (MemberValueObject)session.getAttribute("logininfo");
	   	cvo.setCretrSeq(loginInfo.getMemSeq());
	 
	   		cardService.CardInsert(cvo);
	   
//	   		
//	   		String[] licnsSeqList = cvo.getLicnsSeq().split(",");

	    return "redirect:/CardSelect.do";
	    
		}
	   //명함상세조회화면
	   @RequestMapping(value = "/CardnmeView.do", method={RequestMethod.GET, RequestMethod.POST})
			public String CardnmeView(Model model,CardValueObject cvo,HttpSession session) throws Exception {
			 	
		   		
		   	CardValueObject selectcardview = cardService.selectcardview(cvo);
		   	model.addAttribute("selectcardview",  selectcardview);
		   
		    session.setAttribute("cardinfo", null);
			session.setAttribute("cardinfo", selectcardview);
		       return "card/CardView";
			}
	   //명함 수정 화면
	   @RequestMapping(value = "/nmeCardUpdateForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String nmeCardUpdateForm(@ModelAttribute("CardValueObject") CardValueObject cvo, ModelMap model) throws Exception {
	      System.out.println(cvo.getNmeCardSeq()+"$$$$$$$$$$들어오나");
	      CardValueObject selectcardview = cardService.selectcardview(cvo);
//	      List<CardValueObject> selectLicnsList = cardService.selectLicnsList();
//	      List<CardValueObject> selectLicnsSeq = cardService.selectLicnsSeq(cvo);
	      List<CompanyValueObject> companylist = MemberService.companylist();
		  List<CompanyValueObject> departlist = MemberService.departlist();
			
		  model.addAttribute("companylist", companylist);
		  model.addAttribute("departlist", departlist);
	      model.addAttribute("selectcardview", selectcardview);
//	      model.addAttribute("selectLicnsList", selectLicnsList);
//	      model.addAttribute("selectLicnsSeq", selectLicnsSeq); 
	      
	      return "card/CardUpdate";
	   }
	   //명함 수정 완료
	   @RequestMapping(value = "/updateNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String updateNmeCard(CardValueObject cvo, ModelMap model, HttpSession session, MemberValueObject mvo) throws Exception {
	      
	     
		     
//		      int selectNmeCardHistrSeq = nmeCardService.insertNmeCardHistr(nmeCardValueObject);
//		      nmeCardService.insertLicnsHistr(licnsSeqList, nmeCardValueObject.getNmeCardSeq(),selectNmeCardHistrSeq);	      
//		      nmeCardService.deleteLicns(nmeCardValueObject.getNmeCardSeq());    
//		      nmeCardService.insertLicns(licnsSeqList2, nmeCardValueObject.getNmeCardSeq());
		      cardService.updateNmeCard(cvo);
//		      cardService.updateNmeCardHistrUpdateCol(nmeCardValueObject, selectNmeCardHistrSeq);
		      
//		      session.getAttribute("userLoginInfo");
//		      MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
//		      nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
//		      model.addAttribute("nmeCardValueObject", nmeCardValueObject);
//		      
		      return "redirect:/CardSelect.do";
	      }
	   //명함 삭제 완료
	   @RequestMapping(value = "/deleteNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String deleteNmeCard(@RequestParam(value="checkArray[]") List<Integer> deleteList, CardValueObject cvo, ModelMap model) throws Exception {
	      
	      ArrayList<Integer> deleteArray = new ArrayList<Integer>();
	      for(int i=0;i<deleteList.size();i++){
	         deleteArray.add(deleteList.get(i));
	      }
	      cardService.deleteNmeCard(deleteArray);
	      return  "redirect:/CardSelect.do";
	   }
	   //명함 휴지통 완전 삭제 완료
		@RequestMapping(value = "/deleteNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
		public String deleteNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, CardValueObject cvo, ModelMap model) throws Exception {
			
			ArrayList<Integer> deleteArray = new ArrayList<Integer>();
			for(int i=0;i<deleteList.size();i++){
				deleteArray.add(deleteList.get(i));
			}
			cardService.deleteNmeCardBin(deleteArray);
			
			return "redirect:/CardSelect.do";
		}
		//명함 휴지통 조회 화면
		@RequestMapping(value = "/nmeCardBinSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
		public String nmeCardBinSelectForm(CardValueObject cvo,  ModelMap model, HttpSession session, MemberValueObject mvo) throws Exception {
			
			session.getAttribute("logininfo");
			MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
			cvo.setCretrSeq(logininfo.getMemSeq());
			cvo.setNmeCardUseAt("N");
			cvo.setRecordCountPerPage(8);
			List<CardValueObject> cardselect = cardService.cardselect(cvo);
			
			model.addAttribute("cardselect", cardselect);
			model.addAttribute("CardValueObject", cvo);
			
			return "card/CardBinSelect";
		}  
		
		//명함 휴지통 복원
		@RequestMapping(value = "/recvyNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
		public String recvyNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, CardValueObject cvo, ModelMap model) throws Exception {
			
			ArrayList<Integer> deleteArray = new ArrayList<Integer>();
			for(int i=0;i<deleteList.size();i++){
				deleteArray.add(deleteList.get(i));
			}
			cardService.recvyNmeCardBin(deleteArray);
			
			return "redirect:/CardSelect.do";
		}	
		
	   //명함 커뮤니케이션,명함변경내역 버튼 화면
	   @RequestMapping(value = "/nmeCardButtonForm.do",  method={RequestMethod.GET, RequestMethod.POST})
	   public String nmeCardButtonForm() {
	      System.out.println("nmeCardController의 nmeCardButtonForm.do 작동");
	      
	      return "card/CardButton";
	   }
	   
	   //명함 커뮤니케이션 조회 화면
	   @RequestMapping(value = "/nmeCardComnctnSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String nmeCardComnctnSelectForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
		  session.getAttribute("cardinfo");
		  CardValueObject cardinfo = (CardValueObject)session.getAttribute("cardinfo");
		  comnctnNmeCardValueObject.setNmeCardSeq(cardinfo.getNmeCardSeq());
		  session.getAttribute("logininfo");
		  MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
		  int memSeq= logininfo.getMemSeq();
		  model.addAttribute("memSeq",memSeq);
		  
		  List<ComnctnNmeCardValueObject> selectNmeCardComnctnList = cardService.selectNmeCardComnctnList(comnctnNmeCardValueObject);
	      model.addAttribute("selectNmeCardComnctnList", selectNmeCardComnctnList);
	      int NmeCardSeq2= comnctnNmeCardValueObject.getNmeCardSeq();
	      model.addAttribute("NmeCardSeq2",NmeCardSeq2);
	      
	      return "card/ComnSelect";
	   }  
	   //커뮤니케이션 등록 화면
	  	@RequestMapping(value = "/nmeCardComnctnInsertForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	  	public String nmeCardComnctnInsertForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session) throws Exception {
	  		List<MemberValueObject> selectMemList = cardService.selectMemList();
	  		model.addAttribute("selectMemList",selectMemList);
	  		
	  		return "card/ComnInsert";
	  	}
	  	
	  //커뮤니케이션 등록 완료
		@RequestMapping(value = "/nmeCardComnctnInsert.do", method={RequestMethod.GET, RequestMethod.POST})
		public String nmeCardComnctnInsert(ModelMap model, ComnctnNmeCardValueObject comnctnNmeCardValueObject, HttpSession session, MemberValueObject mvo) throws Exception {
			
			session.getAttribute("logininfo");
			MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
			session.getAttribute("cardinfo");
			CardValueObject cardinfo = (CardValueObject)session.getAttribute("cardinfo");
			comnctnNmeCardValueObject.setMemSeq(logininfo.getMemSeq());
			comnctnNmeCardValueObject.setComnctnCretrSeq(logininfo.getMemSeq());
			comnctnNmeCardValueObject.setNmeCardSeq(cardinfo.getNmeCardSeq());
//			comnvo.setNewspeedType("CC");
//			cardService.insertNewSpeedComctn(comnvo);
//			nmeCardService.insertNewSpeedComctnCretr(comnctnNmeCardValueObject);
			
			
			if (comnctnNmeCardValueObject.getComnctnType().equals("meeting")) {
				if (comnctnNmeCardValueObject.getComnctnAtnd() == "") {
					cardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
				}
				else {
					String[] atndSeqList = comnctnNmeCardValueObject.getComnctnAtnd().split(",");
					cardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
//					comnctnNmeCardValueObject = cardService.selectNmeCardComnctnView(comnctnNmeCardValueObject);
					cardService.insertAtnd(atndSeqList, comnctnNmeCardValueObject.getComnctnSeq());
				}
			}
			else {
				cardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
			}
			return "redirect:/nmeCardComnctnSelectForm.do";
		}
//	 //명함 변경내역 조회 화면
//	   @RequestMapping(value = "/nmeCardHistrSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
//	   public String nmeCardHistrSelectForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, CardValueObject nmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
//	      
//	      session.getAttribute("logininfo");
//	      MemberValueObject logininfo = (MemberValueObject)session.getAttribute("logininfo");
//	      nmeCardValueObject.setCretrSeq(logininfo.getMemSeq());
//	      List<CardValueObject> selectNmeCardHistrList = CardService.selectNmeCardHistrList(nmeCardValueObject);
//	      model.addAttribute("selectNmeCardHistrList", selectNmeCardHistrList);
//	      return "nmeCard/nmeCardHistrSelectForm";
//	   }
}
