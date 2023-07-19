<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li><h5 class="bc-title">클래스룸</h5></li>
			<li class="breadcrumb-item"><a href="javascript:void(0)"> <svg
						width="17" height="17" viewBox="0 0 17 17" fill="none"
						xmlns="http://www.w3.org/2000/svg">
							<path
							d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z"
							stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"></path>
							<path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C"
							stroke-linecap="round" stroke-linejoin="round"></path>
						</svg> 클래스룸 메인
			</a></li>
		</ol>
	</div>
	<!-- row -->
	<div class="container-fluid">
		<div class="col-xl-9 bst-seller">
			<div class="card">
				<div class="card-body p-0">
					<div
						class="table-responsive active-projects style-1 ItemsCheckboxSec shorting ">
						<div class="tbl-caption">
							<h4 class="heading mb-0">공지사항</h4>
							<div>
								<a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas"
									href="#offcanvasExample" role="button"
									aria-controls="offcanvasExample">등록</a>
							</div>
						</div>
						<div id="empoloyees-tbl_wrapper"
							class="dataTables_wrapper no-footer">
							<div class="dt-buttons"></div>
							<table id="empoloyees-tbl" class="table dataTable no-footer"
								role="grid" aria-describedby="empoloyees-tbl_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label=": activate to sort column descending"
											style="width: 27.8px;">
											<div class="form-check custom-checkbox ms-0">
												<input type="checkbox"
													class="form-check-input checkAllInput" id="checkAll2"
													required=""> <label class="form-check-label"
													for="checkAll2"></label>
											</div>
										</th>
										<th class="sorting" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-label="Employee ID: activate to sort column ascending"
											style="width: 98.6px;">No</th>
										<th class="sorting" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-label="Employee Name: activate to sort column ascending"
											style="width: 167.4px;">작성자</th>
										<th class="sorting" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-label="Email Address: activate to sort column ascending"
											style="width: 107.225px;">제목</th>
										<th class="sorting" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-label="Contact Number: activate to sort column ascending"
											style="width: 124.787px;">작성일</th>
										<th class="sorting" tabindex="0"
											aria-controls="empoloyees-tbl" rowspan="1" colspan="1"
											aria-label="Gender: activate to sort column ascending"
											style="width: 65.0125px;">조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="odd">
										<td class="sorting_1">
											<div class="form-check custom-checkbox">
												<input type="checkbox" class="form-check-input"
													id="customCheckBox100" required=""> <label
													class="form-check-label" for="customCheckBox100"></label>
											</div>
										</td>
										<td><span>1</span></td>
										<td>
											<div class="products">
												<!-- 												<img src="images/contacts/pic2.jpg" class="avatar avatar-md" -->
												<!-- 													alt=""> -->
												<div>
													<h6>이성엽</h6>
												</div>
											</div>
										</td>
										<td><a href="javascript:void(0)" class="text-primary">코딩이
												장난임니까 ?</a></td>
										<td><span>2023/07/07</span></td>
										<td><span>0</span></td>
										</td>
									</tr>
							</table>
							<div class="dataTables_info" id="empoloyees-tbl_info"
								role="status" aria-live="polite">Showing 6 to 10 of 15
								entries</div>
							<div class="dataTables_paginate paging_simple_numbers"
								id="empoloyees-tbl_paginate">
								<a class="paginate_button previous"
									aria-controls="empoloyees-tbl" data-dt-idx="0" tabindex="0"
									id="empoloyees-tbl_previous"><i
									class="fa-solid fa-angle-left"></i></a><span><a
									class="paginate_button " aria-controls="empoloyees-tbl"
									data-dt-idx="1" tabindex="0">1</a><a
									class="paginate_button current" aria-controls="empoloyees-tbl"
									data-dt-idx="2" tabindex="0">2</a><a class="paginate_button "
									aria-controls="empoloyees-tbl" data-dt-idx="3" tabindex="0">3</a></span><a
									class="paginate_button next" aria-controls="empoloyees-tbl"
									data-dt-idx="4" tabindex="0" id="empoloyees-tbl_next"><i
									class="fa-solid fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>