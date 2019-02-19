<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function insertNmeCard() { // 등록 완료\
	alert("등록되나?");

	
	if ($("#nmeCardLastNme").val() == ""){
		alert("성을 입력하세요");
		$("#nmeCardLastNme").focus();
    	return;
	}
	else if ($("#nmeCardFirstNme").val() == ""){
		alert("이름을 입력하세요.")
		$("#nmeCardFirstNme").focus();
    	return;
	}
	else{
		alert(" 경로로 이동되나?");
// 		var arr = [];
// 		$.each($("#licnsId .item"),function(k,v){
// 			alert(k);
// 		    arr[arr.length] = $(v).attr('data-value');
// 		});
			
// 		document.getElementById('licnsSeq').value = arr;
		document.frm.action = "/CardnmeInsert.do";
		document.frm.submit();
	}
}
function switchTr(tr,tab){
	
	$(tr).toggleClass("hide");
	
	if($(tab).text() == "▼"){
		
		//어차피 현재는 ▼ 아래로 향하고 있기 때문에 현재 메소드가 돌게되면 당연히 조건을 만족하게 되고 위를 향하는 화살표로 바뀌게 된다.
		$(tab).text("▲");	
	}else{
		
		$(tab).text("▼");	
	}
}

function insertEmail(){ // 이메일 셀렉트 값 넣기
	
    if (frm.email.value == '0') {
        frm.nmeCardEmail2.readOnly = false;
        frm.nmeCardEmail2.value = '';
        
        frm.nmeCardEmail2.focus();
    }
    else {
        frm.nmeCardEmail2.readOnly = true;
        frm.nmeCardEmail2.value = frm.email.value;
    }
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		//우편번호 팝업창
		    function searchPostNum() {
			
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postNum').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('bascAdrs').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('bascAdrs2').focus();
		            }
		        }).open();
		    }
</script>
</head>
<body>                
<c:import url="/title.do"/>

<div style="width:50%; margin:auto;">
<br>
 <h4 style="margin-top:20px;">* 명함 등록</h4>
  <hr>
  <form name="frm" method="post">
  	<input type="hidden" name="licnsSeq" id="licnsSeq" value="0">
    
	<table class="class" style="width:800px; display:inline-table;  margin:auto;">
	
		<tr> 			
			<td colspan="4">
				<img src="/resources/img/name.png" width="20px" height="20px">
				<strong><font size="4">성명</font></strong>
			</td>
		</tr>
		<tr>
			<td style="text-align:right">
				*성
			</td>
			<td>
				<input class="form-control" type="text"  name="nmeCardLastNme" style="width:100px; margin-left: 10px;">
			</td>
			<td  class="text-right">
				*이름
			</td>
			<td>
				<input class="form-control" type="text" name="nmeCardFirstNme" style="width:100px; margin-left: 10px;">
			</td>
		</tr>
		<tr id="sexTr" class="hide">
			<td style="text-align:right">
				성별
			</td>
			<td colspan="3">
				<select class="form-control" name="nmeCardSex" style="width:100px; margin-left: 10px;">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="text-right" colspan="4">
				(성별)<a href="javascript:switchTr('#sexTr','#sexTab')"><font id="sexTab">▼</font></a>
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
				회사
			</td>
			<td>
				<select class="form-control" name="nmeCardCompnSeq" style="width:200px; margin-left: 10px;">
					<c:forEach items="${companylist}" var="item">
						<option value="${item.company_seq}">${item.company_name}</option>
					</c:forEach>
				</select>
			</td>
			<td class="text-right">
				부서
			</td>
			<td>
				<select class="form-control" name="nmeCardDepmtSeq" style="width:200px; margin-left: 10px;">
					<c:forEach items="${departlist}" var="item">
						<option value="${item.depart_seq}">${item.depart_name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr id="postnTr" class="hide">									
			<td class="text-right">
				직급
			</td>	
			<td>
				<input class="form-control" style="width:200px; margin-left: 10px;" type="text" size="16" name="nmeCardPostnNme">
			</td>
			<td>
				직무
			</td>
			<td>
				<input class="form-control" style="width:200px; margin-left: 10px;" type="text" size="16" name="nmeCardJobNme">										
			</td>
		</tr>
		<tr>
			<td class="text-right" colspan="4">
				(직급)<a href="javascript:switchTr('#postnTr','#postnTab')"><font id="postnTab">▼</font></a>
		</tr>
		<tr>
			<td colspan="4">
				<img src="/resources/img/juso.png" width="20px" height="20px">
				<strong><font size="4">주소</font></strong>
			</td>
		</tr>
		<tr>
			<td class="text-right">
				우편번호
			</td>
			<td colspan="3">
				<input class="form-control"  id="postNum" name="nmeCardPostNum" type="text" placeholder="우편번호" style="width:100px; margin-left: 10px;" readonly> 
				<input class="form-control"  id="bascAdrs" name="nmeCardBascAdrs"  type="text" style="width:240px" readonly>
				<input class="btn btn-primary" type="button" style="margin-left: 10px;" onclick="searchPostNum()" value="우편번호 찾기"> 
			</td>
		</tr>
		<tr>
			<td class="text-right">
				상세주소
			</td>
			<td colspan="3">
				<input class="form-control" type="text" style="width:300px; margin-left: 10px;">
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
				휴대폰 
			</td>
			<td colspan="3" >	
				<select id="mobile" name="nmeCardMobil" class="form-control" style="width:100px; margin-left: 10px;" onchange="javascript:insertMobil()">
						<option value="010">010</option>
						<option value="011">011</option>             
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>            
				</select>
				<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
			</td>
		</tr>
		<tr  class="numTr hide">									
			<td class="text-right">
				전화 
			</td>
			<td colspan="3" >	
				<input style="width:100px; margin-left: 10px;" class="form-control" type="text" name="nmeCardTel" size="10" maxlength="3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardTel2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardTel3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					
			</td>	
		</tr>
		<tr  class="numTr hide">
			<td class="text-right">
				팩스 													
			</td>
			<td colspan="3">
				<input style="width:100px; margin-left: 10px;" class="form-control" type="text" name="nmeCardFax" size="10" maxlength="3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardFax2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
				<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardFax3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
			</td>
		</tr>
		<tr>
			<td colspan="4" class="text-right">
				<strong>(전화,팩스)</strong><a href="javascript:switchTr('.numTr','#numTab')"><font id="numTab">▼</font></a>								
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
				이메일 
			</td>
			<td colspan="3">
				<input class="form-control" style="width:100px; margin-left: 10px;" type="text" size="20" id="nmeCardEmail" name="nmeCardEmail" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,_,-]/g,'');">
				@
				<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardEmail2" name="nmeCardEmail2" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,_,-]/g,'');">
				<select id="email" class="form-control" style="width:120px;" onChange="insertEmail();">
						<option value="0" selected>직접입력</option>					
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>             
						<option value="nate.com">nate.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gamil.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="lycos.co.kr">lycos.co.kr</option>
						<option value="empal.com">empal.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="korea.com">korea.com</option>       				
				</select>
			</td>
		<tr>
			<td class="text-right">
				홈페이지 
			</td>
			<td colspan="3" style="border-top-width: 0px;">
				<input class="form-control" style="width:350px; margin-left: 10px;" type="text" size="20" id="nmeCardHompg" name="nmeCardHompg" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,:,_,-/]/g,'');">
			</td>
		</tr>
		<tr class="netTr hide">									
			<td class="text-right">
				SNS
			</td>
			<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
				<input class="form-control" style="width:100px; margin-left: 10px;" type="text" size="16" name="nmeCardSns" maxlength="20">
				<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardSns2" name="nmeCardSns2">
				<select id="sns" class="form-control" style="width:120px" onChange="insertSns();">
						<option value="0" selected>직접입력</option>					
						<option value="카카오스토리">카카오스토리</option>
						<option value="페이스북">페이스북</option>             
						<option value="트위터">트위터</option>
						<option value="Tumblr">Tumblr</option>
						<option value="Pinterest">Pinterest</option>
						<option value="StumbleUpon">StumbleUpon</option>
						<option value="reddit is fun">reddit is fun</option>
						<option value="Instagram">Instagram</option>
						<option value="LinkedIn">LinkedIn</option>
						<option value="BAND">BAND</option>       				
				</select>
			</td>	
		</tr>
		<tr class="netTr hide">
			<td class="text-right">
				메신저 											
			</td>
			<td colspan="3">
				<input class="form-control" style="width:100px; margin-left: 10px;" type="text" size="16" name="nmeCardMesngr" maxlength="20">
				<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardMesngr2" name="nmeCardMesngr2">
				<select id="mesngr" class="form-control" style="width:120px" onChange="insertMesngr();">
						<option value="0" selected>직접입력</option>					
						<option value="카카오톡">카카오톡</option>
						<option value="라인">라인</option>             
						<option value="탱고">탱고</option>
						<option value="위챗">위챗</option>
						<option value="바이버">바이버</option>
						<option value="왓츠앱">왓츠앱</option>
						<option value="마이피플">마이피플</option>
						<option value="네이트온">네이트온</option>
						<option value="스카이프">스카이프</option>       				
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="text-right">
				<strong>(SNS,메신저)</strong><a href="javascript:switchTr('.netTr','#netTab')"><font id="netTab">▼</font></a>								
			</td>
		</tr>
		<!-- 기타 입력란 -->
		<tr>
			<td class="text-left"  colspan="4">
				<img  src="resources/img/etc.png" width="20px" height="20px" >
				<strong><font size=4 > 기타</font></strong>
			</td>
		</tr>
		<tr class="etcTr hide">									
			<td class="text-right">
				<font>취미 </font>	
			</td>
			<td colspan="3" >	
				<input class="form-control" style="width:100px; margin-left: 10px;" type="text" size="16" name="nmeCardHob" maxlength="20">
			</td>	
		</tr>
		<tr class="etcTr hide">
			<td class="text-right">
				관심사											
			</td>
			<td colspan="3" >
				<input class="form-control" style="width:100px; margin-left: 10px;" type="text" size="16" name="nmeCardInterst" maxlength="20">
			</td>
		</tr>
		<tr class="etcTr hide">
			<td class="text-right">
				자격증													
			</td>
			<td colspan="3">
			<!-- 자격증 입력란 -->			
			<div id="licnsId" style="float:left; width:650px">			
			    <select id="licns" name="dd" multiple class="demo-default">
					<c:forEach items="${selectLicnsList}" var="item">
						<option value="${item.licnsSeq}">${item.licnsNme}</option>
					</c:forEach>
				</select>
					<script>
					$('#licns').selectize({
						  maxItems: 10
					});
				</script>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="text-right">
				<strong>(취미, 관심사, 자격증)</strong><a href="javascript:switchTr('.etcTr','#etcTab')"><font id="etcTab">▼</font></a>								
			</td>
		</tr>
	</table>
	</form>
		<div class="form-group" style="text-align:right; padding-right:80px">
			<input class="btn btn-default" type="button" value="등록" onclick="javascript:insertNmeCard()">
			<input class="btn btn-white" type="button" value="취소" onclick="javascript:insertCancel()">
		</div>
</div>
</body>
</html>