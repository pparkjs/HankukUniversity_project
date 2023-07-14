<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="/css/admin/userManage.css">
	<link rel="stylesheet" type="text/css" href="/icons/flaticon/flaticon.css">
	<link rel="stylesheet" href="/css/table.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">사용자관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">사용자관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-3">
				<div class="clearfix">
					<div class="card card-bx profile-card author-profile m-b30">
						<div class="card-body">
							<div class="p-5">
								<div class="author-profile">
									<div class="author-media">
										<img id="profileImg" src="/images/user(2).png" alt="">
<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->
										<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
											<input type="file" class="update-flie" id="profile" name="profile">
											<i class="fa fa-camera"></i>
										</div>
									</div>
									<div class="author-info">
										<h5 class="title">프로필 이미지</h5>
									</div>
								</div>
							</div>
							<div class="info-list">
								<ul>
									<li><a href="app-profile.html">Models</a><span>36</span></li>
									<li><a href="uc-lightgallery.html">Gallery</a><span>3</span></li>
									<li><a href="app-profile.html">Lessons</a><span>1</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-9">
				<div class="card profile-card card-bx m-b30">
					<div class="card-header">
						<div>
							<h4 class="title">
								사용자 등록
							</h4>
						</div>
						<div class="container-fluid">

							<div class="row g-3 custom-form">
								<div class="col-md-2">
									<select class="default-select form-control" id="selectTarget">
										<option value="admin">교직원</option>
										<option value="professor">교수</option>
										<option value="student" selected>학생</option>
									</select>
								</div>
								<div class="col-md-4 input-group ilgualdngrok">
									<input class="form-control" type="file" id="formFile">
									<span class="input-group-append">
										<button type="button" onclick="alert('일괄등록')" class="btn btn-primary btn-flat">일괄등록</button>
									</span>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-primary" onclick="userInsert()">등록</button>
								</div>
							</div>
						</div>
					</div>
					<div>
						<form class="profile-form">
							<div class="card-body user-insert-form">
								<div class="row" id="insertFormDisp">
									<!-- <div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">교번</label>
										<input type="text" class="form-control" id="userNo" placeholder="학번을 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">이름</label>
										<input type="text" class="form-control" id="userNm" placeholder="이름을 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">부서</label>
										<select class="default-select form-control" id="empDeptCd">
											<option value="">Please select</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'EMP_DEPT' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-3 mbKYW">
										<label class="form-label lmbKYW">생년월일</label>
										<input type="text" class="form-control" id="userBrdt" placeholder="생년월일을 입력해주세요(8자리)">
									</div>
									<div class="col-sm-3 mbKYW">
										<label class="form-label lmbKYW">주민등록번호</label>
										<input type="text" class="form-control" id="userRrno" placeholder="주민등록번호를 입력해주세요">
									</div>
									<div class="col-sm-2 mbKYW">
										<label class="form-label lmbKYW">성별</label>
										<select class="default-select form-control" id="sexCd">
											<option value="">Please select</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'SEX' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">연락처</label>
										<input type="text" class="form-control" id="userTelno" placeholder="'-'빼고 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">입사일</label>
										<input type="date" class="form-control" id="empJncmpYmd" placeholder="입사일을 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">직급</label>
										<select class="default-select form-control" id="empJbttlCd">
											<option value="">Please select</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'EMP_POSITION' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">직책</label>
										<select class="default-select form-control" id="empJbgdCd">
											<option value="">Please select</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'EMP_TITLE' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">이메일</label>
										<input type="text" class="form-control" id="userMail" placeholder="이메일을 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">은행</label>
										<select class="default-select form-control" id="bankCd">
											<option value="">Please select</option>
											<c:forEach items="${commonList}" var="common">
												<c:if test="${common.comCdGrp eq 'BANK' }">
													<option value="${common.comCd }">${common.comCdNm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">계좌번호</label>
										<input type="text" class="form-control" id="userActno" placeholder="계좌번호를 입력해주세요">
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">우편번호</label>
										<div class="input-group">
											<input type="text" class="form-control" id="userZip" placeholder="우편변호를 입력해주세요" readonly>
											<span class="input-group-append">
												<button type="button" onclick="DaumPostcode()" class="btn btn-primary btn-flat">우편번호 찾기</button>
											</span>
										</div>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">기본주소</label>
										<input type="text" class="form-control" id="userAddr" placeholder="기본주소를 입력해주세요" readonly>
									</div>
									<div class="col-sm-4 mbKYW">
										<label class="form-label lmbKYW">상세주소</label>
										<input type="text" class="form-control" id="userDaddr" placeholder="상세주소를 입력해주세요">
									</div> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid dd">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">전체 사용자</h5>
			</div>
			<div class="card-body">
				
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="users-tab" data-bs-toggle="tab" data-bs-target="#users" type="button" role="tab" aria-controls="users" aria-selected="true">전체</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="admins-tab" data-bs-toggle="tab" data-bs-target="#admins" type="button" role="tab" aria-controls="admins" aria-selected="false">교직원</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="professors-tab" data-bs-toggle="tab" data-bs-target="#professors" type="button" role="tab" aria-controls="professors" aria-selected="false">교수</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="students-tab" data-bs-toggle="tab" data-bs-target="#students" type="button" role="tab" aria-controls="students" aria-selected="false">학생</button>
					</li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="users" role="tabpanel" aria-labelledby="users-tab" tabindex="0">
						1
					</div>
					<div class="tab-pane" id="admins" role="tabpanel" aria-labelledby="admins-tab" tabindex="0">
						<div class='table-wrap'>
							<table class='table'>
								<thead class='thead-dark'>
									<tr>
										<th>
											<div class='form-check custom-checkbox checkbox-danger'>
												<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>
											</div>
										</th>
										<th>학번/교번</th>
										<th>이름</th>
										<th>사용자 종류</th>
										<th>부서</th>
										<th>직급</th>
										<th>직책</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>연락처</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminsList }" var="admin">
										<tr onclick='adminDetail(this)'>
											<td>
												<div class='form-check custom-checkbox checkbox-danger'>
													<input type='checkbox' class='form-check-input deptCheck' value='\${deptList[i].deptCd }' onclick="onlyCheck()">
												</div>
											</td>
											<td>${admin.userNo }</td>
											<td>${admin.userNm }</td>
											<td>${admin.userClsNm }</td>
											<td>${admin.empDeptNm }</td>
											<td>${admin.empJbttlNm }</td>
											<td>${admin.empJbgdNm }</td>
											<td>${admin.userBrdt }</td>
											<td>${admin.sexNm }</td>
											<td>${admin.userTelno }</td>
											<td>${admin.userMail }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane" id="professors" role="tabpanel" aria-labelledby="professors-tab" tabindex="0">
						<div class='table-wrap'>
							<table class='table'>
								<thead class='thead-dark'>
									<tr>
										<th>
											<div class='form-check custom-checkbox checkbox-danger'>
												<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>
											</div>
										</th>
										<th>학번/교번</th>
										<th>이름</th>
										<th>사용자 종류</th>
										<th>직책</th>
										<th>학과</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>연락처</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${professorsList }" var="professor">
										<tr onclick='professorDetail(this)'>
											<td>
												<div class='form-check custom-checkbox checkbox-danger'>
													<input type='checkbox' class='form-check-input deptCheck' value='\${deptList[i].deptCd }' onclick="onlyCheck()">
												</div>
											</td>
											<td>${professor.userNo }</td>
											<td>${professor.userNm }</td>
											<td>${professor.userClsNm }</td>
											<td>${professor.proJbttlNm }</td>
											<td>${professor.deptNm }</td>
											<td>${professor.userBrdt }</td>
											<td>${professor.sexNm }</td>
											<td>${professor.userTelno }</td>
											<td>${professor.userMail }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane" id="students" role="tabpanel" aria-labelledby="students-tab" tabindex="0">
						<div class='table-wrap'>
							<table class='table'>
								<thead class='thead-dark'>
									<tr>
										<th>
											<div class='form-check custom-checkbox checkbox-danger'>
												<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>
											</div>
										</th>
										<th>학번/교번</th>
										<th>이름</th>
										<th>사용자 종류</th>
										<th>학과</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>연락처</th>
										<th>이메일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${studentsList }" var="student">
										<tr onclick='studentDetail(this)'>
											<td>
												<div class='form-check custom-checkbox checkbox-danger'>
													<input type='checkbox' class='form-check-input deptCheck' value='\${deptList[i].deptCd }' onclick="onlyCheck()">
												</div>
											</td>
											<td>${student.userNo }</td>
											<td>${student.userNm }</td>
											<td>${student.userClsNm }</td>
											<td>${student.deptNm }</td>
											<td>${student.userBrdt }</td>
											<td>${student.sexNm }</td>
											<td>${student.userTelno }</td>
											<td>${student.userMail }</td>
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
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// const triggerTabList = document.querySelectorAll('#myTab button')
// triggerTabList.forEach(triggerEl => {
//   const tabTrigger = new bootstrap.Tab(triggerEl)

//   triggerEl.addEventListener('click', event => {
//     event.preventDefault()
//     tabTrigger.show()
//   })
// })

file = null;

$(function(){
	console.log("앙뇽~");

	var profile = $("#profile");		// 프로필 이미지 선택 Element(이미지 선택 파일)
	var selectTarget = $("#selectTarget");

	insertFormSet(selectTarget.val());	// 처음에는 학생폼으로 세팅

	selectTarget.on("change", function(){	// 값 변경시 해당 폼으로 변경
		var stVal = selectTarget.val();
		console.log(stVal + "으로 변경");
		$("#profileImg").attr("src", "/images/user(2).png");
		console.log("전",$("#profile").val());
		$("#profile").val(null); // ????
		console.log("후",$("#profile").val());
		insertFormSet(stVal);
	});
	
	// 프로필 이미지 선택
	profile.on("change", function(event){
		console.log($("#profile").val());
		file = event.target.files[0];
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#profileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해주세요!");
			$(this).val(null);
		}
	});

	// $("#students-tab").on("click", function(){
	// 	console.log("students탭 버튼 클릭");
	// 	usersSet();
	// })

	// usersSet();
})

function usersSet(){
	var users = $("#users");
	var admins = $("#admins");
	var professors = $("#professors");
	var students = $("#students");
	users.html("사용자들");
	admins.html("교직원들");
	professors.html("교수들");
	students.html("학생들임");
}

// 이미지 파일인지 체크(확장자를 이용해서)
function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();		// 파일명에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg","jpeg","gif","png"]) === -1) ? false : true;
}

function insertFormSet(param){
	var myDisp = $("#insertFormDisp");
	var formText = "";

	if(param == "student"){
		formText += `
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">학번</label>
			<input type="text" class="form-control" id="userNo" placeholder="학번을 입력해주세요">
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">이름</label>
			<input type="text" class="form-control" id="userNm" placeholder="이름을 입력해주세요">
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">학과</label>
			<select class="default-select form-control" id="deptCd">
				<option value="">Please select</option>`;
				<c:forEach items="${deptList}" var="dept">
		formText += "<option value='${dept.deptCd }'>${dept.deptNm }</option>";
				</c:forEach>
		formText+=`</select>
		</div>
		<div class="col-sm-3 mbKYW">
			<label class="form-label lmbKYW">생년월일</label>
			<input type="text" class="form-control" id="userBrdt" placeholder="생년월일을 입력해주세요(8자리)">
		</div>
		<div class="col-sm-3 mbKYW">
			<label class="form-label lmbKYW">주민등록번호</label>
			<input type="text" class="form-control" id="userRrno" placeholder="주민등록번호를 입력해주세요">
		</div>
		<div class="col-sm-2 mbKYW">
			<label class="form-label lmbKYW">성별</label>
			<select class="default-select form-control" id="sexCd">
				<option value="">Please select</option>`;
				<c:forEach items="${commonList}" var="common">
					<c:if test="${common.comCdGrp eq 'SEX' }">
					formText+=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
					</c:if>
				</c:forEach>
		formText+= `</select>
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">연락처</label>
			<input type="text" class="form-control" id="userTelno" placeholder="'-'빼고 입력해주세요">
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">이메일</label>
			<input type="text" class="form-control" id="userMail" placeholder="이메일을 입력해주세요">
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">은행</label>
			<select class="default-select form-control" id="bankCd">
				<option value="">Please select</option>`;
				<c:forEach items="${commonList}" var="common">
					<c:if test="${common.comCdGrp eq 'BANK' }">
						formText+=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
					</c:if>
				</c:forEach>
		formText+=`	</select>
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">계좌번호</label>
			<input type="text" class="form-control" id="userActno" placeholder="계좌번호를 입력해주세요">
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">우편번호</label>
			<div class="input-group">
				<input type="text" class="form-control" id="userZip" placeholder="우편변호를 입력해주세요" readonly>
				<span class="input-group-append">
					<button type="button" onclick="DaumPostcode()" class="btn btn-primary btn-flat">우편번호 찾기</button>
				</span>
			</div>
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">기본주소</label>
			<input type="text" class="form-control" id="userAddr" placeholder="기본주소를 입력해주세요" readonly>
		</div>
		<div class="col-sm-4 mbKYW">
			<label class="form-label lmbKYW">상세주소</label>
			<input type="text" class="form-control" id="userDaddr" placeholder="상세주소를 입력해주세요">
		</div>`;
		myDisp.html(formText);
	} else if(param == "professor") {
		formText += `
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">교번</label>
				<input type="text" class="form-control" id="userNo" placeholder="학번을 입력해주세요">
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">직책</label>
				<select class="default-select form-control" id="proJbttlCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'PRO_JBTTL' }">
		formText +=			"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">이름</label>
				<input type="text" class="form-control" id="userNm" placeholder="이름을 입력해주세요">
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">학과</label>
				<select class="default-select form-control" id="deptCd">
					<option value="">Please select</option>`;
					<c:forEach items="${deptList}" var="dept">
		formText +=		"<option value='${dept.deptCd }'>${dept.deptNm }</option>";
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">생년월일</label>
				<input type="text" class="form-control" id="userBrdt" placeholder="생년월일을 입력해주세요(8자리)">
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">주민등록번호</label>
				<input type="text" class="form-control" id="userRrno" placeholder="주민등록번호를 입력해주세요">
			</div>
			<div class="col-sm-2 mbKYW">
				<label class="form-label lmbKYW">성별</label>
				<select class="default-select form-control" id="sexCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'SEX' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">연락처</label>
				<input type="text" class="form-control" id="userTelno" placeholder="'-'빼고 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">입사일</label>
				<input type="date" class="form-control" id="proJncmpYmd" placeholder="입사일을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">연구실</label>
				<input type="text" class="form-control" id="proLab" placeholder="연구실을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">연구실 전화번호</label>
				<input type="text" class="form-control" id="proLabTelno" placeholder="연구실 전화번호를 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">이메일</label>
				<input type="text" class="form-control" id="userMail" placeholder="이메일을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">은행</label>
				<select class="default-select form-control" id="bankCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'BANK' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">계좌번호</label>
				<input type="text" class="form-control" id="userActno" placeholder="계좌번호를 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">우편번호</label>
				<div class="input-group">
					<input type="text" class="form-control" id="userZip" placeholder="우편변호를 입력해주세요" readonly>
					<span class="input-group-append">
						<button type="button" onclick="DaumPostcode()" class="btn btn-primary btn-flat">우편번호 찾기</button>
					</span>
				</div>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">기본주소</label>
				<input type="text" class="form-control" id="userAddr" placeholder="기본주소를 입력해주세요" readonly>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">상세주소</label>
				<input type="text" class="form-control" id="userDaddr" placeholder="상세주소를 입력해주세요">
			</div>`;

		myDisp.html(formText);
	} else if(param == "admin") {
		formText += `
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">교번</label>
				<input type="text" class="form-control" id="userNo" placeholder="학번을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">이름</label>
				<input type="text" class="form-control" id="userNm" placeholder="이름을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">부서</label>
				<select class="default-select form-control" id="empDeptCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'EMP_DEPT' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">생년월일</label>
				<input type="text" class="form-control" id="userBrdt" placeholder="생년월일을 입력해주세요(8자리)">
			</div>
			<div class="col-sm-3 mbKYW">
				<label class="form-label lmbKYW">주민등록번호</label>
				<input type="text" class="form-control" id="userRrno" placeholder="주민등록번호를 입력해주세요">
			</div>
			<div class="col-sm-2 mbKYW">
				<label class="form-label lmbKYW">성별</label>
				<select class="default-select form-control" id="sexCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'SEX' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">연락처</label>
				<input type="text" class="form-control" id="userTelno" placeholder="'-'빼고 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">입사일</label>
				<input type="date" class="form-control" id="empJncmpYmd" placeholder="입사일을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">직급</label>
				<select class="default-select form-control" id="empJbttlCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'EMP_POSITION' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">직책</label>
				<select class="default-select form-control" id="empJbgdCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'EMP_TITLE' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">이메일</label>
				<input type="text" class="form-control" id="userMail" placeholder="이메일을 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">은행</label>
				<select class="default-select form-control" id="bankCd">
					<option value="">Please select</option>`;
					<c:forEach items="${commonList}" var="common">
						<c:if test="${common.comCdGrp eq 'BANK' }">
		formText +=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
						</c:if>
					</c:forEach>
		formText +=	`</select>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">계좌번호</label>
				<input type="text" class="form-control" id="userActno" placeholder="계좌번호를 입력해주세요">
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">우편번호</label>
				<div class="input-group">
					<input type="text" class="form-control" id="userZip" placeholder="우편변호를 입력해주세요" readonly>
					<span class="input-group-append">
						<button type="button" onclick="DaumPostcode()" class="btn btn-primary btn-flat">우편번호 찾기</button>
					</span>
				</div>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">기본주소</label>
				<input type="text" class="form-control" id="userAddr" placeholder="기본주소를 입력해주세요" readonly>
			</div>
			<div class="col-sm-4 mbKYW">
				<label class="form-label lmbKYW">상세주소</label>
				<input type="text" class="form-control" id="userDaddr" placeholder="상세주소를 입력해주세요">
			</div>`;
		myDisp.html(formText);
	}

}

function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } 
            document.getElementById('userZip').value = data.zonecode;
            document.getElementById("userAddr").value = addr;
            document.getElementById("userDaddr").focus();
        }
    }).open();
}

function userInsert(event){
	console.log("등록버튼");
	var userClsCd = $("#selectTarget").val();	// 사용자 구분
	var userPw = $("#userBrdt").val();
	// if(userClsCd == 'student') {
	// 	userPw = $("#stdBrdt").val();
	// } else if(userClsCd == 'professor'){
	// 	userPw = $("#proBrdt").val();
	// } else if(userClsCd == 'admin'){
	// 	userPw = $("#empBrdt").val();
	// }

	// var files = event.target.files;
	console.log("file",file);
	// var file = files[0];

	let formData = new FormData();
	formData.append("userNo", $("#userNo").val());
	formData.append("userPw", userPw);
	formData.append("userClsCd", userClsCd);

	formData.append("deptCd", $("#deptCd").val());
	formData.append("bankCd", $("#bankCd").val());
	formData.append("sexCd", $("#sexCd").val());

	// formData.append("stdNo", $("#stdNo").val());
	formData.append("userNm", $("#userNm").val());
	formData.append("userTelno", $("#userTelno").val());
	formData.append("userSexCd", $("#userSexCd").val());
	formData.append("userZip", $("#userZip").val());
	formData.append("userAddr", $("#userAddr").val());
	formData.append("userDaddr", $("#userDaddr").val());
	formData.append("userMail", $("#userMail").val());
	formData.append("userBrdt", $("#userBrdt").val());
	formData.append("userRrno", $("#userRrno").val());
	formData.append("userActno", $("#userActno").val());

	formData.append("profile", file);
	
	if(userClsCd == 'professor'){
		formData.append("proJbttlCd", $("#proJbttlCd").val());
		formData.append("proJncmpYmd", $("#proJncmpYmd ").val());
		formData.append("proLab", $("#proLab").val());
		formData.append("proLabTelno", $("#proLabTelno").val());

	}

	if(userClsCd == 'admin'){
		formData.append("empJncmpYmd", $("#empJncmpYmd").val());
		formData.append("empDeptCd", $("#empDeptCd").val());
		formData.append("empJbttlCd", $("#empJbttlCd ").val());
		formData.append("empJbgdCd", $("#empJbgdCd").val());

	}

	let userInsertData = {
		"userNo": $("#userNo").val(),
		"userPw": userPw,
		"userClsCd": userClsCd,
		// "enabled": $("#enabled").val(),

		"deptCd": $("#deptCd").val(),
		"bankCd": $("#bankCd").val(),
		"sexCd": $("#sexCd").val(),

		"stdNo": $("#stdNo").val(),
		"stdNm": $("#stdNm").val(),
		"stdMjrCrd": $("#stdMjrCrd").val(),		//	필요 X
		"stdCtrlCrd": $("#stdCtrlCrd").val(),	//	필요 X
		"stdMtcltnYr": $("#stdMtcltnYr").val(),	//	필요 X
		"stdSttsCd": $("#stdSttsCd").val(),		//	필요 X
		"stdTelno": $("#stdTelno").val(),
		"stdSexCd": $("#stdSexCd").val(),
		"stdZip": $("#stdZip").val(),
		"stdAddr": $("#stdAddr").val(),
		"stdDaddr": $("#stdDaddr").val(),
		"stdMail": $("#stdMail").val(),
		"stdBrdt": $("#stdBrdt").val(),
		"stdRrno": $("#stdRrno").val(),
		"stdActno": $("#stdActno").val(),
		"stdProfile": $("#stdProfile").val(),
		"stdProfilePath": $("#stdProfilePath").val(),

		"empNo": $("#empNo").val(),
		"empName": $("#empName").val(),
		"empMail": $("#empMail").val(),
		"empBrdt": $("#empBrdt").val(),
		"empJncmpYmd": $("#empJncmpYmd").val(),
		"empRsgntnYmd": $("#empRsgntnYmd").val(),
		"empTelno": $("#empTelno").val(),
		"empZip": $("#empZip").val(),
		"empAddr": $("#empAddr").val(),
		"empDaddr": $("#empDaddr").val(),
		"empRrno": $("#empRrno").val(),
		"empActno": $("#empActno").val(),
		"empProfilePath": $("#empProfilePath").val(),
		"empDeptCd": $("#empDeptCd").val(),
		"empJbttlCd": $("#empJbttlCd").val(),
		"empJbgdCd": $("#empJbgdCd").val(),

		"proNo": $("#proNo").val(),
		"proJbttlCd": $("#proJbttlCd").val(),
		"proJncmpYmd": $("#proJncmpYmd").val(),
		"proRsgntnYmd": $("#proRsgntnYmd").val(),
		"proLab": $("#proLab").val(),
		"proLabTelno": $("#proLabTelno").val(),
		"proNm": $("#proNm").val(),
		"proTelno": $("#proTelno").val(),
		"proZip": $("#proZip").val(),
		"proAddr": $("#proAddr").val(),
		"proDaddr": $("#proDaddr").val(),
		"proMail": $("#proMail").val(),
		"proBrdt": $("#proBrdt").val(),
		"proRrno": $("#proRrno").val(),
		"proActno": $("#proActno").val(),
		"proProfilePath": $("#proProfilePath").val(),
	};
	// console.log(userInsertData);
	console.log("formData",formData);	

	$.ajax({
		method: 'POST',
		url: '/hku/admin/user-management',
		data: formData,
		dataType: "text",
		processData: false,
		contentType: false,
		success: function (res) {
			alert("성공");
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});

}
</script>