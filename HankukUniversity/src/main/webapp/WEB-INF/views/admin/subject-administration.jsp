<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/kyw.css">
<link rel="stylesheet" href="/css/table.css">

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사 관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">교과목 관리</a></li>
		</ol>
    </div>
    
	<div class="container-fluid searchCon">
		<div class="basic-form">
			<form class="row g-3 custom-form" action="" name="searchForm">
				<div class="col-md-2">
					<span>이수구분:</span>
					<select class="default-select form-control" name="courseClsf">
						<option value="">전체</option>
						<c:forEach items="${commonList}" var="common">
							<c:if test="${common.comCdGrp eq 'COURSE_CLSF' }">
								<option value="${common.comCdNm }">${common.comCdNm }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-2">
					<span>학과:</span>
					<select class="default-select form-control" name="subjectDept">
						<option value="">전체</option>
						<c:forEach items="${deptList}" var="dept">
							<option value="${dept.deptNm }">${dept.deptNm }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-2">
					<span>학년:</span>
					<select class="default-select form-control" name="subjectGrade">
						<option value="">전체</option>
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
					</select>
				</div>
				<div class="col-md-3">
					<span>교과목명:</span>
					<input type="text" class="form-control" name="subjectName" placeholder="교과목명을 입력하세요.">
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary lecSearchBtn" onclick="subjectList()">검색</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary lecSearchBtn" data-bs-toggle="modal" data-bs-target="#subjectModal" onclick="subNoSet()">교과목개설</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary lecSearchBtn" onclick="deleteSubject()">삭제</button>
				</div>
			</form>
		</div>
	</div>

	<div class="container-fluid subjectDiv">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">교과목</h5>
			</div>
			<hr/>
			<div class="card-body subject-body" id="subject-body">
				
			</div>
		</div>
	</div>
</div>

<!-- 교과목 개설 modal -->
<div class="modal fade" id="subjectModal" tabindex="-1" aria-labelledby="subjectLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="subjectLabel">교과목 개설</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xl-12">
						<form name="subjectModalForm">
							<div class="row">
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">과목번호(자동생성)<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" name="subNo" readonly>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과명<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="default-select form-control" name="deptNm">
											<option value="">학과명 선택</option>
											<c:forEach items="${deptList}" var="dept">
												<option value="${dept.deptCd}">${dept.deptNm}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label mt-3">교과목명<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="교과목명 입력" name="subNm">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">대상 학년<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="default-select form-control" name="subGrade">
											<option value="">전체</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
									</div>
								</div>
								<div class="col-xl-6 mb-3 mt-3">
									<label class="form-label">시수<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type ="text" class="form-control" name="subHour" placeholder="시수 입력">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">이수 구분<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="default-select form-control" name="crsClassfCd">
											<option value="">이수구분 선택</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'COURSE_CLSF' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학점<span class="text-danger">*</span></label>
									<input type ="text" class="form-control" name="subCrd" placeholder="학점 입력">
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">교과목 개요<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="subOtl"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="subjectInsert()">개설</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->

<!-- 교과목 상세,수정 modal -->
<div class="modal fade" id="subjectModifyModal" tabindex="-1" aria-labelledby="subjectModifyLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	    <div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="subjectModifyLabel">교과목 상세</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xl-12">
						<form name="subjectModifyModalForm">
							<div class="row">
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">과목번호(자동생성)<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" name="mSubNo" readonly>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과명<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="form-select form-control" name="mDeptNm">
											<option value="">학과명 선택</option>
											<c:forEach items="${deptList}" var="dept">
												<option value="${dept.deptCd}">${dept.deptNm}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label mt-3">교과목명<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" placeholder="교과목명 입력" name="mSubNm">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">대상 학년<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="form-select form-control" name="mSubGrade">
											<option value="">전체</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
									</div>
								</div>
								<div class="col-xl-6 mb-3 mt-3">
									<label class="form-label">시수<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type ="text" class="form-control" name="mSubHour" placeholder="시수 입력">
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">이수 구분<span class="text-danger">*</span></label>
									<div class="input-group">
										<select class="form-select form-control" name="mCrsClassfCd">
											<option value="">이수구분 선택</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'COURSE_CLSF' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학점<span class="text-danger">*</span></label>
									<input type ="text" class="form-control" name="mSubCrd" placeholder="학점 입력">
								</div>
								<div class="col-xl-12 mb-3">
									<label class="form-label">교과목 개요<span class="text-danger">*</span></label>
									<textarea rows="3" class="form-control" name="mSubOtl"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="subjectModify()">수정</button>
			</div>
	  	</div>
	</div>
</div> <!-- 모달 END -->
<script>
function beforesend(xhr){
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
}

var subjectBody = document.querySelector("#subject-body");

function subjectList(){
	var searchForm = document.forms.searchForm;

	var courseClsf = searchForm.courseClsf.value;
	var subjectDept = searchForm.subjectDept.value;
	var subjectGrade = searchForm.subjectGrade.value;
	var subjectName = searchForm.subjectName.value.trim().toUpperCase();

	let searchData = {
		"comCdNm": courseClsf,
		"deptNm": subjectDept,
		"subGrade": subjectGrade,
		"subNm": subjectName
	};
	console.log("searchData=" + JSON.stringify(searchData));
	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/subject-list",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let tbWrap = "<div class='table-wrap'>";
			tbWrap += "<table class='table'>";

			tbWrap += "<thead class='thead-dark'>";
			tbWrap += "<tr>";
			tbWrap += "<th>";
			tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
			tbWrap += "<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>";
			tbWrap += "</div>";
			tbWrap += "</th>";
			tbWrap += "<th>과목 번호</th>";
			tbWrap += "<th>학과명</th>";
			tbWrap += "<th>교과목명</th>";
			tbWrap += "<th>대상 학년</th>";
			tbWrap += "<th>시수</th>";
			tbWrap += "<th>이수 구분</th>";
			tbWrap += "<th>학점</th>";
			tbWrap += "</tr>";
			tbWrap += "</thead>";

			tbWrap += "<tbody>";

			// console.log("deptList",xhr.responseText);
			if(xhr.responseText != null && xhr.responseText.length > 0) {
				// console.log("값이 있음");
				let subjectList = JSON.parse(xhr.responseText);
				// console.log("parsedeptList",deptList);
	
				for(let i = 0; i <subjectList.length; i++) {
					tbWrap += "<tr onclick='subjectDetail(this)'>";
					tbWrap += "<td>";
					tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
					tbWrap += `<input type='checkbox' class='form-check-input subjectCheck' value='\${subjectList[i].subNo }' onclick="onlyCheck()">`;
					tbWrap += "</div>";
					tbWrap += "</td>";
					
					tbWrap += `<td>\${subjectList[i].subNo }</td>`;
					tbWrap += `<td>\${subjectList[i].deptNm }</td>`;
					tbWrap += `<td>\${subjectList[i].subNm }</td>`;
					tbWrap += `<td>\${subjectList[i].subGrade }</td>`;
					tbWrap += `<td>\${subjectList[i].subHour }</td>`;
					tbWrap += `<td>\${subjectList[i].comCdNm }</td>`;
					tbWrap += `<td>\${subjectList[i].subCrd }</td>`;
					tbWrap += "</tr>";
				}
			} else {
				// console.log("값 없음")
				tbWrap += "<tr><td colspan=8>데이터가 존재하지 않습니다.</td></tr>";
			}
			tbWrap += "</tbody>";
			tbWrap += "</table>";
			tbWrap += "</div>"
			
			subjectBody.innerHTML = tbWrap;
		}
	}
	xhr.send(JSON.stringify(searchData));
}

function subNoSet(){
	var subjectModal = $("#subjectModal");
	var subjectModalForm = document.forms.subjectModalForm;
	var subNo = subjectModalForm.subNo;

	let xhr = new XMLHttpRequest();
	xhr.open("GET","/hku/admin/subNoSet",true);
	beforesend(xhr);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var nextCode = xhr.responseText;
			console.log(nextCode);
			subNo.value = nextCode;
		}
	}
	xhr.send();
}

function subjectInsert(){
	var subjectModal = $("#subjectModal");
	var subjectModalForm = document.forms.subjectModalForm;
	// console.log(deptModalForm);
	var subNo = subjectModalForm.subNo.value;
	var deptCd = subjectModalForm.deptNm.value;	// 이름을 가져와서 코드로 넣음
	var subNm = subjectModalForm.subNm.value;
	var subGrade = subjectModalForm.subGrade.value;
	var subHour = subjectModalForm.subHour.value;
	var crsClassfCd = subjectModalForm.crsClassfCd.value;
	var subCrd = subjectModalForm.subCrd.value;
	var subOtl = subjectModalForm.subOtl.value;

	if(deptCd == ""){
		swal({
			title: "학과명을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(subNm == ""){
		swal({
			title: "과목이름을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(subGrade == ""){
		swal({
			title: "대상학년을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(subHour == ""){
		swal({
			title: "시수를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(crsClassfCd == ""){
		swal({
			title: "이수구분을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(subCrd == ""){
		swal({
			title: "학점을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if(subOtl == ""){
		swal({
			title: "교과목개요를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}

	subjectInsertData = {
		"subNo": subNo,
		"deptCd": deptCd,
		"subNm": subNm,
		"subGrade": subGrade,
		"subHour": subHour,
		"crsClassfCd": crsClassfCd,
		"subCrd": subCrd,
		"subOtl": subOtl
	};
	console.log(JSON.stringify(subjectInsertData));

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/subject-administration",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === "SUCCESS"){
				subjectModal.modal('hide');
				subjectList();
				swal({
					title: "교과목 등록이 완료되었습니다!", 
					icon: "success"
				});
			}

			if(xhr.responseText === "FAILED"){
				subjectModal.modal('hide');
				subjectList();
				swal({
					title: "교과목 등록에 실패하였습니다!", 
					icon: "error"
				});
			}
		}
	}
	xhr.send(JSON.stringify(subjectInsertData));
}

function selectAll(target){
	const checkboxes = document.querySelectorAll(".subjectCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function onlyCheck(){
	event.stopPropagation();
	console.log("오직 체크만");
}

function deleteSubject(){
	var delsubjectArr = new Array();
	let subjects = document.querySelectorAll(".subjectCheck");
	for(let i=0; i<subjects.length; i++){
		if(subjects[i].checked == true){
			delsubjectArr.push(subjects[i].value);
		}
	}
	if(delsubjectArr.length == 0){
		swal({
			title: "항목을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	
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
			xhr.open("DELETE","/hku/admin/subject-administration",true);
			beforesend(xhr);
			xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log("삭제 잘 갔다옴");
					if(xhr.responseText === "SUCCESS"){
						subjectList();
						swal({
							title: "삭제가 완료되었습니다!", 
							icon: "success"
						});
					} else if(xhr.responseText === "FAILED"){
						swal({
							title: "삭제가 실패하였습니다!", 
							icon: "error"
						});
					}
				}
			}
			xhr.send(JSON.stringify(delsubjectArr));
		} else {
			return false;
		}
	});
}

function subjectDetail(target){
	var subjectModifyModal = $("#subjectModifyModal");
	var subjectModifyModalForm = document.forms.subjectModifyModalForm;
	// console.log(deptModalForm);
	var subNo = subjectModifyModalForm.mSubNo;
	var deptNm = subjectModifyModalForm.mDeptNm;
	var subNm = subjectModifyModalForm.mSubNm;
	var subGrade = subjectModifyModalForm.mSubGrade;
	var subHour = subjectModifyModalForm.mSubHour;
	var crsClassfCd = subjectModifyModalForm.mCrsClassfCd;
	var subCrd = subjectModifyModalForm.mSubCrd;
	var subOtl = subjectModifyModalForm.mSubOtl;

	let subDetail = {};
	var selectsubNo = target.children[1].innerText;
	console.log("selectsubNo",selectsubNo);
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/hku/admin/subject-select?subNo="+selectsubNo,true);
	beforesend(xhr);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			// console.log("학과상세 성공");
			subDetail = JSON.parse(xhr.responseText);

			subNo.value = subDetail.subNo;
			deptNm.value = subDetail.deptCd;
			subNm.value = subDetail.subNm;
			subGrade.value = subDetail.subGrade;
			subHour.value = subDetail.subHour;
			crsClassfCd.value = subDetail.crsClassfCd;
			subCrd.value = subDetail.subCrd;
			subOtl.value = subDetail.subOtl;

			subjectModifyModal.modal('show');
			
		}
	}
	xhr.send();
}

function subjectModify(){
	var subjectModifyModal = $("#subjectModifyModal");
	var subjectModifyModalForm = document.forms.subjectModifyModalForm;
	// console.log(deptModalForm);
	var mSubNo = subjectModifyModalForm.mSubNo.value;
	var mDeptNm = subjectModifyModalForm.mDeptNm.value;
	var mSubNm = subjectModifyModalForm.mSubNm.value;
	var mSubGrade = subjectModifyModalForm.mSubGrade.value;
	var mSubHour = subjectModifyModalForm.mSubHour.value;
	var mCrsClassfCd = subjectModifyModalForm.mCrsClassfCd.value;
	var mSubCrd = subjectModifyModalForm.mSubCrd.value;
	var mSubOtl = subjectModifyModalForm.mSubOtl.value;

	let subjectModifyData = {
		"subNo": mSubNo,
		"deptCd": mDeptNm,
		"subNm": mSubNm,
		"subGrade": mSubGrade,
		"subHour": mSubHour,
		"crsClassfCd": mCrsClassfCd,
		"subCrd": mSubCrd,
		"subOtl": mSubOtl
	}

	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/subject-update",true);
	beforesend(xhr);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			// console.log("학과 수정 성공!");
			// console.log("xhr.responseText",xhr.responseText);
			if(xhr.responseText === "SUCCESS") {
				subjectModifyModal.modal('hide');
				subjectList();
				swal({
					title: "수정이 완료되었습니다!", 
					icon: "success"
				});
			}
			if(xhr.responseText === "FAILED") {
				subjectModifyModal.modal('hide');
				subjectList();
				swal({
					title: "수정에 실패하였습니다!", 
					icon: "error"
				});
			}

		}
	}
	xhr.send(JSON.stringify(subjectModifyData));
}

window.addEventListener("DOMContentLoaded", function(){  // 태그 해석만 끝나면 발생
    subjectList();
});
</script>