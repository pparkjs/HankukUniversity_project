<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/counseling-style.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">상담</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">상담신청</a></li>
		</ol>
    </div>
	<div class="container-fluid fTop">
		<div class="card cardLeft" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div class="exp-wrap">
					<div class="card-title" style="color: maroon;  font-weight: 900;">교수목록</div>
					<div class="exp"> * 교수 선택시 우측에 해당 교수의 주차별 시간표가 나타납니다.</div>
				</div>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px;">
				<div class="pro-wrap">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark">
							<tr>
								<th style="width: 130px;">교수명</th>
								<th style="width: 330px;">전공</th>
								<th style="width: 40px;">연구실</th>
								<th style="width: 130px">연구실번호</th>
							</tr>
						</thead>
						<tbody id="proBody">
							<!-- 동적추가 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="card cardRight" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div class="sc-wrap">
					<div class="card-title" id="scTitle"></div>
					<div class="fPro"></div>
					<span style="margin-left: 9px; font-size: 18px;">교수시간표</span>
					<div class="fRsvt"></div>
					<span style="margin-left: 9px; font-size: 18px;">예약된상담</span>	
				</div>
			</div>
			<div class="card-body" style="padding: 0px;">
				<div class="schedule-wrap">
					<!-- 동적 추가-->
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade sModal" id="rsvtModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">상담 신청</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<div class="modal-wrap">
					<form action="/hku/flcts-reservation" method="post">
						<div class="modal-title1">
							<span style="font-size: 19px;">교수명</span>
							<span style="margin-right: -87px; font-size: 19px;">상담 구분</span>
						</div>
						<div class="modal-content1">
							<input type="hidden" class="form-control" id="rsvt-proNo" name="">
							<input type="text" class="form-control" id="rsvt-proNm" name="" readonly>
							<select class="form-control" id="rsvt-face" name="">
								<option value="">-----선택-----</option>
								<option value="nonface">비대면</option>
								<option value="face">대면</option>
							</select>
						</div>
						<div class="modal-title2">
							<span style="font-size: 19px;">상담일자</span>
							<span style=" margin-right: 49px; font-size: 19px;">상담시간</span>
						</div>
						<div class="modal-content2">
							<input type="text" class="form-control" id="rsvt-date" name="" readonly>
							<input type="text" class="form-control" id="rsvt-hours" name="" readonly>
							<input type="hidden" class="form-control" id="rsvt-hours-save" name="">
						</div>
						<div class="modal-title3">
							<span style="font-size:19px;">상담사유</span>
						</div>
						<div class="modal-content3">
							<textarea rows="5" cols="10" class="form-control" id="rsvt-prps" name="usePrps" placeholder="상담 사유를 입력하세요."></textarea>
						</div>
					</form>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="regBtn">신청</button>
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	getProList()
})
var proNo;
var proNm;

$(document).on("click","[pro]", function(){
		$('[pro]').css('background', '');
		$(this).css('background', '#6e6e6e26');
		proNo = $(this).attr("id");
		proNm = $(this).find("[proNm]").text();
		getScheduleList()
})

// 예약가능 시간 클릭시 실행
$(".schedule-wrap").on("click", ".rsvt", function(){
	if(proNo == '' || proNo == null || proNo == "undefined"){
		swal({
			title: "교수를 먼저 선택해주세요.",
			icon: "warning",
			button: "닫기"
		})
	}else{
		var time = $(this).parent().attr("class");
		var timeCg = timeChange(parseInt(time));
		$("#rsvt-proNo").val(proNo);
		$("#rsvt-proNm").val(proNm);
		$("#rsvt-date").val($(this).attr("date"));
		$("#rsvt-hours-save").val(time);
		$("#rsvt-hours").val(timeCg);
	}
})

$('#regBtn').on("click", function(){
	var regObj = {
		proNo: $("#rsvt-proNo").val(),
        stdNo: "${std.stdNo}",
        stdNm: "${std.stdNm}",
        attendModeCd: $("#rsvt-face").val(),
        dscsnAplyDt: $("#rsvt-date").val(),
        periodCd: $("#rsvt-hours-save").val(),
        dscsnRsn: $("#rsvt-prps").val()
	}
	console.log(regObj);

	if(regObj.attendModeCd == ""){
		swal({
			title: "상담 구분을 선택해주세요.",
			icon: "error",
			button: "닫기"
		})
		$("#rsvt-face").focus();
		return false;	
	}

	if(regObj.dscsnRsn == ""){
		swal({
			title: "상담 사유를 입력하세요.",
			icon: "error",
			button: "닫기"
		})
		$("#rsvt-prps").focus();
		return false;	
	}

	$.ajax({
		url:"/hku/counseling-rsvt",
		data:JSON.stringify(regObj),
		type:"post",
		contentType:"application/json; charset=utf-8",
		success:function(res){
			if(res === "success"){
				swal({
                    title: "상담신청 예약이 완료되었습니다.",
                    icon: "success",
                    button: "닫기"
                })
                getScheduleList()
                document.querySelector('.btn[data-bs-dismiss="modal"]').click();
			}else{
				swal({
                    title: "상담신청 예약에 실패하였습니다.",
                    icon: "error",
                    button: "닫기"
                })
			}
		}
	})
})

function getScheduleList(){
	$.ajax({
		url:`/hku/getScheduleList/\${proNo}`,
		dataType:"json",
		type:"get",
		success:function(res){
			console.log(res);
			var sTd = $(".schedule td");
			var scheduled = $(".schedule .schedule-active");
			var rsvtActive = $(".schedule .rsvt-active");
			
			sTd.removeAttr("data-bs-toggle", "");
			sTd.removeAttr("data-bs-target", "");
			
			scheduled.each(function(index, td){
				$(td).addClass("rsvt");
			})
			rsvtActive.each(function(index, td){
				$(td).addClass("rsvt");
			})
			
			sTd.removeClass('schedule-active');
			sTd.removeClass('rsvt-active');
			sTd.css("background", "");
			
			// 해당 과목의 시간표 계산
			var schedule = []; 
			for(var i = 0; i < res.lecture.length; i++){
				var period = []
				for(var j = 0; j < `\${res.lecture[i].lecscHour}`; j++){
					period.push(`\${res.lecture[i].periodCd + j}`)
				}
				schedule.push(period)
			}
			console.log(schedule);

			for(var i = 0; i < schedule.length; i++){
				for(var j = 0; j < schedule[i].length; j++){
					var day = dayChange(`\${res.lecture[i].lecscDay}`);
					var scheduleObj = $(`.\${schedule[i][j]} .\${day}`);
						scheduleObj.css("background", `rgb(255, 222, 222)`)
						scheduleObj.removeClass("rsvt");
						scheduleObj.addClass("schedule-active");
				}
			}

			for(var i = 0; i < res.counse.length; i++){
				var periodCd = res.counse[i].periodCd;
				var dscsnAplyDt = res.counse[i].dscsnAplyDt;
				
				console.log("교시 :", periodCd);
				console.log("날짜", dscsnAplyDt);
				var rsvtObj = $(`.\${periodCd} [date='\${dscsnAplyDt}']`);
				console.log(rsvtObj)
				rsvtObj.css("background", `rgb(0 32 96 / 78%)`)
				rsvtObj.removeClass("rsvt");
				rsvtObj.addClass("rsvt-active");
			}
			
			var rsvt = $('.schedule .rsvt');
			// 예약 안된 시간에는 modal 열 수 있는 data 요소 추가
			rsvt.each(function(index, td){
				$(td).attr("data-bs-toggle", "modal");
				$(td).attr("data-bs-target", "#rsvtModal");
			})
			
			checkDateOfPast();

		}
	})
}

function getProList(){
	var proBody = document.querySelector("#proBody");
	$.ajax({
		url:"/hku/getProList/${std.deptCd}",
		type:"get",	
		dataType:"json",
		success:function(res){
			var scheduleWrap = document.querySelector(".schedule-wrap");
			var scTitle = document.querySelector("#scTitle");
			var currentDate = getWeek();
			
			var weekDateArr = getWeekDate();
			
			scTitle.innerHTML = currentDate;
			
			var timeData = `<table class="schedule" border=1>
								<thead class="thead-dark">
									<tr>
										<th style="width: 57px; height: 46px; font-size: 19px; font-weight: 500;"></th>
										<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">\${weekDateArr[0].substring(5)}(월)</th>
										<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">\${weekDateArr[1].substring(5)}(화)</th>
										<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">\${weekDateArr[2].substring(5)}(수)</th>
										<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">\${weekDateArr[3].substring(5)}(목)</th>
										<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">\${weekDateArr[4].substring(5)}(금)</th>
									</tr>
								</thead>
								<tbody id="timeBody">`;
			
			var times = getTimeArr();
			for(var i = 0; i < 9; i++){
				var time = timeChange(i+1);
				timeData += `  <tr class="\${i+1}" style="font-size: 13px; font-weight: 900; height: 74px;">
									<td style="font-size:16px; font-weight:400;">\${time}</td>
									<td class="mon rsvt" hours="\${times[i]}" date="\${weekDateArr[0]}"></td>
									<td class="tue rsvt" hours="\${times[i]}" date="\${weekDateArr[1]}"></td>
									<td class="wed rsvt" hours="\${times[i]}" date="\${weekDateArr[2]}"></td>
									<td class="thu rsvt" hours="\${times[i]}" date="\${weekDateArr[3]}"></td>
									<td class="fri rsvt" hours="\${times[i]}" date="\${weekDateArr[4]}"></td>`
			}

			timeData += `</tbody>
						</table>`;
			scheduleWrap.innerHTML = timeData;

			var data = '';
			for(var i = 0; i < res.length; i++){
				data += `<tr id="\${res[i].proNo}" pro>
							<td proNm style="padding:11px;">\${res[i].proNm}</td>
							<td style="padding:11px;">\${res[i].deptNm}</td>
							<td style="padding:11px;">\${res[i].proLab}</td>
							<td style="padding:11px;">\${res[i].proLabTelno}</td>`
				data +=	`</tr>`;
			}
			proBody.innerHTML = data;
		}
	})	
}

function checkDateOfPast(){
	
	const currentDate = new Date();

	// 현재 날짜 가져오기 ex) 2023-07-16
	const year = currentDate.getFullYear();
	const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1 해줍니다.
	const day = String(currentDate.getDate()).padStart(2, '0');

	// 현재 시간 가져오기 ex_ 14:02
	var hours = String(currentDate.getHours()).padStart(2, '0');
	var minutes = String(currentDate.getMinutes()).padStart(2, '0');
	var currentTime = hours + ':' + minutes;

	const formattedDate = `\${year}-\${month}-\${day}`;
	
	// 해당 주차에 월 ~ 금에 대한 2023-07-13 형식의 배열가져오기
	var dates = getWeekDate();

	// 09:00 ~ 17:00 이 담긴 배열 
	var hours = getTimeArr();

	for(var i=0; i<dates.length; i++){
		if(formattedDate > dates[i]){
// 			$(`[date="\${dates[i]}"]`).css("background-color", "#80808054");
			var dateTd = $(`[date="\${dates[i]}"]`);
			dateTd.css("background-image", "linear-gradient(45deg, rgba(128, 128, 128, 0.6), rgba(0, 0, 0, 0.5))");
			dateTd.removeClass("rsvt");
			dateTd.removeAttr("data-bs-toggle", "");
			dateTd.removeAttr("data-bs-target", "");
		}
		
		// 현재 날짜인경우 현재 시간 이전 예약 막기
		if(dates[i] == formattedDate){
			for(var j=0; j<hours.length; j++){
				if(hours[j] <= currentTime){
					var timeTd = $(`[date="\${dates[i]}"][hours="\${hours[j]}"]`);
					timeTd.css("background-image", "linear-gradient(45deg, rgba(128, 128, 128, 0.6), rgba(0, 0, 0, 0.5))");
					timeTd.removeClass("rsvt");
					timeTd.removeAttr("data-bs-toggle", "");
					timeTd.removeAttr("data-bs-target", "");
				}
			}
		}
	}
	
}

// 현재 주차를 가져오는 함수
function getWeek(){
	
	const getWeek = (date) => {
		const currentDate = date.getDate();
		const firstDay = new Date(date.setDate(1)).getDay();
	
		return Math.ceil((currentDate + firstDay) / 7);
	};
	
	const currentDate = new Date();
	const currentYear = currentDate.getFullYear();
	const currentMonth = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 +1 해줍니다.
	const week = getWeek(new Date());
	
	return currentYear+"년 "+currentMonth+"월 "+week + "주차";
}

// 이번 주차에 해당하는 월화수목금 일자가져오기
function getWeekDate(){
	const currentDate = new Date();
	const currentMonth = currentDate.getMonth() + 1
	
	// 일 : 0, 월 : 1, 화 : 2, 수: 3, 목 : 4, 금 : 5, 토 : 6
	let day = currentDate.getDay(); 

	let calcDate = currentDate.getDate() - day + 1; // 이번주 월요일에 해당하는 일
	let calcDate2 = currentDate.getDate() - day + ((day == 0 ? 1 : 8) + 0); // 다음주 월요일에 해당하는 일
	
	  let weekDates = [];
	for (let i = 0; i < 5; i++) {
		let date;
		if(day == 0 || day == 6){ // 현재 일요일또는 토요일인 경우
		    date = calcDate2 + i;
		}else{
		    date = calcDate + i;
		}
		
	    const dateObj = new Date(currentDate.getFullYear(), currentMonth - 1, date);
	    const month = dateObj.getMonth() + 1;
	    const weekDay = dateObj.getDate();
	    const formattedDate = `\${dateObj.getFullYear()}-\${month < 10 ? '0' + month : month}-\${weekDay < 10 ? '0' + weekDay : weekDay}`;
	    weekDates.push(formattedDate);
	 }
	
	console.log("이번주 월요일 : ", calcDate);
	console.log("다음주 월요일 : ", calcDate2);
	console.log("해당 주차에 해당하는 월화수목금 일자 : ", weekDates);
	
	return weekDates;
		
}
function timeChange(data){
	var time;
	switch(data){
		case 1:
            time = "09:00 ~ 10:00";
            break;
        case 2:
            time = "10:00 ~ 11:00";
            break;
        case 3:
            time = "11:00 ~ 12:00";
            break;
        case 4:
            time = "12:00 ~ 13:00";
            break;
        case 5:
            time = "13:00 ~ 14:00";
            break;
        case 6:
            time = "14:00 ~ 15:00";
            break;
        case 7:
            time = "15:00 ~ 16:00";
            break;
        case 8:
            time = "16:00 ~ 17:00";
            break;
        case 9:
            time = "17:00 ~ 18:00";
            break;
	}
	return time;
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

// 09:00 ~ 17:00 까지 배열 만들기
function getTimeArr(){
	return ["09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00"];
}
</script>