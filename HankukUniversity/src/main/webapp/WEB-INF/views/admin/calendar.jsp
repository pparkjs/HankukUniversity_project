<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학사 일정 관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
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
						<h4 class="card-intro-title">2023년도 7월 학사일정</h4>
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

	// 일정 등록 버튼

	var calendar = new FullCalendar.Calendar(calendarEl, {
		timeZone: 'UTC',
		selectable: true,
		locale: "ko",
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay'
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
			calModal.modal('show');
			console.log('selected ' + info.startStr + ' to ' + info.endStr);
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
			console.log("이벤트 변경 하는 아이디", info.event.id);
		},
		rerenderDelay: 300,
		editable: true,
		dayMaxEvents: true, // when too many events in a day, show the popover
		// events: '/api/demo-feeds/events.json?overload-day'
	});

	calendar.render();

	getCalendarList();
	// 이벤트 동적 생성
	function getCalendarList(){
		$.ajax({
			type : 'get',
			url : '/hku/admin/calendar-list',
			dataType : 'json',
			success: function(res){
				console.log(res);
				for(let i=0; i<res.length; i++){
					let calData = res[i];
					calendar.addEvent({
						id: calData.calNo,
						title: calData.calTtl,
						start: calData.calBgngDt,
						description : calData.calCn,
						end: calData.calEndDt,
						textColor: '#000000',
						backgroundColor: calData.calColor
					});
					calendar.render();
				}
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
			calClsfCd : 'uni'
		};

		// 체크 하기
		if(valCheck(sendData)){
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '/hku/admin/calendar',
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
					calendar.addEvent({
						id: res.calNo,
						title: res.calTtl,
						start: res.calBgngDt,
						description : res.calCn,
						end: res.calEndDt,
						textColor: '#000000',
						backgroundColor: res.calColor
					});
					calModal.modal('hide');
					// 캘린더 다시 랜더링
					calendar.render();
// 					calendar.renderEvents();
				}else{
					swal({
						title: "서버에러 다시 시도해주세요.", 
						icon: "error"
					});
				}
			}
		});
	});
	
	// 일정 상세 보기
	function detailCalendar(e){
		// console.log("이벤트 아이디" , e.id);
		// console.log("이벤트 제목" , e.title);
		// console.log("이벤트 내용" , e.extendedProps.description);
		// console.log("이벤트 시작날짜" , e.start);
		// console.log("이벤트 종료날짜" , e.end);
		// console.log("이벤트 배경색" , e.backgroundColor);

		$('#calNo').val(e.id);
		$('#calTtl').val(e.title);
		$('#calCn').val(e.extendedProps.description);
		$('#calBgngDt').val(moment(e.start).format("YYYY-MM-DD"))
		$('#calEndDt').val(moment(e.end).format("YYYY-MM-DD"));
		$('input[name="color"][value="' + e.backgroundColor + '"]').prop('checked', true);

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
});
</script>
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="calModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">학사 일정 추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="calNo">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="noticeFrm" name="noticeFrm" enctype="multipart/form-data" method="post">
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
							<!-- 파일 이미지  -->
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