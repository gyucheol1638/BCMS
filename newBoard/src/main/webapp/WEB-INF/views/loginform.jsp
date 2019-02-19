<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap-3.3.2-dist/Signin Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
<link href="/resources/bootstrap-3.3.2-dist/Signin Template for Bootstrap_files/signin.css" rel="stylesheet">

<script>

function main(){
	
	location.href="/loginform.do";
}
function goingmemLogin(){
	
	
	document.loginForm.action = "/memLogin.do";
	document.loginForm.submit();
	
}
function goingmemInsert(){
	
	location.href="/memInsert.do";
}






</script>

</head>
 <body>

    <div class="container">
		<div align="center" style="margin-top:12%">
			<a href="javascript:main()"><img src="/resources/img/BCMS.png" style="width:300px; width:15%; height:15%"></a>
		</div>
	
      <form method="post" name="loginForm" >
	      <div align="center">
	        <input type="text" name="memId" class="form-control" style="width:300px"placeholder="ID" required="" autofocus="">
	       
	        <input type="password" name="memPw" class="form-control" style="width:300px" placeholder="Password" required="">
	        
	        <div class="checkbox">
	          <label>
	            <input type="checkbox" value="remember-me"> Remember me
	          </label>
	        </div>
	      
        <button class="btn btn-lg btn-primary btn-block" style="width:300px" onclick="goingmemLogin()">로그인</button>
        <button type="button" class="btn btn-link" onclick="goingmemInsert()">회원가입</button>
        </div>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    

  

</body></html>