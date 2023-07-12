<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<style>
.tbl{
	text-align: center;
}
.tbl thead th {
	border: none;
   	padding: 11px;
   	font-size: 20px;
}
.tbl tbody th, .tbl tbody td {
	border: none;
	padding: 15px;
	font-size: 16px;
	color:black;
}

.tbl tbody td {
	font-size: 17px;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">메인대쉬보드</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
									
			<div class="card-body">
				<div class="row">
					<div class="col-xl-3 col-lg-4" style="height: 1000px;">
						<div class="card card-bx profile-card author-profile m-b30" style="height: 300px;">
							<div class="card-header">
								<h6 class="title">Profile</h6>
							</div>
							<div class="card-body">
								<div class="p-5">
									<div class="author-profile">
										<div class="author-media">
											<div class="new-arrivals-img-contnent">
		                                        <img class="img-fluid" src="images/product/1.jpg" alt="">
		                                    </div>
										</div>
										<div class="author-info">
											<h6 class="title">asd</h6>
											<span>컴퓨터공학</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix" style="height: 600px;">
							<div class="card card-bx profile-card author-profile m-b30">
								<div class="card profile-card card-bx m-b30" style="max-width: 100%;">
								    <div class="card-header">
								        <h6 class="title">Records changed</h6>
								    </div>
								    <div style="overflow-x: auto;">
								        <table class="tbl">
								            <thead>
								                <tr>
								                    <th>날짜</th>
								                    <th>변동사항</th>
								                    <th>승인여부</th>
								                </tr>
								            </thead>
								            <tbody>
								                <tr>
								                    <td>2023-01-01</td>
								                    <td>휴학</td>
								                    <td>승인</td>
								                </tr>
								                <tr>
								                    <td>2023-01-01</td>
								                    <td>복학</td>
								                    <td>승인</td>
								                </tr>
								            </tbody>
								        </table>
								    </div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-xl-9 col-lg-8" style="height: 800px">
						<div class="card profile-card card-bx m-b30">
							<div class="card-header">
								<h6 class="title">Record information</h6>
							</div>
							<form class="profile-form">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-6 m-b30">
											<label class="form-label">이름</label>
											<input type="text" class="form-control" value="${student.stdNm }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">학번</label>
											<input type="text" class="form-control" value="${student.stdNo }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">성별</label>
											<input type="text" class="form-control" value="${student.comCdNm2 }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">학과</label>
											<input type="text" class="form-control" value="${student.deptNm }">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">학적</label>
											<input type="text" class="form-control" value="${student.comCdNm1 }">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주소</label>
											<input type="text" class="form-control" value="${student.stdAddr }${student.stdDaddr }">
										</div>
							
										<div class="col-sm-6 m-b30">
											<label class="form-label">연락처</label>
											<input type="text" class="form-control" value="${student.stdTelno }">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주민등록번호</label>
											<input type="text" class="form-control" value="${student.stdRrno }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">계좌번호</label>
											<input type="text" class="form-control" value="${student.stdActno }">
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">이메일</label>
											<input type="text" class="form-control" value="${student.stdMail }">
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
