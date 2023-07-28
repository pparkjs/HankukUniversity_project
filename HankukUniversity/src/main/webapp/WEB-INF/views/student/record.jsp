<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/record-style.css">
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
		<div class="card" id="card-title-1" style="margin-top: -12px;">
									
			<div class="card-body" style="padding-bottom: 0px;">
					<div style="height: 465px; display: flex;">
						<div class="card card-bx profile-card author-profile m-b30" style="height: 417px; width: 30%;">
							<div class="card-header" style="margin-bottom: -10px;">
								<h6 class="title">프로필 이미지</h6>
							</div>
							<div class="card-body" style="display: flex; justify-content: center; align-items: center;">
								<c:choose>
									<c:when test="${student.stdProfilePath eq null}">
										<img id="stdProfileImg" src="/images/기본프로필.png" alt="">
									</c:when>
									<c:otherwise>
										<img id="stdProfileImg" src="/download${student.stdProfilePath }" alt="">
										<!-- 										<span class="basicProfileImg flaticon-381-user-4"></span> -->										
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-xl-9 col-lg-8" style="height: 447px; width: 74%; margin-left: 15px;">
							<div class="card profile-card card-bx m-b30">
								<div class="card-header">
									<h6 class="title">학적정보</h6>
								</div>
								<form class="profile-form">
									<div class="card-body pro-card" style="padding: 18px 2px 10px;">
										<div class="profile-wrap">
											<div class="profile-con">
												<span class="profile-span">이름</span>
												<input type="text" class="form-control" value="${student.stdNm }" readonly>
											</div>
											<div class="profile-con">
	 											<span class="profile-span">성별</span>
												<input type="text" class="form-control" value="남" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">학번</span>
												<input type="text" class="form-control" value="${student.stdNo }" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">학년</span>
												<input type="text" class="form-control" value="2" readonly>
											</div>
											<div class="profile-con" style="width: 66%;">
												<span class="profile-span" style="width: 84%;;">학과</span>
												<input type="text" class="form-control" value="${student.deptNm }" style="width: 430%;" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">전공이수학점</span>
												<input type="text" class="form-control" value="10" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">교양이수학점</span>
												<input type="text" class="form-control" value="10" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">학적상태</span>
												<input type="text" class="form-control" value="재학" readonly>
											</div>
								
											<div class="profile-con">
												<span class="profile-span">연락처</span>
												<input type="text" class="form-control" value="${student.stdTelno }" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">이메일</span>
												<input type="text" class="form-control" value="${student.stdMail }" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">주민등록번호</span>
												<input type="text" class="form-control" value="980915-1******" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">은행명</span>
												<input type="text" class="form-control" value="KB국민" readonly>
											</div>
											<div class="profile-con">
												<span class="profile-span">계좌번호</span>
												<input type="text" class="form-control" value="123-456-789012" readonly>
											</div>
										
											<div class="profile-con">
												<span class="profile-span">우편번호</span>
												<input type="text" class="form-control" value="23456" readonly>
											</div>
											<div class="profile-con" style="width: 44%;">
												<span class="profile-span" style="width: 116%;">주소</span>
												<input type="text" class="form-control" value="${student.stdAddr }${student.stdDaddr }" readonly>
											</div>
											<div class="profile-con" style="margin-left: 4px; width: 636px;">
	<!-- 											<span class="profile-span"></span> -->
												<input type="text" class="form-control" value="${student.stdAddr }${student.stdDaddr }" style="width: 151%;" readonly>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<div class="clearfix" style="height: 356px; margin-top: -36px;">
						<div class="card card-bx profile-card author-profile m-b30" style="height: 349px;">
						    <div class="card-header">
						        <h6 class="title">변동사항</h6>
						    </div>
	    					<div class="table-wrap" style="height: 269px;">
								<table class="table" style="margin-top: -17px;">
									<thead class="thead-dark">
										<tr>
											<th style="width:80px;">순번</th> <!-- 이거는 그냥 1, 2, 3으로 넣으면 되요 -->
											<th style="width:150px;">변동사항</th>
											<th style="width:150px;">변동신청일</th>
											<th style="width:150px;">시작년도/시작학기</th> <!-- 이거는 2023년도 2학기 -->
											<th style="width:150px;">종료년도/종료학기</th>
											<th style="width:400px;">변동사유</th>
											<th style="width:140px;">승인여부</th>  <!-- 해당 변동사항부분은 승인된 것만 들어와야함 결제상태코드가 appv인 것만 -->
										</tr>
									</thead>
									<tbody id="recordBody">
									
<!-- 										<tr> -->
<!-- 											<td colspan="7" style="text-align: center">학적변동내역이 존재하지 않습니다.</td> -->
<!-- 										</tr> -->

<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
<!-- 										동적추가 -->
<!-- 										<tr> -->
<!-- 											<td>1</td> -->
<!-- 											<td>군휴학</td> -->
<!-- 											<td>2022-03-12</td> -->
<!-- 											<td>2022년도 1학기</td> -->
<!-- 											<td>2023년도 2학기</td> -->
<!-- 											<td>군대 입대합니다.</td> -->
<!-- 											<td><button class="btn btn-primary" style="background: #0070c0; margin-top: -11px; padding: 5px 21px; border-color:#0070c0;">승인</button></td> -->
<!-- 										</tr> -->
										
									</tbody>
								</table>
							</div>
							    
							    
<!-- 							        <table class="tbl"> -->
<!-- 							            <thead>             -->
<!-- 							                <tr> -->
<!-- 							                    <th style="width: 30%">날짜</th> -->
<!-- 							                    <th style="width: 35%">변동사항</th> -->
<!-- 							                    <th style="width: 35%">승인여부</th> -->
<!-- 							                </tr> -->
<!-- 							            </thead> -->
<!-- 							            <tbody> -->
<%-- 							                <c:choose> --%>
<%-- 								            	<c:when test="${empty recordList }"> --%>
<!-- 								            		<tr> -->
<!-- 								            			<td colspan="3" style="color: red;">학적변동 기록이 없습니다</td> -->
<!-- 								            		</tr> -->
<%-- 								            	</c:when> --%>
<%-- 								            	<c:otherwise> --%>
<%-- 								            		<c:forEach items="${recordList }" var="list"> --%>
<!-- 								            			 <tr> -->
<%-- 										                    <td>${list.changeAplyDt }</td> --%>
<%-- 										                    <td>${list.comCdNm1 }</td> --%>
<%-- 										                    <td>${list.comCdNm2 }</td> --%>
<!-- 										               	 </tr> -->
<%-- 								            		</c:forEach> --%>
<%-- 								            	</c:otherwise> --%>
<%-- 							            	</c:choose>						               --%>
<!-- 							            </tbody> -->
<!-- 							        </table> -->
						</div>
					</div>
			</div>				
		</div>
	</div>
</div>
