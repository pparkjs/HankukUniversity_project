<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/kyw.css">
<link rel="stylesheet" href="/css/table.css">

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사 관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학과 관리</a></li>
		</ol>
    </div>
    
	<div class="container-fluid">
		<div class="basic-form">
			<form class="row g-3 custom-form" action="" name="searchForm">
				<div class="col-md-2">
					<select class="default-select form-control" name="searchType">
						<option value="colCd">대학코드</option>
						<option value="deptCd">학과코드</option>
						<option value="deptNm">학과명</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control input-default" name="searchWord" value="${searchWord }" placeholder="검색어를 입력해주세요">
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="deptList()">검색</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deptModal" onclick="deptCdSet()">학과개설</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="delDept()">삭제</button>
				</div>
			</form>
		</div>
	</div>
	
	<div class="container-fluid deptDiv">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">학과 정보</h5>
			</div>
			<hr/>
			<div class="card-body dept-body" id="dept-body">
				
			</div>
		</div>
	</div>
</div>

<!-- 학과 개설 modal -->
<div class="modal fade" id="deptModal" tabindex="-1" aria-labelledby="deptLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="deptLabel">학과 개설</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xl-12">
						<form name="deptModalForm">
							<div class="row">
								<div class="col-xl-6">
									<label class="form-label mt-3">대학 코드<span class="text-danger">*</span></label>
									<div class="input-group">
										<!-- <input type="text" class="form-control" name="colCd"> -->
										<select class="default-select form-control" name="colCd">
											<option value="">대학코드 선택</option>
											<c:forEach items="${colList}" var="col">
												<option value="${col.colCd}">${col.colNm}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-6">
									<label class="form-label mt-3">학과 코드(자동생성)<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" name="deptCd" readonly>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과명<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="학과명 입력" name="deptNm">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과 연락처<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="학과 연락처 입력" name="deptTelno">
									</div>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">시설 번호<span class="text-danger">*</span></label>
									<!-- <input type ="text" class="form-control" name="flctNo"> -->
									<select class="default-select form-control" name="flctNo">
										<option value="">시설번호 선택</option>
										<c:forEach items="${flctList}" var="flct">
											<option value="${flct.flctNo}">${flct.flctNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">학과 개요<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="deptOtl"></textarea>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">학과 목표<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="deptGoal"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="deptInsert()">개설</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->

<!-- 학과 상세, 수정 modal -->
<div class="modal fade" id="deptModifyModal" tabindex="-1" aria-labelledby="deptModifyLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="deptModifyLabel">학과 상세</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xl-12">
						<form name="deptModifyModalForm">
							<div class="row">
								<div class="col-xl-6">
									<label class="form-label mt-3">대학 코드<span class="text-danger">*</span></label>
									<div class="input-group">
										<!-- <input type="text" class="form-control" placeholder="Name" name="mColCd"> -->
										<select class="form-select form-control" name="mColCd">
											<!-- <option value="">대학코드 선택</option> -->
											<!-- <option value="">1111</option>
											<option value="" selected="selected">2222</option> -->
											<c:forEach items="${colList}" var="col">
												<option value="${col.colCd}">${col.colNm}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-6">
									<label class="form-label mt-3">학과 코드<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Surname" name="mDeptCd" readonly>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과명<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Name" name="mDeptNm">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과 연락처<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Surname" name="mDeptTelno">
									</div>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">시설 번호<span class="text-danger">*</span></label>
									<!-- <input type ="email" class="form-control" name="mFlctNo"> -->
									<select class="form-select form-control" name="mFlctNo">
										<!-- <option value="">시설번호 선택</option> -->
										<!-- <option value="">1111</option>
										<option value="" selected="selected">2222</option> -->
										<c:forEach items="${flctList}" var="flct">
											<option value="${flct.flctNo}">${flct.flctNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">학과 개요<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="mDeptOtl"></textarea>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">학과 목표<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="mDeptGoal"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="deptModify()">수정</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->
<script>
function beforesend(xhr){
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
}

var deptBody = document.querySelector("#dept-body");

function deptList(){
	var searchForm = document.forms.searchForm;
	var searchType = searchForm.elements.searchType.value;
	var searchWord = searchForm.elements.searchWord.value.trim().toUpperCase();
	// console.log("searchType=" + searchType);
	// console.log("searchWord=" + searchWord);

	let searchData = {
		"searchType": searchType,
		"searchWord": searchWord
	};
	// console.log("searchData=" + JSON.stringify(searchData));
	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/dept-list",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let tbWrap = "<div class='table-wrap'>";
			tbWrap += "<table class='table' style='margin-top:-22px;'>";

			tbWrap += "<thead class='thead-dark'>";
			tbWrap += "<tr>";
			tbWrap += "<th>";
			tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
			tbWrap += "<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>";
			tbWrap += "</div>";
			tbWrap += "</th>";
			tbWrap += "<th>대학 코드</th>";
			tbWrap += "<th>학과 코드</th>";
			tbWrap += "<th>시설 번호</th>";
			tbWrap += "<th>학과 이름</th>";
			tbWrap += "<th>학과 연락처</th>";
			tbWrap += "</tr>";
			tbWrap += "</thead>";

			tbWrap += "<tbody>";

			// console.log("deptList",xhr.responseText);
			if(xhr.responseText != null && xhr.responseText.length > 0) {
				// console.log("값이 있음");
				let deptList = JSON.parse(xhr.responseText);
				// console.log("parsedeptList",deptList);
	
				for(let i = 0; i <deptList.length; i++) {
					tbWrap += "<tr onclick='deptDetail(this)'>";
					tbWrap += "<td>";
					tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
					tbWrap += `<input type='checkbox' class='form-check-input deptCheck' value='\${deptList[i].deptCd }' onclick="onlyCheck()">`;
					tbWrap += "</div>";
					tbWrap += "</td>";
					
					tbWrap += `<td>\${deptList[i].colCd }</td>`;
					tbWrap += `<td>\${deptList[i].deptCd }</td>`;
					tbWrap += `<td>\${deptList[i].flctNo }</td>`;
					tbWrap += `<td>\${deptList[i].deptNm }</td>`;
					tbWrap += `<td>\${deptList[i].deptTelno }</td>`;
					tbWrap += "</tr>";
				}
			} else {
				// console.log("값 없음")
				tbWrap += "<tr><td colspan=6>데이터가 존재하지 않습니다.</td></tr>";
			}

			tbWrap += "</tbody>";
			tbWrap += "</table>";
			tbWrap += "</div>"
			
			deptBody.innerHTML = tbWrap;
		}
	}
	xhr.send(JSON.stringify(searchData));
}

function selectAll(target){
	const checkboxes = document.querySelectorAll(".deptCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function onlyCheck(){
	event.stopPropagation();
}


function delDept(){
// 	console.log("delDept");
	var delDeptArr = new Array();
	
	// let data = {};
	
	let Depts = document.querySelectorAll(".deptCheck");
	// console.log(delDepts);
	for(let i=0; i<Depts.length; i++){
		if(Depts[i].checked == true){
			delDeptArr.push(Depts[i].value);
		}
	}
	if(delDeptArr.length == 0){
		failedAlert();
		return false;
	}
	console.log(delDeptArr);
	console.log(JSON.stringify(delDeptArr));


	swal({
		title: "삭제를 진행하시겠습니까?",
		text: "삭제 후 복구가 불가능합니다",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			let xhr = new XMLHttpRequest();
			xhr.open("DELETE","/hku/admin/dept-administration",true);
			beforesend(xhr);
			xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					if(xhr.responseText === 'SUCCESS'){
						deptList();
						successAlert("삭제가 완료되었습니다!");
					} else if(xhr.responseText === 'FAILED'){
						console.log("삭제 실패!");
					}
				}
			}
			xhr.send(JSON.stringify(delDeptArr));

		} else {
			return false;
		}
	});
}

function deptCdSet(){
	var deptModal = $("#deptModal");
	var deptModalForm = document.forms.deptModalForm;
	var deptCd = deptModalForm.deptCd;

	let xhr = new XMLHttpRequest();
	xhr.open("GET","/hku/admin/deptCdSet",true);
	beforesend(xhr);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var nextCode = xhr.responseText;
			console.log(nextCode);
			deptCd.value = nextCode;
		}
	}
	xhr.send();
}

function deptInsert(){
	var deptModal = $("#deptModal");
	var deptModalForm = document.forms.deptModalForm;
	// console.log(deptModalForm);
	var colCd = deptModalForm.colCd.value;
	var deptCd = deptModalForm.deptCd.value;
	var deptNm = deptModalForm.deptNm.value;
	var deptTelno = deptModalForm.deptTelno.value;
	var flctNo = deptModalForm.flctNo.value;
	var deptOtl = deptModalForm.deptOtl.value;
	var deptGoal = deptModalForm.deptGoal.value;

	if(colCd == ""){
		swal({
			title: "대학코드를 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(deptNm == ""){
		swal({
			title: "학과이름을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(deptTelno == ""){
		swal({
			title: "학과연락처를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(flctNo == ""){
		swal({
			title: "시설번호를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(deptOtl == ""){
		swal({
			title: "학과개요를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(deptGoal == ""){
		swal({
			title: "학과목표를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	
	let deptInsertData = {
		"colCd": colCd,
		"deptCd": deptCd,
		"deptNm": deptNm,
		"deptTelno": deptTelno,
		"flctNo": flctNo,
		"deptOtl": deptOtl,
		"deptGoal": deptGoal
	}
	// console.log(deptInsertData);

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/dept-administration",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				console.log("잘 갔다왔어용");
				// deptInsertModal.style.display = "none";
				deptModal.modal('hide');
				successAlert("등록이 완료되었습니다!");
			} else if(xhr.responseText === "FAILED"){
				console.log("등록 실패");
			}
			deptList();
		}
	}
	xhr.send(JSON.stringify(deptInsertData));
}

function deptDetail(target){
	var deptModifyModal = $("#deptModifyModal");
	var deptModifyModalForm = document.forms.deptModifyModalForm;
	// console.log(deptModalForm);
	var colCd = deptModifyModalForm.mColCd;
	var deptCd = deptModifyModalForm.mDeptCd;
	var deptNm = deptModifyModalForm.mDeptNm;
	var deptTelno = deptModifyModalForm.mDeptTelno;
	var flctNo = deptModifyModalForm.mFlctNo;
	var deptOtl = deptModifyModalForm.mDeptOtl;
	var deptGoal = deptModifyModalForm.mDeptGoal;

	// console.log("selectColCd",colCd);
	// console.log("optionsColCd",colCd.options);
	var colOptions = colCd.options;
	var flctOptions = flctNo.options;

	let deptDetail = {};

	// console.log(target);
	var selectDeptCd = target.children[2].innerText;
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/hku/admin/dept-select?deptCd="+selectDeptCd,true);
	beforesend(xhr);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			deptDetail = JSON.parse(xhr.responseText);

			colCd.value = deptDetail.colCd;
			deptCd.value = deptDetail.deptCd;
			deptNm.value = deptDetail.deptNm;
			deptTelno.value = deptDetail.deptTelno;
			flctNo.value = deptDetail.flctNo;
			deptOtl.value = deptDetail.deptOtl;
			deptGoal.value = deptDetail.deptGoal;

			deptModifyModal.modal('show');
			
		}
	}
	xhr.send();
}

function deptModify(){
	var deptModifyModal = $("#deptModifyModal");
	var deptModifyModalForm = document.forms.deptModifyModalForm;

	var mColCd = deptModifyModalForm.mColCd.value;
	var mDeptCd = deptModifyModalForm.mDeptCd.value;
	var mDeptNm = deptModifyModalForm.mDeptNm.value;
	var mDeptTelno = deptModifyModalForm.mDeptTelno.value;
	var mFlctNo = deptModifyModalForm.mFlctNo.value;
	var mDeptOtl = deptModifyModalForm.mDeptOtl.value;
	var mDeptGoal = deptModifyModalForm.mDeptGoal.value;

	let deptModifyData = {
		"colCd": mColCd,
		"deptCd": mDeptCd,
		"deptNm": mDeptNm,
		"deptTelno": mDeptTelno,
		"flctNo": mFlctNo,
		"deptOtl": mDeptOtl,
		"deptGoal": mDeptGoal
	}
	// console.log(deptModifyData);
	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/dept-update",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			// console.log("학과 수정 성공!");
			// console.log("xhr.responseText",xhr.responseText);
			if(xhr.responseText === "SUCCESS") {
				deptModifyModal.modal('hide');
				deptList();
				swal({
					title: "수정이 완료되었습니다!", 
					icon: "success"
				});
			}
			if(xhr.responseText === "FAILED") {
				deptModifyModal.modal('hide');
				deptList();
				swal({
					title: "수정에 실패하였습니다!", 
					icon: "error"
				});
			}

		}
	}
	xhr.send(JSON.stringify(deptModifyData));
}

function successAlert(text){
    swal({
		title: text, 
		icon: "success"
	});
}
function failedAlert(){
    swal({
		title: "항목을 선택해주세요!",
		icon: "error"
	});
}

window.addEventListener("DOMContentLoaded", function(){  // 태그 해석만 끝나면 발생
    deptList();
});
</script>