<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.row{
	--bs-gutter-x: 10px;
}
.table-wrap {
	overflow: scroll;
	height: 440px;
	margin-top: 13px;
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
.form-label{
	color: #800000;
}
.table tbody th, .table tbody td {
    border: none;
    padding: 1px;
    font-size: 18px;
    color: black;
}
.table thead tr th {
    padding: 1px;
}
.card-body{
 margin-top: -18px;
}
.selectCustom{
	width: 20%;
}
.table tbody tr td:nth-child(5) {
    text-align: left;
}
.custom-tab-1 .nav-link {
    font-weight: 800;
    color: #444444;
    font-size: 17px;
}
</style>

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">사용자관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">문자 발송</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-8" style="margin-top: -15px;">
				<div class="row">
					<div class="col-lg-12">
						<div class="custom-tab-1" style="display: flex; align-items: center;">
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link active" data-bs-toggle="tab" href="#profile1" id="allBtn">전체</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#contact1" id="stdBtn">학생</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#message1" id="proBtn">교수</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#message2" id="empBtn">직원</a>
								</li>
							</ul>
						</div>
						<div class="card" id="card-title-1">
							<div class="card-header border-0 pb-0 ">
								<h5 class="card-title">사용자 목록</h5>
								<select class="selectCustom" id="whatDept">
									<option value="">==선택==</option>
									<c:forEach items="${depList }" var="dept">
										<option value="${dept.DEPT_CD }">${dept.DEPT_NM }</option>
									</c:forEach>
									<c:forEach items="${empDeptList }" var="empDept">
										<option value="${empDept.COM_CD }">${empDept.COM_CD_NM }</option>
									</c:forEach>
								</select>
							</div>
							<div class="card-body" style="height: 480px; overflow: visible">
								<div class="tab-content">
									<div class="tab-pane fade show active" id="profile1">
										<!-- 전체 사용자 -->
										<div class="table-wrap">
											<table class="table" style="margin-top: -22px;">
												<thead class="thead-dark">
													<tr>
														<th style="width:10px;">
															<input type="checkbox" class="form-check-input" id="userCheckAll">
														</th>
														<th style="width:100px;">이름</th>
														<th style="width:100px;">직책</th>
														<th style="width:100px;">연락처</th>
														<th style="width:100px;">소속</th>
													</tr>
												</thead>
												<tbody id="userTbody">
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="contact1">
										<!-- 학생 -->
										<div class="table-wrap">
											<table class="table" style="margin-top: -22px;">
												<thead class="thead-dark">
													<tr>
														<th style="width:10px;">
															<input type="checkbox" class="form-check-input" id="stdCheckAll">
														</th>
														<th style="width:100px;">이름</th>
														<th style="width:100px;">직책</th>
														<th style="width:100px;">연락처</th>
														<th style="width:100px;">소속</th>
													</tr>
												</thead>
												<tbody id="userTbody">
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="message1">
										<!-- 교수 -->
										<div class="table-wrap">
											<table class="table" style="margin-top: -22px;">
												<thead class="thead-dark">
													<tr>
														<th style="width:10px;">
															<input type="checkbox" class="form-check-input" id="proCheckAll">
														</th>
														<th style="width:100px;">이름</th>
														<th style="width:100px;">직책</th>
														<th style="width:100px;">연락처</th>
														<th style="width:100px;">소속</th>
													</tr>
												</thead>
												<tbody id="userTbody">
												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="message2">
										<!-- 직원 -->
										<div class="table-wrap">
											<table class="table" style="margin-top: -22px;">
												<thead class="thead-dark">
													<tr>
														<th style="width:10px;">
															<input type="checkbox" class="form-check-input" id="empCheckAll">
														</th>
														<th style="width:100px;">이름</th>
														<th style="width:100px;">직책</th>
														<th style="width:100px;">연락처</th>
														<th style="width:100px;">소속</th>
													</tr>
												</thead>
												<tbody id="userTbody">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4" style="height: 672px; margin-top: 29px">
				<div class="row">
					<div class="col-lg-12 mb-2">
						<div class="card" id="card-title-1">
							<div class="card-header border-0 pb-0 ">
								<h5 class="card-title">메세지 보내기</h5>
								<select class="selectCustom" id="whatMsg" style="width: 35%;">
									<option value="">==선택==</option>
									<c:forEach items="${smsTemplateList }" var="smsTemplate">
										<option value="${smsTemplate.smsTempNo }">${smsTemplate.smsTempType }</option>
									</c:forEach>
								</select>
							</div>
							<div class="card-body" style="height: 525px; overflow: visible">
								<div class="row" style="height: 512px;">
									<div class="col-lg-12">
										<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">수신자</label>
										<textarea rows="3" cols="30" class="form-control" id="receiver" name="receiver" readonly></textarea>
									</div>
									<div class="col-lg-12" style="margin-top: -45px">
										<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">내용</label>
										<textarea rows="10" cols="30" class="form-control" id="msg" name="msg"></textarea>
									</div>
									<div class="col-lg-12" style="text-align: right;">
										<button type="button" class="btn btn-danger light" id="cancelBtn">취소</button>
										<button type="button" class="btn btn-primary" id="msgSendBtn">전송</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card" id="card-title-1" style=" margin-top: -146px">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">발송내역</h5>
						<input type="hidden" id="hsubclNo">
					</div>
					<div class="card-body" style="height: 439px; overflow: visible">
						<div class="table-wrap" style="height: 223px;">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:10px;">No</th>
										<th style="width:100px;">수신자</th>
										<th style="width:100px;">문자발송일</th>
									</tr>
								</thead>
								<tbody id="msgTbody">
									<c:forEach items="${smsDetailList }" var="msg">
										<tr>
											<td>${msg.smsNo }</td>
											<td>${msg.smsReceiver }</td>
											<td>${msg.smsSendDt }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var whatDept = $('#whatDept');
	var profile1 = $('#profile1'); // 전체
	var contact1 = $('#contact1'); // 학생
	var message1 = $('#message1'); // 교수
	var message2 = $('#message2'); // 직원
	var whatMsg = $('#whatMsg');
	var cancelBtn = $('#cancelBtn');
	
	var msgSendBtn = $('#msgSendBtn');
	
	var stdCheckAll = $('#stdCheckAll');
	var proCheckAll = $('#proCheckAll');
	var empCheckAll = $('#empCheckAll');
	var stdCheckAll = $('#stdCheckAll');
	var userCheckAll = $('#userCheckAll');
	
	var receiver = $('#receiver');
	
	let sendData = {};
	sendData.who = "all";
	getAllUsers();

	function getAllUsers(){
		sendData.whatDept = whatDept.val();
		console.log("무슨 소속 선택?? > ", sendData);

		$.ajax({
			type : 'get',
			url : '/hku/admin/getAllUsers-list',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			data : sendData,
			success : function(res){
				console.log(res);
				let stdList = res.stdList;
				let proList = res.proList;
				let empList = res.empList;

				let listStr = "";
				if(stdList != null && stdList.length > 0){
					for(let i=0; i<stdList.length; i++){
						listStr += `<tr>
										<td>
											<input type="checkbox" class="form-check-input stdCk" id="uckBox" value="\${stdList[i].STD_NO}">
										</td>
										<td>\${stdList[i].STD_NM}</td>
										<td>학생</td>
										<td>\${stdList[i].STD_TELNO}</td>
										<td>
											\${stdList[i].DEPT_NM}
											<input type="hidden" value="\${stdList[i].DEPT_CD}">
										</td>
									</tr>`;
					}
				}
				if(proList != null && proList.length > 0){
					for(let i=0; i<proList.length; i++){
						listStr += `<tr>
										<td>
											<input type="checkbox" class="form-check-input stdCk" id="uckBox" value="\${proList[i].PRO_NO}">
										</td>
										<td>\${proList[i].PRO_NM}</td>
										<td>교수</td>
										<td>\${proList[i].PRO_TELNO}</td>
										<td>
											\${proList[i].DEPT_NM}
											<input type="hidden" value="\${proList[i].DEPT_CD}">
										</td>
									</tr>`;
					}
				}
				if(empList != null && empList.length > 0){
					for(let i=0; i<empList.length; i++){
						listStr += `<tr>
										<td>
											<input type="checkbox" class="form-check-input stdCk" id="uckBox" value="\${empList[i].EMP_NO}">
										</td>
										<td>\${empList[i].EMP_NAME}</td>
										<td>직원</td>
										<td>\${empList[i].EMP_TELNO}</td>
										<td>
											\${empList[i].COM_CD_NM}
											<input type="hidden" value="\${empList[i].EMP_DEPT_CD}">
										</td>
									</tr>`;
					}
				}
				var obj = whoSelect(sendData.who);
				obj.find("#userTbody").html(listStr);
			}
		});
	}

	whatDept.on('change', function(){
		getAllUsers();
		uncheckAll();
	});

	$('#allBtn').on('click', function(){
		uncheckAll();
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "all";
		getAllUsers();
	});
	
	$('#stdBtn').on('click', function(){
		uncheckAll();
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "std";
		getAllUsers();
	});
	
	$('#proBtn').on('click', function(){
		uncheckAll();
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "pro";
		getAllUsers();
	});
	
	$('#empBtn').on('click', function(){
		uncheckAll();
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "emp";
		getAllUsers();
	});

	function whoSelect(pWho){
		var returnObject;
		switch(pWho){
			case "all": returnObject = profile1; break;
			case "std": returnObject = contact1; break;
			case "pro": returnObject = message1; break;
			case "emp": returnObject = message2; break;
		}
		return returnObject;
	}

	whatMsg.on('change', function(){
		let selectedMsg = $(this).val();

		if(selectedMsg ==""){
			$('#msg').val("");
			return;
		}
		$.ajax({
			type: 'get',
			url: '/hku/admin/setting-msg',
			contentType: 'application/json;charset=utf-8',
			dataType: 'json',
			data: {smsTempNo:selectedMsg},
			success: function(res){
				$('#msg').val(res.smsTempCn);
			}
		});
	});
	// 하나하나 선택 했을떄!!================================================================
	$(profile1).find('#userTbody').on('click', 'input[type="checkbox"]', function(){
		if ($(userCheckAll).prop("checked")) {
			$(userCheckAll).prop("checked",false);
		}
		let nameStr = "";
		$(profile1).find('#userTbody').find('input[type="checkbox"]').each(function(i,v){
			if($(this).prop("checked")){
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			}
		});
		receiver.val(nameStr);
	});
	
	$(contact1).find('#userTbody').on('click', 'input[type="checkbox"]', function(){
		if ($(stdCheckAll).prop("checked")) {
			$(stdCheckAll).prop("checked",false);
		}
		let nameStr = "";
		$(contact1).find('#userTbody').find('input[type="checkbox"]').each(function(i,v){
			if($(this).prop("checked")){
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			}
		});
		receiver.val(nameStr);
	});
	
	$(message1).find('#userTbody').on('click', 'input[type="checkbox"]', function(){
		if ($(proCheckAll).prop("checked")) {
			$(proCheckAll).prop("checked",false);
		}
		let nameStr = "";
		$(message1).find('#userTbody').find('input[type="checkbox"]').each(function(i,v){
			if($(this).prop("checked")){
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			}
		});
		receiver.val(nameStr);
	});
	
	$(message2).find('#userTbody').on('click', 'input[type="checkbox"]', function(){
		if ($(empCheckAll).prop("checked")) {
			$(empCheckAll).prop("checked",false);
		}
		let nameStr = "";
		$(message2).find('#userTbody').find('input[type="checkbox"]').each(function(i,v){
			if($(this).prop("checked")){
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			}
		});
		receiver.val(nameStr);
	});
	// 하나하나 선택 했을떄!!================================================================  끝!
	
	
	/*
		전체			학생			교수			직원
		profile1	contact1	message1	message2   <= tab div 아이디 사실 이름 귀찮아서 안바꿧음..
	*/

	
	// 전체 체크 버튼 눌럿을떄 ===============================================================================
	$(stdCheckAll).on('click',function(){
		let stdUserCheck = $(contact1).find('#userTbody').find('input[type="checkbox"]');
		if ($(this).prop("checked")) { // 트루이면 전체 체크 된거
			stdUserCheck.prop("checked",true);
			let nameStr = "";
			$(stdUserCheck).each(function(i, e) {
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			});
			receiver.val(nameStr);
		}else{
			stdUserCheck.prop("checked",false);
			receiver.val("");
		}
	});

	$(proCheckAll).on('click',function(){
		let proUserCheck = $(message1).find('#userTbody').find('input[type="checkbox"]');
		if ($(this).prop("checked")) { // 트루이면 전체 체크 된거
			proUserCheck.prop("checked",true);
			let nameStr = "";
			$(proUserCheck).each(function(i, e) {
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			});
			receiver.val(nameStr);
		}else{
			proUserCheck.prop("checked",false);
			receiver.val("");
		}
	});
	
	$(empCheckAll).on('click',function(){
		let empUserCheck = $(message2).find('#userTbody').find('input[type="checkbox"]');
		if ($(this).prop("checked")) { // 트루이면 전체 체크 된거
			empUserCheck.prop("checked",true);
			let nameStr = "";
			$(empUserCheck).each(function(i, e) {
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			});
			receiver.val(nameStr);
		}else{
			empUserCheck.prop("checked",false);
			receiver.val("");
		}
	});

	$(userCheckAll).on('click',function(){
		let allUserCheck = $(profile1).find('#userTbody').find('input[type="checkbox"]');
		if ($(this).prop("checked")) { // 트루이면 전체 체크 된거
			allUserCheck.prop("checked",true);
			
			let nameStr = "";
			$(allUserCheck).each(function(i, e) {
				let name = $(this).parents('tr').find('td').eq(1).text().trim();
				nameStr += name + " ";
			});
			receiver.val(nameStr);
		}else{
			allUserCheck.prop("checked",false);
			receiver.val("");
		}
	});
	// 전체 체크 버튼 눌럿을떄 =============================================================================== 끝!
	
	function uncheckAll(){
		receiver.val("");
		$(stdCheckAll).prop("checked",false);
		$(proCheckAll).prop("checked",false);
		$(empCheckAll).prop("checked",false);
		$(userCheckAll).prop("checked",false);
	}
	
	
	msgSendBtn.on('click',function(){
		if (receiver.val() == "") {
			swal({
				title: "수신자를 선택해주세요!", 
				icon: "error"
			});
			return;
		}
		if ($('#msg').val().trim() == "") {
			swal({
				title: "전송할 내용을 입력해주세요.", 
				icon: "error"
			});
			return;
		}
		
		var whoToReceive = {};
		let userList = [];
		let selectObj = whoSelect(sendData.who);
		$(selectObj).find('#userTbody').find('input[type="checkbox"]').each(function(){
			if ($(this).prop("checked")) {
				let userInfo = {};
				userInfo.userNo = $(this).val();
				userInfo.userTelno = $(this).parents('tr').find('td').eq(3).text().trim();
				userList.push(userInfo);
			}			
		});
		whoToReceive.userList = userList;
		whoToReceive.msg = $('#msg').val();
		console.log("누구 한테 보낼꺼야?", whoToReceive);
		
		/*
			여기서 아작스 처리 타입은 post
			url은 성희누나가 하고싶은데로 
			contentType : 'application/json;charset=utf-8'
			dataType : 'text'
			res 1 이면 전송 완료
			전송 완료ㅕ 되면
			swal success 띄어 주고 
			셋 타임 아웃 1초 정도 걸어서 로케이션 리로드 치면 끝
			전송 데이터 JSON.stringify(whoToReceive)
		*/
		
		$.ajax({
			url : "/hku/admin/send-text-msg",
			type : "post",
			data : JSON.stringify(whoToReceive),
			dataType : "text",
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(res){
				console.log(res)
				if (res == "1") {
					swal({
						title: "정상적으로 문자가 전송 되었습니다.", 
						icon: "success"
					});
					setTimeout(() => {
						location.reload();
					}, 1000);
				}
			}
			
		})
		
	});
	
	cancelBtn.on('click',function(){
		receiver.val("");
		$('#msg').val("");
	});
});
</script>