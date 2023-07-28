<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- jQuery UI 라이브러리 -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<!-- jQuery UI 스타일시트 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/home-pjs.css">
<style>
.table-wrap2{
	margin-top: -321px;
	width: 96%;
    max-height: 275px;
    margin-left: 17px;
    position: relative;
    z-index: 999;
}
.table-wrap2 td{
	cursor: pointer;
}
.table thead th {
    border: none;
    padding: 7px;
    font-size: 20px;
}
#ui-datepicker-div{
	display: none;
}
.form-control{
	width: 183px;
    margin-left: 28px;
    background: #fff;
    color: #6e6e6e;
    line-height: 1.5;
    font-size: 13px;
    height: 2rem;
    border-radius: 0.375rem;
    border-color: #CCCCCC;
}
.grid-stack-item-content{
	height: 440px;
}
#box:before {
	background-color: rgba(0,0,0,0.4)
}
</style>
<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-lg-12">
            <div class="grid-stack">
                <div class="grid-stack-item portlet1" gs-w="6" gs-h="6">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item">
                            <div class="card-body">
                                <div style="display: flex; margin-left: 11px;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="font-weight: 500; display: inline-block;">&nbsp;1일정</h5>
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
                    <div class="grid-stack-item-content" >
                        <div class="card portlet-item" style="margin-bottom: -31px; height: 394px;">
                            <div class="card-body" style="padding: 0.25rem; padding-top: 10px;">
                                <div style="display: flex; margin-left: 11px;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="display: inline-block; font-weight: 500; margin-bottom: 11px;">&nbsp;한국대학교 공지사항</h5>
                                    </div>
                                </div>
                                <div class="custom-tab-1" style="margin-left: 12px; display: flex; align-items: center;">
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
                        <div class="grid-stack-item-content" style="height: 360px;">
                        	<div class="tab-content">
                                <div class="tab-pane fade show active" id="profile1">
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
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
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
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
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
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
                <div class="grid-stack-item portlet3" gs-w="12" gs-h="6">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item">
                            <div class="card-body" style="padding: 0.25rem; padding-top: 10px;">
                                <div style="display: flex; margin-left: 11px;">
                                    <div style="width: 93%; display: flex; align-items: center; position: relative;">
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="display: inline-block; font-weight: 500; margin-left: 4px;">&nbsp;한국대학교 일정</h5>
                                        <div style="position: absolute; position: absolute; left: 310px; font-size: 20px;">v</div>
                                      	<select class="default-select form-control" id="calClsf" tabindex="null">
											<option value="uni">학사 일정</option>
											<option value="${sessionScope.stdInfo.deptCd }">${sessionScope.stdInfo.deptNm } 일정</option>
										</select>
                                    </div>
                                    <div>
                                    </div>
                                </div>
<!--                                 <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3> -->
                                <div class="hnu_schedule" id="uni-calendar" style="margin-top: -7px;">
                                	<div id="datepicker-container" style="height: 376px;"></div>
                                	<div id="monthSchedule">
                                		<div >
				                            <h4 class="card-title" id="timeTitle">2023년도 07월 학사 일정</h4>
				                        </div>
				                        <hr>
	                                	<div id="DZ_W_TimeLine" class="widget-timeline dz-scroll height370 my-4 px-4" style="height: 266px;">
	                                		<ul class="timeline" id="timeline">
		                                		
											</ul>
										</div>
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
                <div class="grid-stack-item portlet4" gs-w="6" gs-h="6">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item">
                            <div class="card-body" style="padding: 0.25rem; padding-top: 10px;">
                                <div style="display: flex; margin-left: 11px;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="display: inline-block; font-weight: 500;">&nbsp;시간표</h5>
                                    </div>
                                    <div>
                                    </div>
                                </div>
                                <div class="hnu_schedule" id="sub-schedule">
                           	       	<div class="schedule-wrap">
										<table class="schedule" border=1>
											<thead class="thead-dark">
												<tr>
													<th style="width: 25px; height: 21px; font-size: 12px; font-weight: 500;"></th>
													<th style="width: 30px; height: 21px; font-size: 12px; font-weight: 500;">월</th>
													<th style="width: 30px; height: 21px; font-size: 12px; font-weight: 500;">화</th>
													<th style="width: 30px; height: 21px; font-size: 12px; font-weight: 500;">수</th>
													<th style="width: 30px; height: 21px; font-size: 12px; font-weight: 500;">목</th>
													<th style="width: 30px; height: 21px; font-size: 12px; font-weight: 500;">금</th>
												</tr>
											</thead>
											<tbody id="timeBody">
												<!-- 동적추가 -->
												
											</tbody>
										</table>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
                <div class="grid-stack-item portlet5" gs-w="6" gs-h="6">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item">
                            <div class="card-body" style="padding: 0.25rem; padding-top: 10px;">
                                <div style="display: flex; margin-left: 11px;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="display: inline-block; font-weight: 500;">&nbsp;5이수정보</h5>
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
                <div class="grid-stack-item portlet6" gs-w="6" gs-h="6">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item">
                            <div class="card-body" style="padding: 0.25rem; padding-top: 10px;">
                                <div style="display: flex; margin-left: 11px;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h5 style="display: inline-block; font-weight: 500;">&nbsp;오늘의 날씨</h5>
                                    </div>
                                </div>
                                <div class="hnu_schedule" id="box" style="display :flex; flex-direction:column; justify-content:center; align-items:center; border:1px; width : 100%; height:94%;  background-size: 100% 100% ; color:white; ">
									<div style="align-items:center; width : 100%; height:100%; background-color:rgba(0,0,0,0.3); background-size: 100% 100% ; ">
										<p id="city" style="color:white; z-index: 1000; font-size : 20px; position: absolute; left:87px; top:135px; text-shadow: 1px 1px 6px black; "></p>
										<p id="temp" style="color:white; z-index: 1000; font-size: 6em; position: absolute; left:85px; top:125px; font-weight: bold; text-shadow: 2px 2px 4px black;"></p>
										<p id="weather" style="color:white; z-index: 1000; font-size : 20px; position: absolute; left:115px; top:240px;  text-shadow: 1px 1px 6px black;"></p>
										<div id="say" style="color:white; z-index: 1000; font-style: italic; left:80px; top:350px; position: absolute;">인생은 폭풍이 지나갈때를 기다리는 것이 아니라,<br>비올때 춤추는 법을 배우는 것이다.</div>
									</div>
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
<script type="text/javascript">
$(document).ready(function () {
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
    
    $('#acTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "uni";
        geDetail(noticeNo,noticeClsf);
    });
    
    $('#epTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "rcrt";
        geDetail(noticeNo,noticeClsf);
    });
    
    $('#dpTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "${std.deptCd}";
        geDetail(noticeNo,noticeClsf);
    });
    
    // detail전송 frm
    function geDetail(pObjVal, pClsf){
    	location.href = `/hku/portal/notice-detail?noticeNo=\${pObjVal}&noticeDiv=\${pClsf}`;
    }
    
});

var calClsf = $('#calClsf');
var clickDate;
presentCourseList();
//수강중인강의가져오기
function presentCourseList(){
	
	var stdData = {
		"stdNo":"${sessionScope.std.stdNo }"
	}
	
	$.ajax({
		type:"get",
		data:stdData,
		url : "/hku/present-list",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log("가져옴", res)
			var schedule = []; 
			for(var i = 0; i < res.length; i++){
				var period = []
				for(var j = 0; j < `\${res[i].lecscHour}`; j++){
					period.push(`\${res[i].periodCd + j}`)
				}
				schedule.push(period)
			}
			console.log("스케쥴", schedule);
			
			var timeTable = ''
			for(var i = 1; i <= 9; i++){
				timeTable += `  <tr class="\${i}" style="font-size: 10px; font-weight: 900; height: 38px;">
									<td style="font-size:10px; font-weight:400;">\${i} 교시</td>
									<td class="mon"></td>
									<td class="tue"></td>
									<td class="wed"></td>
									<td class="thu"></td>
									<td class="fri"></td>
								</tr>`;
			}
			$("#timeBody").html(timeTable);
			
			for(var i = 0; i < res.length; i++){
				
				var day = dayChange(`\${res[i].lecscDay}`);
				var cnt = 0; // 시간표에 교과목명과 담당교수 이름 넣기위함
				
				// 시간표 채우기
				for(var j = 0; j < schedule[i].length; j++ ){
					var scheduleObj = $(`.\${schedule[i][j]} .\${day}`);
					cnt++;
					scheduleObj.css("background", "#ff5e5e3d");
					scheduleObj.css("color", "black");
					scheduleObj.css("font-size", "10px");
					scheduleObj.css("font-weight", "500");
					if(cnt == 1){
						scheduleObj.text(`\${res[i].subNm}`)
					}
					if(cnt == 2){
						scheduleObj.text(`\${res[i].flctNm}(\${res[i].flctsNm})`)
					}
					
				}
			}
			// $('.totalRight').html(`\${sum}학점`)
			// presentBody.html(data);
			//(\${res[i].proNm})
		}
	})
}
$.datepicker.setDefaults({
    closeText: "닫기",
    prevText: "이전달",
    nextText: "다음달",
    currentText: "오늘",
    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
      "7월", "8월", "9월", "10월", "11월", "12월"
    ],
    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
      "7월", "8월", "9월", "10월", "11월", "12월"
    ],
    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
    weekHeader: "주",
    dateFormat: "yy/mm/dd", // 날짜형태 예)yy년 mm월 dd일
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: "년",
//     minDate: 0,
//     maxDate: "+1M"
  })


getCalendarInfoList(getCurrentYearMonth());

$("#datepicker-container").datepicker({
	onSelect: function(dateString) {
		setTimeout(() => {
			if(flctNo == '' || flctNo == null){
				swal({
					title: "시설을 먼저 선택해주세요.",
                    icon: "warning",
                    button: "닫기"
				})
			}else{
				var selectedDate = $("#datepicker-container .ui-state-active").parent();
				selectedDate.css("background", "#ffdede");
			}
		}, 0.5)
        console.log(dateString);
		date = dateString;
// 		flctTimeTable();
	},
	  onChangeMonthYear: function(year, month, instance) { // 다음 or 이전 버튼 클릭시 해당 년도 월 가져옴
		    console.log("Year:", year);
		    console.log("Month:", month);
		    
		   	var monthCh = month < 10? "0"+month : month;
		    
		    console.log(`\${year}-\${monthCh}`)

            getCalendarInfoList(`\${year}-\${monthCh}`)
            clickDate = `\${year}-\${monthCh}`;
		}
});	

$("#calClsf").on("change", function(){
	if(clickDate){
		getCalendarInfoList(clickDate);
	}else{
		getCalendarInfoList(getCurrentYearMonth());
	}
})

// 학사 일정 가져오기
function getCalendarInfoList(pDate){
		
		var timeTitle = $('#timeTitle');
		
		let selectDate = pDate.split("-");
		
		let keyword = $('#calClsf option:selected').text();
		timeTitle.text(`\${selectDate[0]}년도 \${selectDate[1]}월 \${keyword}`)
		
		let sendDate = {
			calBgngDt : pDate,
			calClsfCd : calClsf.val()
		}
// 		console.log("학사정보 가져오기", sendDate);
		$.ajax({
			type : 'get',
			url : '/hku/admin/getCalendarInfoList',
			contentType : "application/json;charset=utf-8",
			data : sendDate,
			dataType : 'json',
			success: function(res){
				console.log("월별로 데이터 가져오기 ", res);
				// 여기다 추가해야함 
				var timeline = $('#timeline');
				
				var timeLineStr = "";
				// 오른쪽 일정 뿌려주기
				if(res.length > 0){
                    for(let i=0; i<res.length; i++){
                        let cal = res[i];
                        timeLineStr += `<li>
                                            <div class="timeline-badge \${selectColor(cal.calColor) }"></div>
                                            <a class="timeline-panel " href="#">
                                                <span>
                                                    <c:out value="\${cal.calTtl }"/>
                                                </span>
                                                <h6 class="mb-0">
                                                    <c:out value="\${cal.calBgngDt }"/> ~
                                                    <c:out value="\${cal.calEndDt }"/>
                                                </h6>
                                            </a>
                                        </li>`;
                                    }
                }else{
                    timeLineStr += `<div style="font-size:17px;">해당 학사일정이 존재하지 않습니다.</div>`;
                }
				timeline.html(timeLineStr)
			}
		});
	}

function selectColor(parm){
	let color = "";
	switch(parm){
		case "#FF5733": color = "danger"; break;
		case "#FFBD33": color = "warning"; break;
		case "#33FFBD": color = "info"; break;
		default: color = "success"; break;
	}
	return color;
}

function getCurrentYearMonth() {
	  const currentDate = new Date();
	  const year = currentDate.getFullYear();
	  let month = currentDate.getMonth() + 1; 
	  if (month < 10) {
	    month = "0" + month; 
	  }
	  return `\${year}-\${month}`;
}

function dayChange(day){
   	if(day == "월"){
    	return "mon";
    }else if(day == "화"){
    	return "tue";
    }else if(day == "수"){
    	return "wed";
   	}else if(day == "목"){
   		return "thu";
   	}else if(day == "금"){
   		return "fri";
   	}
}

/* 날씨 API */
function onGeoOk(position) {
  const lat = position.coords.latitude;
  console.log("내용1:",lat);
  const lon = position.coords.longitude;
  console.log("내용2:",lon)
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=\${lat}&lon=\${lon}&appid=${weatherkey}&lang=kr&units=metric`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      console.log(data.name);
      $('#city')[0].innerText = data.name;
  
      cod = 802;
//       cod = parseInt(data.cod);
      if(cod >= 200 && cod < 300 ){
    	  $('#box').css('background-image','url(/images/weather/stormclouds.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
      }else if(cod >= 300 && cod <600){
    	  
    	  $('#box').css('background-image','url(/images/weather/rain.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
      }else if(cod == 800 || cod == 801){
    	  $('#box').css('background-image','url(/images/weather/sunny.jpg)');
    	 $('#weather')[0].innerText = wDescEngToKor(cod);
    	  
      }else if(cod == 802){
    	  $('#box').css('background-image','url(/images/weather/cloudsky.jpg)');
     	 $('#weather')[0].innerText = wDescEngToKor(cod);
       }
      
      $('#temp')[0].innerText = Math.round(data.main.temp*10)/10 + '°C';

    })
    .catch(error => {
      console.error('데이터 가져오기 실패:', error);
    });
}

function onGeoError() {
  alert("위치를 알 수 없어~");
}

window.addEventListener('load', function() {
  navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
});

function wDescEngToKor(w_id) {
	var w_id_arr = [201,200,202,210,211,212,221,230,231,232,
	300,301,302,310,311,312,313,314,321,500,
	501,502,503,504,511,520,521,522,531,600,
	601,602,611,612,615,616,620,621,622,701,
	711,721,731,741,751,761,762,771,781,800,
	801,802,803,804,900,901,902,903,904,905,
	906,951,952,953,954,955,956,957,958,959,
	960,961,962];
	var w_kor_arr = ["가벼운 비를 동반한 천둥구름","비를 동반한 천둥구름","폭우를 동반한 천둥구름","약한 천둥구름",
	"천둥구름","강한 천둥구름","불규칙적 천둥구름","약한 연무를 동반한 천둥구름","연무를 동반한 천둥구름",
	"강한 안개비를 동반한 천둥구름","가벼운 안개비","안개비","강한 안개비","가벼운 적은비","적은비",
	"강한 적은비","소나기와 안개비","강한 소나기와 안개비","소나기","악한 비","중간 비","강한 비",
	"매우 강한 비","극심한 비","우박","약한 소나기 비","소나기 비","강한 소나기 비","불규칙적 소나기 비",
	"가벼운 눈","눈","강한 눈","진눈깨비","소나기 진눈깨비","약한 비와 눈","비와 눈","약한 소나기 눈",
	"소나기 눈","강한 소나기 눈","박무","연기","연무","모래 먼지","안개","모래","먼지","화산재","돌풍",
	"토네이도","구름 한 점 없는 맑은 하늘","약간의 구름이 낀 하늘","드문드문 구름이 낀 하늘","구름이 거의 없는 하늘",
	"구름으로 뒤덮인 흐린 하늘","토네이도","태풍","허리케인","한랭","고온","바람부는","우박","바람이 거의 없는",
	"약한 바람","부드러운 바람","중간 세기 바람","신선한 바람","센 바람","돌풍에 가까운 센 바람","돌풍",
	"심각한 돌풍","폭풍","강한 폭풍","허리케인"];
	for(var i=0; i<w_id_arr.length; i++) {
	if(w_id_arr[i]==w_id) {
	return w_kor_arr[i];
	break;
	}
	}
	return "none";
	}

</script>