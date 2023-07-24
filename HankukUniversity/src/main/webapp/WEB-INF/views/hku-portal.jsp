<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/portal/webfonts.css">
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
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack-all.js"></script>
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
    margin-top: 6px;
}
.main_cont_header{
	background-color: #800000;
}
</style>
<body>
    <div class="main_wrap">
        <div class="main_inner">
            <div class="main_cont_wrap">
                <div class="main_cont my_info">
                    <div class="logo_wrap">
                        <a href="#" onclick="javascript:window.location.reload(true);">
                            <!-- <span class="sr-only">한국포탈서비스</span> -->
                        </a>
                    </div>
                    
                    <div class="login_box">
                        <div class="profile_box" style="text-align: center;">
                            <div class="profile_div" style="margin-top: 10px;">
                                <hr style="margin: 0.5rem 0rem 1rem 0rem; color: white;"/>
                                <img src="/download/주지훈1.jpg" id="profileImg" style="width:200px; height:200px; border-radius: 20%; border: 3px solid white;">

                            </div>
                        </div>
                        <div class="text_wrap">
                            <p class="balloon">환영합니다!</p>
                            <p><span style="margin-right: 10px;">컴퓨터공학과</span><span style="font-size: 25px;">2014161007</span></p>
                            <p class="en title">주지훈 님</p>
                            <ul>
                                <li>
                                    <a class="LK046_A bb" href="#none">로그아웃</a>
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
                                        <span style="font-size: 18px; color: #FFC933;">124/130</span>
                                    </div>
                                </div>
                                <div style="padding-left: 20px;">
                                    <div>
                                        <span style="font-size: 20px; color: white;">학적상태</span>
                                    </div>
                                    <div>
                                        <span style="font-size: 18px; color: #FFC933;">재학</span>
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
                            <a href="/main/student">공지사항</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">마이페이지</a>
                        </div>
                        <hr style="margin: 1rem 0rem 0rem 0rem; color: white;"/>
                    </div>
                    <div class="footer_txt pers_terms">
                        <a href="#" class="LK052_S pers_terms_s">개인정보처리방침(대덕·국제)</a> <!-- 개인정보처리방침(신촌·국제) -->
                        &nbsp;<span>|</span>&nbsp;
                        <a href="#" class="LK052_F pers_terms_f">개인정보처리방침(미래)</a> <!-- 개인정보처리방침(미래) -->
                    </div>

                </div>
                <div class="main_cont" id="jjgDiv" style="height:auto; overflow: auto;">
                    <!-- 헤더========================================================================= -->
                    <div class="main_cont_header" style="height: 50px; border: 1px solid black;">
                        <nav class="navbar navbar-expand">
                            <div class="collapse navbar-collapse justify-content-between">
                                <ul class="navbar-nav header-right" style="margin-left: 70%;">
                                    <li class="nav-item ps-3">
                                        <button class="btn btn-primary" id="savePortletBtn">포틀릿저장</button>
                                    </li>
                                    <li class="nav-item ps-3">
                                        <!-- 알람  + 로그인 타이머 -->
										<div class="tCon">
											<span id="timer" style=" margin-right:4px; font-size:1.3em; color:white; font-weight: 500; width: 97px;"></span>
											<i id="refresh" class="fa-solid fa-rotate-right fa-lg" style="color: #ffffff; font-size: 1.5em; cursor:pointer;"></i>
										</div>
                                    </li>
                                </ul>
                            </div>                            
                        </nav>
                    </div>
                    <!-- 헤더========================================================================= -->
                    <!-- tiles 했을 때 content 부분 -->
                    <div class="container-fluid mt-3">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-stack">
                                    <div class="grid-stack-item portlet1" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;1일정</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet2" gs-w="12" gs-h="6" gs-no-resize="true">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item" style="margin-bottom: -31px;">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;한국대학교 공지사항</h4>
                                                        </div>
                                                    </div>
                                                    <div class="custom-tab-1" style="display: flex; align-items: center;">
                                                        <ul class="nav nav-tabs">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" data-bs-toggle="tab" href="#profile1">학사공지</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-bs-toggle="tab" href="#contact1">채용공지</a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-bs-toggle="tab" href="#message1" id="calRender">학과공지</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="grid-stack-item-content">
                                            	<div class="tab-content">
                                                    <div class="tab-pane fade show active" id="profile1">
                                                        <div class="table-wrap">
                                                            <table class="table">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th style="width:100px;">제목</th>
                                                                        <th style="width:30px;">등록일자</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="acTbody">
                                                                    <tr>
                                                                        <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="contact1">
                                                        <div class="table-wrap">
                                                            <table class="table">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th style="width:100px;">제목</th>
                                                                        <th style="width:30px;">등록일자</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="epTbody">
                                                                     <tr>
                                                                        <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="message1">
                                                        <div class="table-wrap">
                                                            <table class="table">
                                                                <thead class="thead-dark">
                                                                    <tr>
                                                                        <th style="width:100px;">제목</th>
                                                                        <th style="width:30px;">등록일자</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="dpTbody">
                                                                     <tr>
                                                                        <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet3" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;3날씨</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet4" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;4시간표</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet5" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;5이수정보</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet6" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;6식단표</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="col-lg-6" style="border: 1px solid black;">
                                <div class="card m-3" id="card-title-1">
                                    <div class="card-header border-0 pb-0 ">
                                        <h5 class="card-title">메인 대쉬보드</h5>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            메인대쉬보드 입니다!!
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6" style="border: 1px solid black;">
                                <div class="card m-3" id="card-title-1">
                                    <div class="card-header border-0 pb-0 ">
                                        <h5 class="card-title">메인 대쉬보드</h5>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            메인대쉬보드 입니다!!
                                        </p>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="chatbot chatbot_pulse" onclick="if(0 > 'win16|win32|win64|mac'.indexOf(navigator.platform.toLowerCase())){location.href = 'https://chat.cau.ac.kr/v2/index.html'}else{window.open('https://chat.cau.ac.kr/v2/index.html', '_blank', 'width = 450, height = 720, top = 100, left = 200, location = no, resizable = yes');}">
            <!-- <img src="/images/portal/mic.png"> -->
        </div>
    </div>
</body>
<script>
$(document).ready(function(){
    var grid = GridStack.init({ // 여기에 그리드 스택 옵션 삽입
        disableOneColumnMode: true, // jfidle 작은 창 크기용
        float: false,
        removable: "#trash", // drag-out delete class
        removeTimeout: 100
    });

    var savePortletBtn = $('#savePortletBtn'); // 포틀렛 저장버튼
    
    const regex = /[^0-9]/g;
    
    // 내가 설정한 포틀릿순서대로 보여주는 함수실행
    sortPortlet();

    // 내가 설정한 포틀릿순서대로 보여주는 함수
    function sortPortlet(){
    	// 지금 로컬 스토리지 쓰는데 이거를 데이터 베이스 에서 끌고 오면 됨
    	let myGrid = JSON.parse(localStorage.getItem("myGrid"));
    	console.log("로컬스토리지 저장한거 가져오기", myGrid);
//     	myGrid ="";
		console.log("myGrid, ", myGrid);
        var gridItem = document.querySelectorAll(".grid-stack-item");
        if(myGrid != null && myGrid.length > 0){
            for(let i=0; i<myGrid.length; i++){
                let ptl = document.querySelector('.'+myGrid[i].id);
//                 console.log("포틀릿 섞기 ", ptl);
//                 console.log("포틀릿 섞기 ", parseInt(myGrid[i].x));
//                 console.log("포틀릿 섞기 ", parseInt(myGrid[i].y));
                grid.update(ptl, {x:parseInt(myGrid[i].x) , y:parseInt(myGrid[i].y)});
            }
        }
    }

    
    // 포틀릿 저장 버튼 눌럿을떄
    savePortletBtn.on('click', function(){
    	console.log("저장했을떄 grid.save() =>", grid.save());
    	var myPortletArr = [];
        var gridItem = document.querySelectorAll(".grid-stack-item");
        for(let i=0; i<gridItem.length; i++){
            let saveData = {};
            let item = gridItem[i];
            saveData.id = $(item).attr('class').split(" ")[1].trim();
            console.log("itemitem", item);
            saveData.x = item.getAttribute("gs-x");
            saveData.y = item.getAttribute("gs-y");
            myPortletArr.push(saveData);
        }
        console.log("저장배열", myPortletArr);
        // 지금 로컬 스토리지로 저장하는데 이걸 데이터베이스에 저장하면됨
        localStorage.setItem("myGrid", JSON.stringify(myPortletArr));
        toastr.options = {
		    "closeButton": false,
		    "debug": false,
		    "newestOnTop": false,
		    "progressBar": true,
		    "positionClass": "toast-top-center",
		    "preventDuplicates": false,
		    "onclick": null,
		    "showDuration": "100",
		    "hideDuration": "1000",
		    "timeOut": "2000",
		    "extendedTimeOut": "1000",
		    "showEasing": "swing",
		    "hideEasing": "linear",
		    "showMethod": "fadeIn",
		    "hideMethod": "fadeOut"
		};
    			
		toastr.success('화면 설정이 저장되었습니다.');
    });
    
    getAllNoticeData();

    // 공지사항 가져오기
    function getAllNoticeData(){
        let deptCd = "${std.deptCd}";
//         console.log(deptCd);

        $.ajax({
            type: 'get',
            url: '/hku/portal/all-notice',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: {deptCd:deptCd},
            success: function(res){
                console.log("공지사항 데이터", res);
                let acNotice = res.acNotice;
                let epNotice = res.epNotice;
                let deptNotice = res.deptNotice;

                let acStr = "";
                for(let i = 0; i < acNotice.length; i++){
                    acStr += `<tr>
                                <td><input type="hidden" id="acNo" value="\${acNotice[i].NOTICE_NO}">\${acNotice[i].NOTICE_TTL}</td>
                                <td>\${acNotice[i].REGDATE}</td>
                              </tr>`;
                }
                $('#acTbody').html(acStr);
                let epStr = "";
                for(let i = 0; i < epNotice.length; i++){
                    epStr += `<tr>
                        <td><input type="hidden" id="epNo" value="\${epNotice[i].NOTICE_NO}">\${epNotice[i].NOTICE_TTL}</td>
                        <td>\${epNotice[i].REGDATE}</td>
                        </tr>`;
                    }
                $('#epTbody').html(epStr);
                
                let dpStr = "";
                for(let i = 0; i < deptNotice.length; i++){
                    dpStr += `<tr>
                        <td><input type="hidden" id="dpNo" value="\${deptNotice[i].DEPNT_NO}">\${deptNotice[i].DEPNT_TTL}</td>
                        <td>\${deptNotice[i].REGDATE}</td>
                        </tr>`;
                    }
                $('#dpTbody').html(dpStr);
            }
        });
    }
});

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
