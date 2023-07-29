<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>

.schedule, .schedule th, .schedule td {
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
   width : 100px;
   height: 40px;
}
.schedule th, .schedule td {
   padding: 20px;
}
.schedule th{
  	text-align: center;
	font-size: 1.5em;
}
.custom-tab-1 .nav-link {
    font-weight: 800;
    color: #444444;
    font-size: 17px;
}
.study-top{
	border: 1px solid maroon;
    padding: 13px;
    height: 252px;
}
.schedule td, .schedule th{
border-color: #6e6e6e;
}
.schedule td{
	padding:22px;
}
.fCanUse {
    width: 30px;
    height: 30px;
    background: white;
    border: 1px solid #40404042;
    margin-left: 25px;
    margin-right: 8px;
}
.fUseing {
    width: 30px;
    height: 30px;
    background: rgb(255, 222, 222);
    margin-left: 25px;
    margin-right: 8px;
}
.fTitle-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
}
#redColor{
	background-color: #FF5733;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#oranColor{
	background-color: #FFBD33;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#lemonColor{
	background-color: #DBFF33;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#greenColor{
	background-color: #33FF57;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}

#darkGreenColor{
	background-color: #33FFBD;
	z-index:1;
	width:25px;
	height:25px;
	border-radius:50%;
}
input[name=color]{
 	display:none;
}

input[name=color]:checked + label{
	border:2px solid black;
}
</style>
		<meta charset="UTF-8">
		<div class="content-body">
			<div class="page-titles">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active"><a href="javascript:void(0)">study room</a></li>
				</ol>
			</div >
<!-- 				<div style="display: flex; justify-content: end; margin-right: 80px; margin-top: 10px;"> -->
<!-- 				</div> -->
			<div class="container-fluid subCon">
					<div class="custom-tab-1" style="display: flex; align-items: center;">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" data-bs-toggle="tab" href="#profile1"><i class="far fa-user me-2"></i> 스터디원</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" href="#contact1"><i class="far fa-clock me-2"></i> 시간표</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-bs-toggle="tab" href="#message1" id="calRender"><i class="ti-calendar me-2"></i> 일정</a>
							</li>
						</ul>
						<a class="btn btn-primary" href="https://6ce9-1-212-157-150.ngrok-free.app/study?room=${study.studyNo }" role="button" id="btn1" style="margin-left: 733px; margin-bottom: 10px; background: #0070c0; border-color: #0070c0;">화상채팅</a>
					
						<form action="/hku/student/delStudy" method="post" id="delForm">
							<input type="hidden" name="studyNo" value="${study.studyNo}" id="studyNo">
						</form>
						<!-- 스터디장은 스터디 해체 버튼 보여주기 -->
						<c:choose>
						    <c:when test="${role eq 'Y'}">
						        <button type="button" class="btn btn-primary" style="margin-left: 14px; margin-bottom: 10px; background: #ff4343; border-color: #ff4343;" id="delBtn">
						            <i class="fa-solid fa-circle-exclamation me-2"></i>스터디 삭제
						        </button>
						    </c:when>
						    <c:otherwise>
						        <button type="button" class="btn btn-primary" style="margin-left: 14px; margin-bottom: 10px;" id="exitBtn"> 스터디 탈퇴</button>
						    </c:otherwise>
						</c:choose>									
					</div>
					<div class="card" id="card-title-1">
						<div class="card-body" style="padding-top: 0px;">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="profile1">
									<div class="pt-4">
										<div class="study-top">
											<h4 style="font-weight: 800; font-size: 21px; color: #800000;">스터디 소개</h4>
											<hr>
											<c:choose>
												<c:when test="${empty study }">
													<p>스터디 소개글이 존재하지 않습니다.</p>
												</c:when>
												<c:otherwise>
													<p> ${study.studyIntro }</p>																						
												</c:otherwise>
											</c:choose>
										</div>
										<div style="display: flex; margin-top: 12px;">
											<div style="width: 40%; margin-top: 20px; margin-right: 25px;">
											<p style="font-weight: 900; font-size: 21px; color: maroon; margin-bottom: 0px;">스터디원</p>
											<table style="width: 100%; border: none;" class="table">
											<thead class="thead-dark">
												<tr>
											    	<th>이름</th><th>학번</th><th>학과</th><th>학년</th>
											    </tr>
											</thead>
											  <c:choose>
											    <c:when test="${empty studyMem }">
											      <tr>
											        <td colspan="5">스터디원이 존재하지 않습니다.</td>
											      </tr>
											    </c:when>
											    <c:otherwise>
											      <tbody>
											        <c:forEach items="${studyMem }" var="studyMem">
											          <tr>
											            <td>${studyMem.stdNm}</td>
											            <td>${studyMem.stdNo}</td>
											            <td>${studyMem.deptNm}</td>
											            <td>2</td>
											  
											          </tr>
											        </c:forEach>
											      </tbody>
											    </c:otherwise>
											  </c:choose>
										</table>
									</div>
									<div style="width: 60%; margin-top: 20px ">
										<p style="font-weight: 900; font-size: 21px; color: maroon; margin-bottom: 0px;">가입신청자 목록</p>
										<input type="hidden" value="${study.studyNo }" id="studyNo">
										<table style="width: 100%; border: none;" class="table" id="tbl1">
											<thead class="thead-dark">
												<tr>
													<th>이름 </th><th>학과 </th><th>학번 </th><th>신청일</th><th style="width: 300px;">comment</th><th> </th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
											    <c:when test="${role eq 'Y'}">
													<c:choose>
														<c:when test="${empty appli}">
															<tr><td colspan="5">가입신청 인원이 존재하지 않습니다.</td></tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${appli }" var="appli">
																<tr id="link">
																	<td>${appli.stdNm } </td>
																	<td>${appli.deptNm } </td>
																	<td id="td">${appli.stdNo }</td>
																	<td>${appli.joinRegdate }</td>
																	<td style="width: 300px;">${appli.joinReason }</td>
																	<td>
																		<div class="action-button">
																			<form action="" method="post" id="applFrm" name="applFrm">
																				<input type="hidden" name="joinNo" id="joinNo" value="${appli.joinNo}">																	
																				<a href="#" class="applBtn1" onclick="assignStudy()">
																					<span class="badge badge-success badge-sm">승인<span class="ms-1 fa fa-check"></span></span>																	
																				</a>
																				<a href="#" class="applBtn2" onclick="rejStudy()">
																					<span class="badge badge-secondary  badge-sm">반려<span class="ms-1 fa fa-ban"></span></span>
																				</a>
																			</form>
																		</div>
																	</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>											
									    </c:when>
									    <c:otherwise>
									       <tr>
									       <td colspan="5"> 스터디장만 확인 가능합니다.</td>
									       </tr>
									    </c:otherwise>
									</c:choose>	
											</div>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>

							<div class="tab-pane fade" id="contact1">
								<div style="display: flex;">
									<div style="width: 53%; margin-top: 23px">
										<div class="exp" style="margin-top: 13px;"> * 스터디원간 시간표를 비교해 겹치지 않는 일정을 확인할 수 있습니다.						
										</div>
										
										<table style="width: 100%; border: none;" class="table">
										<thead class="thead-dark">
											<tr>
										    	<th>이름</th><th>학번</th><th>학과</th>
										    </tr>
										</thead>
										<tbody id="tbody"> 
											<c:forEach items="${studyMem}" var="study" varStatus="status">
												<tr>
													<td id="${study.stdNo}" onclick="sList(this)">${study.stdNm}</td>
													<td id="${study.stdNo}"	onclick="sList(this)">${study.stdNo}</td>
													<td id="${study.stdNo}"	onclick="sList(this)">${study.deptNm}</td>	
												</tr>
											</c:forEach>
										</tbody>
										
										</table>
										<button type="button" class="btn btn-primary" style="margin: 10px" onclick="resetSList()" id="resetBtn"> 초기화</button>	
									</div>		
									<div style="width: 70%; margin-top: 22px">
										<div class="fTitle-wrap" style="margin-left: 70% ">
											<div class="fUseing"></div>
											<span style="margin-right : 0px; font-size: 18px;">중복시간</span>
											<div class="fCanUse"></div>
											<span style="margin-right: 0px; font-size: 18px;">빈시간</span>	
										</div>
										<div class="schedule-wrap">
											<table class="schedule" border=1 style="width: 92%; margin-left: 61px; margin-top: 20px;" >
												<thead class="thead-dark" style="background: #6e6e6e; color: white;">
													<tr>
														<th style="width: 150px; padding: 10px;"></th>
														<th style="width: 150px; padding: 10px;">월</th>
														<th style="width: 150px; padding: 10px;">화</th>
														<th style="width: 150px; padding: 10px;">수</th>
														<th style="width: 150px; padding: 10px;">목</th>
														<th style="width: 150px; padding: 10px;">금</th>
													</tr>
												</thead>
												<tbody id="sBody">
													<!-- 동적추가 -->
	
												</tbody>
											</table>
										</div>
									</div>	
								</div>	
							</div>
							<div class="tab-pane fade" id="message1">
								<div id="calendar"></div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="calModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">일정 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="calNo">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="calFrm" name="noticeFrm" enctype="multipart/form-data" method="post">
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom01">
									일정 제목 <span class="text-danger">*</span>
								</label>
								<input type="text" name="calTtl" id="calTtl" class="form-control" id="validationCustom01" placeholder="제목을 입력하세요." required>
								<div class="invalid-feedback">
									제목을 입력해주세요.
								</div>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									내용 <span class="text-danger">*</span>
								</label>
								<textarea name="calCn" id="calCn" class="form-control h-50" id="validationCustom04" rows="5" placeholder="내용을 입력하세요." required></textarea>
								<div class="invalid-feedback">
									내용을 입력해주세요.
								</div>
							</div>
							<div class="mb-3 row">
								<div class="col-xl-6 col-xxl-4">
									<label class="col-lg-4 col-form-label" for="validationCustom01">
										시작 날짜 <span class="text-danger">*</span>
									</label>
									<input type="date" name="calBgngDt" id="calBgngDt" class="form-control" required>
								</div>
								<div class="col-xl-6 col-xxl-4">
									<label class="col-lg-4 col-form-label" for="validationCustom01">
										종료 날짜 <span class="text-danger">*</span>
									</label>
									<input type="date" name="calEndDt" id="calEndDt" class="form-control" required>
								</div>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom01">
									일정 색상 선택 <span class="text-danger">*</span>
								</label>
								<div class="col-6">
									<input type="radio" name="color" id="color1" value="#FF5733">
									<label for="color1" id="redColor" class="mr-2"></label>
									<input type="radio" name="color" id="color2" value="#FFBD33">
									<label for="color2" id="oranColor" class="mr-2"></label>
									<input type="radio" name="color" id="color3" value="#DBFF33">
									<label for="color3" id="lemonColor" class="mr-2"></label>
									<input type="radio" name="color" id="color4" value="#33FF57">
									<label for="color4" id="greenColor" class="mr-2"></label>
									<input type="radio" name="color" id="color5" value="#33FFBD">
									<label for="color5" id="darkGreenColor"></label>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addBtn">등록</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	sTbl();
});
function sTbl(){
	var sBody = $("#sBody");
    var timeTable = '';
    for (var i = 1; i <= 9; i++) {
        timeTable += `<tr class="${i}" style="font-size: 13px; font-weight: 900;">
                        <td style="font-size:16px; font-weight:400;">\${i} 교시</td>
                        <td class="mon week"></td>
                        <td class="tue week"></td>
                        <td class="wed week"></td>
                        <td class="thu week"></td>
                        <td class="fri week"></td>
                    </tr>`;
    }
    sBody.html(timeTable);
}

function resetSList(){
	sTbl();
}
</script>
<script>

function sList(element) {
	var stdNo = $(element).attr("id");
    var sBody = $("#sBody");
    console.log("stdNo:",stdNo);
    $.ajax({
        type: "get",
        url: "/hku/student/scheduleList",
        beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
        data: {
            "stdNo": stdNo
        },
        dataType: "json",
        success: function(res) {
            console.log("res:",res);
            
            
            var tableCells = sBody.find('.week'); 
            var WEEKDAYS = 5;
            
            var tableColByName = {
                    '월': 1,
                    '화': 2,
                    '수': 3,
                    '목': 4,
                    '금': 5
                };

            for (const {lecscDay, lecscHour, periodCd} of res) {               	
                var colNum = tableColByName[lecscDay];
                console.log("colNum", colNum);
                var rowNum = periodCd; 
                console.log("rowNum", rowNum);
                var cellIndex = (rowNum - 1) * WEEKDAYS + colNum - 1;

                for (var i = 0; i < lecscHour; i++) {
                    tableCells.eq(cellIndex + i * WEEKDAYS).css('background-color', 'rgb(250, 220, 220)');
                }
            }
           
        },
        error: function(err) {
            console.log(err);
        }
    });
}


$(function(){
	
	var delBtn = $('#delBtn');
	var exitBtn = $('#exitBtn');
	var delForm = $('#delForm');
	
	var tbody = $('#tbody');
	  
	delBtn.on('click', function(){
		swal.fire({
	      title: '정말로 삭제하시겠습니까??',
	      icon: 'warning'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        delForm.submit();
	      }
	    });
	});

	exitBtn.on('click', function(){
		delForm.attr("action", "/hku/student/exitStudy");
		swal.fire({
	      title: '정말로 탈퇴하시겠습니까??',
	      icon: 'warning'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        delForm.submit();
	      }
	    });
	})
	
});

function assignStudy() {

	var frm = document.forms.applFrm;	
	var joinNo = frm.joinNo.value;

	var joinNo = {
		"joinNo": joinNo
		}

    $.ajax({
        type: "POST",
        data: joinNo,
        url: "/hku/student/assignStudy",
        beforeSend : function(xhr){
           xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        dataType: "json",
        success: function(res) {
            console.log("res: ", res);
	            if(res>0){
	            	location.reload();
	            	swal({
						title: "가입승인 완료", 
						icon: "success"
					});
	            }else{
	            	swal({
	        			title: "승인실패", 
	        			icon: "error"
	        		});
	            }
	            
	       	}
    });
}

function rejStudy() {

	var frm = document.forms.applFrm;	
	var joinNo = frm.joinNo.value;

	var joinNo = {
		"joinNo": joinNo
		}

    $.ajax({
        type: "POST",
        data: joinNo,
        url: "/hku/student/rejStudy",
        beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
        dataType: "json",
        success: function(res) {
            console.log("res: ", res);
	            if(res>0){
	            	location.reload();
	            	swal({
						title: "가입거부 하였습니다.", 
						icon: "success"
					});
	            }else{
	            	swal({
	        			title: "승인실패", 
	        			icon: "error"
	        		});
	            }
	            
	       	}
    });
}
</script>
<!-- 캘린더 스크립트 ======================================================== -->
<script type="text/javascript">
$(document).on('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calModal = $('#calModal');
	var calStudyNo = "${study.studyNo}";
	var addBtn = $('#addBtn');
	
	var calendar = new FullCalendar.Calendar(calendarEl, {
		timeZone: 'UTC',
		selectable: true,
		locale: "ko",
		headerToolbar: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		height: 730,
		width: 500,
	 	eventClick : function(info){
	 		detailCalendar(info.event);
	 	},
	 	dateClick: function(info) {
	 		console.log('clicked ' + info.dateStr);
	 	},
	 	select: function(info) {
	 		$('#calBgngDt').val(info.startStr);
	 		$('#calEndDt').val(info.endStr);
	 		calModal.modal('show');
	 		console.log('selected ' + info.startStr + ' to ' + info.endStr);
	 	},
	 	eventDragStop:function(info){
	 		if(info.jsEvent.screenX > 1800){
	 			console.log("아이디 : " + info.event.id + "이정도 드래그면 삭제 해도된다.");
	 			deleteEvent(info.event.id);
	 		}
	 	},
	 	eventResize: function(info){
	 		changeEvent(info.event);
	 	},
	 	eventDrop: function (info){
	 		changeEvent(info.event);
	 	},
		rerenderDelay: 300,
		editable: true,
		dayMaxEvents: true // when too many events in a day, show the popover
	});

	calendar.render();
	
	getCalendarList();
	
	function getCalendarList(){
		let sendData = {
			studyNo:calStudyNo
		};
		console.log("어떤 캘린더 보여줄꺼야?", sendData);
		$.ajax({
			type : 'get',
			url : '/hku/student/study-calendar',
			dataType : 'json',
			data : sendData,
			success: function(res){
				console.log("캘린더 정보", res);
				for(let i=0; i<res.length; i++){
					let calData = res[i];
					calendar.addEvent({
						id: calData.calNo,
						title: calData.calTtl,
						start: calData.calBgngDt,
						description : calData.calCn,
						end: calData.calEndDt,
						textColor: "black",
						backgroundColor: calData.calColor
					});
				}
// 				getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
			}
		});
	}
	
	// 일정 상세 보기
	function detailCalendar(e){
		// console.log("이벤트 아이디" , e.id);
		// console.log("이벤트 제목" , e.title);
		// console.log("이벤트 내용" , e.extendedProps.description);
		// console.log("이벤트 시작날짜" , e.start);
		// console.log("이벤트 종료날짜" , e.end);
		// console.log("이벤트 배경색" , e.backgroundColor);
		addBtn.text("저장");
		$('#calNo').val(e.id);
		$('#calTtl').val(e.title);
		$('#calCn').val(e.extendedProps.description);
		$('#calBgngDt').val(moment(e.start).format("YYYY-MM-DD"))
		$('#calEndDt').val(moment(e.end).format("YYYY-MM-DD"));
		$('input[name="color"][value="' + e.backgroundColor + '"]').prop('checked', true);

		calModal.modal('show');
	}
	
	// 변경 했을때 다시 저장
	function setChangeEvent(e,data){
		
		console.log("왜 안됨?", data);
		e.setProp('title', data.calTtl);
		e.setExtendedProp('description', data.calCn);
		e.setStart(data.calBgngDt);
		e.setEnd(data.calEndDt);
		e.setProp('backgroundColor', data.calColor);
	}
	
	function changeEvent(e){
		// 이벤트 움직엿을떄 발생할떄 변경 해주기
		let changeData = {
			calNo: e.id,
			calTtl: e.title,
			calCn: e.extendedProps.description,
			calBgngDt: moment(e.start).format("YYYY-MM-DD"),
			calEndDt: moment(e.end).format("YYYY-MM-DD"),
			calColor: e.backgroundColor,
			studyNo: calStudyNo
		};
		console.log("changeData", changeData);
		
		$.ajax({
			type : 'put',
			url : '/hku/student/study-calendar',
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			data : JSON.stringify(changeData),
			dataType : 'text',
			success: function(res){
				console.log(res);
			}
		});
	}
	
	// 등록 버튼
	addBtn.on('click', function(){
		let calTtl = $('#calTtl').val();
		let calCn = $('#calCn').val();
		let calBgngDt = $('#calBgngDt').val();
		let calEndDt = $('#calEndDt').val();
		let color = $('input[name="color"]:checked').val();
		
		
		let sendData = {
			calTtl : calTtl,
			calCn : calCn,
			calBgngDt : calBgngDt,
			calEndDt : calEndDt,
			calColor : color,
			studyNo : calStudyNo
		};

		// 체크 하기
		if(valCheck(sendData)){
			return false;
		}
		if($(this).text() == "등록"){
			$.ajax({
				type : 'post',
				url : '/hku/student/study-calendar',
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(sendData),
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				dataType : 'text',
				success: function(res){
					console.log(res);
					if(res.calNo != "0"){
						swal({
							title: "일정이 추가 되었습니다.", 
							icon: "success"
						});
						console.log("일정 추가 성공", res);
						res = JSON.parse(res);
						calendar.addEvent({
							id: res.calNo,
							title: res.calTtl,
							start: res.calBgngDt,
							description : res.calCn,
							end: res.calEndDt,
							textColor: 'black',
							backgroundColor: res.calColor
						});
						calModal.modal('hide');
// 						getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
					}else{
						swal({
							title: "서버에러 다시 시도해주세요.", 
							icon: "error"
						});
					}
				}
			});
		}else if($(this).text() == "저장"){
			sendData.calNo = $('#calNo').val();
			console.log(sendData);
			$.ajax({
				type : 'put',
				url : '/hku/student/study-calendar',
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(sendData),
				dataType : 'text',
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success: function(res){
					if(res == "1"){
						swal({
							title: "일정이 변경되었습니다.", 
							icon: "success"
						});
						let changedEvent = calendar.getEventById(sendData.calNo);
						setChangeEvent(changedEvent, sendData);
						calModal.modal('hide');
// 						getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
					}
				}
			});
		}
	});
	
	// 모달창 닫힐떄 일어나는 매서드
	calModal.on('hidden.bs.modal', function() {
		$('#calFrm')[0].reset();
		addBtn.text("등록");
	});
	
	function valCheck(data){
		if(data.calTtl == "" || data.calTtl == null){
			swal({
				title: "제목을 입력해주세요.", 
				icon: "error"
			});
			return true;
		}
		if(data.calCn == "" || data.calCn == null){
			swal({
				title: "내용을 입력해주세요.", 
				icon: "error"
			});
			return true;
		}
		if(data.calBgngDt == "" || data.calBgngDt == null){
			swal({
				title: "시작날짜를 입력해주세요.", 
				icon: "error"
			});
			return true;
		}
		if(data.calEndDt == "" || data.calEndDt == null){
			swal({
				title: "종료날짜를 입력해주세요.", 
				icon: "error"
			});
			return true;
		}
		if(data.calColor == "" || data.calColor == null){
			swal({
				title: "색상을 선택해주세요.", 
				icon: "error"
			});
			return true;
		}
	}
	
	function deleteEvent(pCalNo){
		swal({
			   title: '해당 일정을 삭제 하시겠습니까?',
			   icon: 'warning',
			   buttons: true,
			   dangerMode: true,
		}).then((willDelete) => {
			if (willDelete) {
				
				let deleteData = {
					calNo: pCalNo
				};
				$.ajax({
					type:"delete",
					url: "/hku/student/study-calendar",
					contentType: "application/json;charset=utf-8", // 필수 
					data: JSON.stringify(deleteData),
					dataType: "text",
					beforeSend : function(xhr){
		               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
					success: function(res){
						if (res == "1") {
							swal({
								title: "일정이 삭제 되었습니다.", 
								icon: "success"
							});
							// 여기 이제 구현하면 됨
							var eventToDelete = calendar.getEventById(pCalNo);
							eventToDelete.remove();
// 							getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
						}
					},
					err: function(err){
						console.log("err:", err)
					}
				});
			}
		});
	}
	
	// 일정 버튼 눌럿을떄 캘린더 다시 랜더링
	$('#calRender').click(function(){
		calendar.render();
	});
});
</script>
<!-- 캘린더 스크립트 끝======================================================== -->