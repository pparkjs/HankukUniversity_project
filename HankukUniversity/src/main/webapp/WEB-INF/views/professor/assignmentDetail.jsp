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
	<div class="container-fluid">
		<!-- row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title" style="font-size:2em;">과제등록</h4>
					</div>
					<div class="card-body">
						<div class="form-validation">
							<form class="needs-validation" action="/hku/professor/regiAssignment" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-xl-12">
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"   
												for="validationCustom01">교수명
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control"
													id="validationCustom01" disabled value=${pro.proNm }>
												<div class="invalid-feedback">
												</div>
											</div>
											<label class="col-lg-1 col-form-label"
												for="validationCustom02">과목명 <span
												class="text-danger"></span>
											</label>
											<div class="col-lg-3">
												<input type="text" class="form-control
													id="validationCustom02" value="시스템프로그래밍"
													disabled>
												<div class="invalid-feedback"></div>
											</div>
										</div>
										
										<div class="mb-3 row">
											<label class="col-lg-1 col-form-label"
												for="validationCustom03">제목<span
												class="text-danger">*</span>
											</label>
											<div class="col-lg-7">
												<input type="text" id="asmTtl" class="form-control"
													id="validationCustom03" placeholder="제목을 입력하세요"
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
												<textarea id="asmCn" class="form-control h-50" id="validationCustom04"
													 rows="10" placeholder="내용을 입력하세요"
													required=""></textarea>
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
													<select class="default-select wide form-control"
														id="validationCustom05">
														<c:forEach var="i" begin="1" end="15" step="1">
															<option><span>${i }주차</span></option>
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
												<input type="file" class="form-control"
													id="validationCustom06" placeholder="파일을 선택하세요">
												<div class="invalid-feedback">
												</div>
											</div>
										</div>
										<hr>
										<div class="mb-3 row">
											<div class="col-lg-7 ms-auto" style="padding-left:40%">
												<button type="submit" id="regBtn" class="btn btn-primary">등록</button>
												<button type="button" id="listBtn" class="btn btn-danger light">목록</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xl-12">
						<div class="card">
							<div class="card-body p-0">
								<div class="table-responsive active-projects manage-client">
								<div class="tbl-caption">
									<h4 class="heading mb-0">과제제출현황</h4>
								</div>
								<table>
										<thead>
											<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Invoice #: activate to sort column descending" style="width: 150.406px;">학번</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Customer: activate to sort column ascending" style="width: 157.297px;">이름</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 151.422px;">학과</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Due Date: activate to sort column ascending" style="width: 151.422px;">제출일자</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Amount: activate to sort column ascending" style="width: 123.234px;">과제확인</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Amount Open: activate to sort column ascending" style="width: 182.953px;">과제점수</th>
											<th class="sorting" tabindex="0" aria-controls="reports-tbl" rowspan="1" colspan="1" aria-label="Adjustment: activate to sort column ascending" style="width: 156.109px;">제출확인</th>
										</thead>
										<tbody>											
										<tr role="row" class="odd">
												<td class="sorting_1">
													<a href="javascript:void(0)" class="text-primary">INV-00001</a>
												</td>
												<td><span>2022001</span></td>
												<td>
													<span>황지현</span>
												</td>
												<td>
													<span>컴퓨터공학</span>
												</td>	
												<td>
													<span class="text-secondary">2023/07/13</span>
												</td>
												<td>
													<span class="text-secondary">다운로드</span>
												</td>
												<td>
													<span class="text-secondary">80</span>
												</td>
												<td>
													<button type="button" class="btn btn-primary">확인</button>
												</td>
											</tr>
											</tbody>
										</table>
									<div class="dataTables_info" id="reports-tbl_info" role="status" aria-live="polite">Showing 1 to 10 of 24 entries</div><div class="dataTables_paginate paging_simple_numbers" id="reports-tbl_paginate"><a class="paginate_button previous disabled" aria-controls="reports-tbl" data-dt-idx="0" tabindex="0" id="reports-tbl_previous"><i class="fa-solid fa-angle-left"></i></a><span><a class="paginate_button current" aria-controls="reports-tbl" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="reports-tbl" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="reports-tbl" data-dt-idx="3" tabindex="0">3</a></span><a class="paginate_button next" aria-controls="reports-tbl" data-dt-idx="4" tabindex="0" id="reports-tbl_next"><i class="fa-solid fa-angle-right"></i></a></div></div>
								</div>
							</div>
						</div>
					</div>
		</div>
	</div>
<script>
var asmCn = document.querySelector("#asmCn"); 
var asmTtl = document.querySelector("#asmTtl"); 
	
	function alertF(){
		if(asmCn == " " || asmCn == null){
			alert("내용을 입력해주세요");
			return false;
			asmCn.focus();
		}
		
		if( asmTtl == " " || asmTtl == null){
			alert("제목을 입력해주세요");
			return false;
			asmCn.focus();
		}
	}

listBtn.addEventListener("click", function(){
	location.href="/hku/professor/assignmentList";
})


</script>