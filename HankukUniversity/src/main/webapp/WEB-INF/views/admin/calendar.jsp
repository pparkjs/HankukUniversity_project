<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
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
.height370 {
	height: 41.125rem;
}
#calClsf{
	width: 8%;
}
.fc .fc-toolbar.fc-header-toolbar {
    margin-bottom: -0.9em;
}
.fc-toolbar {
    margin-top: -0.0625rem;
}
.fc .fc-daygrid-body td {
	height:65px;
}
.fc .fc-daygrid-day-number {
    padding: 4px;
    position: relative;
    z-index: 4;
    color: black;
    font-size: 17px;
    font-weight: 600;
}
.fc .fc-col-header-cell-cushion {
    display: inline-block;
    padding: 2px 4px;
    color: black;
    font-size: 16px;
    font-weight: 600;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학사 일정 관리</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -12px;">
		<div class="row">
			<div class="mb-1">
				<select class="form-control" id="calClsf" style="height: 32px;">
					<option value="uni" selected>학사</option>						
					<c:forEach items="${deptList }" var="dept">
						<option value="${dept.DEPT_CD }">${dept.DEPT_NM }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-xl-9 col-xxl-8">
				<div class="card">
					<div class="card-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-xxl-4">
				<div class="card">
					<div class="card-body">
						<div class="card-header border-0 pb-0">
                            <h4 class="card-title" id="timeTitle"></h4>
                        </div>
						<hr>
						<div class="card-body p-0">
							<div id="DZ_W_TimeLine" class="widget-timeline dz-scroll height370 my-4 px-4">
								<ul class="timeline" id="timeline">
									<c:forEach items="${curCalendarList }" var="curCal">
										<c:choose>
											<c:when test="${curCal.calColor eq '#FF5733' }">
												<c:set var="color" value="danger"/>
											</c:when>
											<c:when test="${curCal.calColor eq '#FFBD33' }">
												<c:set var="color" value="warning"/>
											</c:when>
											<c:when test="${curCal.calColor eq '#33FFBD'}">
												<c:set var="color" value="info"/>
											</c:when>
											<c:otherwise>
												<c:set var="color" value="success"/>
											</c:otherwise>
										</c:choose>
										<li>
											<div class="timeline-badge ${color }"></div>
											<a class="timeline-panel " href="#">
												<span>
													<c:out value="${curCal.calTtl }"/>
												</span>
												<h6 class="mb-0">
													<c:out value="${curCal.calBgngDt }"/> ~
													<c:out value="${curCal.calEndDt }"/>
												</h6>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	var calendarEl = document.getElementById('calendar');
	var calModal = $('#calModal');
	var addBtn = $('#addBtn');
	var calClsf = $('#calClsf');

	// 일정 등록 버튼
	var calendar = new FullCalendar.Calendar(calendarEl, {
		timeZone: 'UTC',
		selectable: true,
		locale: "ko",
	 	height: 850,
		headerToolbar: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		eventClick : function(info){
			detailCalendar(info.event);
		},
		dateClick: function(info) {
			console.log('clicked ' + info.dateStr);
		},
		select: function(info) {
			$('#calBgngDt').val(info.startStr);
			$('#calEndDt').val(info.endStr);
			$('#automaticCompletionBtn').css('display', 'block');
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
		eventDataTransform: function(event) {                                                                                                                                
	 		if(event.allDay) {                                                                                                                                               
	 			console.log("여기", event.dateStr);
// 	    		event.end = moment(event.end).add(1, 'days')                                                                                                                 
	  		}
// 	  		return event;  
		}, 
		// 툴팁인데 안먹네..
// 		eventDidMount: function(info) {
// 			var tooltip = new Tooltip(info.el, {
// 				title: info.event.extendedProps.description,
// 				placement: 'top',
// 				trigger: 'hover',
// 				container: 'body'
// 			});
// 		},
		eventDrop: function (info){
			// 일정 잡와서 다른데 놨을떄 발생하는 이벤트
			changeEvent(info.event);
		},
		customButtons: {
	    	prev: {
	      		text: '이전',
	      		click: function(info) {
			        calendar.prev();
			        // 원하는 로직을 처리합니다.
			        getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
		      	}
	    	},
	    	next: {
	      		text: '다음',
	      		click: function(info) {
			        calendar.next();
			        // 원하는 로직을 처리합니다.
			        getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
		      	}
	    	}
	  	},
		eventColor: 'black',
		rerenderDelay: 300,
		editable: true,
		dayMaxEvents: true, // when too many events in a day, show the popover
		// events: '/api/demo-feeds/events.json?overload-day'
	});

	calendar.render();

	getCalendarList();
	
	// 일정 구분 선택 
	calClsf.on('change', function(){
		// 변경 될떄 전체 이벤트 삭제 하고 다시 추가 
		calendar.removeAllEvents();
		console.log(calClsf.val());
		getCalendarList();
	});
	
	
	// 이벤트 동적 생성
	function getCalendarList(){
		let sendData = {
			calClsfCd:calClsf.val()
		};
		console.log("어떤 캘린더 보여줄꺼야?", sendData);
		$.ajax({
			type : 'get',
			url : '/hku/admin/calendar-list',
			dataType : 'json',
			data : sendData,
			success: function(res){
				console.log(res);
				for(let i=0; i<res.length; i++){
					let calData = res[i];
					var endDate = moment(calData.calEndDt);
					var nextDay = endDate.add(1, 'days').format('YYYY-MM-DD');
					calendar.addEvent({
						id: calData.calNo,
						title: calData.calTtl,
						start: calData.calBgngDt,
						description : calData.calCn,
						end: nextDay,
						textColor: 'black',
						backgroundColor: calData.calColor
					});
				}
				getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
			}
		});
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
					url: "/hku/admin/calendar",
					beforeSend : function(xhr){
		               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
					contentType: "application/json;charset=utf-8", // 필수 
					data: JSON.stringify(deleteData),
					dataType: "text",
					success: function(res){
						if (res == "1") {
							swal({
								title: "일정이 삭제 되었습니다.", 
								icon: "success"
							});
							// 여기 이제 구현하면 됨
							var eventToDelete = calendar.getEventById(pCalNo);
							eventToDelete.remove();
							getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
						}
					},
					err: function(err){
						console.log("err:", err)
					}
				});
			}
		});
	}
	
	// 오른쪽 학사 정보 가져오기!!
	function getCalendarInfoList(pDate){
		
		var timeTitle = $('#timeTitle');
		
		let selectDate = pDate.split("-");
		
		let keyword = $('#calClsf option:selected').text();
		setTimeout(() => timeTitle.text(`\${selectDate[0]}년도 \${selectDate[1]}월 \${keyword} 일정`), 370);
		
		let sendDate = {
			calBgngDt : pDate.substr(0,7),
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
				// console.log("월별로 데이터 가져오기 ", res);
				// 여기다 추가해야함 
				var timeline = $('#timeline');
				
				var timeLineStr = "";
				// 오른쪽 일정 뿌려주기
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
				setTimeout(() => timeline.html(timeLineStr), 370);
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
	
	// 모달창 닫힐떄 일어나는 매서드
	calModal.on('hidden.bs.modal', function() {
		$('#calFrm')[0].reset();
		$('input[type="radio"]').each(function() {
	    	$(this).prop('checked', false);
	  	});
		addBtn.text("등록");
	});

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
			calClsfCd : calClsf.val()
		};

		// 체크 하기
		if(valCheck(sendData)){
			return false;
		}
		if($(this).text() == "등록"){
			$.ajax({
				type : 'post',
				url : '/hku/admin/calendar',
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(sendData),
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
						const endDate = moment(res.calEndDt);
						const nextDay = endDate.add(1, 'days').format('YYYY-MM-DD');
						calendar.addEvent({
							id: res.calNo,
							title: res.calTtl,
							start: res.calBgngDt,
							description : res.calCn,
							end: nextDay,
							textColor: 'black',
							backgroundColor: res.calColor
						});
						calModal.modal('hide');
						getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
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
				url : '/hku/admin/calendar',
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(sendData),
				dataType : 'text',
				success: function(res){
					if(res == "1"){
						swal({
							title: "일정이 변경되었습니다.", 
							icon: "success"
						});
// 						calendar.refetchEvents();
						let changedEvent = calendar.getEventById(sendData.calNo);
						setChangeEvent(changedEvent, sendData);
						calModal.modal('hide');
						getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
					}
				}
			});
		}
	});
	
	// 변경 했을때 다시 저장
	function setChangeEvent(e,data){
		const endDate = moment(data.calEndDt);
		const nextDay = endDate.add(1, 'days').format('YYYY-MM-DD');
		console.log("왜 안됨?", data);
		e.setProp('title', data.calTtl);
		e.setExtendedProp('description', data.calCn);
		e.setStart(data.calBgngDt);
		e.setEnd(nextDay);
		e.setProp('backgroundColor', data.calColor);
	}
	
	function changeEvent(e){
		// 이벤트 움직엿을떄 발생할떄 변경 해주기
		let realDate = moment(e.end).format("YYYY-MM-DD");
		const endDate = moment(realDate);
		const nextDay = endDate.subtract(1, 'days').format('YYYY-MM-DD');
		
		let changeData = {
			calNo: e.id,
			calTtl: e.title,
			calCn: e.extendedProps.description,
			calBgngDt: moment(e.start).format("YYYY-MM-DD"),
			calEndDt: nextDay,
			calColor: e.backgroundColor,
			calClsfCd: 'uni'
		};
		console.log("changeData", changeData);
		
		$.ajax({
			type : 'put',
			url : '/hku/admin/calendar',
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(changeData),
			dataType : 'text',
			success: function(res){
				console.log(res);
				getCalendarInfoList(moment(calendar.getDate()).format("YYYY-MM-DD"));
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
		$('#automaticCompletionBtn').css('display', 'none');
		calModal.modal('show');
	}

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

	// function setCurDate() {
	// 	var currentDate = new Date(); // 현재 날짜와 시간을 가져옵니다.
	// 	var year = currentDate.getFullYear(); // 현재 년도를 가져옵니다.
	// 	var month = currentDate.getMonth() + 1; // 현재 월을 가져오고 1을 더합니다.

	// 	var timeTitle = document.querySelector('#timeTitle'); // id가 "timeTitle"인 HTML 요소를 가져옵니다.
	// 	let keyword = $('#calClsf option:selected').text();
	// 	console.log("setCurDate 매서드 실행", keyword);
	// 	timeTitle.innerText = year + '년도 ' + month + '월 '+keyword+' 일정';
	// }
	
	$('#automaticCompletionBtn').on('click', function(){
		$('#calTtl').val('한국대학교 수강신청 기간');
		$('#calCn').val('한국대학교 2학기 \n수강 신청 기간입니다. \n신청기간에 준수하여 신청하기 바랍니다.');
		$('#calEndDt').val("2023-08-12")
		$('#color2').attr("checked", true);
	});
});
</script>
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
				<button type="button" class="btn btn-info" id="automaticCompletionBtn">자동완성</button>
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addBtn">등록</button>
			</div>
		</div>
	</div>
</div>