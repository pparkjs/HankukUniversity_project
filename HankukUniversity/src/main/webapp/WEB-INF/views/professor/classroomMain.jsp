<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="col-xl-9 bst-seller">
	<div class="card">
		<div class="card-body p-0">
			<div
				class="table-responsive active-projects style-1 ItemsCheckboxSec shorting ">
				<div class="tbl-caption">
					<h4 class="heading mb-0">Employees</h4>
					<div>
						<a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas"
							href="#offcanvasExample" role="button"
							aria-controls="offcanvasExample">+ Add Employee</a>
						<button type="button" class="btn btn-secondary btn-sm"
							data-bs-toggle="modal" data-bs-target="#exampleModal1">+
							Invite Employee</button>
					</div>
				</div>
				<div id="empoloyees-tbl_wrapper"
					class="dataTables_wrapper no-footer">
					<div class="dt-buttons">
						<button
							class="dt-button buttons-excel buttons-html5 btn btn-sm border-0"
							tabindex="0" aria-controls="empoloyees-tbl" type="button">
							<span><i class="fa-solid fa-file-excel"></i> Export Report</span>
						</button>
					</div>
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
										<input type="checkbox" class="form-check-input checkAllInput"
											id="checkAll2" required=""> <label
											class="form-check-label" for="checkAll2"></label>
									</div>
								</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Employee ID: activate to sort column ascending"
									style="width: 98.6px;">Employee ID</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Employee Name: activate to sort column ascending"
									style="width: 167.4px;">Employee Name</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Email Address: activate to sort column ascending"
									style="width: 107.225px;">Email Address</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Contact Number: activate to sort column ascending"
									style="width: 124.787px;">Contact Number</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Gender: activate to sort column ascending"
									style="width: 65.0125px;">Gender</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Location: activate to sort column ascending"
									style="width: 72.3875px;">Location</th>
								<th class="sorting" tabindex="0" aria-controls="empoloyees-tbl"
									rowspan="1" colspan="1"
									aria-label="Status: activate to sort column ascending"
									style="width: 74.0625px;">Status</th>
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
								<td><span>1018</span></td>
								<td>
									<div class="products">
										<img src="images/contacts/pic2.jpg" class="avatar avatar-md"
											alt="">
										<div>
											<h6>
												<a href="javascript:void(0)">Mony Antony</a>
											</h6>
											<span>Web Designer</span>
										</div>
									</div>
								</td>
								<td><a href="javascript:void(0)" class="text-primary">ma@gmail.com</a></td>
								<td><span>+62 123 456 7890</span></td>
								<td><span>Female</span></td>
								<td><span>WA</span></td>
								<td><span class="badge badge-success light border-0">Active</span>
								</td>
							</tr>
							<tr role="row" class="even">
								<td class="sorting_1">
									<div class="form-check custom-checkbox">
										<input type="checkbox" class="form-check-input"
											id="customCheckBox1111" required=""> <label
											class="form-check-label" for="customCheckBox1111"></label>
									</div>
								</td>
								<td><span>1018</span></td>
								<td>
									<div class="products">
										<img src="images/contacts/pic1.jpg" class="avatar avatar-md"
											alt="">
										<div>
											<h6>
												<a href="javascript:void(0)">Ankites Risher</a>
											</h6>
											<span>Web Designer</span>
										</div>
									</div>
								</td>
								<td><a href="javascript:void(0)" class="text-primary">ar@gmail.com</a></td>
								<td><span>+62 123 456 7890</span></td>
								<td><span>Female</span></td>
								<td><span>AL</span></td>
								<td><span class="badge badge-success light border-0">Active</span>
								</td>
							</tr>
							<tr role="row" class="odd">
								<td class="sorting_1">
									<div class="form-check custom-checkbox">
										<input type="checkbox" class="form-check-input"
											id="customCheckBox1111" required=""> <label
											class="form-check-label" for="customCheckBox1111"></label>
									</div>
								</td>
								<td><span>1018</span></td>
								<td>
									<div class="products">
										<img src="images/contacts/pic2.jpg" class="avatar avatar-md"
											alt="">
										<div>
											<h6>
												<a href="javascript:void(0)">Elijah James</a>
											</h6>
											<span>Software Developer</span>
										</div>
									</div>
								</td>
								<td><a href="javascript:void(0)" class="text-primary">ar@gmail.com</a></td>
								<td><span>+85 123 456 7890</span></td>
								<td><span>Female</span></td>
								<td><span>AL</span></td>
								<td><span class="badge badge-success light border-0">Active</span>
								</td>
							</tr>
							<tr role="row" class="even">
								<td class="sorting_1">
									<div class="form-check custom-checkbox">
										<input type="checkbox" class="form-check-input"
											id="customCheckBox1122" required=""> <label
											class="form-check-label" for="customCheckBox1122"></label>
									</div>
								</td>
								<td><span>1018</span></td>
								<td>
									<div class="products">
										<img src="images/contacts/pic3.jpg" class="avatar avatar-md"
											alt="">
										<div>
											<h6>
												<a href="javascript:void(0)">Elijah James</a>
											</h6>
											<span>Software Developer</span>
										</div>
									</div>
								</td>
								<td><a href="javascript:void(0)" class="text-primary">ej@gmail.com</a></td>
								<td><span>+69 123 456 7890</span></td>
								<td><span>Male</span></td>
								<td><span>AL</span></td>
								<td><span class="badge badge-success light border-0">Active</span>
								</td>
							</tr>
							<tr role="row" class="odd">
								<td class="sorting_1">
									<div class="form-check custom-checkbox">
										<input type="checkbox" class="form-check-input"
											id="customCheckBox100" required=""> <label
											class="form-check-label" for="customCheckBox100"></label>
									</div>
								</td>
								<td><span>1018</span></td>
								<td>
									<div class="products">
										<img src="images/contacts/pic3.jpg" class="avatar avatar-md"
											alt="">
										<div>
											<h6>
												<a href="javascript:void(0)">Tony Antony</a>
											</h6>
											<span>Web Designer</span>
										</div>
									</div>
								</td>
								<td><a href="javascript:void(0)" class="text-primary">ta@gmail.com</a></td>
								<td><span>+78 123 456 7890</span></td>
								<td><span>Female</span></td>
								<td><span>NYC</span></td>
								<td><span class="badge badge-success light border-0">Active</span>
								</td>
							</tr>
						</tbody>

					</table>
					<div class="dataTables_info" id="empoloyees-tbl_info" role="status"
						aria-live="polite">Showing 6 to 10 of 15 entries</div>
					<div class="dataTables_paginate paging_simple_numbers"
						id="empoloyees-tbl_paginate">
						<a class="paginate_button previous" aria-controls="empoloyees-tbl"
							data-dt-idx="0" tabindex="0" id="empoloyees-tbl_previous"><i
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