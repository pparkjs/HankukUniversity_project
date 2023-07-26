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
			<div class="col-lg-8">
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
															<input type="checkbox" class="form-check-input" id="checkAll">
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
															<input type="checkbox" class="form-check-input" id="checkAll">
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
															<input type="checkbox" class="form-check-input" id="checkAll">
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
															<input type="checkbox" class="form-check-input" id="checkAll">
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
			<div class="col-lg-4" style="height: 672px; margin-top: 40px">
				<div class="row">
					<div class="col-lg-12 mb-2">
						<div class="card" id="card-title-1">
							<div class="card-header border-0 pb-0 ">
								<h5 class="card-title">메세지 보내기</h5>
								<select class="selectCustom" id="whatMsg" style="width: 35%;">
									<option value="">==선택==</option>
									<option value="">==선택==</option>
									<option value="">==선택==</option>
									<option value="">==선택==</option>
								</select>
							</div>
							<div class="card-body" style="height: 519px; overflow: visible">
								<div class="row" style="height: 512px;">
									<div class="col-lg-12 mb-3">
										<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">수신자</label>
										<textarea rows="3" cols="30" class="form-control" id="receiver" name="receiver" readonly></textarea>
									</div>
									<div class="col-lg-12 mb-2">
										<label class="text-label form-label" style="font-size: 1.5em; font-weight: bold;">내용</label>
										<textarea rows="5" cols="30" class="form-control" id="msg" name="msg"></textarea>
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
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:10px;">No</th>
										<th style="width:100px;">수신자</th>
										<th style="width:100px;">문자발송일</th>
									</tr>
								</thead>
								<tbody id="msgTbody">
									<c:forEach items="${msgMap }" var="msg">
										<tr>
											<td>${msg.SMS_NO }</td>
											<td>${msg.SMS_RECEIVER }</td>
											<td>${msg.SMS_SEND_DT }</td>
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
	});

	$('#allBtn').on('click', function(){
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "all";
		getAllUsers();
	});
	
	$('#stdBtn').on('click', function(){
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "std";
		getAllUsers();
	});
	
	$('#proBtn').on('click', function(){
		$(whatDept).find("option").eq(0).prop("selected", true);
		sendData.who = "pro";
		getAllUsers();
	});
	
	$('#empBtn').on('click', function(){
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
});
</script>