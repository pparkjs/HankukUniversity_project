<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/admin/lockerManage.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">사물함관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="container-fluid">
					<div class="row g-2 custom-form">
						<div class="col-lg-2">
							<select class="default-select form-control form-control-sm" id="lockerflctNo">
								<option value="">시설 선택</option>
								<c:forEach items="${flctList}" var="flct">
									<option value="${flct.flctNo}">${flct.flctNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-lg-2">
							<select class="form-select form-control form-control-sm" id="lockerFloor">
								<option value="">층 선택</option>
							</select>
						</div>
						<div class="col-lg-2">
							<select class="default-select form-control form-control-sm" id="lockerAvlCd">
								<option value="">불출 여부 선택</option>
								<option value="Y">불출</option>
								<option value="N">미불출</option>
							</select>
						</div>
						<!-- <div class="col-lg-2">
							<input type="text" class="form-control input-default form-control-sm" id="lockerSearchWord" placeholder="검색어를 입력해주세요">
						</div> -->
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="lockerList()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" id="insertLockerGoGo" data-bs-toggle="modal" data-bs-target="#lockerModal">등록</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="ilgualBtnSwitch()">상태변경</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="deleteLocker()">삭제</button>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card" id="card-title-1">
						<div class="card-header border-0 pb-0 ">
							<h5 class="card-title">사물함 관리</h5>
						</div>
						<hr/>
						<div class="card-body" id="lockerDiv">
							깔깔
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="container-fluid">
					<div class="row g-2 custom-form">
						<div class="col-md-1">
							<select class="default-select form-control form-control-sm" id="lockerRsvtflctNo">
								<option value="">시설 선택</option>
								<c:forEach items="${flctList}" var="flct">
									<option value="${flct.flctNo}">${flct.flctNm}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-1">
							<select class="form-select form-control form-control-sm" id="lockerRsvtFloor">
								<option value="">층 선택</option>
							</select>
						</div>
						<div class="col-md-1">
							<select class="default-select form-control form-control-sm" id="lockerRsvtYear">
								<option value="">년도 선택</option>
								<option value="2021">2021학년도</option>
								<option value="2022">2022학년도</option>
								<option value="2023">2023학년도</option>
							</select>
						</div>
						<div class="col-md-1">
							<select class="default-select form-control form-control-sm" id="lockerRsvtSem">
								<option value="">학기 선택</option>
								<option value=1>1학기</option>
								<option value=2>2학기</option>
							</select>
						</div>
						<div class="col-md-1">
							<select class="default-select form-control form-control-sm" id="lockerRsvtAvlCd">
								<option value="">불출 여부</option>
								<option value="Y">불출</option>
								<option value="N">미출불</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="text" class="form-control input-default form-control-sm" id="lockerStdNo" placeholder="검색 할 학번을 입력해주세요">
						</div>
						<!-- <div class="col-md-3">
							<input type="text" class="form-control input-default form-control-sm" id="fcltsRsvtSearchWord" placeholder="검색어를 입력해주세요">
						</div> -->
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="lockerRsvtList()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="ilgualRsvtBtnSwitch(this)">상태변경</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="deleteFlctsRsvt()">취소</button>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card" id="card-title-1">
						<div class="card-header border-0 pb-0 ">
							<h5 class="card-title">사물함 신청 내역</h5>
						</div>
						<hr/>
						<div class="card-body" id="lockerRsvtDiv">
							깔깔
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 사물함 개설 modal -->
<div class="modal fade" id="lockerModal" tabindex="-1" aria-labelledby="lockerLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title card-title" id="lockerLabel">사물함 등록</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="flctModalBody">
				<div class="row">
					<div class="col-xl-12">
						<label class="form-label mt-3">시설명<span class="text-danger">*</span></label>
						<div class="input-group">
							<select class="form-control form-select" id="modalLockerFlctNo">
								<option value="">시설 선택</option>
								<c:forEach items="${flctList}" var="flct">
									<option value="${flct.flctNo}">${flct.flctNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-xl-12" id="flctFloorDiv">
						<label class="form-label mt-3">층<span class="text-danger">*</span></label>
						<div class="input-group">
							<select class="form-control form-select" id="modalLockerFloor">
								<option value=''>Please Select</option>
								<option value=1>1층</option>
								<option value=2>2층</option>
								<option value=3>3층</option>
								<option value=4>4층</option>
							</select>
						</div>
					</div>
					<div class="col-xl-12 mb-3">
						<label class="form-label mt-3">추가 개수<span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="number" class="form-control" placeholder="시설명 입력" id="lockerInsertCount">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-danger light fcltBtn" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctInsertBtn" onclick="lockerInsert()">등록</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctModifyBtn" onclick="flctModify()" style="display: none;">수정</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->
<script>
$(function(){
	lockerList();
	lockerRsvtList();

	$("#lockerflctNo").on("change", function(){
		floorSet();
	});
	$("#lockerRsvtflctNo").on("change", function(){
		RsvtfloorSet();
	});
	$("#modalLockerFlctNo").on("change", function(){
		modalFloorSet();
	});
});

function selectLockerAll(target){
	const checkboxes = document.querySelectorAll(".lockerCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function selectLockerRsvtAll(target){
	const checkboxes = document.querySelectorAll(".lockerRsvtCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function onlyCheck(){
	event.stopPropagation();
// 	console.log("오직 체크만");
}
function btnSwitch(target){
// 	console.log("switch!!");
// 	console.log("this", target);
// 	console.log("1",$(target).parents('tr').children().eq(1).val());
// 	console.log("2",$(target).parents('tr').children().eq(2).text());

	let flctNo = $(target).parents('tr').children().eq(1).val();
	let lockerNo = $(target).parents('tr').children().eq(2).text();
	let floor = $(target).parents('tr').children().eq(4).text();

	let std = $(target).attr('std');
// 	console.log('std',std);

	let kywData = {
		"flctNo" : flctNo,
		"lockerNo": lockerNo,
		"floor": floor,
		"avlCd": ""
	};
	if(std == 0){
		kywData.avlCd = "Y";
	}
	if(std == 1){
		kywData.avlCd = "N";
	}

// 	console.log("kywData",kywData);
	
	$.ajax({
		type: "POST",
		url: "/hku/admin/btnSwitch",
		data: JSON.stringify(kywData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(){
			// alert("성공");
			if(std == 0){
				$(target).attr('std', '1');
				$(target).css({'background':'#ff4343', 'border-color':'#ff4343'});
				$(target).text("대여불가");
			}
			if(std == 1){
				$(target).attr('std', '0');
				$(target).css({'background':'#0070c0', 'border-color':'#0070c0'});
				$(target).text("대여가능");
			}
		},
		error: function(){
			alert("실패");
		}
	});
}
function ilgualBtnSwitch(){
	swal({
		title: "상태변경을 진행하시겠습니까?",
		// text: "재확인 요망",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			// console.log("일괄상태변경 체킁");
			// console.log($(".lockerCheck:checked"));
			let checkedBox = $(".lockerCheck:checked");
			for(let i=0; i<checkedBox.length; i++){
				let checkBox = checkedBox[i];
				// console.log(checkBox);
				let target = $(checkBox).parents('tr').children().eq(5).children().first()[0];
				// console.log("target",target);
				btnSwitch(target);
		
				let resetTarget =  $(".lockerCheck");
				for(let i=0; i<resetTarget.length; i++){
					resetTarget[i].checked = false;
				}
				$("#lockerAllCheck").prop("checked", false);
			}
			swal({
				title: "상태변경이 완료되었습니다!",
				icon: "success"
			});
		} else {
			return false;
		}
	});
}

function ilgualRsvtBtnSwitch(){
	// console.log("일괄불출!");
	swal({
		title: "상태변경을 진행하시겠습니까?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			let checkedBox = $(".lockerRsvtCheck:checked");
			for(let i=0; i<checkedBox.length; i++){
				let checkBox = checkedBox[i];
				// console.log(checkBox);
				let target = $(checkBox).parents('tr').children().eq(10).children().first()[0];
				// console.log("target",target);
				rsvtBtnSwitch(target);
		
				let resetTarget =  $(".lockerRsvtCheck");
				for(let i=0; i<resetTarget.length; i++){
					resetTarget[i].checked = false;
				}
				$("#lockerRsvtAllCheck").prop("checked", false);
			}
			swal({
				title: "상태변경이 완료되었습니다!",
				icon: "success"
			});
		} else {
			return false;
		}
	});

}

function rsvtBtnSwitch(target){
// 	console.log("rsvtSwitch!!");
// 	console.log("this", target);
// 	console.log("시설예약번호",$(target).parents('tr').children().eq(1).text());
	// console.log("2",$(target).parents('tr').children().eq(2).text());

	let lockerRsvtNo = $(target).parents('tr').children().eq(1).text();
	// let lockerNo = $(target).parents('tr').children().eq(2).text();

	let std = $(target).attr('std');
// 	console.log('std',std);

	let kywkywData = {
		"lockerRsvtNo" : lockerRsvtNo,
		"avlCd": ""
	};
	if(std == 0){
		kywkywData.avlCd = "Y";
	}
	if(std == 1){
		kywkywData.avlCd = "N";
	}
// 	console.log("kywkywData",kywkywData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/rsvtBtnSwitch",
		data: JSON.stringify(kywkywData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(){
			// alert("성공");
			if(std == 0){
				$(target).attr('std', '1');
				$(target).css({'background':'#0070c0', 'border-color':'#0070c0'});
				$(target).text("불출");
			}
			if(std == 1){
				$(target).attr('std', '0');
				$(target).css({'background':'#ff4343', 'border-color':'#ff4343'});
				$(target).text("미불출");
			}
		},
		error: function(){
			alert("실패");
		}
	});
}

function lockerList(){
// 	console.log("사물함검색 체킁");
	var lockerflctNo = $("#lockerflctNo").val();
	var lockerFloor = $("#lockerFloor").val();
	var lockerAvlCd = $("#lockerAvlCd").val();

	let searchData = {
		"flctNo": lockerflctNo,
		"floor": lockerFloor,
		"avlCd": lockerAvlCd
	};

// 	console.log(searchData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/lockerList",
		data: JSON.stringify(searchData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		async: false,
		success: function(res){
			// alert("사물함리스트 체킁");
			var tblStr = "";
			tblStr += `<div class='table-wrap' id='facility'>
				<table class='table mb-0'>
					<thead class='thead-dark'>
						<tr>
							<th style='width:4%'>
								<div class='form-check custom-checkbox checkbox-danger'>
									<input type='checkbox' class='form-check-input' onclick='selectLockerAll(this)' id="lockerAllCheck">
								</div>
							</th>
							<th style='width:24%'>사물함번호</th>
							<th style='width:24%'>시설명</th>
							<th style='width:24%'>층수</th>
							<th style='width:24%'>대여여부</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input lockerCheck' value='\${res[i].lockerNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<input type='hidden' value='\${res[i].flctNo}'/>
									<td>\${res[i].lockerNo }</td>
									<td>\${res[i].flctNm }</td>
									<td>\${res[i].floor }</td>`;
									if(res[i].avlCd == 'N') {
										tblStr += `<td><button type="button" class="btn btn-sm btn-danger" style=" margin-bottom: 0px; 
													margin-left: 4px; padding: 3px 5px; background: #0070c0; border-color: #0070c0;" std='0' onclick="btnSwitch(this)">
													대여가능
													</button></td>`;
									} else if(res[i].avlCd == 'Y') {
										tblStr += `<td><button type="button"class="btn btn-sm btn-danger" style=" margin-bottom: 0px; 
													margin-left: 5px; padding: 3px 5px; background: #ff4343; border-color: #ff4343;" std='1' onclick="btnSwitch(this)">
													대여불가
													</a></td>`;
									}
								tblStr += `</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=5>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody></table></div>`;
			$("#lockerDiv").html(tblStr);

		},
		error: function(){

		}
	});
}
function lockerRsvtList(){
// 	console.log("사물함예약리스트 체킁");
	var lockerRsvtflctNo = $("#lockerRsvtflctNo").val();
	var lockerRsvtFloor = $("#lockerRsvtFloor").val();
	var lockerRsvtYear = $("#lockerRsvtYear").val();
	var lockerRsvtSem = $("#lockerRsvtSem").val();
	var lockerRsvtAvlCd = $("#lockerRsvtAvlCd").val();
	var lockerStdNo = $("#lockerStdNo").val();

	let searchData = {
		"flctNo": lockerRsvtflctNo,
		"floor": lockerRsvtFloor,
		"lockerYr": lockerRsvtYear,
		"rsvtSem": lockerRsvtSem,
		"avlCd": lockerRsvtAvlCd,
		"stdNo": lockerStdNo
	};

// 	console.log(searchData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/lockerRsvtList",
		data: JSON.stringify(searchData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		// async: false,
		success: function(res){
			// alert("사물함예약 리스트 체킁");
			var tblStr = "";
			tblStr += `<div class='table-wrap' id='facility'>
				<table class='table mb-0'>
					<thead class='thead-dark'>
						<tr>
							<th style='width:4%'>
								<div class='form-check custom-checkbox checkbox-danger'>
									<input type='checkbox' class='form-check-input' onclick='selectLockerRsvtAll(this)' id="lockerRsvtAllCheck">
								</div>
							</th>
							<th>예약 번호</th>
							<th>학번</th>
							<th>예약자</th>
							<th>시설번호</th>
							<th>시설명</th>
							<th>층</th>
							<th>사물함번호</th>
							<th>예약년도</th>
							<th>예약학기</th>
							<th>열쇠불출여부</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input lockerRsvtCheck' value='\${res[i].lockerRsvtNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].lockerRsvtNo }</td>
									<td>\${res[i].stdNo }</td>
									<td>\${res[i].stdNm }</td>
									<td>\${res[i].flctNo }</td>
									<td>\${res[i].flctNm }</td>
									<td>\${res[i].floor }</td>
									<td>\${res[i].lockerNo }</td>
									<td>\${res[i].lockerYr }</td>
									<td>\${res[i].rsvtSem }</td>`;
									if(res[i].avlCd == 'Y') {
										tblStr += `<td><button type="button" class="btn btn-sm btn-danger" id="regBtn" style="width:51px; margin-bottom: 0px; 
													margin-left: 4px; padding: 3px 5px; background: #0070c0; border-color: #0070c0;" std='1' onclick="rsvtBtnSwitch(this)">
													불출
													</button></td>`;
									} else if(res[i].avlCd == 'N') {
										tblStr += `<td><button type="button"class="btn btn-sm btn-danger" id="regBtn" style="width:51px; margin-bottom: 0px; 
													margin-left: 5px; padding: 3px 5px; background: #ff4343; border-color: #ff4343;" std='0' onclick="rsvtBtnSwitch(this)">
													미불출
													</a></td>`;
									}
								tblStr += `</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=11>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody></table></div>`;
			$("#lockerRsvtDiv").html(tblStr);

		},
		error: function(){

		}
	});
}
function floorSet(){
	// console.log("셀렉트 변경ㄷ횜~");
	var flctNo = $("#lockerflctNo").val();
	// console.log("flctNo",flctNo);
	$.ajax({
		type: "GET",
		url: "/hku/admin/floorSet?flctNo=" + flctNo,
		dataType: "json",
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
// 			console.log("가져온 층들",res);
			selectFloorStr = "";
			selectFloorStr += `<option value="">층 선택</option>`;
			for(let i=0; i<res.length; i++){
				selectFloorStr += `<option value="\${res[i]}">\${res[i]}층</option>`;
			}
			$("#lockerFloor").html(selectFloorStr);
		},
		error: function(){

		}
	});
}
function modalFloorSet(){
// 	console.log("모달셀렉트 변경ㄷ횜~");
	var flctNo = $("#modalLockerFlctNo").val();
	// console.log("flctNo",flctNo);
	$.ajax({
		type: "GET",
		url: "/hku/admin/floorSet?flctNo=" + flctNo,
		dataType: "json",
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
// 			console.log("가져온 층들",res);
			selectFloorStr = "";
			selectFloorStr += `<option value="">층 선택</option>`;
			for(let i=0; i<res.length; i++){
				selectFloorStr += `<option value="\${res[i]}">\${res[i]}층</option>`;
			}
			$("#modalLockerFloor").html(selectFloorStr);
		},
		error: function(){

		}
	});
}
function RsvtfloorSet(){
	// console.log("셀렉트 변경ㄷ횜~");
	var flctNo = $("#lockerRsvtflctNo").val();
	// console.log("flctNo",flctNo);
	$.ajax({
		type: "GET",
		url: "/hku/admin/floorSet?flctNo=" + flctNo,
		dataType: "json",
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
// 			console.log("가져온 층들",res);
			selectFloorStr = "";
			selectFloorStr += `<option value="">층 선택</option>`;
			for(let i=0; i<res.length; i++){
				selectFloorStr += `<option value="\${res[i]}">\${res[i]}층</option>`;
			}
			$("#lockerRsvtFloor").html(selectFloorStr);
		},
		error: function(){

		}
	});
}
function lockerInsert(){
// 	console.log("체킁");
	var modalLockerFlctNo = $("#modalLockerFlctNo").val();
	var modalLockerFloor = $("#modalLockerFloor").val();
	var lockerInsertCount = $("#lockerInsertCount").val();

	let insertLockerData = {
		"flctNo": modalLockerFlctNo,
		"floor": modalLockerFloor,
		"lockerInsertCount": lockerInsertCount
	};

// 	console.log(insertLockerData);

	if(modalLockerFlctNo == '') {
		swal({
			title: "시설명을 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(modalLockerFloor == '') {
		swal({
			title: "시설의 층 수를 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(lockerInsertCount == '') {
		swal({
			title: "등록 개수를 작성해주세요!",
			icon: "error"
		});
		return false;
	}

	$.ajax({
		type: "POST",
		url: "/hku/admin/lockerInsert",
		data: JSON.stringify(insertLockerData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			if(res === "SUCCESS"){
				swal({
					title: "사물함등록이 완료되었습니다!",
					icon: "success"
				});
				$("#modalLockerFlctNo").val('');
				$("#modalLockerFloor").val('');
				$("#lockerInsertCount").val('');

				// $("#flctFloorDiv").css("display","none");

				$("#lockerModal").modal('hide');

				// flctsModalSelectBoxSet();
				lockerList();
				// $('#facility').scrollTop($('#facility')[0].scrollHeight);
			}
		},
		error: function(){
			alert("사물함등록 실패");
		}
	});
}
function deleteLocker(){
// 	console.log("deleteLocker");
	var delLockerArr = new Array();
	
	let lockers = document.querySelectorAll(".lockerCheck");
	for(let i=0; i<lockers.length; i++){
		if(lockers[i].checked == true){
			// delLockerArr.push(lockers[i].value);

			// let flctType = $(flctArr[i]).parents("tr").children().eq(4).val(); 
			// 시설번호
			let flctNo = $(lockers[i]).parents("tr").children().eq(1).val();
			// 층수
			let floor = $(lockers[i]).parents("tr").children().eq(4).text();


			let delLocker = {
				"flctNo": flctNo,
				"floor": floor,
				"lockerNo": lockers[i].value
			};

			delLockerArr.push(delLocker);

		}
	}
	if(delLockerArr.length == 0){
		swal({
			title: "항목을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
// 	console.log(delLockerArr);
// 	console.log(JSON.stringify(delLockerArr));

	swal({
		title: "삭제를 진행하시겠습니까?",
		text: "삭제 후 되돌릴 수 없습니다!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			$.ajax({
				type: 'DELETE',
				url: '/hku/admin/deleteLocker',
				data: JSON.stringify(delLockerArr),
				dataType: "text",
				contentType: 'application/json;charset=UTF-8',
				beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
				success: function (res) {
					lockerList();
					lockerRsvtList();
					swal({
						title: "삭제가 완료되었습니다!",
						icon: "success"
					});
				},
				error: function (xhr, status, error) {
					alert("출력실패");
				}
			});
		} else {
			return false;
		}
	});
}
</script>