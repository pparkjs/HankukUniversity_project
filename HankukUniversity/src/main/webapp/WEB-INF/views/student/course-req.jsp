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
				<div class="search1">
					이수구분:&nbsp;&nbsp;&nbsp;
					<select class="clsfSel">
						<option value="">전체</option>
						<c:forEach items="${commonList}" var="common">
							<c:if test="${common.comCdGrp eq 'COURSE_CLSF' }">
								<option value="${common.comCdNm }">${common.comCdNm }</option>
							</c:if>
						</c:forEach>
					</select>
					학과:&nbsp;&nbsp;&nbsp;
					<select class="deptSel">
						<option value="">전체</option>
						<c:forEach items="${deptList}" var="dept">
							<option value="${dept.deptNm }">${dept.deptNm }</option>
						</c:forEach>
					</select>
					학년:&nbsp;&nbsp;&nbsp;
					<select class="gradeSel">
						<option value="">전체</option>
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
					</select>
					교과목명:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="subName" style="width:274px;" placeholder="교과목명을 입력하세요.">
					<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
					<div class="cart">
						<img class="timeImg" src="/images/시간.png" alt="">
						<div id="clock"></div>
						<img class="cartImg" src="/images/shopping-cart(white).png" alt="">
						<button type="button" class="btn btn-primary" id="cartBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과목담기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-body" style="padding-top: 0px;">
				<div class="course-wrap">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark">
							<tr>
								<th style="width: 130px;">과목코드</th>
								<th style="width: 330px;">교과목명</th>
								<th style="width: 40px;">이수구분</th>
								<th style="width: 130px">담당교수</th>
								<th style="width: 15px;">학년</th>
								<th style="width: 15px;">학점</th>
								<th style="width: 15px;">시수</th>
								<th style="width: 40px;">강의시간</th>
								<th style="width: 250px;">학과</th>
								<th style="width: 20px;">정원</th>
								<th style="width: 20px;">잔여</th>
							</tr>
						</thead>
						<tbody id="recBody">
							<!-- 동적추가 -->
						</tbody>
					</table>
				</div>
				<div class="middle">
					<div class="middleLeft">
						<div class="lTitle">
							<div style="color: maroon;  font-weight: 900; margin-bottom: -10px;">장바구니</div>
							<div class="totalCnt">
								<span>신청학점&nbsp;:&nbsp;&nbsp;</span><div class="totalLeft">15학점</div>
								<span>신청과목수&nbsp;:&nbsp;&nbsp;</span><div class="totalRight">5과목</div>
								<div class="maxCnt"> * 최대 신청가능 학점 : 19학점 </div>
							</div>
						</div>
						<div class="cart-wrap" style="margin-top: 10px;">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width: 130px;">과목코드</th>
										<th style="width: 330px;">교과목명</th>
										<th style="width: 100px">담당교수</th>
										<th style="width: 15px;">학년</th>
										<th style="width: 15px;">학점</th>
										<th style="width: 200px;">학과</th>
										<th style="width: 20px;">신청</th>
										<th style="width: 20px;">취소</th>
									</tr>
								</thead>
								<tbody id="cartBody">
									<!-- 동적추가 -->
								</tbody>
							</table>
						</div>
					</div>
					<div class="middleRight">
						<div class="rTitle">
							<p style="color: maroon;  font-weight: 900; margin-bottom: -10px;">시간표 배정</p>
							<div class="exp"> * 장바구니에 담긴 과목에 대한 시간표입니다.</div>
						</div>
						<div class="schedule-wrap">
							<table class="schedule" border=1>
								<thead class="thead-dark">
									<tr>
										<th style="width: 30px;"></th>
										<th style="width: 30px;">월</th>
										<th style="width: 30px;">화</th>
										<th style="width: 30px;">수</th>
										<th style="width: 30px;">목</th>
										<th style="width: 30px;">금</th>
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
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	
	 rectureList(); 
	 cartList();
	 
	var searchBtn = $("#searchBtn");
	
	// 조회버튼 클릭시 동작
	searchBtn.on("click", function(){
		rectureList();
	})
	
	$(document).on("click","tr", function(){
		$('tr').css('background', '');
		$('tr').removeClass("selected");
		$(this).addClass('selected');
		$(this).css('background', '#6e6e6e26');
		
		var subOtl = $(this).find('.otl');
		$(".otlContent").html(subOtl.text());
	})

	// 과목 클릭 후 장바구니 담기클릭시 동작
	$("#cartBtn").on("click", function(){
		var selected = document.querySelectorAll(".selected td");
		const backgroundColor = generateReadableBackgroundColor(); // 랜덤배경색 가져옴
		
		console.dir(selected[0].className);
		console.log(selected[11].innerText);
		console.log(selected[12].innerText);
		console.log(parseInt(selected[11].innerText) + parseInt(selected[12].innerText));
		console.log(selected[13].innerText);
		console.log('학점',selected[5].innerText);
		
		// console.log(selected.eq(0)) jquery 사용할때는 이렇게 가졍옴
		// console.log(selected.eq(11))
		// console.log(selected.eq(12))
		// console.log(selected.eq(13))
		
		var cartObj = {
			"stdNo" : "${sessionScope.std.stdNo}",
			"lecapNo" : selected[0].className,
			"periodCd" : selected[12].innerText,
			"endPeriod" : parseInt(selected[11].innerText) + parseInt(selected[12].innerText) - 1, 
			"lecscDay" : selected[13].innerText,
			"subCrd" : selected[5].innerText,
			"backColor" : backgroundColor
		}
		
		$.ajax({
			type:"post",
			url:"/hku/subject-cart",
			data:JSON.stringify(cartObj),
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			contentType:"application/json; charset=utf-8",
			success: function(res){
				console.log(res);
				if(res == "exist"){
					swal({
						title: "실패",
						text: "장바구니에 담긴 과목과 시간이 중복됩니다.",
						icon: "error",
						button: "닫기",
						});
				}else if(res == "exceed"){
					swal({
						title: "실패",
						text: "신청 최대 학점을 초과하였습니다.",
						icon: "error",
						button: "닫기",
						});
					cartList();
				}else if(res == "success"){
					swal({
						title: "성공",
						text: "정상적으로 장바구니에 담겼습니다.",
						icon: "success",
						button: "닫기",
						});
					cartList();
				}else{
					swal({
						title: "실패",
						text: "장바구니 담기에 실패하였습니다. 다시 시도하세요.",
						icon: "error",
						button: "닫기",
						});
				}
			}
			
		})
	})
	
	// 취소버튼 클릭 시 실행
	$(document).on("click", "#delBtn", function(){
		var lecapNo = $(this).parent().attr("class");
		
		var delData = {
			"lecapNo":lecapNo,
			"stdNo":"${sessionScope.std.stdNo}"
		}
		
		$.ajax({
			type:"get",
			data:delData,
			url : "/hku/cart-cancle",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				if(res === "success"){
					socketSend();
					swal({
						title: "취소 완료",
						icon: "success",
						button: "닫기",
						});
					cartList();
				}else{
					swal({
						title: "취소 실패",
						text: "시스템 오류입니다. 다시 시도해주세요",
						icon: "error",
						button: "닫기",
						});
				}
			}
		})
		
	})
	
	// 신청버튼클릭시 실행
	$(document).on("click", "#regBtn", function(){
		var lecapNo = $(this).parent().attr("class");
		
		var regData = {
			"lecapNo":lecapNo,
			"stdNo":"${sessionScope.std.stdNo}"
		}
		
		
		$.ajax({
			type:"get",
			data:regData,
			url : "/hku/course-regist",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(res){
				
				if(res === "exceed"){
					swal({
						title: "정원초과",
						text: "이미 수강정원이 초과되었습니다.",
						icon: "error",
						button: "닫기",
					});
				}else if(res === "success"){
					socketSend();
					cartList();
				}else{
					swal({
						title: "취소 실패",
						text: "시스템 오류입니다. 다시 시도해주세요",
						icon: "error",
						button: "닫기",
					});
				}
			}
		})
		
	})
	
})

//------------------------ websocket 관련------------------------

var websocket = null;

connect();

// 웹소켓 연결 함수
function connect(){
	// 웹소켓 주소
    var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/rectureAppl.do";
    websocket = new WebSocket(wsUri);
    
    websocket.onopen = function(){
    	console.log('info: connection opened.');
    }
    
}

// 웹소켓에서 메시지 받을시 실행
websocket.onmessage = function(evt) {
 	console.log("evt.data : ", evt.data)
 	
    if(evt.data == "reload"){
    	rectureList();
    }
 }

// 메시지 보내는 함수
function socketSend(){
	websocket.send("reload");
}

//-----------------------------------------------------------
// 장바구니 리스트 가져오기
function cartList(){
	var cartBody = $("#cartBody");
	var timeBody = $("#timeBody");
	$.ajax({
		type:"get",
		url : "/hku/cart-list",
		data:{
			"stdNo" : "${sessionScope.std.stdNo}"
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		dataType : "json",
		success : function(res){
			console.log(res)
			
			// 해당 과목의 시간표 계산
			var schedule = []; 
			for(var i = 0; i < res.length; i++){
				var period = []
				for(var j = 0; j < `\${res[i].lecscHour}`; j++){
					period.push(`\${res[i].periodCd + j}`)
				}
				schedule.push(period)
			}
			console.log("schedule: ", schedule);
			
			var timeTable = ''
			for(var i = 1; i <= 9; i++){
				timeTable += `  <tr class="\${i}" style="font-size: 13px; font-weight: 900;">
									<td style="font-size:16px; font-weight:400;">\${i} 교시</td>
									<td class="mon"></td>
									<td class="tue"></td>
									<td class="wed"></td>
									<td class="thu"></td>
									<td class="fri"></td>
								</tr>`;
			}
			timeBody.html(timeTable);
			
			var data = '';
			var subCnt = res.length;
			var craditSum = 0;
			for(var i = 0; i < res.length; i++){
				craditSum += parseInt(`\${res[i].subCrd}`);
				data += `<tr>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].subNo}</th>
							<td class="\${res[i].lecapNo} subNm" style="padding:8px;">
								<div style="background:\${res[i].backColor}; font-weight: 900; width:30px; height:30px;">
								</div>
								<div class="nm">\${res[i].subNm}</div>
							</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].proNm}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].lecapTgGrade}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].subCrd}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].deptNm}</td>`
				if(`\${res[i].applYn}` == "N"){
					data +=		`<td class="\${res[i].lecapNo}" style="padding:8px;"><input type="button" class="btn btn-primary" id="regBtn" value="신청"></td>`
				}else{ 
					data +=		`<td class="\${res[i].lecapNo}" style="color:#f11212; padding:7px;">완료</td>`
				}
					data +=		`<td class="\${res[i].lecapNo}" style="padding:8px;"><input type="button" class="btn btn-primary" id="delBtn" value="취소"></td>`
				data +=	`</tr>`;
				
				var day = dayChange(`\${res[i].lecscDay}`);
				var cnt = 0; // 시간표에 교과목명과 담당교수 이름 넣기위함
				
				// 시간표 채우기
				for(var j = 0; j < schedule[i].length; j++ ){
					var scheduleObj = $(`.\${schedule[i][j]} .\${day}`);
					cnt++;
					console.log("스케줄 : ", schedule[i][j]);
					scheduleObj.css("background", `\${res[i].backColor}`)
					
					if(cnt == 1){
						scheduleObj.text(`\${res[i].subNm}`)
					}
					if(cnt == 2){
						scheduleObj.text(`\${res[i].proNm}`)
					}
					
				}
			}
			$(".totalLeft").html(craditSum + "학점")
			$(".totalRight").html(subCnt + "과목")
			cartBody.html(data);
		}
	})
	
	
}

// 개설된강의 리스트 가져오는 함수
function rectureList(){
	var recBody = $("#recBody");
	var clsfSel = $(".clsfSel").val();
	var deptSel = $(".deptSel").val();
	var gradeSel = $(".gradeSel").val();
	var subNm = $("#subName").val();
	
	var selData = {
		"com_cd_nm":clsfSel,
		"dept_nm":deptSel,
		"sub_grade":gradeSel,
		"sub_nm":subNm
	}
	
	$.ajax({
		type:"get",
		data:selData,
		url : "/hku/lecture-list",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res)
			
			// 해당 과목의 시간표 계산
			var schedule = []; 
			for(var i = 0; i < res.length; i++){
				var period = []
				for(var j = 0; j < `\${res[i].lecscHour}`; j++){
					period.push(`\${res[i].periodCd + j}`)
				}
				schedule.push(period)
			}
			console.log(schedule)
			
			var data = '';
			for(var i = 0; i < res.length; i++){
				data += `<tr>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].subNo}</th>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].subNm}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].comCdNm}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].proNm}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].lecapTgGrade}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].subCrd}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].lecscHour}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].lecscDay} \${schedule[i]}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].deptNm}</td>
							<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].lecapCpct}</td>`
				if(`\${res[i].remainder}` > 0){
					data +=		`<td class="\${res[i].lecapNo}" style="padding:8px;">\${res[i].remainder}</td>`
				}else{
					data +=		`<td class="\${res[i].lecapNo}" style="padding:8px; background: #ff000085;  color: #fff; font-weight: 500;">\${res[i].remainder}</td>`
				}
						
				data +=		`<td class="\${res[i].lecapNo}" style="display:none">\${res[i].lecscHour}</td>
							<td class="\${res[i].lecapNo}" style="display:none">\${res[i].periodCd}</td>
							<td class="\${res[i].lecapNo}" style="display:none">\${res[i].lecscDay}</td>`
				data +=	`</tr>`;
			}
			recBody.html(data);
		}
	})
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

// 검은색 글씨가 잘 보이는 배경색 생성
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

// 색상의 밝기(luminance) 계산
function getLuminance(color) {
	  const hex = color.replace("#", "");
	  const r = parseInt(hex.substr(0, 2), 16) / 255;
	  const g = parseInt(hex.substr(2, 2), 16) / 255;
	  const b = parseInt(hex.substr(4, 2), 16) / 255;

	  const luminance = (0.299 * r + 0.587 * g + 0.114 * b);
	  return luminance;
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
//실시간 시간
const clock = document.querySelector("#clock");

function getClock(){
  const d = new Date();
  const h = String(d.getHours()).padStart(2,"0");
  const m = String(d.getMinutes()).padStart(2,"0");
  const s = String(d.getSeconds()).padStart(2,"0");
  clock.innerText = `\${h}:\${m}:\${s}`;
}

getClock(); //맨처음에 한번 실행
setInterval(getClock, 1000); //1초 주기로 새로실행
</script>