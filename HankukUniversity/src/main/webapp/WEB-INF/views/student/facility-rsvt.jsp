<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="/css/student/facility-rsvt.css">
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script> -->
<!-- <link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" /> -->
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- jQuery UI 라이브러리 -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
<!-- jQuery UI 스타일시트 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/css/datepicker-style.css">
<style>
.schedule-wrap{
	overflow: scroll;
    height: 254px;
    margin-top: 13px;
}
.thead-dark{
      position: sticky;
      top: 0px;
      background: #800000;
}
#exp2{
    margin-left: 44px;
    margin-bottom: -2px;
    font-weight: 600;
    font-size: 16px;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">시설예약</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">시설물예약</a></li>
		</ol>
    </div>
	<div class="container-fluid fTop" style="margin-top: -18px;">
		<div class="card cardLeft" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div class="">
					<div class="card-title" style="color: maroon;  font-weight: 900;">시설지도</div>
				</div>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px;	padding: 0.75rem;">
				<div class="map-wrap">
					<img src="/images/학교지도.png" id="map" alt="">
					<button>
						<img src="/images/맵마커.png" id="FLCT014" class="marker marker1" alt="">
					</button>
					<button>
						<img src="/images/맵마커.png" id="FLCT013" class="marker marker2" alt="">
					</button>
					<button>
						<img src="/images/맵마커.png" id="FLCT012" class="marker marker3" alt="">
					</button>
				</div>
			</div>
		</div>
		<div class="card cardRight" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div style="display: flex;">
					<div class="card-title" style="color: maroon;  font-weight: 900;">예약 날짜</div>
					<div class="exp" style="margin-left: 33px; margin-top: 3px;"> * 금일로 부터 한달 내의 날짜만 예약가능</div>
				</div>
			</div>
			<hr>
			<div class="card-body" style="padding: 0px;">
			    <div>
			        <input type="hidden" id="myDate" name="" value="" class="datepicker inp" readonly="true" /> 
			        <div id="datepicker-container" style="height: 430px;"></div>
	   			</div>	
			</div>
		</div>
	</div>
	<div class="container-fluid fBottom">
		<div class="card cardTable" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div class="fTitle-wrap">
					<div class="card-title" style="color: maroon;  font-weight: 900;">시설 예약 현황</div>
					<div class="exp" id="exp2"></div>
					<div class="fUseing"></div>
					<span style="margin-left: 9px; font-size: 18px;">예약불가</span>
					<div class="fCanUse"></div>
					<span style="margin-left: 9px; font-size: 18px;">예약가능</span>	
				</div>
			</div>
			<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px;	padding: 0.75rem;">
				<div class="schedule-wrap">
					<table class="schedule" border=1 style="margin-top: -2px;">
						<thead class="thead-dark">
							<tr>
								<th style="width: 411px; height: 42px; font-size: 19px; font-weight: 500;"></th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">09:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">10:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">11:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">12:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">13:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">14:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">15:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">16:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">17:00</th>
								<th style="height: 42px; font-size: 19px; font-weight: 500;">18:00</th>
								<th style="display:none; height: 42px; font-size: 19px; font-weight: 500;">19:00</th>
							</tr>
						</thead>
						<tbody id="timeBody">
							<!-- 동적추가 -->
							<tr>
								<td colspan="11" style="font-size: 25px; color: #6e6e6e; padding: 19px;">예약하실 시설물을 선택해주세요.</td>
							</tr>							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade sModal" id="rsvtModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">시설예약 신청</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<div class="modal-wrap">
					<div class="modal-title1">
						<span style="font-size: 19px;">신청자</span>
						<span style="margin-right: 68px; font-size: 19px;">시설물명</span>
					</div>
					<div class="modal-content1">
						<input type="hidden" class="form-control" id="rsvt-stdNo" name="stdNo">
						<input type="hidden" class="form-control" id="rsvt-flctsNo" name="flctsNo">
						<input type="text" class="form-control" id="rsvt-stdNm" name="stdNm" readonly>
						<input type="text" class="form-control" id="rsvt-flctsNm" name="flctsNm" readonly>
					</div>
					<div class="modal-title2">
						<span style="font-size: 19px;">사용인원</span>
						<span style=" margin-right: 252px; font-size: 19px;">예약날짜</span>
					</div>
					<div class="modal-content2">
						<input type="text" class="form-control" id="rsvt-cnt" name="useUsers"  placeholder="숫자를 입력하세요.">
						<input type="text" class="form-control" id="rsvt-date" name="rsvtDate" readonly>
						<input type="text" class="form-control" id="rsvt-startTime" name="startHours" readonly>
						 ~
						<select class="form-control" id="rsvt-endTime" name="endHours">
							<!-- 동적추가 -->
						</select>
					</div>
					<div class="modal-title3">
						<span style="font-size:19px;">사용목적</span>
					</div>
					<div class="modal-content3">
						<textarea rows="10" cols="10" class="form-control" id="rsvt-prps" name="usePrps" placeholder="사용 목적을 입력하세요."></textarea>
					</div>
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

var marker = $(".marker");
var flctNo;
var dayTd = $("#datepicker-container td");
var date;

if("${msg}" == "error"){
	swal({
		title: "예약에 실패하였습니다. 다시 시도해주세요.",
		icon: "error",
		button: "닫기"
	})
}
// 사물함예약하기
$("#regBtn").on("click", function(){
    var useUsers = $("#rsvt-cnt").val();
    var endHours = $("#rsvt-endTime").val();
	var startHours = $("#rsvt-startTime").val();
    var usePrps = $("#rsvt-prps").val();
	var rsvtFlctsNo = $("#rsvt-flctsNo").val();
	var rsvtDate = $("#rsvt-date").val();

	if(useUsers == ""){
		swal({
			title: "사용 인원을 입력하세요.",
			icon: "error",
			button: "닫기"
		})
		useUsers.focus();
		return false;
	}

	if(endHours == ""){
		swal({
			title: "사용 시간을 선택하세요.",
			icon: "error",
			button: "닫기"
		})
		endHours.focus();
		return false;
	}

	if(usePrps == ""){
		swal({
			title: "사용 목적을 입력하세요.",
			icon: "error",
			button: "닫기"
		})
		usePrps.focus();
		return false;
	}
	
	if(isNaN(useUsers)){
		swal({
			title: "사용인원은 숫자만 입력 가능합니다.",
			icon: "error",
			button: "닫기"
		})
		useUsers.focus();
		return false;
	}
	
	var rsvtData = {
        'useUsers': useUsers,
        'endHours': endHours,
        'usePrps': usePrps,
        'flctsNo': rsvtFlctsNo,
        'rsvtDate': rsvtDate,
		'startHours': startHours
    }
	console.log("체킁 : ",rsvtData)
	$.ajax({
		url:"/hku/flcts-reservation",
		type: "post",
        data: JSON.stringify(rsvtData),
		contentType: "application/json; charset=utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success:function(res){
			if(res === 'success'){
				swal({
					title: "예약에 성공하였습니다.",
                    icon: "success",
                    button: "닫기"
				})
				flctTimeTable();
				document.querySelector('.btn[data-bs-dismiss="modal"]').click();
			}else if(res === 'failed'){
				swal({
					title: "예약에 실패하였습니다.",
                    icon: "error",
                    button: "닫기"
				})
			}
		}
	})

	// $('form').submit();

})

marker.on("click", function() {
	flctNo = $(this).attr("id");
	flctTable()
})

function flctTable(){
	console.log(flctNo);
	var timeBody = $("#timeBody");
	var flctData = {
		'flctNo': flctNo
	}

	$.ajax({
		url: "/hku/flct-list",
        type: "get",
        data: flctData,
		contentType: "application/json;utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
        dataType: "json",
        success: function(res) {
			
			data = '';
    		for(var i = 0; i < res.length; i++){
				data += `<tr class="\${res[i].flctsNo}">`;
				data += `<td id="flctsNm">\${res[i].flctsNm}</td>`;
				data += `<td id="09:00" class="9 rsvt"></td>`;
				data += `<td id="10:00" class="10 rsvt"></td>`;
				data += `<td id="11:00" class="11 rsvt"></td>`;
				data += `<td id="12:00" class="12 rsvt"></td>`;
				data += `<td id="13:00" class="13 rsvt"></td>`;
				data += `<td id="14:00" class="14 rsvt"></td>`;
				data += `<td id="15:00" class="15 rsvt"></td>`;
				data += `<td id="16:00" class="16 rsvt"></td>`;
				data += `<td id="17:00" class="17 rsvt"></td>`;
				data += `<td id="18:00" class="18 rsvt"></td>`;
				data += `<td id="19:00" class="19 rsvt" style="display:none;"></td>`;
				data += `</tr>`;
			}
			timeBody.html(data);
        }	
	})
}

// 예약가능 시간 클릭시 실행
$("#timeBody").on("click", ".rsvt", function(){
	var stdNo = "${std.stdNo}";
	var stdNm = "${std.stdNm}";
	var flctsNm = $(this).parent().find('#flctsNm').text();
	var flctsNo = $(this).parent().attr("class");
	var startTime = $(this).attr('id');

	var nextDatas = $(this).nextAll("td");
	
	let endArr = [];
	
	for(var i = 0; i < nextDatas.length; i++){
		endArr.push(nextDatas.eq(i).attr("id"))
		if(nextDatas.eq(i).attr("class").split(" ")[1] == 'rsvt-active'){
			break;
		}
	}
	console.log(endArr);

	$("#rsvt-stdNo").val(stdNo);
	$("#rsvt-stdNm").val(stdNm);
	$("#rsvt-flctsNm").val(flctsNm);
	$("#rsvt-flctsNo").val(flctsNo);
	$("#rsvt-date").val(date);
	$("#rsvt-startTime").val(startTime);

	endData = `<option value="">--선택--</option>`;
	for(var i = 0; i < endArr.length; i++){
		endData += `<option value="\${endArr[i]}">\${endArr[i]}</option>`;
	}
	$("#rsvt-endTime").html(endData);

	
})

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
    minDate: 0,
    maxDate: "+1M"
  })

//   $(".datepicker").datepicker({
// 	  minDate: 0,
//   })

$("#datepicker-container").datepicker({
	onSelect: function(dateString) { // 선택한 날짜 가져오기
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
		date = dateString;
		$("#exp2").text(`선택 날짜 : \${dateString}`);
		flctTimeTable();
	}
});	

// 해당 시설에 날짜에 대한 시간테이블 가져오기
function flctTimeTable(){
	var rsvtObj = {
		"rsvtDate":date,
		"flctNo":flctNo
	}
	$.ajax({
		url: "/hku/rsvt-list",
		data: rsvtObj,
		dataType:"json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			
			var timeArr = [];
			var timeTd = $('#timeBody td');
			var rsvtActive = $('#timeBody .rsvt-active');
			
			timeTd.removeAttr("data-bs-toggle", "");
			timeTd.removeAttr("data-bs-target", "");
			
			console.log(rsvtActive);
			rsvtActive.each(function(index, td){
				$(td).addClass("rsvt");
			})
			
			timeTd.removeClass("rsvt-active");
			timeTd.css("background", "");
			
			for(var i = 0; i < res.length; i++){
				var startHours = hoursChange(res[i].startHours);
				var endHours = hoursChange(res[i].endHours);
				var arr = [];

				for(var j = startHours; j < endHours; j++){
					arr.push(j);
				}
				timeArr.push(arr);
			}
			console.log(timeArr);
			
			for(var i = 0; i < res.length; i++){
				for(var j = 0; j < timeArr[i].length; j++){
					var obj = $(`.\${res[i].flctsNo} .\${timeArr[i][j]}`);
					obj.css("background", "#ffdede");
					obj.removeClass("rsvt");
					obj.addClass("rsvt-active");
				}
			}
			
			var rsvt = $('#timeBody .rsvt');
			// 예약 안된 시간에는 modal 열 수 있는 data 요소 추가
			rsvt.each(function(index, td){
				$(td).attr("data-bs-toggle", "modal");
				$(td).attr("data-bs-target", "#rsvtModal");
			})
		}

	});
}

function hoursChange(hours){
	let hoursCg;
	switch(hours){
		case "09:00":
		hoursCg = 9; break;
		case "10:00":
			hoursCg = 10; break;
        case "11:00":
			hoursCg = 11; break;
		case "12:00":
			hoursCg = 12; break;
		case "13:00":
			hoursCg = 13; break;
        case "14:00":
			hoursCg = 14; break;
		case "15:00":
			hoursCg = 15; break;
        case "16:00":
			hoursCg = 16; break;
		case "17:00":
			hoursCg = 17; break;
        case "18:00":
			hoursCg = 18; break;	
        case "19:00":
			hoursCg = 19; break;	
	}
	return hoursCg;
}
</script>