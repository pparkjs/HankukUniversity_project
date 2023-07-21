<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="/css/admin/userManage.css">
	<link rel="stylesheet" type="text/css" href="/icons/flaticon/flaticon.css">
	<link rel="stylesheet" href="/css/table.css">
<c:if test="${ilgualStatus eq '1' }">
	<script>
		swal({
			title: "일괄등록이 완료되었습니다!",
			icon: "success"
		});
	</script>
</c:if>
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
									<li>
										<p id="notice">사용자 등록 주의사항</p>
										<div style="text-align:left;">
											- 항목을 정확히 모두 입력해주세요.<br/>
											- 엑셀 파일 일괄등록 시 엑셀 형식을 꼭 맞춰주세요.<br/>
										</div>
									</li>
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
								<div class="col-md-4 ilgualdngrok">
									<form action="/hku/admin/insertUserExcel" class="input-group" id="excelForm" method="POST" enctype="multipart/form-data">
										<input class="form-control" type="file" id="formFile" name="formFile">
										<span class="input-group-append">
											<button type="button" onclick="poiInsert()" class="btn btn-primary btn-flat">일괄등록</button>
										</span>
									</form>
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
				<div class="row spaceBetween">
					<div class="col-auto">
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
					</div>
					<div class="col-md-8">
						<form class="row g-3 custom-form" action="" id="searchForm">
							<div class="col-md-2">
								<select class="default-select form-control form-control-sm" id="searchType">
									<option value="userNo">학번/교번</option>
									<option value="userNm">이름</option>
									<option value="deptNm">학과명</option>
								</select>
							</div>
							<div class="col-md-3">
								<input type="text" class="form-control form-control-sm input-default" id="searchWord" value="${searchWord }" placeholder="검색어를 입력해주세요">
							</div>
							<div class="col-auto">
								<button type="button" class="btn btn-sm btn-primary listBtn" id="userSearchBtn">검색</button>
							</div>
							<!-- <div class="col-auto">
								<button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#deptModal" onclick="deptCdSet()">학과개설</button>
							</div> -->
							<div class="col-auto">
								<button type="button" class="btn btn-sm btn-primary listBtn" onclick="deleteUser()">삭제</button>
							</div>
						</form>
					</div>
				</div>
				<!-- <button type="button" onclick="tabChange()">탭변경</button> -->
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="users" role="tabpanel" aria-labelledby="users-tab" tabindex="0">
						
					</div>
					<div class="tab-pane" id="admins" role="tabpanel" aria-labelledby="admins-tab" tabindex="0">
						
					</div>
					<div class="tab-pane" id="professors" role="tabpanel" aria-labelledby="professors-tab" tabindex="0">
						
					</div>
					<div class="tab-pane" id="students" role="tabpanel" aria-labelledby="students-tab" tabindex="0">
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 학생 상세보기 -->
	<div class="modal modal-lg fade" id="studentDetailModal" tabindex="-1" aria-labelledby="studentDetailLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-center">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="studentDetailLabel">학생 상세</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding: 0.575rem 1.875rem;">
					<div class="row">
						<div class="col-xl-12">
							<div class="row">
								<div class="col-xl-6">
									<div class="p-4">
										<div class="author-profile">
											<div class="author-media">
												<img id="stdProfileImg" src="/images/user(2).png" alt="">
												<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->
												<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
													<input type="file" class="update-flie" id="stdProfile" name="stdProfile">
													<i class="fa fa-camera"></i>
												</div>
											</div>
											<div class="author-info">
												<h5 class="title">프로필 이미지</h5>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="row">
										<div class="col-xl-12">
											<label class="form-label mt-3">학번<span class="text-danger">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="학번" id="mStdNo" readonly>
											</div>
										</div>
										<div class="col-xl-12">
											<label class="form-label mt-3">이름<span class="text-danger">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="이름" id="mStdNm">
											</div>
										</div>
										<div class="col-xl-12">
											<label class="form-label mt-3">학과<span class="text-danger">*</span></label>
											<div class="input-group">
												<select class="form-select form-control" id="mStdDeptCd">
													<c:forEach items="${deptList}" var="dept">
														<option value="${dept.deptCd}">${dept.deptNm}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">전공이수학점<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="전공이수학점" id="mStdMjrCrd" readonly>
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">교양이수학점<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="교양이수학점" id="mStdCtrlCrd" readonly>
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">입학년도<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="입학년도" id="mStdMtcltnYr">
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">학적상태<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mStdSttsCd">
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'STD_STTS' }">
											<option value="${common.comCd }">${common.comCdNm }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-2">생년 월일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="생년월일" id="mStdBrdt">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-2">성별<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mStdSexCd">
									<option value="">Please select</option>
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'SEX' }">
										formText+=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">주민등록번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="주민등록번호" id="mStdRrno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">연락처<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="연락처" id="mStdTelno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">은행<span class="text-danger">*</span></label>
							<select class="form-select form-control" id="mStdBankCd">
								<option value="">Please select</option>
								<c:forEach items="${commonList}" var="common">
									<c:if test="${common.comCdGrp eq 'BANK' }">
										<option value='${common.comCd }'>${common.comCdNm }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">계좌번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="계좌번호" id="mStdActno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">이메일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="이메일" id="mStdMail">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">우편번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="우편번호" id="mStdZip">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">기본주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="기본주소" id="mStdAddr">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">상세주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="상세주소" id="mStdDaddr">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="userModify('student')">수정</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 교수 상세 모달 -->
	<div class="modal modal-lg fade" id="professorDetailModal" tabindex="-1" aria-labelledby="professorDetailLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-center">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="professorDetailLabel">교수 상세</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding: 0.575rem 1.875rem;">
					<div class="row">
						<div class="col-xl-12">
							<div class="row">
								<div class="col-xl-6">
										<div class="p-4">
											<div class="author-profile">
												<div class="author-media">
													<img id="proProfileImg" src="/images/user(2).png" alt="">
													<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->
													<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
														<input type="file" class="update-flie" id="proProfile" name="proProfile">
														<i class="fa fa-camera"></i>
													</div>
												</div>
												<div class="author-info">
													<h5 class="title">프로필 이미지</h5>
												</div>
										</div>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="row">
										<div class="col-xl-12">
											<label class="form-label mt-3">학번<span class="text-danger">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="학번" id="mProNo" readonly>
											</div>
										</div>
										<div class="col-xl-12">
											<label class="form-label mt-3">이름<span class="text-danger">*</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="이름" id="mProNm">
											</div>
										</div>
										<div class="col-xl-12">
											<label class="form-label mt-3">학과<span class="text-danger">*</span></label>
											<div class="input-group">
												<select class="form-select form-control" id="mProDeptCd">
													<c:forEach items="${deptList}" var="dept">
														<option value="${dept.deptCd}">${dept.deptNm}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">직책<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mProJbttlCd">
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'PRO_JBTTL' }">
											<option value="${common.comCd }">${common.comCdNm }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">입사일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="입사일" id="mProJncmpYmd">
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">연구실<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="연구실" id="mProLab">
							</div>
						</div>
						<div class="col-xl-3">
							<label class="form-label mt-2">연구실 번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="연구실" id="mProLabTelno">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-2">생년 월일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="생년월일" id="mProBrdt">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-2">성별<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mProSexCd">
									<option value="">Please select</option>
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'SEX' }">
										formText+=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">주민등록번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="주민등록번호" id="mProRrno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">연락처<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="연락처" id="mProTelno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">은행<span class="text-danger">*</span></label>
							<select class="form-select form-control" id="mProBankCd">
								<option value="">Please select</option>
								<c:forEach items="${commonList}" var="common">
									<c:if test="${common.comCdGrp eq 'BANK' }">
										<option value='${common.comCd }'>${common.comCdNm }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">계좌번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="계좌번호" id="mProActno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">이메일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="이메일" id="mProMail">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">우편번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="우편번호" id="mProZip">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">기본주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="기본주소" id="mProAddr">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">상세주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="상세주소" id="mProDaddr">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="userModify('professor')">수정</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 직원 상세 모달 -->
	<div class="modal modal-lg fade" id="employeeDetailModal" tabindex="-1" aria-labelledby="employeeDetailLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-center">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="employeeDetailLabel">직원 상세</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body" style="padding: 0.575rem 1.875rem;">
					<div class="row">
						<div class="col-xl-12">
							<div class="row">
								<div class="col-xl-6">
									<div class="p-4">
										<div class="author-profile">
											<div class="author-media">
												<img id="empProfileImg" src="/images/user(2).png" alt="">
												<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->
												<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
													<input type="file" class="update-flie" id="empProfile" name="empProfile">
													<i class="fa fa-camera"></i>
												</div>
											</div>
											<div class="author-info">
												<h5 class="title">프로필 이미지</h5>
											</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="row">
									<div class="col-xl-12">
										<label class="form-label mt-3">학번<span class="text-danger">*</span></label>
										<div class="input-group">
											<input type="text" class="form-control" placeholder="학번" id="mEmpNo" readonly>
										</div>
									</div>
									<div class="col-xl-12">
										<label class="form-label mt-3">이름<span class="text-danger">*</span></label>
										<div class="input-group">
											<input type="text" class="form-control" placeholder="이름" id="mEmpNm">
										</div>
									</div>
									<div class="col-xl-12">
										<label class="form-label mt-3">부서<span class="text-danger">*</span></label>
										<div class="input-group">
											<select class="form-select form-control" id="mEmpDeptCd">
												<c:forEach items="${commonList}" var="common">
													<c:if test="${common.comCdGrp eq 'EMP_DEPT' }">
														<option value="${common.comCd }">${common.comCdNm }</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
						<div class="col-xl-4">
							<label class="form-label mt-2">직급<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mEmpJbgdCd">
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'EMP_TITLE' }">
											<option value="${common.comCd }">${common.comCdNm }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-4">
							<label class="form-label mt-2">직책<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mEmpJbttlCd">
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'EMP_POSITION' }">
											<option value="${common.comCd }">${common.comCdNm }</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-4">
							<label class="form-label mt-2">입사일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="입사일" id="mEmpJncmpYmd">
							</div>
						</div>
						
						<div class="col-xl-6">
							<label class="form-label mt-2">생년 월일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="생년월일" id="mEmpBrdt">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-2">성별<span class="text-danger">*</span></label>
							<div class="input-group">
								<select class="form-select form-control" id="mEmpSexCd">
									<option value="">Please select</option>
									<c:forEach items="${commonList}" var="common">
										<c:if test="${common.comCdGrp eq 'SEX' }">
										formText+=	"<option value='${common.comCd }'>${common.comCdNm }</option>";
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">주민등록번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="주민등록번호" id="mEmpRrno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label mt-2">연락처<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="연락처" id="mEmpTelno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">은행<span class="text-danger">*</span></label>
							<select class="form-select form-control" id="mEmpBankCd">
								<option value="">Please select</option>
								<c:forEach items="${commonList}" var="common">
									<c:if test="${common.comCdGrp eq 'BANK' }">
										<option value='${common.comCd }'>${common.comCdNm }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">계좌번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="계좌번호" id="mEmpActno">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">이메일<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="이메일" id="mEmpMail">
							</div>
						</div>
						<div class="col-xl-6 mb-2">
							<label class="form-label">우편번호<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="우편번호" id="mEmpZip">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">기본주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="기본주소" id="mEmpAddr">
							</div>
						</div>
						<div class="col-xl-6 mb-1">
							<label class="form-label">상세주소<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="상세주소" id="mEmpDaddr">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="userModify('employee')">수정</button>
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
	usersSet();
	adminsSet();
	professorsSet();
	studentsSet();
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
		console.log("file", file);
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

	$("#stdProfile").on("change", function(event){
		file = event.target.files[0];
		console.log("file", file);
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#stdProfileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해주세요!");
			$(this).val(null);
		}
	});
	$("#proProfile").on("change", function(event){
		file = event.target.files[0];
		console.log("file", file);
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#proProfileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해주세요!");
			$(this).val(null);
		}
	});
	$("#empProfile").on("change", function(event){
		file = event.target.files[0];
		console.log("file", file);
		if(isImageFile(file)){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#empProfileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{	// 이미지 파일을 선택하지 않음
			alert("이미지 파일을 선택해주세요!");
			$(this).val(null);
		}
	});

	$("#userSearchBtn").on("click", function(){
		var searchType = $("#searchType").val();
		var searchWord = $("#searchWord").val();
		console.log(searchType);

		if(searchType == "userNo"){
			usersSet();
			studentsSet();
			professorsSet();
			adminsSet();
		} else if(searchType == "userNm"){
			usersSet();
			studentsSet();
			professorsSet();
			adminsSet();
		} else if(searchType == "deptNm"){
			studentsSet();
			professorsSet();
		}
	})
})

function userModify(param){
	var formdata = new FormData();
	// let formData = new FormData();

	if(param === "student"){
		// console.log("1");
		console.log($("#mStdNm").val());
		console.log($("#mStdDeptCd").val());
		console.log($("#mStdDeptCd").val());

		formdata.append("userClsNm","student");
		formdata.append("userNo",$("#mStdNo").val());
		formdata.append("userNm",$("#mStdNm").val());
		formdata.append("deptCd",$("#mStdDeptCd").val());
		formdata.append("stdMtcltnYr",$("#mStdMtcltnYr").val());
		formdata.append("stdSttsCd",$("#mStdSttsCd").val());
		formdata.append("userBrdt",$("#mStdBrdt").val());
		formdata.append("sexCd",$("#mStdSexCd").val());
		formdata.append("userRrno",$("#mStdRrno").val());
		formdata.append("userTelno",$("#mStdTelno").val());
		formdata.append("bankCd",$("#mStdBankCd").val());
		formdata.append("userActno",$("#mStdActno").val());
		formdata.append("userMail",$("#mStdMail").val());
		formdata.append("userZip",$("#mStdZip").val());
		formdata.append("userAddr",$("#mStdAddr").val());
		formdata.append("userDaddr",$("#mStdDaddr").val());
		console.log(file);
		console.log("f",document.querySelector('#stdProfile').files.length);

		let modImg = document.querySelector('#stdProfile');
		if(modImg.files.length > 0){
			formdata.append("profile", modImg.files[0]);
			// formdata.append("profile", file);
		}

		$.ajax({
			type: "POST",
			url: "/hku/admin/userModify",
			data: formdata,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(res){
				alert("수정 잘 갔다옴");
				studentsSet();
				swal({
					title: "수정이 완료되었습니다!",
					icon: "success"
				});
				$("#studentDetailModal").modal('hide');
			},
			error: function(res){
	
			}
		});
	} else if(param === "professor"){
		// console.log("2");
		// console.log($("#mProNm").val());
		// console.log($("#mProDeptCd").val());

		formdata.append("userClsNm","professor");
		formdata.append("userNo",$("#mProNo").val());
		formdata.append("userNm",$("#mProNm").val());
		formdata.append("deptCd",$("#mProDeptCd").val());

		formdata.append("proJbttlCd",$("#mProJbttlCd").val());
		formdata.append("proJncmpYmd",$("#mProJncmpYmd").val());
		formdata.append("proLab",$("#mProLab").val());
		formdata.append("proLabTelno",$("#mProLabTelno").val());

		formdata.append("userBrdt",$("#mProBrdt").val());
		formdata.append("sexCd",$("#mProSexCd").val());
		formdata.append("userRrno",$("#mProRrno").val());
		formdata.append("userTelno",$("#mProTelno").val());
		formdata.append("bankCd",$("#mProBankCd").val());
		formdata.append("userActno",$("#mProActno").val());
		formdata.append("userMail",$("#mProMail").val());
		formdata.append("userZip",$("#mProZip").val());
		formdata.append("userAddr",$("#mProAddr").val());
		formdata.append("userDaddr",$("#mProDaddr").val());
		console.log(file);
		console.log("f",document.querySelector('#proProfile').files.length);
		
		let modImg = document.querySelector('#proProfile');
		if(modImg.files.length > 0){
			formdata.append("profile", modImg.files[0]);
			// formdata.append("profile", file);
		}

		$.ajax({
			type: "POST",
			url: "/hku/admin/userModify",
			data: formdata,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(res){
				professorsSet();
				swal({
					title: "수정이 완료되었습니다!",
					icon: "success"
				});
				$("#professorDetailModal").modal('hide');
			},
			error: function(res){
	
			}
		});
		
	} else if(param === "employee"){
		console.log("3");

		formdata.append("userClsNm","employee");
		formdata.append("userNo",$("#mEmpNo").val());
		formdata.append("userNm",$("#mEmpNm").val());

		formdata.append("empDeptCd",$("#mEmpDeptCd").val());
		formdata.append("empJbgdCd",$("#mEmpJbgdCd").val());
		formdata.append("empJbttlCd",$("#mEmpJbttlCd").val());
		formdata.append("empJncmpYmd",$("#mEmpJncmpYmd").val());

		formdata.append("userBrdt",$("#mEmpBrdt").val());
		formdata.append("sexCd",$("#mEmpSexCd").val());
		formdata.append("userRrno",$("#mEmpRrno").val());
		formdata.append("userTelno",$("#mEmpTelno").val());
		formdata.append("bankCd",$("#mEmpBankCd").val());
		formdata.append("userActno",$("#mEmpActno").val());
		formdata.append("userMail",$("#mEmpMail").val());
		formdata.append("userZip",$("#mEmpZip").val());
		formdata.append("userAddr",$("#mEmpAddr").val());
		formdata.append("userDaddr",$("#mEmpDaddr").val());

		console.log(file);
		console.log("f",document.querySelector('#empProfile').files.length);
		
		let modImg = document.querySelector('#empProfile');
		if(modImg.files.length > 0){
			formdata.append("profile", modImg.files[0]);
			// formdata.append("profile", file);
		}

		$.ajax({
			type: "POST",
			url: "/hku/admin/userModify",
			data: formdata,
			dataType: "text",
			processData: false,
			contentType: false,
			success: function(res){
				adminsSet();
				swal({
					title: "수정이 완료되었습니다!",
					icon: "success"
				});
				$("#employeeDetailModal").modal('hide');
			},
			error: function(res){
	
			}
		});

	}

}

function userDetail(target){
	var userClsNm = target.children[3].innerText;
	var selectUserNo = target.children[1].innerText;
	console.log(userClsNm, selectUserNo);

	let userData = {
		"userClsNm": userClsNm,
		"userNo": selectUserNo
	}
	let userDetail = {};

	$.ajax({
		type: "POST",
		url: "/hku/admin/userDetail",
		data: JSON.stringify(userData),
		dataType: "JSON",
		contentType: 'application/json;charset=UTF-8',
		success: function(res) {
			// alert("상세 성공")
			// console.log(res);
			userDetail = res;
			// console.log("userDetail", userDetail);
			
			if(userClsNm == "직원"){
				console.log("교직원 모달");
				$("#mEmpNo").val(userDetail.userNo);
				$("#mEmpNm").val(userDetail.userNm);
				$("#mEmpDeptCd").val(userDetail.empDeptCd);

				$("#mEmpJbgdCd").val(userDetail.empJbgdCd);
				$("#mEmpJbttlCd").val(userDetail.empJbttlCd);
				$("#mEmpJncmpYmd").val(userDetail.empJncmpYmd);

				$("#mEmpBrdt").val(userDetail.userBrdt);
				$("#mEmpSexCd").val(userDetail.sexCd);
				$("#mEmpRrno").val(userDetail.userRrno);
				$("#mEmpTelno").val(userDetail.userTelno);
				$("#mEmpSexCd").val(userDetail.sexCd);
				$("#mEmpBankCd").val(userDetail.bankCd);
				$("#mEmpActno").val(userDetail.userActno);
				$("#mEmpMail").val(userDetail.userMail);
				$("#mEmpZip").val(userDetail.userZip);
				$("#mEmpAddr").val(userDetail.userAddr);
				$("#mEmpDaddr").val(userDetail.userDaddr);
				if(userDetail.profilePath != null){
					$("#empProfileImg").attr("src", "/download"+userDetail.profilePath);
				} else {
					$("#empProfileImg").attr("src", "/images/user(2).png");
				}

				$("#employeeDetailModal").modal('show');
			} else if(userClsNm == "교수"){
				console.log("교수 모달");

				$("#mProNo").val(userDetail.userNo);
				$("#mProNm").val(userDetail.userNm);
				$("#mProDeptCd").val(userDetail.deptCd);
				$("#mProJbttlCd").val(userDetail.proJbttlCd);
				$("#mProJncmpYmd").val(userDetail.proJncmpYmd);
				$("#mProLab").val(userDetail.proLab);
				$("#mProLabTelno").val(userDetail.proLabTelno);
				$("#mProBrdt").val(userDetail.userBrdt);
				$("#mProSexCd").val(userDetail.sexCd);
				$("#mProRrno").val(userDetail.userRrno);
				$("#mProTelno").val(userDetail.userTelno);
				$("#mProBankCd").val(userDetail.bankCd);
				$("#mProActno").val(userDetail.userActno);
				$("#mProMail").val(userDetail.userMail);
				$("#mProZip").val(userDetail.userZip);
				$("#mProAddr").val(userDetail.userAddr);
				$("#mProDaddr").val(userDetail.userDaddr);
				if(userDetail.profilePath != null){
					$("#proProfileImg").attr("src", "/download"+userDetail.profilePath);
				} else {
					$("#proProfileImg").attr("src", "/images/user(2).png");
				}

				$("#professorDetailModal").modal('show');
			} else if(userClsNm == "학생"){

				$("#mStdNo").val(userDetail.userNo);
				$("#mStdNm").val(userDetail.userNm);
				$("#mStdDeptCd").val(userDetail.deptCd);
				$("#mStdMjrCrd").val(userDetail.stdMjrCrd);
				$("#mStdCtrlCrd").val(userDetail.stdCtrlCrd);
				$("#mStdMtcltnYr").val(userDetail.stdMtcltnYr);
				$("#mStdSttsCd").val(userDetail.stdSttsCd);
				$("#mStdBrdt").val(userDetail.userBrdt);
				$("#mStdSexCd").val(userDetail.sexCd);
				$("#mStdRrno").val(userDetail.userRrno);
				$("#mStdTelno").val(userDetail.userTelno);
				$("#mStdBankCd").val(userDetail.bankCd);
				$("#mStdActno").val(userDetail.userActno);
				$("#mStdMail").val(userDetail.userMail);
				$("#mStdZip").val(userDetail.userZip);
				$("#mStdAddr").val(userDetail.userAddr);
				$("#mStdDaddr").val(userDetail.userDaddr);
				console.log("profilePath",userDetail.profilePath);
				if(userDetail.profilePath != null){
					$("#stdProfileImg").attr("src", "/download"+userDetail.profilePath);
				} else {
					$("#stdProfileImg").attr("src", "/images/user(2).png");
				}
		
				$("#studentDetailModal").modal('show');
			}
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});


	

}

function poiInsert(){
	console.log("POI 실행 함수");
// 	var formFile = $("#formFile");
	var formFile = document.querySelector("#formFile");
	console.log("1",formFile.files[0]);
	if(formFile.files[0] == null){
		swal({
			title: "파일을 선택해주세요!",
			icon: "error"
		})
		return false;
	}
	$("#excelForm").submit();
	// console.log("2",formFile.file);
	// console.log("3",formFile.value);

	// let formData = new FormData();
	// formData.append("file",formFile.files[0]);
	
	// // window.href = "/hku/admin/insertUserExcel";
	// $.ajax({
	// 	type: 'POST',
	// 	url: '/hku/admin/insertUserExcel',
	// 	data: formData,
	// 	dataType: "JSON",
	// 	processData: false,
	// 	contentType: false,
	// 	success: function(res) {
	// 		swal({
	// 			title: "일괄등록 성공!!",
	// 			icon: "success"
	// 		})
	// 		console.log("일괄등록 완료!!!!!!");
	// 		console.log(res);
	// 		studentsSet();
	// 	},
	// 	error: function (xhr, status, error) {
	// 		alert("출력실패");
	// 	}
	// });
}

function tabChange(){
	console.log("hi~");
	// console.log(document.querySelector("#professors-tab").classList);
	var tabButtons = document.querySelectorAll(".nav-link");
	var tabPanels = document.querySelectorAll(".tab-pane");

	tabButtons.forEach(function(btn) {
        btn.classList.remove("active");
		btn.setAttribute("aria-selected",false);
    });
	document.querySelector("#professors-tab").classList.add("active");
	document.querySelector("#professors-tab").setAttribute("aria-selected",true);

	tabPanels.forEach(function(panel) {
        panel.classList.remove("active");
	});

	var targetPanelId = document.querySelector("#professors-tab").getAttribute("data-bs-target");
	var targetPanel = document.querySelector(targetPanelId);
    targetPanel.classList.add("active");
}

function selectAll(target){
	const checkboxes = document.querySelectorAll(".userCheck");
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}
function onlyCheck(target){
	event.stopPropagation();
	console.log("오직 체크만",target.value);
	
}

function usersSet(){
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	let data = {
		"searchType": searchType,
		"searchWord": searchWord
	}

	console.log(data);

	$.ajax({
		type: 'POST',
		url: '/hku/admin/user-list',
		data: JSON.stringify(data),
		dataType: "JSON",
		// processData: false,
		contentType: "application/json;charset=UTF-8",
		success: function(res) {
			var users = $("#users");
			var tblStr = "";
			tblStr += `<div class='table-wrap'>
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
							<th>생년월일</th>
							<th>성별</th>
							<th>연락처</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {
								tblStr += `<tr onclick='userDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input userCheck' value='\${res[i].userNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].userNo }</td>
									<td>\${res[i].userNm }</td>
									<td>\${res[i].userClsNm }</td>
									<td>\${res[i].userBrdt }</td>
									<td>\${res[i].sexNm }</td>
									<td>\${res[i].userTelno }</td>
									<td>\${res[i].userMail }</td>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=8>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody>
				</table>
			</div>`;
			users.html(tblStr);
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});
}
function adminsSet(){
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	let data = {
		"searchType": searchType,
		"searchWord": searchWord
	}

	console.log(data);

	$.ajax({
		type: 'POST',
		url: '/hku/admin/admin-list',
		data: JSON.stringify(data),
		dataType: "JSON",
		// processData: false,
		contentType: "application/json;charset=UTF-8",
		success: function(res) {
			console.log("res",res);
			var admins = $("#admins");
			var tblStr = "";
			tblStr += `<div class='table-wrap'>
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
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++){
								tblStr += `<tr onclick='userDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input userCheck' value='\${res[i].userNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].userNo }</td>
									<td>\${res[i].userNm }</td>
									<td>\${res[i].userClsNm }</td>
									<td>\${res[i].empDeptNm }</td>
									<td>\${res[i].empJbttlNm }</td>
									<td>\${res[i].empJbgdNm }</td>
									<td>\${res[i].userBrdt }</td>
									<td>\${res[i].sexNm }</td>
									<td>\${res[i].userTelno }</td>
									<td>\${res[i].userMail }</td>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=11>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody>
				</table>
			</div>`;
			admins.html(tblStr);
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});
}
function professorsSet(){
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	let data = {
		"searchType": searchType,
		"searchWord": searchWord
	}

	console.log(data);

	$.ajax({
		type: 'POST',
		url: '/hku/admin/professor-list',
		data: JSON.stringify(data),
		dataType: "JSON",
		// processData: false,
		contentType: "application/json;charset=UTF-8",
		success: function(res) {
			var professors = $("#professors");
			var tblStr = "";
			tblStr += `<div class='table-wrap'>
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
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++) {

								tblStr += `<tr onclick='userDetail(this)'>
										<td>
											<div class='form-check custom-checkbox checkbox-danger'>
												<input type='checkbox' class='form-check-input userCheck' value='\${res[i].userNo }' onclick="onlyCheck(this)">
											</div>
										</td>
										<td>\${res[i].userNo }</td>
										<td>\${res[i].userNm }</td>
										<td>\${res[i].userClsNm }</td>
										<td>\${res[i].proJbttlNm }</td>
										<td>\${res[i].deptNm }</td>
										<td>\${res[i].userBrdt }</td>
										<td>\${res[i].sexNm }</td>
										<td>\${res[i].userTelno }</td>
										<td>\${res[i].userMail }</td>
									</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=10>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody>
				</table>
			</div>`;
			professors.html(tblStr);
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});
}
function studentsSet(){
	var searchType = $("#searchType").val();
	var searchWord = $("#searchWord").val();
	let data = {
		"searchType": searchType,
		"searchWord": searchWord
	}

	console.log(data);

	$.ajax({
		type: 'POST',
		url: '/hku/admin/student-list',
		data: JSON.stringify(data),
		dataType: "JSON",
		// processData: false,
		contentType: "application/json;charset=UTF-8",
		success: function(res) {
			// console.log("또체킁 : ",res);
			var students = $("#students");
			var tblStr = "";
			tblStr += `<div class='table-wrap'>
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
					<tbody>`;
						if(res != null && res.length > 0) {
							for(let i=0; i<res.length; i++){
								tblStr += `<tr onclick='userDetail(this)'>
									<td>
										<div class='form-check custom-checkbox checkbox-danger'>
											<input type='checkbox' class='form-check-input userCheck' value='\${res[i].userNo }' onclick="onlyCheck(this)">
										</div>
									</td>
									<td>\${res[i].userNo }</td>
									<td>\${res[i].userNm }</td>
									<td>\${res[i].userClsNm }</td>
									<td>\${res[i].deptNm }</td>
									<td>\${res[i].userBrdt }</td>
									<td>\${res[i].sexNm }</td>
									<td>\${res[i].userTelno }</td>
									<td>\${res[i].userMail }</td>
								</tr>`;
							}
						} else {
							tblStr += "<tr><td colspan=9>검색 결과가 없습니다.</td></tr>";
						}
			tblStr += `</tbody>
				</table>
			</div>`;
			students.html(tblStr);
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});
}
function deleteUser(){
	var delUserArr = new Array();
	// let users = document.querySelectorAll(".userCheck");
	let users = $(".userCheck");
	for(let i=0; i<users.length; i++){
		if(users[i].checked == true){
			console.log(users[i]);
			let userType = $(users[i]).parents("tr").children().eq(3).html();
			console.log(userType);

			let delUser = {
				"type": userType,
				"userNo": users[i].value
			};
			delUserArr.push(delUser);
		}
	}
	if(delUserArr.length == 0){
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
			console.log(delUserArr);
			console.log(JSON.stringify(delUserArr));
			$.ajax({
				type: 'DELETE',
				url: '/hku/admin/user-management',
				data: JSON.stringify(delUserArr),
				dataType: "text",
				// processData: false,
				contentType: 'application/json;charset=UTF-8',
				success: function (res) {
					usersSet();
					adminsSet();
					professorsSet();
					studentsSet();
		
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
		<div class="col-sm-2 mbKYW">
			<label class="form-label lmbKYW">생년월일</label>
			<input type="text" class="form-control" id="userBrdt" placeholder="생년월일(8자리)">
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
			<label class="form-label lmbKYW">주민등록번호</label>
			<input type="text" class="form-control" id="userRrno" placeholder="주민등록번호를 입력해주세요">
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
				<input type="text" class="form-control" id="proJncmpYmd" placeholder="입사일을 입력해주세요">
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
				<input type="text" class="form-control" id="empJncmpYmd" placeholder="입사일을 입력해주세요">
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

	if($("#userNo").val() == ''){
		swal({
			title: "학번/교번을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userNm").val() == ''){
		swal({
			title: "이름을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userBrdt").val() == ''){
		swal({
			title: "생년월일을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userRrno").val() == ''){
		swal({
			title: "주민등록번호를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#sexCd").val() == ''){
		swal({
			title: "성별을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userTelno").val() == ''){
		swal({
			title: "연락처를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userMail").val() == ''){
		swal({
			title: "이메일을 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#bankCd").val() == ''){
		swal({
			title: "은행을 선택해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userActno").val() == ''){
		swal({
			title: "계좌번호를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userZip").val() == ''){
		swal({
			title: "우편번호를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userAddr").val() == ''){
		swal({
			title: "기본주소를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}
	if($("#userDaddr").val() == ''){
		swal({
			title: "상세주소를 입력해주세요!", 
			icon: "error"
		});
		return false;
	}

	if(userClsCd == 'student') {
		if($("#deptCd").val() == ''){
			swal({
				title: "학과를 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
	} else if(userClsCd == 'professor'){
		if($("#deptCd").val() == ''){
			swal({
				title: "학과를 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#proJbttlCd").val() == ''){
			swal({
				title: "직책을 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#proJncmpYmd").val() == ''){
			swal({
				title: "입사일을 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#proLab").val() == ''){
			swal({
				title: "연구실을 입력해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#proLabTelno").val() == ''){
			swal({
				title: "연구실 전화번호를 입력해주세요!", 
				icon: "error"
			});
			return false;
		}	
	} else if(userClsCd == 'admin'){
		if($("#empDeptCd").val() == ''){
			swal({
				title: "부서를 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#empJbttlCd").val() == ''){
			swal({
				title: "직급을 선택해주세요!", 
				icon: "error"
			});
			return false;
		}	
		if($("#empJbgdCd").val() == ''){
			swal({
				title: "직책을 선택해주세요!", 
				icon: "error"
			});
			return false;
		}
	}

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
			if(userClsCd == "student"){
				studentsSet();
			} else if(userClsCd == "professor"){
				professorsSet();
			} else if(userClsCd == "admin"){
				adminsSet();
			}
			swal({
				title: "사용자 등록이 완료되었습니다!", 
				icon: "success"
			});
			var selectTarget = $("#selectTarget");
			var stVal = selectTarget.val();
			$("#profileImg").attr("src", "/images/user(2).png");
			$("#profile").val(null); // ????
			insertFormSet(stVal);
			console.log("휴~");
		},
		error: function (xhr, status, error) {
			alert("출력실패");
		}
	});

}
</script>