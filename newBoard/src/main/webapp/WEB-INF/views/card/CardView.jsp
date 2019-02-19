<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function nmeCardUpdateForm() { //명함 수정 화면
	document.selectviewInfo.action = "/nmeCardUpdateForm.do";
	document.selectviewInfo.submit();
}
function sexTr(){ //성별 접기/펼치기
		$('#sexTr').toggleClass("hide");
		if ($('#sexTab').text() == "▼"){
			$('#sexTab').text("▲");
		}
		else {
			$('#sexTab').text("▼");
		}				
	}
	
	function postnTr(){ //직급직무 접기/펼치기
		$('#postnTr').toggleClass("hide");
		if ($('#postnTab').text() == "▼"){
			$('#postnTab').text("▲");
		}
		else {
			$('#postnTab').text("▼");
		}				
	}
	
	function numTr(){ //전화번호 접기/펼치기
		$('#numTr').toggleClass("hide");
		$('#numTr2').toggleClass("hide");
		if ($('#numTab').text() == "▼"){
			$('#numTab').text("▲");
		}
		else {
			$('#numTab').text("▼");
		}				
	}
	
	function netTr(){ //네트워크 접기/펼치기
		$('#netTr').toggleClass("hide");
		$('#netTr2').toggleClass("hide");
		if ($('#netTab').text() == "▼"){
			$('#netTab').text("▲");
		}
		else {
			$('#netTab').text("▼");
		}				
	}
	
	function etcTr(){ //네트워크 접기/펼치기
		
		$('#etcTr').toggleClass("hide");
		$('#etcTr2').toggleClass("hide");
		$('#etcTr3').toggleClass("hide");
		if ($('#etcTab').text() == "▼"){
			$('#etcTab').text("▲");
		}
		else {
			$('#etcTab').text("▼");
		}				
	}
</script>
</head>
<body>

	<div>
		
		<c:choose>
		<c:when test="${selectcardview.nmeCardUseAt == 'Y'}">
			<c:import url="/CardSelect.do"/>
		</c:when>
		<c:otherwise>
			<c:import url="/nmeCardBinSelectForm.do"/>
		</c:otherwise>
		</c:choose>
	</div>
		<div class="wrapper" style="width:600px; float:left; margin-left:250px;">	
			<form name="selectviewInfo">
				<input type="hidden" name="nmeCardSeq" value="${selectcardview.nmeCardSeq}">
				<input type="hidden" name="currentPageNo" value="${selectcardview.currentPageNo}"> <!-- 현재 페이지값 -->
	<%-- 			<input type="hidden" name="searchCnd" value="${selectcardview.searchCnd}"> <!-- 검색조건 --> --%>
	<%-- 			<input type="hidden" name="searchWrd" value="${selectcardview.searchWrd}"> <!-- 검색단어 --> --%>
			</form>
			<div class="card" style="width:500px">
				<div style="border:1px solid white">
					<h3 id="test" class="page-header" style="border-bottom:0px;float:left;">* 명함정보 </h3>
				</div>
					<div class="dropdown" style="width:30px;margin-left:133px;margin-top:35px;">
						<input type="image" src="resources/img/share2.png" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:30px;height:30px; border:none ">
						<ul class="dropdown-menu" role="menu" style="text-align:left;">
							<li><a href="javascript:sharForm()">공유</a></li>
							<li><a href="javascript:sharRelsForm()">공유 관리</a></li>
						</ul>
					</div>
					<input class="btn btn-default" type="button" value="수정" style="float:right" onclick="javascript:nmeCardUpdateForm()">
					<article>
						<div class="col-lg-12" style="margin-top:30px">
							<table class="class" style="width:100%;">
								<tr> 			
									<td colspan="4">
										<img src="/resources/img/name.png" width="20px" height="20px">
										<strong><font size="4">성명</font></strong>
									</td>
								</tr>
									<tr>
										<td style="text-align:right">
											<strong>이름:</strong> 
										</td>
										<td colspan="3" style="text-align:middle">
											${selectcardview.nmeCardLastNme}${selectcardview.nmeCardFirstNme}
										</td>
									</tr>
									<tr id="sexTr" class="hide">
										<td style="text-align:right">
											<strong>성별:</strong>
										</td>
										<td colspan="3" style="text-align:middle">
											 ${selectcardview.nmeCardSex}
										</td>
									</tr>
									<tr>
										<td class="text-right" colspan="4">
											(성별)<a href="javascript:sexTr()"><font id="sexTab">▼</font></a>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<img src="/resources/img/company.png" width="20px" height="20px">
											<strong><font size="4">회사</font></strong>
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>회사:</strong>
										</td>
										<td>
											${selectcardview.nmeCardCompnNme}
										</td>
										<td class="text-right">
											<strong>부서:</strong>
										</td>
										<td>
											 ${selectcardview.nmeCardDepmtNme}
										</td>
									</tr>
									<tr id="postnTr" class="hide">									
										<td class="text-right">
											<strong>직급:</strong>
										</td>	
										<td>
											${selectcardview.nmeCardPostnNme}
										</td>
										<td>
											<strong>직무:</strong>
										</td>
										<td>
											${selectcardview.nmeCardJobNme}
										</td>
									</tr>
									<tr>
										<td class="text-right" colspan="4">
											(직급)<a href="javascript:postnTr()"><font id="postnTab">▼</font></a>
									</tr>
									<tr>
										<td colspan="4">
											<img src="/resources/img/juso.png" width="20px" height="20px">
											<strong><font size="4">주소</font></strong>
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>우편번호:</strong> 
										</td>
										<td colspan="3">
											${selectcardview.nmeCardPostNum}
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>기본주소:</strong>
										</td>
										<td colspan="3">
											${selectcardview.nmeCardBascAdrs}
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>상세주소:</strong>
										</td>
										<td colspan="3">
											${selectcardview.nmeCardDetlAdrs}
										</td>
									</tr>
									<tr>
										<td style="border-top-width: 0px;" colspan="4">
										<br>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<img src="resources/img/tel.png" width="20px" height="20px">
											<strong><font size=4>연락처 </font></strong>
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>휴대폰:</strong> 
										</td>
										<td colspan="3" >	
											${selectcardview.nmeCardMobil}
										</td>
									</tr>
									<tr id="numTr" class="hide">									
										<td class="text-right">
											<strong>전화:</strong> 
										</td>
										<td colspan="3" >	
											
											${selectcardview.nmeCardTel}
												
										</td>	
									</tr>
									<tr id="numTr2" class="hide">
										<td class="text-right">
											<strong>팩스:</strong>													
										</td>
										<td colspan="3">
											
											${selectcardview.nmeCardFax}
										</td>
									</tr>
									<tr>
										<td colspan="4" class="text-right">
											<strong>(전화,팩스)</strong><a href="javascript:numTr()"><font id="numTab">▼</font></a>								
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<img  src="resources/img/network.png" width="20px" height="20px" >
											<strong><font size=4> 네트워크</font></strong>
										</td>
									</tr>
									<tr>
										<td class="text-right">
											<strong>이메일:</strong> 
										</td>
										<td colspan="3">
											${selectcardview.nmeCardEmail}
											
										</td>
									<tr>
										<td class="text-right">
											<strong>홈페이지:</strong> 
										</td>
										<td colspan="3" style="border-top-width: 0px;">
											${selectcardview.nmeCardHompg}
										</td>
									</tr>
									<tr id="netTr" class="hide">									
										<td class="text-right">
											<strong>SNS:</strong>
										</td>
										<td colspan="3" style="border-top-width: 0px;">	
											${selectcardview.nmeCardSns}
										</td>	
									</tr>
									<tr id="netTr2" class="hide">
										<td class="text-right">
											<strong>메신저:</strong> 											
										</td>
										<td colspan="3">
											${selectcardview.nmeCardMesngr}
										</td>
									</tr>
									<tr>
										<td colspan="4" class="text-right">
											<strong>(SNS,메신저)</strong><a href="javascript:netTr()"><font id="netTab">▼</font></a>								
										</td>
									</tr>
									<!-- 기타 입력란 -->
									<tr>
										<td class="text-left"  colspan="4">
											<img  src="resources/img/etc.png" width="20px" height="20px" >
											<strong><font size=4 > 기타</font></strong>
										</td>
									</tr>
									<tr id="etcTr" class="hide">									
										<td class="text-right">
											<strong><font>취미:</font></strong>	
										</td>
										<td colspan="3" >	
											${selectcardview.nmeCardHob}
										</td>	
									</tr>
									<tr id="etcTr2" class="hide">
										<td class="text-right">
											<strong>관심사:</strong>											
										</td>
										<td colspan="3" >
											${selectcardview.nmeCardInterst}
										</td>
									</tr>
									<tr id="etcTr3" class="hide">
										<td class="text-right">
											<strong>자격증:</strong>													
										</td>
										<td colspan="3">
										<!-- 자격증 입력란 -->					
										  
										</td>
									</tr>
									<tr>
										<td colspan="4" class="text-right">
											<strong>(취미, 관심사, 자격증)</strong><a href="javascript:etcTr()"><font id="etcTab">▼</font></a>								
										</td>
									</tr>
								</table>
							</div>
						</article>
					</div>
				</div>
					<c:import url="/nmeCardButtonForm.do"/>
				
</body>
</html>