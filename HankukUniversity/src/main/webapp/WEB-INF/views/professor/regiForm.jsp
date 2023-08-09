<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
.form-control:disabled, .form-control[readonly] {
	background: #e9ecef;
	opacity: 1;
}

.col-form-label {
	padding-top: calc(0.375rem + 1px);
	padding-bottom: calc(0.375rem + 1px);
	margin-bottom: 0;
	font-size: 16px;
	line-height: 1.5;
	color: #716f6f;
}

.bootstrap-select .dropdown-toggle .filter-option-inner-inner {
	overflow: hidden;
	font-size: 14px;
}

.text {
	font-size: 15px;
}
</style>

<div class="content-body">
	<c:set value="등록" var="name" />
	<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name" />
	</c:if>
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title" style="font-size: 2em;">과제 ${name }</h4>
						<input type="button" id="autoWrite" class="btn btn-primary" style="background-color: #f1e9e9;
    						border-color: #f1e9e9; color: #424040;" value="자동완성">
					</div>
					<div class="card-body">
						<div class="form-validation">
							<form class="needs-validation"
								action="/hku/professor/regiAssignment" method="post" enctype="multipart/form-data" id="regiForm" >
								<input type="hidden" name="lecapNo" id="lecapNo"
									value="${sessionScope.lecapNo }"/>
								<c:if test="${status eq 'u' }">
									<input type="hidden" name="asmNo" id="asmNo" value="${vo.asmNo }" />
								</c:if>
								<div class="row">
									<div class="col-xl-12">
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom01">교수명 </label>
											<div class="col-lg-3">
												<input type="text" class="form-control" name="asmProNm"
													id="validationCustom01" readonly value="${pro.proNm }">
												<div class="invalid-feedback"></div>
											</div>
											<label class="col-lg-1 col-form-label"
												for="validationCustom02">과목명 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control" name="subNm"
													id="validationCustom02" readonly
													value="${sessionScope.subNm }">
												<div class="invalid-feedback"></div>
											</div>
										</div>

										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom03">제목<span class="text-danger">*</span>
											</label>
											<div class="col-lg-7">
												<input type="text" id="asmTtl" class="form-control"
													name="asmTtl" placeholder="제목을 입력하세요"
													value="${vo.asmTtl }" required="">
												<div class="invalid-feedback"></div>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom04">내용 <span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-7">
												<textarea class="form-control h-50" name="asmCn" id="asmCn"
													rows="10" placeholder="내용을 입력하세요" required="">${vo.asmTtl }</textarea>
												<div class="invalid-feedback">내용을 입력해주세요</div>
											</div>
										</div>

										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom05">주차 <span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-4">
												<div
													class="dropdown bootstrap-select default-select wide form-control">
													<select class="default-select wide form-control"
														name="asmWeek" id="weekSel">
														<c:forEach var="i" begin="1" end="15" step="1">
															<option value="${i }">${i }주차</option>
														</c:forEach>
													</select>

													<div class="dropdown-menu ">
														<div class="inner show" role="listbox" id="bs-select-1"
															tabindex="-1">
															<ul class="dropdown-menu inner show" role="presentation"></ul>
														</div>
													</div>
												</div>
												<div class="invalid-feedback"></div>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom06">파일 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-4">
												<input type="file" class="form-control" name="assignFile"
													id="atchFileNo" placeholder="파일을 선택하세요"
													value="${atchFileNo }">
												<div class="invalid-feedback"></div>
											</div>
										</div>
										<hr>
										<div class="mb-3 row">
											<div class="col-lg-7 ms-auto" style="padding-left:47%">
												<input type="button" id="regBtn" value="${name}" class="btn btn-primary"/>
												<c:if test="${status eq 'u' }">
													<input type="button" id="cancelBtn" value="취소" class="btn btn-primary"/>
												</c:if>
												<c:if test="${status ne 'u' }">
													<input type="button" id="listBtn" value="목록" class="btn btn-danger light"/>
												</c:if>
											</div>
										</div>
									</div>
								</div>
								<sec:csrfInput/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){

	

var listBtn = $("#listBtn");
var regBtn = $("#regBtn");
var cancelBtn = $("#cancelBtn");
var regiForm = $("#regiForm");
var asmNo = $("#asmNo").val();
var autoWrite = $("#autoWrite");

autoWrite.on('click', function(){
	var asmTtl = $("#asmTtl");
	var asmCn = $("#asmCn");
	var title = "14주차 과제";
	var content = "14주차 과제입니다. 수업내용 이해도 확인을 위한 기말고사 전 마지막 과제이니 첨부된 파일 확인 후  성실히 작성해서 제출바랍니다."
	
	asmTtl.val(title);
	asmCn.val(content);
		
})

listBtn.on("click", function(){
	var lecapNo = $("#lecapNo").val();
	location.href= "/hku/professor/assignmentList/"+lecapNo ;
})

cancelBtn.on("click", function(){
	location.href = "/hku/professor/assignmentDetail/"+asmNo;
})

regBtn.on("click", function(){
	var asmTtl = $("#asmTtl").val();
	var asmCn = $("#asmCn").val();
	
	if(asmTtl == '' || asmTtl == null){
		swal ("", "제목을 입력해주세요","error");
		return false;
	}
	
	if(asmCn == '' || asmCn == null) {
		swal ("", "내용을 입력해주세요","error");
		
		return false;
 	}

	if($(this).val() == "수정"){
		console.log("여기 실행")
		regiForm.attr("action", "/hku/professor/updateAssignment");
	} 
	
	regiForm.submit();
	swal("", "과제가 등록되었습니다", "success")
	
  })
})
</script>