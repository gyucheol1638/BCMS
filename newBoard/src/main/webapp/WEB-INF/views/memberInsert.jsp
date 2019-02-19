<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap-3.3.2-dist/Signin Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap-3.3.2-dist/Signin Template for Bootstrap_files/signin.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/default.css"> -->
<!-- <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/normalize.css"> -->
<!-- <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/stylesheet.css"> -->


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/bootstrap-3.3.2-dist/js/selectize.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/calendar_beans_v2.2.js" type="text/javascript"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/jquery.mask.min.js" type="text/javascript"></script>
<script>

function main(){
	
	location.href="/loginform.do";
}



function insertEmail(){
	
	
	
	if(mem.email.value == "직접입력"){
		
		mem.memEmail2.readOnly = false;
		mem.memEmail2.value = '';
		mem.memEmail2.focus();
	}else{
		
		mem.memEmail2.readOnly = true;
		mem.memEmail2.value = mem.email.value;
	}
}

function insertMember(){
	
	if ($("#memId").val() == "") {
  	  alert("아이디를 꼭 입력하세요!");
  	  $("#memId").focus();
  	  return;
    }
	
	else if($("#idCheckResult").val() == "1" || $("#idCheckResult").val() == null ) {
			alert("아이디 중복확인을 해주세요.");
			document.frm.memId.focus();
			return;
		}
    else if ($("#memId").val().length <= 3) {
 	   alert("아이디를 4자리 이상 입력하세요!");
	    $("#memId").val("");
	    $("#memId").focus();
	    return;
	} 
	  	else if ($("#memPw").val() == "") {
    	alert("비밀번호를 꼭 입력하세요!");
    	$("#memPw").focus();
    	return;
 	}
    else if ($("#memPwcheck").val() == "") {
    	alert("비밀번호확인 을 꼭 입력하세요!");
    	$("#memPwRe").focus();
    	return;
    } 
    else if ($("#memPw").val() != $("#memPwcheck").val()) {
    	
			
    	alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
    	$("#memPw").val("");
    	$("#memPwcheck").val("");
    	$("#memPw").focus();
    	return;
    } 
	else if ($("#memName").val() == "") {
    	alert("이름을 꼭 입력하세요!");
    	$("#memNme").focus();
    	return;
    } 

    else if ($("#memTitle").val() == "") {
    	alert("직급을 입력하세요!");
    	$("#memPostn").focus();
    	return;
	}
    else if ($("#memSex").val() == "성별") {
    	alert("성별을 선택하세요!");
    	$("#memSex").focus();
    	return;
    } 
    else if ($("#memBirth").val() == "") {
    	alert("생년월일을 입력하세요!");
    	$("#memBirth").focus();
    	return;
    }
	else if ($("#memEmail1").val() == "") {
   		alert("이메일을 입력하세요!");
    	$("#memEmail").focus();
    	return;
    }
	else if ($("#memEmail2").val() == "") {
    	alert("이메일 주소를 입력하세요!");
    	$("#memEmail2").focus();
    	return;
    }
	else if ($("#memMobil1").val() == "선택") {
    	alert("휴대폰 첫 자리를 선택하세요!");
    	$("#memMobil1").focus();
    	return;
	}
    else if ($("#memMobil2").val() == "") {
    	alert("휴대폰 둘쨰 자리를 입력하세요!");
    	$("#memMobil2").focus();
    	return;
    }
	else if ($("#memMobil3").val() == "") {
    	alert("휴대폰 셋째 자리를 입력하세요!");
    	$("#memMobil3").focus();
    	return;
    }
	else {
   		alert("ok");
   		document.mem.action = "/insertMembership.do";
		document.mem.submit();
    }
//        else if ($("#tel1").val().length != 3) {
//     alert("전화1을 3개의 숫자로 꼭 입력하세요!");
//     $("#tel1").val("");
//     $("#tel1").focus();
// } 
}
function pwCheck(){

	var pw1 = $("#memPw").val();
	var pw2 = $("#memPwcheck").val();
	alert(pw1);
	alert(pw2);
	
	if(pw1 != pw2){
		
		 document.getElementById('pwCheck').style.color = "red";
		 document.getElementById('pwCheck').innerHTML = "암호가 일치하지 않습니다."; 
		
	} 
	
	if(pw1 == pw2){
		
		alert("ㅇㅇ");
		 document.getElementById('pwCheck').style.color = "black";
		 document.getElementById('pwCheck').innerHTML = "암호가 일치합니다."; 
	}
	//$("#pwCheck").html('<font>블라블라</font>'); 이런 형태로도 가능
}

function idCheck(){
	
	 
	if ($("#memId").val() == "") {
    	alert("아이디를 꼭 입력하세요!");
    	$("#memId").focus();
    	return;
    }
	else if ($("#memId").val().length <= 3) {
 		alert("아이디를 4자리 이상 입력하세요!");
		$("#memId").val("");
		$("#memId").focus();
		return;
	} else {
		
		alert("ㅇㅋ됨")
		
		var memId = $("#memId").val();
		
		$.ajax({
			type: "get",
			url: "idCheck.do",
			data : $("#memId"),
			
			
			success:function(data){
				
			var idCount = data["idCount"]
			
				if(idCount !=0){
					
					var text = '<font style="color:red">아이디가 있단다</font>';
					text += '<input type="hidden" id="idCheckResult" name="idCheckResult" value="1">'
					$("#loadtext").html(text); //해당 내용을 보여준다
					
				}else{
					var	text = '<font style="color:blue">사용가능한 아이디입니다</font>';
					text += '<input type="hidden" id="idCheckResult" name="idCheckResult" value="0">'
					$("#loadtext").html(text); //해당 내용을 보여준다
					$( "#memId" ).prop( "readonly",true);
					}
				},
				 error:function(xhr,status,error){ //ajax 오류인경우  
				    	alert("$");
			            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
			   		}
			})
		}
}








</script>
</head>
<body>
	<form method="post" name="mem">
		<nav class ="navbar navbar-inverse">
			<div class ="container-fluid">
			 	<div class="navbar-inverse">
			 	</div>
			</div>
		</nav>
		<div style="width:50%; margin:auto;">
		<table class="table" align="center" >
		
		  <tr>
		  	<td> 아이디 </td>
		  	<td> <input style="width:250px;" class="form-control" type="text" id="memId" name="memId" ></td>
		    <td> <button class="btn btn-default" type="button" id="idRequest" name="idRequest" onclick="idCheck()">중복확인</button></td>  
		    <td><div id="loadtext"></div></td>
		  
		 </tr>
		 <tr>
		  	<td> 비밀번호 </td>
		  	<td> <input style="width:250px;" class="form-control" type="password" id= "memPw" name="memPw" ></td>
		  	
		 </tr>
		 <tr>
		  	<td> 비밀번호 확인 </td>
		  	<td> <input  style="width:250px;" class="form-control" type="password"  id= "memPwcheck"  name="memPwcheck" onkeyup="pwCheck()" ></td>
		  	<td> <div id="pwCheck" >동일한 비밀번호를 입력하세요</div>
		 </tr>
		 <tr>
		  	<td> 성명 </td>
		  	<td> <input  style="width:250px;" class="form-control" type="text" id="mamName" name="memName" ></td>
		 </tr>
		 <tr>
			 <td> 회사 </td>
			 <td> <select style="width:250px;" id ="memCompnSeq" name="memCompnSeq"  class="form-control" style="width:300px; placeholder:Select a state...">
															<option value="회사선택" selected>회사선택</option>
														<c:forEach items="${companylist}" var="item">
																<option value="${item.company_seq}">${item.company_name}</option>
															</c:forEach>
														</select>
			 </td>
		 </tr>
		 <tr>
			 <td>부서 </td>
			 <td> <select  style="width:250px;" id="memDepmtSeq" name="memDepmtSeq" class="form-control" style="width:300px; placeholder:Select a state...">
															<option value="부서선택" selected>부서선택</option>
															<c:forEach items="${departlist}" var="item">
																<option value="${item.depart_seq}">${item.depart_name}</option>
															</c:forEach>
															
														</select>
														
															
															
			 </td>
		 </tr>
		 <tr>
			 <td> 직급 </td>
			 <td>  <input style="width:250px;" class="form-control" type="text" id="memTitle"name="memTitle" ></td> 
		 </tr>
		 <tr>
		 	<td> 성별 </td>
		 	<td> <select class="form-control" style="width:250px;" id ="memSex" name="memSex" style="width:80px;">
		 			 <option value="성별" selected>성별</option>
				  	 <option value="남자">남자</option>
					 <option value="여자">여자</option>
				</select>
			</td>
		</tr>
		<tr>
			<td> 생년월일 </td>
			<td> <input style="width:250px;" class="form-control" type="text" name="memBirth" id="memBirth">
					<script type="text/javascript">   
					
						initCal({id:"memBirth",type:"day",today:"y",icon:"y"});
						
					</script>
			</td> 
		</tr>
		<tr>
			<td> 이메일 </td>
			<td nowrap="nowrap">
				<input   type="text" class="form-control" style="width:100px; display: inline-grid;" id="memEmail1" name="memEmail1" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
					@
				<input  type="text" class="form-control" style="width:100px; display: inline-grid;"  id="memEmail2" name="memEmail2" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
					<select  id="email" class="form-control" style="width:150px; text-align:left;  display: inline-grid;"  onChange="insertEmail()">
						<option value="직접입력" selected>직접입력</option>					
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
			
		</tr>
		<tr>
			<td> 휴대폰 </td>
			<td> <select class="form-control"id="memMobil1" style="width:100px; display: inline-grid;">
					<option value ="010"> 010 </option>
					<option value ="011"> 011 </option>
					<option value ="016"> 016 </option>
					<option value ="017"> 017 </option>
				</select>
			 -<input class="form-control" id="memMobil2" style="width:100px; display: inline-grid;" type="text"> 
			 -<input class="form-control" id="memMobil3" style="width:100px; display: inline-grid;" type="text"> 
			</td>	
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
				<button class="btn btn-default" type="button" onclick="insertMember()">회원가입</button>
				<button class="btn btn-default" type="button" onclick="main()">취소</button>
			</td>
		</tr>
		</table>
		</div>
	</form>
</body>
</html>