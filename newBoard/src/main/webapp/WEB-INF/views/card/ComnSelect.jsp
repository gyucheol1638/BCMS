<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/ui.css" type="text/css">
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script>
//커뮤니케이션 등록화면
function nmeCardComnctnInsertForm() {
	document.comnselect.action = "/nmeCardComnctnInsertForm.do";
	document.comnselect.submit();
}
//커뮤니케이션 체크박스 보내기
function sendNmeCardComnctn(){ 
	var sendComnctnSeq ="";
	var sendCheckArray = new Array();
	
	$("input[name=chkbox]:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
		sendCheckArray.push($(this).val());
	});
	
// 	<c:forEach var="selectNmeCardComnctnList" items="${selectNmeCardComnctnList}" varStatus="status">
// 		sendComnctnSeq= "#"+"${selectNmeCardComnctnList.comnctnSeq}";
// 		if($(sendComnctnSeq).is(":checked")){
// 			sendCheckArray.push("${selectNmeCardComnctnList.comnctnSeq}");		
// 		}
// 	</c:forEach>
	if(sendCheckArray.length == 0){
		alert("보내기할 커뮤니케이션을 선택하세요.")
	}
	else{
		if (confirm("보내기 화면으로 이동합니다.") == true){
			$.ajax({
			type : 'POST',
			url : '/sendSession.do',
			data : {
				
				"sendCheckArray" : sendCheckArray},
				success: function popload(){
					$("input[name=chkbox]:checkbox").attr("checked", false);
					$("input[name=allChkBox]:checkbox").attr("checked", false);
					var sendFormURL = "/sendForm.do";
					var sendFormOption = "width=1300, height=820,  toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, ";    //공유해제 팝업창 옵션(optoin)
					window.open(sendFormURL,"sendPopUp",sendFormOption);
				},
			});
			sendCheckArray= new Array();
			sendComnctnSeq="";
		}
		else{   //취소
			location.reload(true);
		}
	}
}
</script>
</head>
<body>
<!-- 		<form name="comnctnInfo" method="post"> -->
<%-- 			<input type="hidden" name="comnctnCurrentPageNo" id="comnctnCurrentPageNo" value="${comnctnNmeCardValueObject.comnctnCurrentPageNo}"> --%>
<%-- 			<input type="hidden" name="nmeCardSeq" id="nmeCardSeq" value="${comnctnNmeCardValueObject.nmeCardSeq}">  --%>
<%-- 			<input type="hidden" name="comnctnSeq" id="comnctnSeq" value="${comnctnNmeCardValueObject.comnctnSeq}"> --%>
<%-- 			<input type="hidden" name="comnctnSearchCnd" value="${comnctnNmeCardValueObject.comnctnSearchCnd}">   검색 조건 --%>
<%-- 			<input type="hidden" name="comnctnSearchWrd" value="${comnctnNmeCardValueObject.comnctnSearchWrd}">  검색 단어 --%>
<%-- 			<input type="hidden" name="comnctnSearchAry" value="${comnctnNmeCardValueObject.comnctnSearchAry}">  정렬 조건 --%>
<%-- 			<input type="hidden" name="memSeq" id="memSeq" value="${memSeq}"> --%>
<!-- 		</form> -->
		<div style="width:600px;">
				<div>
					<div style="float:left">
						<form method="post" name="comnselect">
							<select class="form-control" name="comnctnType" id="comnctnSearchAry" onchange="comnctnSelectForm(1)" style="display:inline-block; width:100px; margin-bottom:6px">
								<c:choose>
									<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 0}">
										<option value="0" selected="selected">전체</option>
										<option value="1">meeting</option>
										<option value="2">memo</option>
									</c:when>
									<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 1}">
										<option value="0">전체</option>
										<option value="1" selected="selected">meeting</option>
										<option value="2">memo</option>
									</c:when>
									<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 2}">
										<option value="0">전체</option>
										<option value="1">meeting</option>
										<option value="2" selected="selected">memo</option>
									</c:when>
								</c:choose>
							</select>
							<input type="hidden" value="${NmeCardSeq2}" name="nmeCardSeq">
							<input type="hidden" value="0" name="comnctnSeq">
						</form>
					</div>						
					<img src="resources/img/send.png" style="margin-right:100px;width:25px;height:25px" onclick="javascript:sendNmeCardComnctn()">
					<div style="float:right;margin-bottom:10px">
						<input class="btn btn-default"  type="button" value="추가" style="margin-left:7px;" onclick="javascript:nmeCardComnctnInsertForm()" target="iframe_a" ID="nmeCardComnctnViewForm">
						<input class="btn btn-default"  type="button" value="삭제" style="margin-left:7px;" onclick="javascript:deleteNmeCardComnctn()" id="del">
					</div>
				</div>
				<form name="frm" method="post">
				<input type="hidden" id="comntCount" value="${fn:length(selectNmeCardComnctnList)}">
				<table class="table " id="checkboxTestTbl" style="border:1px; margin-left: auto; margin-right: auto;">
					<colgroup>
						<col width="10px;"/>
						<col width="45px;"/>
						<col width="250px;"/>
						<col width="130px;"/>
						<col width="150px;"/>
					</colgroup>
					<tr >
						<th style="text-align:center"><input name = "allChkBox" type="checkbox"/></th>
						<th style="text-align:center">종류</th>
						<th style="text-align:center">제목</th>
						<th style="text-align:center">작성자</th>
						<th style="text-align:center">날짜</th>
					</tr>
					<c:forEach var="selectNmeCardComnctnList" items="${selectNmeCardComnctnList}" varStatus="status">
					<input type="hidden" name="comnctnCretrSeq" id="comnctnCretrSeq" value="${selectNmeCardComnctnList.comnctnCretrSeq}">
						<tr style="text-align:center">
							<c:if test="${selectNmeCardComnctnList.comnctnCretrSeq==memSeq}">
								<td><input type="checkbox" id="${selectNmeCardComnctnList.comnctnSeq}" name="chkbox" value="${selectNmeCardComnctnList.comnctnSeq}"></td>
							</c:if>
							<c:if test="${selectNmeCardComnctnList.comnctnCretrSeq!=memSeq}">
								<td>
									　
								</td>
							</c:if>
							<td><c:out value="${selectNmeCardComnctnList.comnctnType}"/></td>
							<td style="text-align:left"><a href="javascript:nmeCardComnctnViewForm(${selectNmeCardComnctnList.comnctnSeq})" target="iframe_a" ID="nmeCardComnctnViewForm"><c:out value="${selectNmeCardComnctnList.comnctnTitl}"/></a></td>
							<td><c:out value="${selectNmeCardComnctnList.memName}"/></td>
							<td><c:out value="${selectNmeCardComnctnList.comnctnCretDate}"/></td>
						</tr>
					</c:forEach>
				</table>
				</form>
		
			<c:if test="${comnctnNmeCardValueObject.comnctnLastRecordIndex != 1}">
				<div style="text-align:center">
					<ul class="pagination">
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnCurrentPageNo != 1}">
							<li class="paginate_button previous"><a href="javascript:comnctnSelectForm(1)">&laquo;</a></li>
							<li class="paginate_button previous"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnCurrentPageNo-1})">&lsaquo;</a></li>
						</c:if>
					
						<c:forEach var="comnctnpage" begin="${comnctnNmeCardValueObject.comnctnFirstPageNoOnPageList}" end="${comnctnNmeCardValueObject.comnctnLastPageNoOnPageList}">
							<c:if test="${comnctnpage == comnctnNmeCardValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button active"><a href="javascript:comnctnSelectForm(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
							<c:if test="${comnctnpage != comnctnSearchAndPageValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button"><a href="javascript:comnctnSelectForm(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
						</c:forEach>
					
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnTotalPageCount != comnctnNmeCardValueObject.comnctnCurrentPageNo}">
							<li class="paginate_button next"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnCurrentPageNo+1})">&rsaquo;</a></li>
							<li class="paginate_button next"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnTotalPageCount})">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			
			<div style="text-align:center">
				<select id="comnctnSearchCnd" class="form-control" style="width: 126px;">
					<c:choose>
						<c:when test="${comnctnNmeCardValueObject.comnctnSearchCnd == 0}">
							<option value="0" selected="selected">제목</option>
							<option value="1">작성자</option>
						</c:when>
						<c:when test="${comnctnNmeCardValueObject.comnctnSearchCnd == 1}">
							<option value="0">제목</option>
							<option value="1" selected="selected">작성자</option>
						</c:when>
					</c:choose>
				</select>
				<input id="comnctnSearchWrd" class="form-control" type="text" name="search" style="width: 226px;">
				<input class="btn btn-default"  type="button" value="검색" onclick="javascript:recvNmeCardComnctnSearch(1)">
			</div>
		</div>
	</body>
</html>