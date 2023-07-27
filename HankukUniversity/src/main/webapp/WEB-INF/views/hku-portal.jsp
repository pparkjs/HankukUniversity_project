<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link href="/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/portal/webfonts.css">
    <link href="/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/portal/default.css">
    <link href="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack.min.css" rel="stylesheet"/>
    <!-- toastr -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />	
	<!-- 제이쿼리 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- toastr -->
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>		
    <title>한국대학교 포탈</title>
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack-all.js"></script>
<script src="/js/custom.js"></script>
<style>
.grid-stack {
/*   background: lightgoldenrodyellow; */
}

.grid-stack-item-content {
/*   color: #2c3e50; */
  text-align: center;
/*   background-color: #18bc9c; */
}
.table-wrap {
    height: 405px;
}
.thead-dark{
	position: sticky;
	top: 0px;
}
.table-info-td{
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	color: whitesmoke;
	background-color: #800000;
}
.table-wrap table td{
	height: 0px;
}
.table tbody td{
    padding: 3px;
}
.table tbody td:first-child{
	text-align: left;
}
.nav-link{
	color:#800000;
}
.tCon{
	display: flex;
    align-items: center;
    justify-content: center;
    padding: 15px;
    margin-right: 15px;
    height: 40px;
}
.main_cont_header{
	background-color: #800000;
}
.hWrap{
	display: flex;
    justify-content: end;
    align-items: center;
    margin-top: 4px;
}
.toast-success{
/*  	background: black;  */
}
#preloader {
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 99999999999;
  background: #fff; }

.loader {
  position: absolute;
  width: 11rem;
  height: 16rem;
  top: 50%;
  margin: 0 auto;
  left: 0;
  right: 0;
  transform: translateY(-50%); }

.circular {
  animation: rotate 2s linear infinite;
  height: 100%;
  transform-origin: center center;
  width: 100%;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto; }

.path {
  stroke-dasharray: 1, 200;
  stroke-dashoffset: 0;
  animation: dash 1.5s ease-in-out infinite, color 6s ease-in-out infinite;
  stroke-linecap: round; }

@keyframes rotate {
  100% {
    transform: rotate(360deg); } }

@keyframes dash {
  0% {
    stroke-dasharray: 1, 200;
    stroke-dashoffset: 0; }
  50% {
    stroke-dasharray: 89, 200;
    stroke-dashoffset: -3.5rem; }
  100% {
    stroke-dasharray: 89, 200;
    stroke-dashoffset: -12.4rem; } }

@keyframes color {
  100%,
  0% {
    stroke: #800000; }
  40% {
    stroke: #800000; }
  66% {
    stroke: #800000; }
  80%,
  90% {
    stroke: #800000; } 
  }
</style>

<div id="preloader">
	<div class="loader">
		<img src="/images/로딩로고.png" width="205px;" height="205px;" style="margin-top: 26px; margin-left: -16px;">
		<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
        </svg>
	</div>
</div>
<c:if test="${not empty first}">
	<c:remove var="first" scope="request"/>
	<c:remove var="first" scope="session"/>
	<script type="text/javascript">
		window.open("/main/changePopup","_blank","width=400,height=450,left=650,top=350");
	</script>
</c:if>
<body>
    <div class="main_wrap">
        <div class="main_inner">
            <div class="main_cont_wrap">
                <div class="main_cont my_info">
                    <div class="logo_wrap">
                        <a href="/main/portal" onclick="javascript:window.location.reload(true);">
                            <!-- <span class="sr-only">한국포탈서비스</span> -->
                        </a>
                    </div>
                    
                    <div class="login_box">
                        <div class="profile_box" style="text-align: center;">
                            <div class="profile_div" style="margin-top: 10px;">
                                <hr style="margin: 0.5rem 0rem 1rem 0rem; color: white;"/>
                                <c:choose >
                                	<c:when test="${sessionScope.stdInfo.stdProfilePath == null || sessionScope.stdInfo.stdProfilePath == ''}">
                                		<img src="/images/기본프로필.png" id="profileImg" style="width:200px; height:200px; border-radius: 50%; border: 3px solid white;">
                                	</c:when>
                                	<c:otherwise>
                                		<img src="/download${sessionScope.stdInfo.stdProfilePath }" id="profileImg" style="width:200px; height:200px; border-radius: 50%; border: 3px solid white;">
                                	</c:otherwise>
								</c:choose>
                            </div>
                        </div>
                        <div class="text_wrap">
                            <p class="balloon">환영합니다!</p>
                            <p><span style="margin-right: 10px;"><c:out value="${sessionScope.stdInfo.deptNm }"/></span><span style="font-size: 25px;"><c:out value="${std.stdNo }"/></span></p>
                            <p class="en title"><c:out value="${std.stdNm }"/> 님</p>
                            <ul>
                                <li>
                                    <a class="LK046_A bb" href="/main/logout">로그아웃</a>
                                </li>
                                <li>
                                    <a class="LK047_A bb" href="#none" style="width: 90px;">비밀번호변경</a>
                                </li>
                            </ul>
                            <hr style="margin: 0.5rem 0; color: white;"/>
                            <div style="display: flex; justify-content: center;">
                                <!-- <ul class="std_info">
                                    <li>
                                        <a style="cursor: pointer;">KOR</a>
                                    </li>
                                    <li>
                                        <a style="cursor: pointer;">ENG</a>
                                    </li>
                                </ul> -->
                                <div style="border-right: 2px solid white; padding-right: 20px;">
                                    <div>
                                        <span style="font-size: 20px; color: white;">이수/졸업학점</span>
                                    </div>
                                    <div>
                                        <span style="font-size: 18px; color: #FFC933;"><c:out value="${sessionScope.stdInfo.crdSum }"/>/130</span>
                                    </div>
                                </div>
                                <div style="padding-left: 20px;">
                                    <div>
                                        <span style="font-size: 20px; color: white;">학적상태</span>
                                    </div>
                                    <div>
                                        <span style="font-size: 18px; color: #FFC933;"><c:out value="${sessionScope.stdInfo.stdSttsNm }"/></span>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 0.5rem 0; color: white;"/>
                            <!-- <p class="en desc">Hankuk university</p> -->
                        </div>
                    </div>
                    <div class="side_box">
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">통합학사시스템</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/hku/student/studyBoard">스터디게시판</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/hku/portal/all-notice-list">공지사항</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">마이페이지</a>
                        </div>
                        <hr style="margin: 1rem 0rem 0rem 0rem; color: white;"/>
                    </div>
<!--                     <div class="footer_txt pers_terms"> -->
<!--                         <a href="#" class="LK052_S pers_terms_s">개인정보처리방침(대덕·국제)</a> 개인정보처리방침(신촌·국제) -->
<!--                         &nbsp;<span>|</span>&nbsp; -->
<!--                         <a href="#" class="LK052_F pers_terms_f">개인정보처리방침(미래)</a> 개인정보처리방침(미래) -->
<!--                     </div> -->

                </div>
                <div class="main_cont" id="jjgDiv" style="height:auto; overflow: auto; background-color: rgba( 0, 0, 0, 0.6 );">
                    <!-- 헤더========================================================================= -->
                    <div class="main_cont_header" style="height: 50px; border: 1px solid #6e6e6e; margin-left: -49px; width: 1008px; background-color: #6e6e6e8f">
                        <div class="">
                            <h5 class="mb-0"></h5>
                            <div class="hWrap">
<!--                                 <div class="icon-box  icon-box-sm task-tab me-2" style="display: flex;"> -->
                                   <button class="btn btn-primary" id="savePortletBtn" style="background-color: #dc3545de; border-color: #dc3545de; padding: 3px 10px;">화면 저장</button>
                                   <div class="tCon">
                                       <span id="timer" style=" margin-right:4px; font-size:1.3em; color:white; font-weight: 500; width: 97px;"></span>
                                       <i id="refresh" class="fa-solid fa-rotate-right fa-lg" style="color: #ffffff; font-size: 1.5em; cursor:pointer;"></i>
                                   </div>
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                    <!-- 헤더========================================================================= -->
                    <!-- tiles 했을 때 content 부분 -->
                   	<tiles:insertAttribute name="portalContent"/>  
                    
                    <!-- tiles 했을 때 content 부분 -->
                </div>
            </div>
        </div>
        <div class="chatbot chatbot_pulse" onclick="if(0 > 'win16|win32|win64|mac'.indexOf(navigator.platform.toLowerCase())){location.href = 'https://chat.cau.ac.kr/v2/index.html'}else{window.open('https://chat.cau.ac.kr/v2/index.html', '_blank', 'width = 450, height = 720, top = 100, left = 200, location = no, resizable = yes');}">
            <!-- <img src="/images/portal/mic.png"> -->
        </div>
    </div>
</body>
<script>
var timer = document.getElementById("timer");
var time = 10799;
var hour ="";
var min = ""; 
var sec = ""; 
function formatTwoDigits(number) {
    return number.toString().padStart(2, '0');
}
function updateTimer() {
    hour =formatTwoDigits( parseInt(time / 3600)); 
    min = formatTwoDigits(parseInt((time % 3600) / 60)); 
    sec = formatTwoDigits(time % 60); 
    timer.innerHTML = hour + " : " + min + " : " + sec;
    time--;
    
    if(time <= 0){
        clearInterval(x); 
		swal({
			  title: "로그인을 연장하시겠습니까?",
			  text: "취소버튼을 누를 경우 보안을 위해 로그아웃 처리됩니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("시간이 연장되었습니다.", {
			      icon: "success",
			    }).then(() => {
                    time = 10799; // 연장 후 시간을 다시 5로 설정
                    x = setInterval(updateTimer, 1000); // 타이머 다시 시작
                });
			  } else {
			    swal("로그아웃되었습니다.");
			    location.replace("/main/logout");
			  }
			});
	};
};
var x = setInterval(updateTimer, 1000);
var refresh = document.getElementById("refresh");
refresh.addEventListener("click", function() {
    clearInterval(x); 
    time = 10799; 
    x = setInterval(updateTimer, 1000); 
});
</script>
