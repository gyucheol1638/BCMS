<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>Insert title here</title>
<script>
function deleteNmeCard(){ //명함 체크박스 삭제
	
		var nmeCardSeq ="";
		var checkArray = new Array(); 
		
		$("input[name=chkbox]:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			checkArray.push($(this).val());
			  });
		
		
// 		<c:forEach var="cardselect" items="${cardselect}" varStatus="status">
// 			nmeCardSeq= "#"+"${cardselect.nmeCardSeq}";
// 			if($(nmeCardSeq).is(":checked")){
// 				checkArray.push("${cardselect.nmeCardSeq}");			
// 			}
// 		</c:forEach>
	
		if(checkArray.length == 0){
			alert("삭제할 명함을 선택하세요.")
		}
		else{
			if (confirm("삭제하시겠습니까?") == true){    //확인
				$.ajax({
				type : 'POST',
				url : 'deleteNmeCard.do',
				data : {  
					
					checkArray : checkArray},
					success: function pageReload(){
						location.href="/CardSelect.do"
					}
				});
				checkArray= new Array();
				nmeCardSeq="";
			}
			else{   //취소	
				location.reload(true);
			}
		}
	}		
$(document).ready(function(){ //체크박스 전체선택,전체해제
	$("#checkAll").click(function() {
		$("input[name=chkbox]:checkbox").prop("checked",true);
	});
	$("#unCheckAll").click(function() {
		$("input[name=chkbox]:checkbox").prop("checked",false);
	});
});
	
function sharForm(){
    var popUrl = "/sharForm.do";
	var popOption = "width=1400, height=820,  toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, ";    //공유 팝업창 옵션(optoin)
	window.open(popUrl,"sharPopUp",popOption);
	}
function arrayPage(page) { //명함 정렬보기
	

	document.selectInfo.currentPageNo.value = page;				
	document.selectInfo.action = "/CardSelect.do";
	document.selectInfo.submit();
	
}
function cardselectview(cardseq){
	
	
	document.selectInfo.nmeCardSeq.value = cardseq;
	document.selectInfo.action = "/CardnmeView.do";
	document.selectInfo.submit();
	
}
function cardinsertform(){
	
	location.href="/cardinsertform.do";
}



</script>
</head>
<form name="selectInfo">
	<input type="hidden" name="currentPageNo" value="${CardValueObject.currentPageNo}">
	<input type="hidden" name="nmeCardSeq" value="${CardValueObject.nmeCardSeq}">
</form>
	<body>
		<div class="head">                           
			<c:import url="/title.do"/>
		</div>
		<div class="body" style="margin-bottom:60px">
			<div class="wrapper">
				<div class="card">
						<h4>
						*나의 명함 리스트
							<select  class="form-control" style="display:inline-block; width:120px;">
								 <option> 최신순 </option>
								 <option> 이름순 </option>
							</select>
							<button class="btn btn-default-mina" style="margin-left:7px;" style="display:inline" onclick="location.href='/nmeCardSelectForm.do'"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></button>				
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									메뉴 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" id="checkAll">전체선택</a></li>
									<li><a href="#" id="unCheckAll">전체해제</a></li>
									<li><a href="#" onclick="deleteNmeCard()" id="del">삭제</a></li>
								</ul>
							</div>
						</h4>		
					<hr></hr>
				<article>
					<div style="min-height:400px">
						<div class="product-list">
							<ul id="productlist">
								<li id="insertCardBtn">
									<div>
									<input type="checkbox" style="visibility:hidden"> <!-- 줄맞추기용 -->
									</div>
									<div id="cardBox">
										<table class="tb-radius">
							           		<tr>
							             		<td style="text-align:center"><a href="javascript:cardinsertform()"><img src="resources/img/PLUS.png" id="plus" width="30px" height="30px"></a></td>
							              	</tr>
							             </table>
									</div>	
								</li>		
<!-- 							명함 리스트 부분 -->
								<c:forEach var="cardselect" items="${cardselect}" varStatus="status">
								<li id="selectCardList" style="margin-left:20px">
									<div style="float:left;">
										<input type="checkbox" id="${cardselect.nmeCardSeq}" name="chkbox" value="${cardselect.nmeCardSeq}">
									</div>
									<div class="cardBox" id="cardBox" style="float:left;" >
											<a href="javascript:cardselectview(${cardselect.nmeCardSeq})" id="cardId" onmouseover="this.style.color='black'" onmouseout="this.style.color='#428bca'" style="text-decoration:none">
												<table class="tb-radius" id="nmecardList">
													<tr>
														<td>
															성명: ${cardselect.nmeCardNme}
															<img src="/resources/img/new2.png" style="float:right" id="new" width="35px" height="20px">
														</td>
													</tr>
													<tr>
														<td>
															휴대폰: ${cardselect.nmeCardMobil}
														</td>
													</tr>
													<tr>
														<td> 
													   	 	E-mail: ${cardselect.nmeCardEmail}
													   </td>
													</tr>
													<tr>
														<td>
															전화: ${cardselect.nmeCardTel}
														</td>
													</tr>
													<tr>
														<td>
															회사: ${cardselect.nmeCardCompnNme}
														</td>
													</tr>
												</table>	
											</a>	
										</div>	
									</li>
							</c:forEach>
						</ul>
					</div>	
				</div>	
			</article>
			<c:if test="${CardValueObject.lastPageNoOnPageList != 1}">
			<div style="text-align:center">
				<ul class="pagination">
					<c:if test="${CardValueObject.totalPageCount > 1 && CardValueObject.currentPageNo != 1}">
						<li class="paginate_button previous"><a href="javascript:arrayPage(1)">&laquo;</a></li>
						<li class="paginate_button previous"><a href="javascript:arrayPage(${CardValueObject.currentPageNo-1})">&lsaquo;</a></li>
					</c:if>
					
					<c:forEach var="page" begin="${CardValueObject.firstPageNoOnPageList}" end="${CardValueObject.lastPageNoOnPageList}">
						<c:if test="${page == CardValueObject.currentPageNo}">
							<li class="paginate_button active"><a href="javascript:arrayPage(${page})">${page}</a></li>
						</c:if>
						<c:if test="${page != CardValueObject.currentPageNo}">
							<li class="paginate_button"><a href="javascript:arrayPage(${page})">${page}</a></li>
						</c:if>
					</c:forEach>
					
					<c:if test="${CardValueObject.totalPageCount > 1 && CardValueObject.totalPageCount != CardValueObject.currentPageNo}">
						<li class="paginate_button next"><a href="javascript:arrayPage(${CardValueObject.currentPageNo+1})">&rsaquo;</a></li>
						<li class="paginate_button next"><a href="javascript:arrayPage(${CardValueObject.totalPageCount})">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			</c:if>
			<div align="center">
				<table>
					<tr>
						<td>
						<!-- 명함 검색 -->
							<select id="searchCnd" class="form-control" style="width:100px;">
								<option value="0" selected="selected">이름</option>
								<option value="1">휴대폰</option>             
								<option value="2">Email</option>

							</select>
						</td>
						<td>
							<div class="input-group" style="padding-left:5px;">
								<input type="text" class="form-control" id="searchWrd" maxlength="60" value="${nmeCardValueObject.searchWrd}">
								<span class="input-group-btn">
								<button class="btn btn-default" style="margin-left:7px;" onclick="javascript:nmeCardSearchForm(1)">검색</button>													
								</span>										
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="page-header" style="margin-top: 20px;">
			</div>
		</div>
	</div>

								
</div>

</body>
</html>