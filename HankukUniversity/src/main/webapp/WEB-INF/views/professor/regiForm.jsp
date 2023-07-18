
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    color : #716f6f;
}

.bootstrap-select .dropdown-toggle .filter-option-inner-inner {
    overflow: hidden;
    font-size: 14px;
}

.text{
	font-size:15px;
}

</style>

<div class="content-body">
<c:set value="등록" var="name"/>
<c:if test="${status eq 'u' }"> 
<c:set value="수정" var="name"/>
</c:if>
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title" style="font-size:2em;">과제 ${name }</h4>
					</div>
					<div class="card-body">
						<div class="form-validation">
							<form class="needs-validation" action="/hku/professor/regiAssignment" method="post" 
									id= "regiForm" enctype="multipart/form-data">
								<div class="row">
								<c:if test="${status eq 'u' }">
									<input type="hidden" name="asmNo" id="asmNo" value="${asmNo }"/>
								</c:if>
								<input type="hidden" name="lecapNo" value="${sessionScope.lecapNo }"/>
									<div class="col-xl-12">
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"   
												for="validationCustom01">교수명
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control" name="asmProNm"
													id="validationCustom01" readonly value="${pro.proNm }">
												<div class="invalid-feedback">
												</div>
											</div>
											<label class="col-lg-1 col-form-label"
												for="validationCustom02">과목명 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control" name="subNm"
													id="validationCustom02" readonly value="${sessionScope.subNm }">
												<div class="invalid-feedback"></div>
											</div>
										</div>
										
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom03">제목<span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-7">
												<input type="text" id="asmTtl" class="form-control" name="asmTtl"
													id="asmTtl" placeholder="제목을 입력하세요" value="${assignVo.asmTtl }"
													required="">
												<div class="invalid-feedback">
												</div>
											</div>
										</div>
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom04">내용 <span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-7">
												<textarea id="asmCn" class="form-control h-50" name="asmCn" id="asmCn"
													 rows="10" placeholder="내용을 입력하세요"
													required="">${assignVo.asmTtl }</textarea>
												<div class="invalid-feedback">내용을 입력해주세요 </div>
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
													<select class="default-select wide form-control" name="asmWeek"
														id="weekSel" value="${assignVo.asmWeek }">
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
													id="validationCustom05" placeholder="파일을 선택하세요" value="">
												<div class="invalid-feedback">
												</div>
											</div>
										</div>
										<hr>
										<div class="mb-3 row">
											<div class="col-lg-7 ms-auto" style="padding-left:40%">
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
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

var listBtn = document.querySelector("#listBtn");
var regBtn = document.querySelector("#regBtn");
// var weekSel = document.querySelector("#asmWeek");
// weekSel.addEventListener("change", selWeekF);

// function selWeekF(){
 	
// }

listBtn.addEventListener("click", function(){
	location.href="/hku/professor/assignmentList";
})

cancelBtn.addEventListener("click", function(){
	location.href = "/hku/professor/assignmentDetail/${asmNo}"
}

regBtn.addEventListener("click", function(){
	event.preventDefault();
	var asmTtl = document.querySelector("#asmTtl");
	var asmCn = document.querySelector("#asmCn");
	
	if(asmTtl == '' && asmTtl == null){
		Swal.fire({
			  icon: 'error',				 
			  text: '제목을 입력해주세요!'
			})
		return false;
	}
	
	if(asmCn == '' && asmCn == null) {
		Swal.fire({
			  icon: 'error',				 
			  text: '내용을 입력해주세요!'
			})
		return false;
 	}
	
	regiForm.submit();
	
})

</script>