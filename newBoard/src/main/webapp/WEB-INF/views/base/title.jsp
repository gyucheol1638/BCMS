<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
   <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
   <script src="/resources/bootstrap-3.3.2-dist/Bootswatch_ Cosmo_files/bootstrap.min.js"></script>
   <script src="/resources/bootstrap-3.3.2-dist/js/selectize.js"></script> 
   <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/bootstrap.css" media="screen">
   <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/ji.css" media="screen">
   <link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/default.css">
    
<title>Insert title here</title>


<script>
	function nmeCardSelectForm(){
		location.href="/CardSelect.do";
	}
	function nmeCardBinSelectForm(){
		location.href="/nmeCardBinSelectForm.do";
	}
// 	function groupListForm(){
// 		location.href="/groupListForm.do";
// 	}
	function goinglogout(){	
		alert("로그아웃");
		location.href="/logout.do";
	}
	function bcmsmain(){
		location.href="/mynamecard.do";
   }
</script>

</head>
<body>
	<div align="center" style="margin-top:15px;">
		<a href="#"><img  style="width:300px"src="resources/img/BCMS.png" id="logo"></a>
	</div>
	<div class="navbar-wrapper">
		<nav class="navbar navbar-default navbar-static-top">
			<div  class="collapse navbar-collapse">
	          <ul class="nav navbar-nav">
	            <li><a href="">Bcms</a></li>
	            <li class="dropdown">
	            	<a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false" onclick="javascript:groupListForm()">[명함관리]<span class="caret"></span></a>
		            <ul class="dropdown-menu" role="menu" > 
		            	<li><a href="javascript:nmeCardSelectForm()">- 나의 명함 리스트</a></li>
						<li><a href="javascript:sharNmeCardSelectForm()">- 공유 명함 리스트</a></li>
						<li><a href="javascript:recvNmeCard();">- 받은 명함 리스트</a></li>
		            </ul>
	            </li>
	            <li><a href="">[그룹관리]</a></li>
	            <li class="dropdown">
	            	<a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false">[휴지통]<span class="caret"></span></a>
	            	<ul class="dropdown-menu" role="menu"> 
	            		<li><a href="javascript:nmeCardBinSelectForm()">- 나의 명함 리스트 휴지통</a></li>
						<li><a href="javascript:sharNmeCardBinSelectForm()">- 공유 명함 리스트 휴지통</a></li>
						<li><a href="javascript:recvNmeCardBinSelectForm()">- 받은 명함 리스트 휴지통</a></li>
					</ul>
				</li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	          
							<li><a><b>${logininfo.memName}</b>님 환영합니다.</a></li>
							<li><a href="javascript:memSelectViewForm();">【정보관리】</a></li>
					        <li><a href="javascript:goinglogout();">【로그아웃】</a></li>
			  </ul>
	        </div>
		</nav>
	</div>
</body>
</html>
