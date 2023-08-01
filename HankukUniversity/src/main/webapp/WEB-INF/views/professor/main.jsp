<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- jQuery UI 라이브러리 -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<!-- jQuery UI 스타일시트 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro.css">
<style>
#ui-datepicker-div{
	display: none;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">교수</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">내정보</a></li>
		</ol>
    </div>
    <div class="top-wrap">
		<div class="container-fluid" style="width:40%; margin-right: -47px;">
			<div class="card" id="card-title-1" style="height: 300px;">
				<div class="card-header border-0 pb-0 " style="margin-top: -11px; margin-bottom: -9px;">
					<h5 class="card-title">내정보</h5>
				</div>
				<hr>
				<div class="card-body">
					<div class="myinfo-wrap">
					    <c:choose >
                           	<c:when test="${sessionScope.pro.proProfilePath == null || sessionScope.pro.proProfilePath == ''}">
								<img alt="" src="/images/기본프로필.png" id="profile">
                           	</c:when>
                           	<c:otherwise>
                           		<img src="/download${sessionScope.pro.proProfilePath }" id="profile">
                           	</c:otherwise>
						</c:choose>
						<div class="myinfo-con">
							<div class="span-wrap">
								<div style="width: 78px; border-right: 2px solid; font-weight: 800;">교번</div>
								<div style="padding-left: 13px;"><c:out value="${sessionScope.proInfo.proNo }"/></div>
							</div>
							<div class="span-wrap">
								<div style="width: 78px; border-right: 2px solid; font-weight: 800;">단과대</div>
								<div style="padding-left: 13px;"><c:out value="${sessionScope.proInfo.colNm }"/></div>
							</div>
							<div class="span-wrap">
								<div style="width: 78px; border-right: 2px solid; font-weight: 800;">전공</div>
								<div style="padding-left: 13px;"><c:out value="${sessionScope.proInfo.deptNm }"/></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid" style="width: 60%">
			<div class="card" id="card-title-1" style="height: 300px;">
				<div class="card-header border-0 pb-0 " style="margin-top: -11px; margin-bottom: -9px;">
					<h5 class="card-title">강의목록</h5>
				</div>
				<hr>
				<div class="card-body">
					<div class="table-wrap" style="height: 237px;">
						<table class="table" style="margin-top: -17px;">
							<thead class="thead-dark">
								<tr>
									<th style="width:50px;"></th>
									<th style="width:400px;">교과목명</th>
									<th style="width:230px;">건물</th>
									<th style="width:130px;">강의실</th>
									<th style="width:130px;">개설년도</th>
									<th style="width:130px;">개설학기</th>
								</tr>
							</thead>
							<tbody id="pro-body">
								<!-- 동적추가 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bottom-wrap">
		<div class="container-fluid" style="width:40%; margin-right: -47px;">
			<div class="card" id="card-title-1" style="height: 466px;">
				<div class="card-header border-0 pb-0 " style="margin-top: -11px; margin-bottom: -9px;">
					<h5 class="card-title">시간표</h5>
				</div>
				<hr>
				<div class="card-body">
	    	       	<div class="schedule-wrap">
						<table class="schedule" border=1>
							<thead class="thead-dark">
								<tr>
									<th style="width: 23px; height: 42px; font-size: 20px; font-weight: 500;"></th>
									<th style="width: 28px; height: 42px; font-size: 20px; font-weight: 500;">월</th>
									<th style="width: 28px; height: 42px; font-size: 20px; font-weight: 500;">화</th>
									<th style="width: 28px; height: 42px; font-size: 20px; font-weight: 500;">수</th>
									<th style="width: 28px; height: 42px; font-size: 20px; font-weight: 500;">목</th>
									<th style="width: 28px; height: 42px; font-size: 20px; font-weight: 500;">금</th>
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
		<div class="container-fluid" style="width:60%">
			<div class="card" id="card-title-1" style="height: 466px;">
				<div class="card-header border-0 pb-0 " style="margin-top: -11px; margin-bottom: -9px;">
					<h5 class="card-title">한국대학교 일정</h5>
					<select id="calClsf" tabindex="null">
						<option value="uni">학사 일정</option>
						<option value="${sessionScope.proInfo.deptCd }">${sessionScope.proInfo.deptNm } 일정</option>
					</select>
				</div>
				<hr>
				<div class="card-body">
				  	<div id="datepicker-container" style="height: 376px;"></div>
                       	<div id="monthSchedule">
                      		<div >
	                            <h4 class="card-title" id="timeTitle"></h4>
	                        </div>
	                        <hr>
                           	<div id="DZ_W_TimeLine" class="widget-timeline dz-scroll height370 my-4 px-4" style="height: 331px;">
                       		<ul class="timeline" id="timeline">
                              		
							</ul>
						</div>
                   	</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
getMyLectire();
function getMyLectire(){

	$.ajax({
		url: "/hku/lecture/getMyLectire",
		dataType:"json",
		success: function(res){
			console.log(res);
			
			if(res.length > 0){
				data = '';
				for(var i = 0; i < res.length; i++){
					data += `<tr>
								<td>\${i+1}</td>
								<td>\${res[i].subNm}</td>
								<td>\${res[i].flctNm}</td>
								<td>\${res[i].flctsNm}</td>
								<td>\${res[i].lecapYr}년</td>
								<td>\${res[i].lecapSem}학기</td>
							</tr>`;
					}
			}else{
				data += `<tr>
							<td colspan="6">현재 강의중인 목록이 존재하지 않습니다.</td>
						</tr>`;
			}
			$("#pro-body").html(data);
		}
	})
}
presentCourseList();
//수강중인강의가져오기
function presentCourseList(){
	
	var stdData = {
		"proNo":"${sessionScope.pro.proNo }"
	}
	
	$.ajax({
		type:"get",
		data:stdData,
		url : "/hku/professor/myTimeTable",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log('가져옴',res)
			var schedule = []; 
			for(var i = 0; i < res.length; i++){
				var period = []
				for(var j = 0; j < parseInt(res[i].lecscHour); j++){
					period.push(parseInt(res[i].periodCd) + j)
				}
				schedule.push(period)
			}
			
			console.log("스케쥴 ",schedule)
			var timeTable = ''
			for(var i = 1; i <= 9; i++){
				timeTable += `  <tr class="\${i}" style="font-size: 16px; font-weight: 900; height: 38px;">
									<td style="font-size: 16px; font-weight:400;">\${i} 교시</td>
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
					scheduleObj.css("font-size", "11px");
					scheduleObj.css("font-weight", "800");
					if(cnt == 1){
						scheduleObj.text(`\${res[i].subNm}`)
					}
				}
			}
		}
	})
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
var calClsf = $('#calClsf');
var clickDate;

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
            clickDate = `\${year}-\${monthCh}`
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
</script>