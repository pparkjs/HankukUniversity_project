<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/course-info.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">수강정보</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">교과목 조회</a></li>
		</ol>
    </div>
	<div class="container-fluid searchCon">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					학년:&nbsp;&nbsp;&nbsp;
					<input type="text" class="gradeText" value="${std.grade }학년" disabled>
					생년월일:&nbsp;&nbsp;&nbsp;
					<input type="text" class="birthText" value="${std.stdBrdt }" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<div class="tLeft">
					<h5 class="card-title" style="color: maroon;  font-weight: 900;}">수강중인강의</h5>
					<div class="totalCdt">
						<span>수강학점&nbsp;:&nbsp;&nbsp;</span><div class="totalRight">5과목</div>
					</div>
					<button type="button" class="btn btn-primary" id="scheduleBtn" data-bs-toggle="modal" data-bs-target="#scheduleModal">시간표보기</button>
				</div>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px;">
				<div class="presentCon">
					<div class="record-wrap2" style="margin-top: 10px;">
						<table class="table" style="margin-top: -22px;">
							<thead class="thead-dark">
								<tr>
									<th style="width: 130px;">학년도</th>
									<th style="width: 70px;">학기</th>
									<th style="width: 400px">교과목명</th>
									<th style="width: 100px;">이수구분</th>
									<th style="width: 70px;">학점</th>
									<th style="width: 150px;">담당교수</th>
									<th style="width: 150px;">강의시간</th>
									<th style="width: 250px;">강의실</th>
								</tr>
							</thead>
							<tbody id="presentBody">
								<!-- 동적추가 -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade sModal" id="scheduleModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">강의 시간표</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
            	<h1 style="margin-left: 205px;">2023학년도 1학기 강의시간표</h1>
            	<div class="schedule-wrap">
					<table class="schedule" border=1>
						<thead class="thead-dark">
							<tr>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;"></th>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">월</th>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">화</th>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">수</th>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">목</th>
								<th style="width: 30px; height: 42px; font-size: 19px; font-weight: 500;">금</th>
							</tr>
						</thead>
						<tbody id="timeBody">
							<!-- 동적추가 -->

						</tbody>
					</table>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
	presentCourseList();
})

//  수강중인강의가져오기
function presentCourseList(){
	var presentBody = $("#presentBody");
	
	var stdData = {
		"stdNo":"${std.stdNo }"
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
			console.log(res)
			
			var h1 = document.querySelector(".modal-body h1");

			h1.innerHTML = `\${res[0].lecapYr}학년도 \${res[0].lecapSem}학기 강의시간표`;;
						
			var schedule = []; 
			for(var i = 0; i < res.length; i++){
				var period = []
				for(var j = 0; j < `\${res[i].lecscHour}`; j++){
					period.push(`\${res[i].periodCd + j}`)
				}
				schedule.push(period)
			}
			console.log(schedule);
			
			var timeTable = ''
			for(var i = 1; i <= 9; i++){
				timeTable += `  <tr class="\${i}" style="font-size: 13px; font-weight: 900; height: 61px;">
									<td style="font-size:16px; font-weight:400;">\${i} 교시</td>
									<td class="mon"></td>
									<td class="tue"></td>
									<td class="wed"></td>
									<td class="thu"></td>
									<td class="fri"></td>
								</tr>`;
			}
			$("#timeBody").html(timeTable);
			
			var data = '';
			var sum = 0;
			for(var i = 0; i < res.length; i++){
				sum += parseInt(`\${res[i].subCrd}`);
				data += `<tr>
							<td id="\${res[i].crsClassfCd}">\${res[i].lecapYr}</th>
							<td id="\${res[i].crsClassfCd}">\${res[i].lecapSem}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].subNm}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].comCdNm}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].subCrd}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].proNm}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].lecscDay} \${schedule[i]}</td>
							<td id="\${res[i].crsClassfCd}">\${res[i].flctNm}(\${res[i].flctsNm})</td>`
				data +=	`</tr>`;
				
				var day = dayChange(`\${res[i].lecscDay}`);
				var cnt = 0; // 시간표에 교과목명과 담당교수 이름 넣기위함
				
				// 시간표 채우기
				for(var j = 0; j < schedule[i].length; j++ ){
					var scheduleObj = $(`.\${schedule[i][j]} .\${day}`);
					cnt++;
					console.log("스케줄 : ", schedule[i][j]);
					scheduleObj.css("background", "#ff5e5e3d");
					scheduleObj.css("color", "black");
					scheduleObj.css("font-size", "17px");
					scheduleObj.css("font-weight", "500");
					if(cnt == 1){
						scheduleObj.text(`\${res[i].subNm}(\${res[i].proNm})`)
					}
					if(cnt == 2){
						scheduleObj.text(`\${res[i].flctNm}(\${res[i].flctsNm})`)
					}
					
				}
			}
			$('.totalRight').html(`\${sum}학점`)
			presentBody.html(data);
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
function generateRandomColor() {
	  // 랜덤한 16진수 색상을 생성하는 함수
	  function getRandomHex() {
	    const hexChars = "0123456789ABCDEF";
	    return hexChars[Math.floor(Math.random() * 16)];
	  }

	  let color = "#";
	  for (let i = 0; i < 6; i++) {
	    color += getRandomHex();
	  }
	  return color;
}

//검은색 글씨가 잘 보이는 배경색 생성
function generateReadableBackgroundColor() {
	  let color = generateRandomColor();
	  let luminance = getLuminance(color);

	  // 배경색의 밝기가 일정 값 이하인 경우에는 다시 생성
	  while (luminance > 0.5) {
	    color = generateRandomColor();
	    luminance = getLuminance(color);
	  }

	  return color;
}

//색상의 밝기(luminance) 계산
function getLuminance(color) {
	  const hex = color.replace("#", "");
	  const r = parseInt(hex.substr(0, 2), 16) / 255;
	  const g = parseInt(hex.substr(2, 2), 16) / 255;
	  const b = parseInt(hex.substr(4, 2), 16) / 255;

	  const luminance = (0.299 * r + 0.587 * g + 0.114 * b);
	  return luminance;
}
</script>