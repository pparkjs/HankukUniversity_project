<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-center">
	<div class="modal-content">
	  <div class="modal-header">
		<h1 class="modal-title fs-5" id="exampleModalLabel1">Invite Employee</h1>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	  </div>
	  <div class="modal-body">
			<div class="row">
				<div class="col-xl-12">
					<label class="form-label">Email ID<span class="text-danger">*</span></label>
					<input type="email" class="form-control" placeholder="hello@gmail.com">
					<label class="form-label mt-3">Employment date<span class="text-danger">*</span></label>
					<input class="form-control" type="date">
					<div class="row">
						<div class="col-xl-6">
							<label class="form-label mt-3">First Name<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Name">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-3">Last Name<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Surname">
							</div>
						</div>
					</div>
					<div class="mt-3 invite">
						<label class="form-label">Send invitation email<span class="text-danger">*</span></label>
						<input type ="email" class="form-control " placeholder="+ invite">
					</div>
					
			
				</div>
			</div>
			
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary">Save changes</button>
	  </div>
	</div>
  </div>
</div>