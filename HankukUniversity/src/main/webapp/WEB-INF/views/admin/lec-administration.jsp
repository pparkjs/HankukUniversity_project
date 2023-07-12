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
    
    <!-- <div class="container-fluid">
		<div class="basic-form">
			<form class="row g-3 custom-form" action="" name="searchForm">
				<div class="col-md-2">
					<select class="default-select form-control" name="searchType">
						<option value="deptCd">학과코드</option>
						<option value="subNo">과목번호</option>
						<option value="subNm">과목명</option>
						<option value="subGrade">대상학년</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control input-default" name="searchWord" value="${searchWord }" placeholder="검색어를 입력해주세요">
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="subjectList()">검색</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subjectModal" onclick="deptCdSet()">교과목개설</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="delSubject()">삭제</button>
				</div>
			</form>
		</div>
	</div> -->

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
					<button type="button" class="btn btn-primary lecSearchBtn" data-bs-toggle="modal" data-bs-target="#subjectModal">교과목개설</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary lecSearchBtn" onclick="delSubject()">삭제</button>
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

<!-- 학과 개설 modal -->
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
										<input type="text" class="form-control" name="subNo">
										<!-- <select class="default-select form-control" name="colCd">
											<option value="">대학코드 선택</option>
											<c:forEach items="${colList}" var="col">
												<option value="${col.colCd}">${col.colNm}</option>
											</c:forEach>
										</select> -->
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">학과명<span class="text-danger">*</span></label>
									<div class="input-group">
										<!-- <input type="text" class="form-control" name="deptNm" readonly> -->
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
										<!-- <input type="text" class="form-control" placeholder="학과 연락처 입력" name="deptTelno"> -->
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
									<input type ="text" class="form-control" name="subHour">
									<!-- <select class="default-select form-control" name="flctNo">
										<option value="">시설번호 선택</option>
										<c:forEach items="${flctList}" var="flct">
											<option value="${flct.flctNo}">${flct.flctNm}</option>
										</c:forEach>
									</select> -->
									</div>
								</div>
								<div class="col-xl-6 mb-3">
									<label class="form-label mt-3">이수 구분<span class="text-danger">*</span></label>
									<div class="input-group">
										<!-- <input type="text" class="form-control" placeholder="학과 연락처 입력" name="deptTelno"> -->
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
									<input type ="text" class="form-control" name="subCrd">
									<!-- <select class="default-select form-control" name="flctNo">
										<option value="">시설번호 선택</option>
										<c:forEach items="${flctList}" var="flct">
											<option value="${flct.flctNo}">${flct.flctNm}</option>
										</c:forEach>
									</select> -->
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
<script>

var subjectBody = document.querySelector("#subject-body");

function subjectList(){
	var searchForm = document.forms.searchForm;
	// var searchType = searchForm.searchType.value;
	// var searchWord = searchForm.searchWord.value.trim().toUpperCase();
	// console.log("searchType=" + searchType);
	// console.log("searchWord=" + searchWord);

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
					tbWrap += "<tr onclick='deptDetail(this)'>";
					tbWrap += "<td>";
					tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
					tbWrap += `<input type='checkbox' class='form-check-input subjectCheck' value='\${subjectList[i].deptCd }' onclick="onlyCheck()">`;
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

function selectAll(target){
	// console.log(target);
	const checkboxes = document.querySelectorAll(".subjectCheck");
	// console.log(checkboxes);
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function onlyCheck(){
	event.stopPropagation();
	console.log("오직 체크만");
}

function subjectInsert(){
	var subjectModal = $("#subjectModal");
	var subjectModalForm = document.forms.subjectModalForm;

	var subNo = subjectModalForm.subNo.value;
	var deptCd = subjectModalForm.deptNm.value;	// 이름을 가져와서 코드로 넣음
	var subNm = subjectModalForm.subNm.value;
	var subGrade = subjectModalForm.subGrade.value;
	var subHour = subjectModalForm.subHour.value;
	var crsClassfCd = subjectModalForm.crsClassfCd.value;
	var subCrd = subjectModalForm.subCrd.value;
	var subOtl = subjectModalForm.subOtl.value;

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
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log("잘 갔다왔어용");
		}
	}
	xhr.send(JSON.stringify(subjectInsertData));
}

window.addEventListener("DOMContentLoaded", function(){  // 태그 해석만 끝나면 발생
    subjectList();
});
</script>