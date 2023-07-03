<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="offcanvasExample">
  <div class="offcanvas-header">
  <h5 class="modal-title" id="#gridSystemModal">Add Employee</h5>
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
		<i class="fa-solid fa-xmark"></i>
	</button>
  </div>
  <div class="offcanvas-body">
	<div class="container-fluid">
		<div>
			<label>Profile Picture</label>
			<div class="dz-default dlab-message upload-img mb-3">
				<form action="#" class="dropzone">
					<svg width="41" height="40" viewBox="0 0 41 40" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M27.1666 26.6667L20.4999 20L13.8333 26.6667" stroke="#DADADA" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
						<path d="M20.5 20V35" stroke="#DADADA" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
						<path d="M34.4833 30.6501C36.1088 29.7638 37.393 28.3615 38.1331 26.6644C38.8731 24.9673 39.027 23.0721 38.5703 21.2779C38.1136 19.4836 37.0724 17.8926 35.6111 16.7558C34.1497 15.619 32.3514 15.0013 30.4999 15.0001H28.3999C27.8955 13.0488 26.9552 11.2373 25.6498 9.70171C24.3445 8.16614 22.708 6.94647 20.8634 6.1344C19.0189 5.32233 17.0142 4.93899 15.0001 5.01319C12.9861 5.0874 11.015 5.61722 9.23523 6.56283C7.45541 7.50844 5.91312 8.84523 4.7243 10.4727C3.53549 12.1002 2.73108 13.9759 2.37157 15.959C2.01205 17.9421 2.10678 19.9809 2.64862 21.9222C3.19047 23.8634 4.16534 25.6565 5.49994 27.1667" stroke="#DADADA" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
						<path d="M27.1666 26.6667L20.4999 20L13.8333 26.6667" stroke="#DADADA" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
					</svg>
					<div class="fallback">
						<input name="file" type="file" multiple>
						
					</div>
				</form>
			</div>	
		</div>
		<form>
			<div class="row">
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput1" class="form-label">Employee ID <span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="">
				</div>	
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput2" class="form-label">Employee Name<span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="exampleFormControlInput2" placeholder="">
				</div>	
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput3" class="form-label">Employee Email<span class="text-danger">*</span></label>
					<input type="email" class="form-control" id="exampleFormControlInput3" placeholder="">
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput4" class="form-label">Password<span class="text-danger">*</span></label>
					<input type="password" class="form-control" id="exampleFormControlInput4" placeholder="">
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Designation<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">Software Engineer</option>
						<option value="css">Civil Engineer</option>
						<option value="javascript">Web Doveloper</option>
					</select>
				</div>	
				<div class="col-xl-6 mb-3">
					<label class="form-label">Department<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">Software</option>
						<option value="css">Doit</option>
						<option value="javascript">Designing</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Country<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">Ind</option>
						<option value="css">USA</option>
						<option value="javascript">UK</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput88" class="form-label">Mobile<span class="text-danger">*</span></label>
					<input type="number" class="form-control" id="exampleFormControlInput88" placeholder="">
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Gender<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">Male</option>
						<option value="css">Female</option>
						<option value="javascript">Other</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput99" class="form-label">Joining Date<span class="text-danger">*</span></label>
					<input type="date" class="form-control" id="exampleFormControlInput99">
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput8" class="form-label">Date of Birth<span class="text-danger">*</span></label>
					<input type="date" class="form-control" id="exampleFormControlInput8">
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInput10" class="form-label">Reporting To<span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="exampleFormControlInput10" placeholder="">
				</div>		
				<div class="col-xl-6 mb-3">
					<label class="form-label">Language Select<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">English</option>
						<option value="css">Hindi</option>
						<option value="javascript">Canada</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">User Role<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Please select</option>
						<option value="html">Parmanent</option>
						<option value="css">Parttime</option>
						<option value="javascript">Per Hours</option>
					</select>
				</div>
				<div class="col-xl-12 mb-3">
					<label class="form-label">Address<span class="text-danger">*</span></label>
					<textarea rows="2" class="form-control"></textarea>
				</div>
				<div class="col-xl-12 mb-3">
					<label class="form-label">About<span class="text-danger">*</span></label>
					<textarea rows="2" class="form-control"></textarea>
				</div>	
			</div>
			<div>
				<button class="btn btn-primary me-1">Submit</button>
				<button class="btn btn-danger light ms-1">Cancel</button>
			</div>
		</form>
	  </div>
  </div>
</div>		

<div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="offcanvasExample1">
  <div class="offcanvas-header">
  <h5 class="modal-title" id="#gridSystemModal1">Add New Task</h5>
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
		<i class="fa-solid fa-xmark"></i>
	</button>
  </div>
  <div class="offcanvas-body">
	<div class="container-fluid">
		<form>
			<div class="row">
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInputfirst" class="form-label">Title<span class="text-danger">*</span></label>
					<input type="text" class="form-control" id="exampleFormControlInputfirst" placeholder="Title">
				</div>	
				<div class="col-xl-6 mb-3">
					<label class="form-label">Project<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Project</option>
						<option value="html">Salesmate</option>
						<option value="css">ActiveCampaign</option>
						<option value="javascript">Insightly</option>
					</select>
				</div>	
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInputthree" class="form-label">Start Date<span class="text-danger">*</span></label>
					<input type="date" class="form-control" id="exampleFormControlInputthree">
				</div>
				<div class="col-xl-6 mb-3">
					<label for="exampleFormControlInputfour" class="form-label">End Date<span class="text-danger">*</span></label>
					<input type="date" class="form-control" id="exampleFormControlInputfour">
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Estimated Hour<span class="text-danger">*</span></label>
					<div class="input-group">
						<input type="text" class="form-control" value="09:30"><span class="input-group-text"><i
									class="fas fa-clock"></i></span>
                          </div>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Status<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Status</option>
						<option value="html">In Progess</option>
						<option value="css">Pending</option>
						<option value="javascript">Completed</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">priority<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">priority</option>
						<option value="html">Hight</option>
						<option value="css">Medium</option>
						<option value="javascript">Low</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Category<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Category</option>
						<option value="html">Designing</option>
						<option value="css">Development</option>
						<option value="javascript">react developer</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Permission<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Permission</option>
						<option value="html">Public</option>
						<option value="css">Private</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Deadline add<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Deadline</option>
						<option value="html">Yes</option>
						<option value="css">No</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Assigned to<span class="text-danger">*</span></label>
					<select class="default-select form-control">
						<option  data-display="Select">Assigned</option>
						<option value="html">Bernard</option>
						<option value="css">Sergey Brin</option>
						<option value="javascript"> Larry Ellison</option>
					</select>
				</div>
				<div class="col-xl-6 mb-3">
					<label class="form-label">Responsible Person<span class="text-danger">*</span></label>
					<input name='tagify' class="form-control py-0 ps-0" value='James, Harry'>
					
				</div>
				<div class="col-xl-12 mb-3">
					<label class="form-label">Description<span class="text-danger">*</span></label>
					<textarea rows="3" class="form-control"></textarea>
				</div>
				<div class="col-xl-12 mb-3">
					<label class="form-label">Summary<span class="text-danger">*</span></label>
					<textarea rows="3" class="form-control"></textarea>
				</div>
				
			</div>
			<div>
				<button class="btn btn-primary me-1">Help Desk</button>
				<button class="btn btn-danger light ms-1">Cancel</button>
			</div>
		</form>
	  </div>
  </div>
</div>