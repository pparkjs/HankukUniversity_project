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
.author-profile .author-media img {
    width: 180px;
    height: 180px;
    border: 2px solid #800000;
    border-radius: 50%;
}
.profile-form .form-control{
	font-size: 18px;
}
.tbl tbody td {
	font-size: 17px;
}
.profile-form .form-label{
	font-size: 18px;
}
.title{
	font-size: 1.3em;
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
					<div class="col-xl-3 col-lg-4" style="height: 800px;">
						<div class="card card-bx profile-card author-profile m-b30" style="height: 350px;">
							<div class="card-header" style="margin-bottom: -10px;">
								<h6 class="title">Profile</h6>
							</div>
							<div class="card-body">
								<div class="author-profile" >
									<div class="author-media" style="margin-top: 25px;">
									<c:choose>
										<c:when test="${student.stdProfilePath eq null}">
											<img id="stdProfileImg" src="/images/user(2).png" alt="">
										</c:when>
										<c:otherwise>
											<img id="stdProfileImg" src="/download${student.stdProfilePath }" alt="">
											<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->										
										</c:otherwise>
									</c:choose>
									</div>
									<div class="author-info">
										<h5 class="title">프로필 이미지</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix" style="height: 428px;">
							<div class="card card-bx profile-card author-profile m-b30">
								<div class="card profile-card card-bx m-b30" style="max-width: 100%; height: 398px;">
								    <div class="card-header">
								        <h6 class="title">Records changed</h6>
								    </div>
								    <div style="overflow-x: auto;">
								        <table class="tbl">
								            <thead>            
								                <tr>
								                    <th style="width: 30%">날짜</th>
								                    <th style="width: 35%">변동사항</th>
								                    <th style="width: 35%">승인여부</th>
								                </tr>
								            </thead>
								            <tbody>
								                <c:choose>
									            	<c:when test="${empty recordList }">
									            		<tr>
									            			<td colspan="3" style="color: red;">학적변동 기록이 없습니다</td>
									            		</tr>
									            	</c:when>
									            	<c:otherwise>
									            		<c:forEach items="${recordList }" var="list">
									            			 <tr>
											                    <td>${list.changeAplyDt }</td>
											                    <td>${list.comCdNm1 }</td>
											                    <td>${list.comCdNm2 }</td>
											               	 </tr>
									            		</c:forEach>
									            	</c:otherwise>
								            	</c:choose>						              
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
											<input type="text" class="form-control" value="${student.deptNm }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">학적</label>
											<input type="text" class="form-control" value="${student.comCdNm1 }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주소</label>
											<input type="text" class="form-control" value="${student.stdAddr }${student.stdDaddr }" readonly>
										</div>
							
										<div class="col-sm-6 m-b30">
											<label class="form-label">연락처</label>
											<input type="text" class="form-control" value="${student.stdTelno }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">주민등록번호</label>
											<input type="text" class="form-control" value="${student.stdRrno }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">계좌번호</label>
											<input type="text" class="form-control" value="${student.stdActno }" readonly>
										</div>
										<div class="col-sm-6 m-b30">
											<label class="form-label">이메일</label>
											<input type="text" class="form-control" value="${student.stdMail }" readonly>
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
