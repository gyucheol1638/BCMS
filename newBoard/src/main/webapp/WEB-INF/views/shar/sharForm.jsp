<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "sharMainDiv" style=" width:1210;height:750">
<!-- 	<form name="sharInfo" method="post"> -->
<%-- 		<input type="hidden" name="sharCurrentPageNo" id="sharCurrentPageNo" value="${sharVo.sharCurrentPageNo}"> --%>
<%-- 		<input type="hidden" name="sharSearchCnd" value="${sharVo.sharSearchCnd}">   검색 조건 --%>
<%-- 		<input type="hidden" name="sharSearchWrd" value="${sharVo.sharSearchWrd}">  검색 단어 --%>
<%-- 		<input type="hidden" name="gropSeq" value="${sharVo.gropSeq}" onchange="shi()"> --%>
<!-- 	</form> -->
	<div style=" height:750px; margin-left:22px; margin-bottom:0px; margin-top:20px; margin-right:20px; border: ">
		<c:if test="${selector == 1||selector == 3}">	
		<div style= "float:left; height:750px; width:180px; border:1px gray solid">
			<a href="javascript:nmeCardLogo()"><img src="resources/img/BCMS.png"  style="margin-left:15px; margin-top:25px; max-width:80%; height:auto"></a>
				<div class="static">
						<div style="overflow:auto; width:200px; height:300px; margin-top:30px">
							<input type="text"  id= "grop0" value="전체명단" readonly class="btn btn-default" style="margin-left:12px; width:150px" onclick="javascript:groupWholeListClickForm(1,0)">
		 					<table style="margin-left:12px;"> 
								<c:forEach var="group" items="${groupList}" varStatus="Status">
									<tr >
										<td style="width:200px;margin-right:15px;" onclick="javascript:groupWholeListClickForm(1,${group.gropSeq})">
											<input id= "grop${group.gropSeq}" type ="text" value="${group.gropNme}" readonly class="btn btn-default" name="name" id="test" style=" width:150px">
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
		</c:if>
		<div id ="sharContentsDiv" style="float:left;height: 750px;width:1000px;">
			<c:if test="${selector == 1}">	    
				<c:import url="/sharTableForm.do"/>
			</c:if>
		</div>
	</div>
	
	
</div>			
</body>
</html>