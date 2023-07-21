<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="/css/table.css">
	<link rel="stylesheet" href="/css/admin/facilityManage.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">시설관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 fleft">
				<div class="container-fluid">
					<div class="row g-2 custom-form">
						<div class="col-md-2">
							<select class="default-select form-control form-control-sm" id="fcltSearchType">
								<option value="flctNo">시설번호</option>
								<option value="flctNm">시설명</option>
								<option value="comCdNm">시설분류</option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control form-control-sm" id="fcltSearchWord" placeholder="검색어를 입력해주세요">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="fcltList()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" id="insertFlctGoGo" data-bs-toggle="modal" data-bs-target="#flctModal">시설등록</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="deleteFlct()">삭제</button>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card" id="card-title-1">
						<div class="card-header border-0 pb-0 ">
							<h5 class="card-title">시설 정보</h5>
						</div>
						<hr/>
						<div class="card-body" id="fcltDiv">
							안녕
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 fright">
				<div class="container-fluid">
					<div class="row g-2 custom-form">
						<div class="col-auto">
							<select class="default-select form-control form-control-sm" id="fcltsSearchType">
								<option value="flctsNo">시설물번호</option>
								<option value="flctNo">시설번호</option>
								<option value="flctsNm">시설물명</option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control form-control-sm" id="fcltsSearchWord" placeholder="검색어를 입력해주세요">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="fcltsList()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" id="insertFlctsGoGo" data-bs-toggle="modal" data-bs-target="#flctsModal">시설물등록</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="deleteFlcts()">삭제</button>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card" id="card-title-1">
						<div class="card-header border-0 pb-0 ">
							<h5 class="card-title">시설물 정보</h5>
						</div>
						<hr/>
						<div class="card-body" id="fcltsDiv">
							<p class="card-text">
								바보
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="container-fluid">
					<div class="row g-2 custom-form">
						<div class="col-md-2">
							<select class="default-select form-control form-control-sm" id="fcltsRsvtSearchType">
								<option value="flctsRsvtNo">시설예약번호</option>
								<option value="flctsNm">시설물명</option>
								<option value="rsvtDate">예약날짜</option>
							</select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control input-default form-control-sm" id="fcltsRsvtSearchWord" placeholder="검색어를 입력해주세요">
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="fcltsRsvtList()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-sm btn-primary fcltBtn" onclick="deleteFlctsRsvt()">취소</button>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="card" id="card-title-1">
						<div class="card-header border-0 pb-0 ">
							<h5 class="card-title">시설 사용 정보</h5>
						</div>
						<hr/>
						<div class="card-body" id="fcltsRsvtDiv">
							깔깔
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 시설 개설 modal -->
<div class="modal fade" id="flctModal" tabindex="-1" aria-labelledby="flctLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title card-title" id="flctLabel">시설 등록</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="flctModalBody">
				<div class="row">
					<div class="col-xl-12">
						<label class="form-label mt-3">시설 분류<span class="text-danger">*</span></label>
						<div class="input-group">
							<select class="form-control form-select" id="flctClsfCd">
								<option value="">Please Select</option>
								<c:forEach items="${commonList}" var="common">
									<c:if test="${common.comCdGrp eq 'FLCT_CLSF'}">
										<option value="${common.comCd }">${common.comCdNm }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-xl-12" id="flctFloorDiv" style="display: none;">
						<label class="form-label mt-3">최대 층수<span class="text-danger">*</span></label>
						<div class="input-group">
							<select class="form-control form-select" id="maxFlctFloor">
								<option value=''>Please Select</option>
								<option value=1>1층</option>
								<option value=2>2층</option>
								<option value=3>3층</option>
								<option value=4>4층</option>
							</select>
						</div>
					</div>
					<div class="col-xl-12">
						<label class="form-label mt-3">시설 번호(자동생성)<span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" id="nextFlctNo" readonly>
						</div>
					</div>
					<div class="col-xl-12 mb-3">
						<label class="form-label mt-3">시설명<span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="시설명 입력" id="flctNm">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-danger light fcltBtn" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctInsertBtn" onclick="flctInsert()">등록</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctModifyBtn" onclick="flctModify()" style="display: none;">수정</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->

<!-- 시설물 개설 modal -->
<div class="modal fade" id="flctsModal" tabindex="-1" aria-labelledby="flctsLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title card-title" id="flctsLabel">시설물 등록</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" id="flctModalBody">
				<div class="row">
					<div class="col-xl-12">
						<label class="form-label mt-3">시설명<span class="text-danger">*</span></label>
						<div class="input-group" id="flctsModalSelect">
							
						</div>
					</div>
					<div class="col-xl-12">
						<label class="form-label mt-3">시설물 번호(자동생성)<span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" id="flctsNo" readonly>
						</div>
					</div>
					<div class="col-xl-12 mb-3">
						<label class="form-label mt-3">시설물명<span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="시설명 입력" id="flctsNm">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-danger light fcltBtn" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctsInsertBtn" onclick="flctsInsert()">등록</button>
				<button type="button" class="btn btn-sm btn-primary fcltBtn" id="flctsModifyBtn" onclick="flctsModify()" style="display: none;">수정</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->
<script>
$(function(){
	fcltList();
	fcltsList();
	fcltsRsvtList();
	flctsModalSelectBoxSet();

	$("#flctClsfCd").on("change", function(){
		// console.log($("#flctClsfCd").val() + "으로 셀렉트 바뀜");
		let flctClsfCd = $("#flctClsfCd").val();
		if(flctClsfCd == 'clsf01'){
			$("#flctFloorDiv").css("display","block");
		} else {
			$("#flctFloorDiv").css("display","none");
			$("#maxFlctFloor").val('');
		}
	});

	$("#insertFlctGoGo").on("click", function(){
		$("#flctLabel").text("시설 등록");
		$("#flctInsertBtn").css("display","inline");
		$("#flctModifyBtn").css("display","none");

		$("#flctFloorDiv").css("display","none");

		$("#flctClsfCd").val('');
		$("#maxFlctFloor").val('');
		$("#nextFlctNo").val('');
		$("#flctNm").val('');

		flctNoSet();
	});

	$("#insertFlctsGoGo").on("click", function(){
		// flctsModalSelectBoxSet();
		console.log("시설물모달");
		$("#flctsLabel").text("시설물 등록");
		$("#flctNo").val('');
		$("#flctsNo").val('');
		$("#flctsNm").val('');

		flctsNoSet();
	});
});
function flctNoSet(){
	console.log("시설번호 자동생성 체킁");

	let xhr = new XMLHttpRequest();
	xhr.open("GET","/hku/admin/flctNoSet",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var nextNo = xhr.responseText;
			console.log(nextNo);

			$("#nextFlctNo").val(nextNo);
		}
	}
	xhr.send();
}
function flctsNoSet(){
	console.log("시설물다음번호");
	$.ajax({
		type: "GET",
		url: "/hku/admin/flctsNoSet",
		dataType: "text",
		success: function(res){
			console.log("시설물 다음 번호",res);
			$("#flctsNo").val(res);
		},
		error: function(){
			alert("시설물번호 출력 실패");
		}
	});
}
function flctInsert(){
	var flctClsfCd = $("#flctClsfCd").val();
	var maxFlctFloor= $("#maxFlctFloor").val();
	var nextFlctNo = $("#nextFlctNo").val();
	var flctNm = $("#flctNm").val();

	let flctInsertData = {
		"flctClsfCd": flctClsfCd,
		"floor": maxFlctFloor,
		"flctNo": nextFlctNo,
		"flctNm": flctNm
	};
	console.log("flctInsertData",flctInsertData);

	if(flctClsfCd == '') {
		swal({
			title: "시설 분류를 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctClsfCd == 'clsf01' && maxFlctFloor == '') {
		swal({
			title: "시설의 층 수를 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctNm == '') {
		swal({
			title: "시설명을 작성해주세요!",
			icon: "error"
		});
		return false;
	}

	$.ajax({
		type: "POST",
		url: "/hku/admin/flctInsert",
		data: JSON.stringify(flctInsertData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		success: function(res){
			if(res === "SUCCESS"){
				swal({
					title: "시설등록이 완료되었습니다!",
					icon: "success"
				});
				$("#flctClsfCd").val('');
				$("#maxFlctFloor").val('');
				$("#nextFlctNo").val('');
				$("#flctNm").val('');

				$("#flctFloorDiv").css("display","none");

				$("#flctModal").modal('hide');

				flctsModalSelectBoxSet();
				fcltList();
				$('#facility').scrollTop($('#facility')[0].scrollHeight);
			}
		},
		error: function(){
			alert("시설등록 실패");
		}
	});
}
function flctsInsert(){
	var flctNo = $("#flctNo").val();
	var flctsNo= $("#flctsNo").val();
	var flctsNm = $("#flctsNm").val();

	let flctsInsertData = {
		"flctNo": flctNo,
		"flctsNo": flctsNo,
		"flctsNm": flctsNm
	};
	// console.log("flctsInsertData",flctsInsertData);

	if(flctNo == '') {
		swal({
			title: "시설을 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctsNm == '') {
		swal({
			title: "시설물명을 작성해주세요!",
			icon: "error"
		});
		return false;
	}

	$.ajax({
		type: "POST",
		url: "/hku/admin/flctsInsert",
		data: JSON.stringify(flctsInsertData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		success: function(res){
			if(res === "SUCCESS"){
				swal({
					title: "시설물등록이 완료되었습니다!",
					icon: "success"
				});
				$("#flctNo").val('');
				$("#flctsNo").val('');
				$("#flctsNm").val('');

				// $("#flctFloorDiv").css("display","none");

				$("#flctsModal").modal('hide');

				// flctsModalSelectBoxSet();
				fcltsList();
				$('#facilities').scrollTop($('#facilities')[0].scrollHeight);
			} else {
				swal({
					title: "시설물등록에 실패하였습니다!",
					icon: "error"
				});
			}
		},
		error: function(){
			alert("시설등록 실패");
		}
	});
}

function selectFlctAll(target){
	const checkboxes = document.querySelectorAll(".flctCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function selectFlctsAll(target){
	const checkboxes = document.querySelectorAll(".flctsCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function selectFlctsRsvtAll(target){
	const checkboxes = document.querySelectorAll(".flctsRsvtCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}

function onlyCheck(){
	event.stopPropagation();
	console.log("오직 체크만");
}

function fcltList(){
	console.log("시설검색 체킁");
	var searchType = $("#fcltSearchType").val();
	var searchWord = $("#fcltSearchWord").val().trim().toUpperCase();

	let searchData = {
		"searchType": searchType,
		"searchWord": searchWord
	};
	console.log(searchData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/fcltList",
		data: JSON.stringify(searchData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		async: false,
		success: function(res){
			// alert("시설리스트 체킁");
			var tblStr = "";
			tblStr += `<div class='table-wrap' id='facility'>
				<table class='table mb-0'>
					<thead class='thead-dark'>
						<tr>
							<th>
								<div class='form-check custom-checkbox checkbox-danger'>
									<input type='checkbox' class='form-check-input' onclick='selectFlctAll(this)'>
								</div>
							</th>
							<th>시설번호</th>
							<th>시설명</th>
							<th>시설분류</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr onclick='flctDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input flctCheck' value='\${res[i].flctNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].flctNo }</td>
									<td>\${res[i].flctNm }</td>
									<td>\${res[i].flctClsfNm }</td>
									<input type='hidden' value='\${res[i].flctClsfCd}'/>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=4>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody></table></div>`;
			$("#fcltDiv").html(tblStr);

		},
		error: function(){

		}
	});
}
function fcltsList(){
	console.log("체킁~");
	var searchType = $("#fcltsSearchType").val();
	var searchWord = $("#fcltsSearchWord").val().trim().toUpperCase();

	let searchData = {
		"searchType": searchType,
		"searchWord": searchWord
	};
	console.log(searchData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/fcltsList",
		data: JSON.stringify(searchData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		async: false,
		success: function(res){
			// alert("시설리스트 체킁");
			var tblStr = "";
			tblStr += `<div class='table-wrap' id='facilities'>
				<table class='table mb-0'>
					<thead class='thead-dark'>
						<tr>
							<th>
								<div class='form-check custom-checkbox checkbox-danger'>
									<input type='checkbox' class='form-check-input' onclick='selectFlctsAll(this)'>
								</div>
							</th>
							<th>시설물번호</th>
							<th>시설번호</th>
							<th>시설물명</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr onclick='flctsDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input flctsCheck' value='\${res[i].flctsNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].flctsNo }</td>
									<td>\${res[i].flctNo }</td>
									<td>\${res[i].flctsNm }</td>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=4>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody></table></div>`;
			$("#fcltsDiv").html(tblStr);

		},
		error: function(){

		}
	});
}
function fcltsRsvtList(){
	console.log("시설예약 체킁");
	var searchType = $("#fcltsRsvtSearchType").val();
	var searchWord = $("#fcltsRsvtSearchWord").val().trim().toUpperCase();

	let searchData = {
		"searchType": searchType,
		"searchWord": searchWord
	};
	console.log(searchData);

	$.ajax({
		type: "POST",
		url: "/hku/admin/fcltRsvList",
		data: JSON.stringify(searchData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		success: function(res){
			// alert("시설리스트 체킁");
			var tblStr = "";
			tblStr += `<div class='table-wrap'>
				<table class='table mb-0'>
					<thead class='thead-dark'>
						<tr>
							<th>
								<div class='form-check custom-checkbox checkbox-danger'>
									<input type='checkbox' class='form-check-input' onclick='selectFlctsRsvtAll(this)'>
								</div>
							</th>
							<th>시설예약번호</th>
							<th>시설물명</th>
							<th>신청자</th>
							<th>예약날짜</th>
							<th>시작시간</th>
							<th>종료시간</th>
							<th>사용인원</th>
							<th>사용목적</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr onclick='userDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input flctsRsvtCheck' value='\${res[i].flctsRsvtNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].flctsRsvtNo }</td>
									<td>\${res[i].flctsNm }</td>
									<td>\${res[i].stdNm }</td>
									<td>\${res[i].rsvtDate }</td>
									<td>\${res[i].startHours }</td>
									<td>\${res[i].endHours }</td>
									<td>\${res[i].useUsers }</td>
									<td>\${res[i].usePrps }</td>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=9>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody></table></div>`;
			$("#fcltsRsvtDiv").html(tblStr);

		},
		error: function(){

		}
	});
}

function flctDetail(target){
	console.log("시설 상세 체킁");
	var flctModal = $("#flctModal");
	var flctNo = $(target).children().eq(1).text();
	console.log("flctNo",flctNo);

	$.ajax({
		type: "GET",
		url: "/hku/admin/selectFlct?flctNo=" + flctNo,
		// data: flctNo,
		dataType: "JSON",
		success: function(res){
			console.log(res);
			console.log(res.flctClsfCd);
			console.log(res.floor);
			$("#flctLabel").text("시설 상세");
			$("#flctClsfCd").val(res.flctClsfCd);
			$("#nextFlctNo").val(res.flctNo);
			$("#flctNm").val(res.flctNm);

			if(res.flctClsfCd == "clsf01"){
				$("#maxFlctFloor").val(res.floor);
				$("#flctFloorDiv").css('display', 'block');
			} else {
				$("#maxFlctFloor").val('');
				$("#flctFloorDiv").css('display', 'none');
			}

			$("#flctInsertBtn").css('display', 'none');
			$("#flctModifyBtn").css('display', 'inline');
			flctModal.modal('show');
		},
		error: function(){
			alert("시설상세 못가져옴");
		}
	});
}
function flctsDetail(target){
	console.log("시설물 상세 체킁");
	var flctsModal = $("#flctsModal");
	var flctsNo = $(target).children().eq(1).text();
	console.log("flctsNo",flctsNo);

	$.ajax({
		type: "GET",
		url: "/hku/admin/selectFlcts?flctsNo=" + flctsNo,
		// data: flctNo,
		dataType: "JSON",
		success: function(res){
			console.log(res);
			$("#flctsLabel").text("시설물 상세");
			$("#flctNo").val(res.flctNo);
			$("#flctsNo").val(res.flctsNo);
			$("#flctsNm").val(res.flctsNm);

			$("#flctsInsertBtn").css('display', 'none');
			$("#flctsModifyBtn").css('display', 'inline');
			flctsModal.modal('show');
		},
		error: function(){
			alert("시설물상세 못가져옴");
		}
	});
}
function flctModify(){
	console.log("시설수정 체킁");
	var flctClsfCd = $("#flctClsfCd").val();
	var maxFlctFloor= $("#maxFlctFloor").val();
	var flctNo = $("#nextFlctNo").val();
	var flctNm = $("#flctNm").val();

	let flctModifyData = {
		"flctClsfCd": flctClsfCd,
		"floor": maxFlctFloor,
		"flctNo": flctNo,
		"flctNm": flctNm
	};
	console.log("flctModifyData",flctModifyData);

	if(flctClsfCd == '') {
		swal({
			title: "시설 분류를 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctClsfCd == 'clsf01' && maxFlctFloor == '') {
		swal({
			title: "시설의 층 수를 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctNm == '') {
		swal({
			title: "시설명을 작성해주세요!",
			icon: "error"
		});
		return false;
	}

	$.ajax({
		type: "PUT",
		url: "/hku/admin/flctModify",
		data: JSON.stringify(flctModifyData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		success: function(res){
			if(res === "SUCCESS"){
				swal({
					title: "시설수정이 완료되었습니다!",
					icon: "success"
				});
				$("#flctClsfCd").val('');
				$("#maxFlctFloor").val('');
				$("#nextFlctNo").val('');
				$("#flctNm").val('');

				$("#flctFloorDiv").css("display","none");
				$("#flctModal").modal('hide');

				flctsModalSelectBoxSet();
				fcltList();
				// $('#facility').scrollTop($('#facility')[0].scrollHeight);
			} else {
				swal({
					title: "시설수정에 실패하였습니다!",
					icon: "error"
				});
			}
		},
		error: function(){
			alert("시설수정 실패");
		}
	});
}
function flctsModify(){
	var flctNo = $("#flctNo").val();
	var flctsNo= $("#flctsNo").val();
	var flctsNm = $("#flctsNm").val();
	
	let flctsModifyData = {
		"flctNo": flctNo,
		"flctsNo": flctsNo,
		"flctsNm": flctsNm
	};
	console.log("flctsModifyData",flctsModifyData);

	if(flctNo == '') {
		swal({
			title: "시설을 선택해주세요!",
			icon: "error"
		});
		return false;
	}
	if(flctsNm == '') {
		swal({
			title: "시설물명을 작성해주세요!",
			icon: "error"
		});
		return false;
	}

	$.ajax({
		type: "PUT",
		url: "/hku/admin/flctsModify",
		data: JSON.stringify(flctsModifyData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		success: function(res){
			if(res === "SUCCESS"){
				swal({
					title: "시설물수정이 완료되었습니다!",
					icon: "success"
				});
				$("#flctNo").val('');
				$("#flctsNo").val('');
				$("#flctsNm").val('');

				// $("#flctFloorDiv").css("display","none");
				$("#flctsModal").modal('hide');

				// flctsModalSelectBoxSet();
				fcltsList();
				// $('#facility').scrollTop($('#facility')[0].scrollHeight);
			} else {
				swal({
					title: "시설물수정에 실패하였습니다!",
					icon: "error"
				});
			}
		},
		error: function(){
			alert("시설물수정 실패");
		}
	});
}

function deleteFlct(){
	var delFlctArr = new Array();
	// let users = document.querySelectorAll(".userCheck");
	let flctArr = $(".flctCheck");
	for(let i=0; i<flctArr.length; i++){
		if(flctArr[i].checked == true){
			let flctType = $(flctArr[i]).parents("tr").children().eq(4).val();
			console.log(flctType);

			let delFlct = {
				"flctClsfCd": flctType,
				"flctNo": flctArr[i].value
			};

			delFlctArr.push(delFlct);
		}
	}
	console.log("delFlctArr",delFlctArr);
	if(delFlctArr.length == 0){
		swal({
			title: "항목을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	swal({
		title: "삭제를 진행하시겠습니까?",
		text: "삭제 후 되돌릴 수 없습니다!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			console.log(delFlctArr);
			console.log(JSON.stringify(delFlctArr));
			$.ajax({
				type: 'DELETE',
				url: '/hku/admin/deleteFlct',
				data: JSON.stringify(delFlctArr),
				dataType: "text",
				// processData: false,
				contentType: 'application/json;charset=UTF-8',
				success: function (res) {
					fcltList();
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
function deleteFlcts(){
	console.log("delFlcts");
	var delFlctsArr = new Array();
	
	// let data = {};
	
	let facilities = document.querySelectorAll(".flctsCheck");
	// console.log(delDepts);
	for(let i=0; i<facilities.length; i++){
		if(facilities[i].checked == true){
			delFlctsArr.push(facilities[i].value);
		}
	}
	if(delFlctsArr.length == 0){
		swal({
			title: "항목을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	console.log(delFlctsArr);
	console.log(JSON.stringify(delFlctsArr));

	swal({
		title: "삭제를 진행하시겠습니까?",
		text: "삭제 후 되돌릴 수 없습니다!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			console.log(delFlctsArr);
			console.log(JSON.stringify(delFlctsArr));
			$.ajax({
				type: 'DELETE',
				url: '/hku/admin/deleteFlcts',
				data: JSON.stringify(delFlctsArr),
				dataType: "text",
				// processData: false,
				contentType: 'application/json;charset=UTF-8',
				success: function (res) {
					fcltsList();
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
function deleteFlctsRsvt(){
	var delFlctsRsvtArr = new Array();
	
	let flctRsvts = document.querySelectorAll(".flctsRsvtCheck");
	for(let i=0; i<flctRsvts.length; i++){
		if(flctRsvts[i].checked == true){
			delFlctsRsvtArr.push(flctRsvts[i].value);
		}
	}
	if(delFlctsRsvtArr.length == 0){
		swal({
			title: "항목을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	console.log(delFlctsRsvtArr);

	swal({
		title: "삭제를 진행하시겠습니까?",
		text: "삭제 후 되돌릴 수 없습니다!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			console.log(delFlctsRsvtArr);
			console.log(JSON.stringify(delFlctsRsvtArr));
			$.ajax({
				type: 'DELETE',
				url: '/hku/admin/deleteFlctsRsvt',
				data: JSON.stringify(delFlctsRsvtArr),
				dataType: "text",
				// processData: false,
				contentType: 'application/json;charset=UTF-8',
				success: function (res) {
					fcltsRsvtList();
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

function flctsModalSelectBoxSet(){
	console.log("시설물모달 셀렉트박스 세팅 체킁");
	
	$.ajax({
		type: "GET",
		url: "/hku/admin/flctsModalSelectBoxSet",
		dataType: "json",
		success: function (res){
			console.log("res", res);

			let selStr = "";
			selStr += `
			<select class="form-control form-select" id="flctNo">
				<option value="">Please Select</option>`;
				for(let i=0; i<res.length; i++) {
					selStr += `<option value="\${res[i].flctNo}">\${res[i].flctNm}</option>`
				}
			selStr += `</select>`;
			$("#flctsModalSelect").html(selStr);
		},
		error: function (){

		}
	});

}
</script>