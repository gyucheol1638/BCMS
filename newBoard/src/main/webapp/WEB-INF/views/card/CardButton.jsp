<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap-3.3.2-dist/css/tabs.css" type="text/css">
</head>

<body>
	<div class="wrapper" style="width:600px; float:left; margin-top: 63px;">
		<div id="css_tabs">
		    <input id="tab1" type="radio" name="tab" checked="checked" />
		    <input id="tab2" type="radio" name="tab" />
		    <label for="tab1" style="margin-left: 0px;">커뮤니케이션</label>
		    <label for="tab2">변경내역</label>
		    <div class="tab1_content"><iframe src="/nmeCardComnctnSelectForm.do" width="600px" height="1300px" name="iframe_a" frameborder=0 scrolling=no></iframe></div>
<%-- 			<div class="tab2_content"><iframe src="/nmeCardHistrSelectForm.do?nmeCardSeq=${NmeCardSeq}" width="600px" height="1300px" name="iframe_a" frameborder=0 scrolling=no></iframe></div> --%>
		</div>
	</div>		
</body>
</html>