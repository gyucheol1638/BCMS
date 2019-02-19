 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>





<script type="text/javascript" src="/resources/S.E/js/HuskyEZCreator.js" charset="utf-8"></script>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>다이얼로그  - 데이터분석포탈</title>
<!-- 상단 타이틀 아이콘 -->
<link rel="icon" href="/resources/carousel/favicon.ico">


  



<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->




<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">

<link href="/resources/bootstrap-3.3.2-dist/css/dialoge.css?ver=1" rel="stylesheet">
<!-- 부가적인 테마 -->
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">

<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<!-- JQuery 관련 파일들 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>	












   
   
   
      <script>
      
      	 var oEditors = [];
         $(document).ready(function(){
        	 
        	 nhn.husky.EZCreator.createInIFrame({
      			oAppRef: oEditors,
      			elPlaceHolder: "conExplan",
      			sSkinURI: "/resources/S.E/SmartEditor2Skin.html",
      			fCreator: "createSEditor2"
      		});
        	 
             $('#btn_cancle').click(function() {
                var url = "/.do";    
                $(location).attr('href',url);
            });
             
             $("#btn_insert").click(function(){
                if ($("#m_dtsetTitle").val() == "")
               {
                  alert("제목을 입력해주세요.");
                     $("#m_dtsetTitle").focus();
               }
//                else if ($("#dupliCheckSeq").val() == "")
// //                {
//                   alert("바코드 중복 검사를 진행해주세요.");
//                      $("#prodctSeq").focus();
//                }
               else if ($("#topCatgrNme").val() == "대분류")
               {
                  alert("대분류를 선택해주세요.");
                     $("#topCatgrNme").focus();
               }
//                else if ($("#midCatgrNme").val() == "중분류")
//                {
//                   alert("중분류를 선택해주세요.");
//                      $("#midCatgrNme").focus();
//                }
               else if ($("#m_dtsetProvideORG").val() == "")
               {
                  alert("출처를 입력해주세요.");
                     $("#m_dtsetProvideORG").focus();
               }
               else if ($("#m_dtsetProvideType").val() == "")
               {
                  alert("제공 형태를 입력해주세요.");
                     $("#m_dtsetProvideType").focus();
               }
               else if ($("#fileUpload").val() == "" && $("#url").val() == "")
               {
                  alert("파일 또는 URL을 등록해 주세요.");
                     $("#url").focus();
               }
               else
               {
            	     oEditors.getById["conExplan"].exec("UPDATE_CONTENTS_FIELD", []);
    				 document.openDataSetInsert.m_dtsetExplan.value = $("#conExplan").val();	 
            	   
                     $("input[name=m_categorySeq]").val($("#topCatgrNme").val());                      
                     document.openDataSetInsert.action = "/myDataSetInsert.do";
                     document.openDataSetInsert.method = "post";
                     document.openDataSetInsert.submit();
               }
            });      
         });
         
//          var arr = new Array(2); 
//          arr[0] = "<td class='text-center' style='padding-top: 13px;'>"
//                + "<font color='red'>*</font>파일 업로드"
//                + "</td>"
//                + "<td class='text-center'>"
//                + "<div class='col-md-4 col-xs-4'><input type='file' id='exampleInputFile'></div>"
//                + "<div class='col-md-8 col-xs-8'>"
//                + "<input class='btn btn-default btn-sm' type='button' value='파일 추가' ID='btn_filePlus'>"
//                + "</div>"
      
//                + "</td>"
//          arr[1] = "<td class='text-center' style='padding-top: 13px;'>"
//                + "<font color='red'>*</font>DB링크 "
//                + "</td>"
//                + "<td class='text-center'>"
//                + "<input type='text' name='url' class='form-control'>"
//                + "</td>"                           
      
//          function fileUp(index){ //파일 업로드 형태에 따른 선택 기능
//             file.innerHTML=arr[index];
//          }
               
         //공개여부 라디오 box
         function publicCheck(index){
            if(index==0){
               $("input[name=m_publicCheck]").val("공개");
               
            }
            else if(index==1){
               $("input[name=m_publicCheck]").val("비공개");
            }
            
         }
               //대분류를 선택했을때 중분류 나타내기위해
//          function catgrChoice(size,value)
//          {
//             var categoryNme;
//             var categorySeq;
// //             var cartgArray = new Array();
//             var catgrData = { "catgrSize" : size, "catgrSeq" : value};
            
//             if(value=="대분류"){
               
//                $("#midCatgrNme").find("option").remove();
//                $("#midCatgrNme").append("<option>중분류</option>");
// //                $("#botCatgrNme").find("option").remove();
// //                $("#botCatgrNme").append("<option>소분류</option>");
// //                $("input[name=selectedBotCatgrNme]").val("소분류");
//             }
//             if(size == "대" && value=="전체"){
               
//                $("#midCatgrNme").find("option").remove();
//                $("#midCatgrNme").append("<option>전체</option>");
// //                $("#botCatgrNme").find("option").remove();
// //                $("#botCatgrNme").append("<option>전체</option>");
// //                $("input[name=selectedBotCatgrNme]").val("소분류");
//             }
//             else
//             {
//                $.ajax({
//                   type: "post",
//                   url: "/dataSetCatgSelectList.do", //이페이지에서 중복체크를 한다
//                   data : catgrData,
//                   dataType : "JSON",
//                   success: function(data){
// //                      var catgrArray = data["catgrArray"];
//                         $.each(data, function(i, vo){
//                            categoryNme = vo.categoryNme;
//                            categorySeq = vo.categorySeq;
// //                            alert(categoryNme);
//                         });
//                      if(size=="대")
//                      {
//                         $("#midCatgrNme").find("option").remove();
//                         $("#midCatgrNme").append("<option selected>중분류</option>");
//                         $.each(data, function(i, vo){
//                            categoryNme = vo.categoryNme;
//                            categorySeq = vo.categorySeq;
//                            $("#midCatgrNme").append("<option value='"+categorySeq+"'>"+categoryNme+"</option>");
//                         });
//                         $("input[name=topCatgrNme]").val(value);
                        
//                         catgrArray = data["botCatgrArray"];                     
//                         $("#botCatgrNme").find("option").remove();
//                         $("#botCatgrNme").append("<option selected>소분류</option>");
//                         for(var i=0;i<catgrArray.length;i++)
//                         $("#botCatgrNme").append("<option>"+catgrArray[i]+"</option>");
//                         $("input[name=midCatgrNme]").val($("#midCatgrNme").val());
//                      }
//                      else if(size=="중")
//                      {
                     
//                         $("#botCatgrNme").find("option").remove();
//                         $("#botCatgrNme").append("<option selected>소분류</option>");
//                         $.each(data, function(i, vo){
//                            categoryNme = vo.categoryNme;
//                            categorySeq = vo.categorySeq;
//                            $("#botCatgrNme").append("<option value='"+categorySeq+"'>"+categoryNme+"</option>");
//                         });
//                         $("input[name=midCatgrNme]").val(value);
//                      }
//                      $("input[name=selectedTopCatgrNme]").val($("#topCatgrNme").val());
//                      $("input[name=selectedMidCatgrNme]").val($("#midCatgrNme").val());
//                      $("input[name=selectedBotCatgrNme]").val($("#botCatgrNme").val());
//                   },
//                    error:function(xhr,status,error)
//                    { //ajax 오류인경우  
//                         alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
//                      }
//                });
//             }         
//          }   
         function checkDataSet(){
            
            var formInfo = new FormData(document.getElementById("dataSetCheck"));
            $.ajax({
               url: "/tempFileInsert.do",
               data: formInfo,
               processData: false,
               contentType: false,
               type: 'POST',
               success:function(){
            	   
            	   
            	   
//                   var flag = Number($("#CheckDataFlag").val());
                  $.ajax({
                     url: "/tempFileSelect.do",
                     data: {},
                     type: 'GET',
                     success:function(data){
                         $.each(data, function(i, vo){ //제이쿼리 포문. vo로 받아옴. 
                            // alert(i);
                            
                              var files = vo.m_dFileNme;
                              var fileSize = vo.m_dFileSize;
                               // 파일 이름을 넣을 DIV 생성
                              var fileName=document.createElement('div');
                              fileName.id="checkDataSetDiv"+i;  //div id 생성
                              document.getElementById("checkDataSetChild").appendChild(fileName);
                              document.getElementById("checkDataSetDiv"+i).innerHTML=files+"("+fileSize+"kb)           ";
                              
                              // 삭제 이미지 생성
                              var deleteImg = document.createElement('img');
                              deleteImg.src = "resources/images/fileDelete.png";
                              deleteImg.name="checkDeleteImg"; //삭제 이미지 이름 생성
                              deleteImg.id="checkDeleteImg"+i; //삭제 이미지 id 생성
                              deleteImg.value = vo.m_dFileSeq;
                              
                              deleteImg.onclick = function(){
                                       var s = Number($("#checkDeleteImg"+i).val());
                                       $.ajax({
                                        url: "/tempFileDelete.do?s="+s,
                                        data: {},
                                        processData: false,
                                        contentType: false,
                                        type: 'GET',
                                        success:function(){$("#checkDeleteImg"+i).parent().remove()},
                                     error:function(xhr,status,error)
                                     { //ajax 오류인경우  
                                        alert("$");
                                        alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
                                     }
                                  });
                                 };
                              document.getElementById("checkDataSetDiv"+i).appendChild(deleteImg);
                         });
                     },
                     error:function(xhr,status,error)
                     { //ajax 오류인경우  
                        alert("$");
                        alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
                     }
                  });
               },
               error:function(xhr,status,error)
               { //ajax 오류인경우  
                  alert("$");
                  alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
               }
            });   
         }
//          $(document).ready(function(){
//             $("#myDataSetInsert").click(function(){
//                $("input[name=m_categorySeq]").val($("#midCatgrNme").val());
//                document.openDataSetInsert.action = "/myDataSetInsert.do";
//                document.openDataSetInsert.submit();
//             });
//          });
      </script>
      






<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>다이얼로그  - 데이터분석포탈</title>
<!-- 상단 타이틀 아이콘 -->
<link rel="icon" href="/resources/carousel/favicon.ico">


  



<!-- jQuery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->




<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">

<link href="/resources/bootstrap-3.3.2-dist/css/dialoge.css?ver=1" rel="stylesheet">
<!-- 부가적인 테마 -->
<link href="/resources/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">

<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<!-- JQuery 관련 파일들 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>	












<!-- <link type="text/css" rel="stylesheet" media="all" href="/assets/css/common/font.css"/> -->
<!-- <link type="text/css" rel="stylesheet" media="all" href="/resources/open/font-awesome.css"/> -->
<!-- <link type="text/css" rel="stylesheet" media="all" href="/resources/open/font-ptech.css"/> -->

<!-- 기존 CSS -->
<!-- <link rel="stylesheet" type="text/css" href="/resources/open/old_view_use_layout.css" > -->


<link type="text/css" rel="stylesheet" media="all" href="/resources/open/application.css?ver=1">
	<script>
	
		function loginForm(){
			alert("로그인 하셔야 가능합니다.");
			location.href="/memLoginForm.do";
		}
	
		function commonView(){
    		location.href="/commonView.do";
    	}
    	
    	function commonSideView(){
    		location.href="/commonSideView.do";
    	}
    	

    	function one(){
    		location.href="/one.do";
    	}
    	
    	function mainConView(i){
    		if(i == 5){
    			window.location.href="conInsertView.do?i="+i;
    		}
    	}
    </script>



<!-- 상단 회색바, 로그인, 회원가입, 일반사용자 관리자 구분 (시작) -->
	<div id="common-header">
		
	       
	          <div class="container" style="height:37px">
				<div>
					<ul class="navbar">
		                <li class="active">
		                    <a href="" class="box"></a>
		                </li>
		            </ul>
					<ul class="navbar right">
						<li>
		                    <a href="/memMypageForm.do"><font>(wjddn)님 환영합니다!</font></a>
		                </li>
		                <li>
		                    <a href="/logout.do" class="">로그아웃</a>
		                </li>
		                <li>
		                    <a href="/memberInsertForm.do" class="">회원가입</a>
		                </li>
		                 <li>
		                     <a href="/memMypageForm.do">
		                    	마이페이지
		                    </a>
		                </li>
					</ul>
				</div>
			</div>
	       
           

	       
	   


	</div>
<!-- 상단 회색바, 로그인, 회원가입, 일반사용자 관리자 구분 (끝) -->	
		


<!-- 메인메뉴  (시작) -->
	<div class="gnb-wrapper visible-desktop" style="margin-top:30px">
	<div class="container">
		<a class="logo" href="/"> <img src="/resources/images/logoMain.png" alt="다이얼로그(Dialoge)" style="height:55px"> </a>
		<div class="right">
			<ul class="gnb clearfix">
			
	       		
	       			<li> <a href="/dataSetList.do">데이터셋</a> <div class="indicator"></div>
		               <ul class="child-menu menu0 ">
		                  <li><a href="/dataSetList.do"> 데이터셋 </a></li>
		                  <li> <a href="/myDataSetList.do">MY 데이터셋</a></li>
		               </ul>
		            </li>
	       		
	       		
	       		
	       		
	       		
	       	
	      

				<li> <a href="/reportListM.do">보고서</a> <div class="indicator"></div>
					<ul class="child-menu menu1 ">			
						<li> <a href="/reportListE.do?type=1"> 연구보고서 </a></li>	
						<li> <a href="/reportListE.do?type=2"> 연구논문 </a></li>	
						<li> <a href="/reportListE.do?type=3"> 신문기사 </a></li>				
						<li> <a href="/reportListM.do"> 분석보고서 </a></li>		
						<li> <a href="/reportListE.do?type=4"> 기타 </a></li>									
					</ul>
				</li>
				
				<li> <a href="/conView.do?page=5">공모전</a> <div class="indicator"></div>
					<ul class="child-menu menu2 ">
						<li> <a href="/conView.do?page=1"> 새로 등록한 공모전 </a> </li>	
						
						
							<li> <a href="/conView.do?page=2"> 신청중인 공모전 </a> </li>
							<li> <a href="/conView.do?page=7"> 참가한 공모전 </a> </li>
						
						
						<li> <a href="/conView.do?page=5"> ALL </a> </li>
					</ul>
				</li>
				
				
					
					
					
						<li> <a onclick="alert('준비중입니다.')"> 다이얼로그</a> <div class="indicator"></div>
							<ul class="child-menu menu3">			
								<li> <a onclick="alert('준비중입니다.')"> 다이얼로그 ? </a> </li>
								<li> <a href="/noticeList.do"> 공지사항 </a> </li>
							</ul>
						</li>
					
				
				
				
			</ul>
		</div>
	</div>
</div>

<div class="submenu-wrapper visible-desktop">
</div>
<!-- 메인메뉴  (끝) -->
 


 
<!--          <div class="container-fluid"> -->
<!--              <div class="col-md-3 col-xs-4" style="border:1px solid;"> -->

<!--              </div> -->
            <div class="container">
		    	<div class="col-md-12 col-xs-12" style="border-bottom:1px solid gray;">
					<div class="col-md-6 col-xs-6" style="margin-top: 25px;">
						<h1>데이터 셋 등록</h1>
						<h5 style="margin-top:5px">
						   	 	<font color="gray">데이터의 집합체, 컬렉션(collection)이며, <br>
						   	 	각각의 데이터 테이블의 내용이나 각각의 통계적 <br>
						   	 	데이터 매트릭스(data metrix)에 해당하는 것.</font>			 				     
						</h5>			   
					</div>
					<div class="col-md-6 col-xs-6">
						<img src="/resources/images/main.PNG" style="width:330px; padding-right:50px; margin-right:0px; margin-top:20px;">
					</div>
				</div>
               <div class="col-md-9 col-xs-9" style="margin-top:10px;">
               </div>
               <div class="col-md-3 col-xs-3" text-align="right" style="margin-top:10px;">
                     <font color="red">*</font>는 필수 항목입니다.
               </div>
               
               <div class="col-md-12 col-xs-12" style="margin-top:10px;">
               <form name="openDataSetInsert" method="post" class="form-inline">
                  <input type="hidden" name="m_categorySeq" value="0">
                  <input type="hidden" name="m_publicCheck" value="비공개">
                  <table class="table" style="margin-bottom: 0px" ;="">
                     <colgroup>            
                         <col class="col-md-3 col-sm-3">          
                         <col class="col-md-9 col-sm-9">
                     </colgroup>
                     
                     <tbody><tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>공개 여부
                        </td>
                        <td class="text-left">                        
                           <input type="radio" name="optionsRadio" id="optionsRadios1" value="공개" checked="" onclick="javascript:publicCheck(0)">공개
                           <input type="radio" name="optionsRadio" id="optionsRadios2" value="비공개" onclick="javascript:publicCheck(1)">비공개                                                            
                        </td>                     
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>제목
                        </td>
                        <td class="text-center">
                           <input type="text" class="form-control" name="m_dtsetTitle" id="m_dtsetTitle">
                        </td>
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>분류
                        </td>
                        <td class="text-center">
                           <div class="col-md-4 col-xs-4" style="padding-right:8px; padding-left:0px;">
                           <select class="form-control" id="topCatgrNme" onchange="javascript:catgrChoice('대',this.value)">
                              <option selected="">대분류</option>
                              
                                    <option value="1">교육</option>
                              
                                    <option value="2">국토관리</option>
                              
                                    <option value="3">공공행정</option>
                              
                                    <option value="4">재정금융</option>
                              
                                    <option value="5">산업고용</option>
                              
                                    <option value="6">사회복지</option>
                              
                                    <option value="7">식품건강</option>
                              
                                    <option value="8">문화관광</option>
                              
                                    <option value="9">보건의료</option>
                              
                                    <option value="10">재난안전</option>
                              
                                    <option value="11">교통물류</option>
                              
                                    <option value="12">환경기상</option>
                              
                                    <option value="13">과학기술</option>
                              
                                    <option value="14">농축수산</option>
                              
                                    <option value="15">통일외교안보</option>
                              
                                    <option value="16">법률</option>
                              
                           </select>
                             </div>
                        </td>
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>설명
                        </td>
                        <td class="text-center">
                           <textarea class="form-control" id="conExplan" style="margin-left: 2%; height: 300px; width: 100%; display: none;" rows="200" placeholder="설명을 입력해주십시오."></textarea><iframe frameborder="0" scrolling="no" src="/resources/S.E/SmartEditor2Skin.html" style="width: 100%; height: 349px;"></iframe>
                           <input type="hidden" name="m_dtsetExplan" id="m_dtsetExplan">
                        </td>
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>출처
                        </td>
                        <td class="text-center">
                           <input type="text" class="form-control" name="m_dtsetProvideORG" id="m_dtsetProvideORG">
                        </td>
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>제공 형태
                        </td>
                        <td class="text-center">
                           <input type="text" class="form-control" name="m_dtsetProvideType" id="m_dtsetProvideType">
                        </td>
                     </tr>
                     <tr>
                        <td class="text-center" style="padding-top: 13px;">
                           <font color="red">*</font>URL
                        </td>
                        <td class="text-left">                        
                           <input type="text" class="form-control" name="url" id="url">                                                               
                        </td>                     
                     </tr>
                     </tbody></table>   
                  </form>
                                          
                  <form name="dataForm" id="dataSetCheck" enctype="multipart/form-data" method="post">   
                     <table class="table">
                        <colgroup>            
                            <col class="col-md-3 col-sm-3">          
                            <col class="col-md-9 col-sm-9">
                           </colgroup>            
                        <tbody><tr>
                           <td class="text-center" style="padding-top: 13px;">
                              <font color="red">*</font>파일 업로드
                           </td>
                           <td class="text-center">
<!--                               <div class="col-md-4 col-xs-4"> -->
                              <input type="file" id="fileUpload" name="fileInfo" multiple="" onchange="javascript:checkDataSet()">
<!--                               </div>                      -->
<!--                               <div class="col-md-8 col-xs-8"></div> -->
                           </td>
                        </tr>
                     
                        <tr>
                           <td style=" border-top-width: 0px; padding-top:0px; padding-bottom:0px;" colspan="2">
                           
                              <div id="checkDataSetChild">
                               </div>
                           </td>
                        </tr>                                                    
                        <tr>
                           <td colspan="2"></td>
                        </tr>
                     </tbody></table>
                  </form>
               </div>
               <div class="col-md-7 col-xs-9">
               </div>
               <div class="col-md-5 col-xs-3">
                  <input class="btn btn-default" type="button" value="등록" style="width:126px; float:right;" id="btn_insert">
                  <input class="btn btn-default" type="button" value="취소" style="width:126px; float:right; margin-right:15px" id="btn_cancle">
               </div>
             </div>
<!--           </div> -->
       
   
      
</body>
</body>
</html>