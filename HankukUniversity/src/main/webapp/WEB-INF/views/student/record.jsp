<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">메인대쉬보드</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<ul class="nav nav-pills mb-4 light">
				<li class=" nav-item">
					<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false">학생정보</a>
				</li>
				<li class="nav-item">
					<a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false">학적</a>
				</li>
			</ul>
			
			<!-- tab1 -->
			<div class="tab-content">
				<div id="navpills-1" class="tab-pane active">
					<div class="row">
									
			<!-- 프로필 -->
			<div class="card-body">
				<div class="row">
					<div class="col-xl-3 col-lg-4">
						<div class="clearfix">
							<div class="card card-bx profile-card author-profile m-b30">
								<div class="card-body">
									<div class="p-5">
										<div class="author-profile">
											<div class="author-media">
												<img src="images/tab/1.jpg" alt="">
												<div class="upload-link" title="" data-toggle="tooltip" data-placement="right" data-original-title="update">
													<input type="file" class="update-flie">
													<i class="fa fa-camera"></i>
												</div>
											</div>
											<div class="author-info">
												프로필사진
											</div>
										</div>
									</div>			
								</div>
							</div>
						</div>
					</div>
					<!-- 프로필 end -->
					
					<div class="col-xl-9 col-lg-8" style="height: 40%">
						<div class="card profile-card card-bx m-b30">
							<div class="card-header">
								<h6 class="title">record information</h6>
							</div>
							<form class="profile-form">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-6 m-b30">
											<label class="form-label">이름</label>
											<input type="text" class="form-control" value="">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주소</label>
											<input type="text" class="form-control">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">학번</label>
											<input type="text" class="form-control" value="">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">연락처</label>
											<input type="text" class="form-control" value="">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주민등록번호</label>
											<input type="text" class="form-control">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">성별</label>
											<input type="text" class="form-control" value="">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">계좌번호</label>
											<input type="text" class="form-control" value="">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">이메일</label>
											<input type="text" class="form-control" value="">
										</div>
									</div>
								</div>
								<div class="card-footer" style="display: flex; justify-content: end; margin-right: 50px;">
									<button class="btn btn-primary">수정</button>
								</div>
							</form>
						</div>
					</div>
					</div>
				</div>
				
				<!-- tab2 -->
				<div id="navpills-2" class="tab-pane">
					<div class="row">
						Tab2
					</div>
				</div>
				
				</div>

				</div>
			</div>
		</div>
	</div>
</div>
