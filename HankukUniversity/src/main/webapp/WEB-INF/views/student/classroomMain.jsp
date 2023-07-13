<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/table.css">
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
				<div class="table-responsive active-projects style-1 attendance-tbl">
					<div class="tbl-caption">
						<h4 class="heading mb-0">
							<strong>출석현황</strong>
						</h4>
						<div>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary btn-sm"
								data-bs-toggle="modal" data-bs-target="#exampleModal">
								이의신청</button>
						</div>
					</div>
					<div id="attendance-tbl_wrapper"
						class="dataTables_wrapper no-footer">
						<div class="dt-buttons">
							<button
								class="dt-button buttons-excel buttons-html5 btn btn-sm border-0"
								tabindex="0" aria-controls="attendance-tbl" type="button">
								<span><i class="fa-solid fa-file-excel"></i> Export
									Report</span>
							</button>
						</div>
						<table id="attendance-tbl" class="table dataTable no-footer"
							role="grid" aria-describedby="attendance-tbl_info">
							<thead>
								<tr role="row">
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="Employee Name: activate to sort column ascending"
										style="width: 172.288px;"><strong>주차</strong></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="1
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>1</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															2
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>2</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															3
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>3</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															4
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>4</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															5
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>5</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															6
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>6</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															7
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>7</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															8
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>8</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															9
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>9</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															10
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>10</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															11
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>11</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															12
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>12</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															13
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>13</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															14
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>14</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															15
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>15</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															16
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>16</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															17
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>17</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															18
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>18</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															19
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>19</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															20
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>20</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															21
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>21</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															22
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>22</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															23
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>23</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															24
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>24</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															25
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>25</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															26
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>26</span>
										<p>MO</p></th>
									<th class="sorting_asc" tabindex="0"
										aria-controls="attendance-tbl" rowspan="1" colspan="1"
										aria-label="
															27
															MO
														: activate to sort column descending"
										style="width: 16.6625px;" aria-sort="ascending"><span>27</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															28
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>28</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															29
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>29</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															30
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>30</span>
										<p>MO</p></th>
									<th class="sorting" tabindex="0" aria-controls="attendance-tbl"
										rowspan="1" colspan="1"
										aria-label="
															31
															MO
														: activate to sort column ascending"
										style="width: 16.6625px;"><span>31</span>
										<p>MO</p></th>
									<th class="text-center sorting" tabindex="0"
										aria-controls="attendance-tbl" rowspan="1" colspan="1"
										aria-label="
															Total
															MO
														: activate to sort column ascending"
										style="width: 35.6875px;"><span>Total</span>
										<p>MO</p></th>
								</tr>
							</thead>
							<tbody>

								<tr role="row" class="odd">
									<td class="">
										<div class="products">
											<img src="images/contacts/pic3.jpg" class="avatar avatar-md"
												alt="">
											<div>
												<h6>${std.stdNm }</h6>
												<span>컴퓨터공학</span>
											</div>
										</div>
									</td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td class=""><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-danger"><i
											class="fa-regular fa-xmark"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td class="sorting_1"><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td><span class="text-success"><i
											class="fa-solid fa-check"></i></span></td>
									<td class="text-center"><span>28/31</span></td>
								</tr>
							</tbody>

						</table>
						<div class="dataTables_info" id="attendance-tbl_info"
							role="status" aria-live="polite">Showing 11 to 11 of 11
							entries</div>
						<div class="dataTables_paginate paging_simple_numbers"
							id="attendance-tbl_paginate">
							<a class="paginate_button previous"
								aria-controls="attendance-tbl" data-dt-idx="0" tabindex="0"
								id="attendance-tbl_previous"><i
								class="fa-solid fa-angle-left"></i></a><span><a
								class="paginate_button " aria-controls="attendance-tbl"
								data-dt-idx="1" tabindex="0">1</a><a
								class="paginate_button current" aria-controls="attendance-tbl"
								data-dt-idx="2" tabindex="0">2</a></span><a
								class="paginate_button next disabled"
								aria-controls="attendance-tbl" data-dt-idx="3" tabindex="0"
								id="attendance-tbl_next"><i class="fa-solid fa-angle-right"></i></a>
						</div>
					</div>
				</div><hr>			
				
				<div class="card-body p-0">
					<div
						class="table-responsive active-projects style-1 ItemsCheckboxSec shorting ">
						<div class="tbl-caption">
							<h4 class="heading mb-0">
								<strong>공지사항</strong>
							</h4>
							<div>
								<!-- 								<a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" -->
								<!-- 									href="#offcanvasExample" role="button" -->
								<!-- 									aria-controls="offcanvasExample">등록</a> -->
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
										<td><a href="javascript:void(0)" class="text-primary">
										1주차 과제 공지</a></td>
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