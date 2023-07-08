<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<style>

table, th, td {
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
   width : 100px;
   height: 40px;
}
th, td {
   padding: 20px;
}
th{
  	text-align: center;
	font-size: 1.5em;
}
	</style>
		<meta charset="UTF-8">
		<div class="content-body">
			<div class="page-titles">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active"><a href="javascript:void(0)">study room</a></li>
				</ol>
			</div >
			
			
			<div class="container-fluid">
				<div class="card" id="card-title-1">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">study room</h5>
					</div>
					<div style="display: flex; justify-content: end; margin-right: 80px;">
						<a class="btn btn-primary" href="#" role="button" id="btn1" style="margin: 10px">화상채팅</a>
						
						<form action="/hku/student/delStudy" method="post" id="delForm">
							<input type="hidden" name="studyNo" value="${study.studyNo}">
						</form>
						<!-- 스터디장은 스터디 해체 버튼 보여주기 -->
						<button type="button" class="btn btn-primary" style="margin: 10px" id="delBtn">
							<i class="fa-solid fa-circle-exclamation me-2"></i>스터디 해체
						</button>									
						<a class="btn btn-primary" href="#" role="button" id="btn2" style="margin: 10px">스터디 탈퇴</a>																

					</div>
					<div class="card-body">
						<div class="custom-tab-1">
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link active" data-bs-toggle="tab" href="#home1"> <i class="fa-solid fa-user-plus me-2"></i> 신청인원</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#profile1"><i class="far fa-user me-2"></i> 스터디원</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#contact1"><i class="far fa-clock me-2"></i> 시간표</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#message1"><i class="ti-calendar me-2"></i> 일정</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="home1" role="tabpanel">
									<div class="pt-4">
										<table style="width: 90%" class="table">
											<thead class="thead-dark">
												<tr>
													<th></th><th>이름 </th><th>학과 </th><th>학번 </th><th>학년 </th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1 </td>
													<td>홍길동 </td>
													<td>컴공 </td>
													<td>202203001 </td>
												</tr>
												
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="profile1">
									<div class="pt-4">
										<div>
											<h3>스터디 소개</h3>
											<c:choose>
												<c:when test="${empty study }">
													<p>스터디 소개글이 존재하지 않습니다.</p>
												</c:when>
												<c:otherwise>
													<p> ${study.studyIntro }</p>																						
												</c:otherwise>
											</c:choose>
											<br>
										</div>
										<p>스터디원</p>
										<table style="width: 90%" class="table">
										<thead class="thead-dark">
											<tr>
										    	<th>이름</th><th>학번</th><th>학과</th>
										    </tr>
										</thead>
										  <c:choose>
										    <c:when test="${empty studyMem }">
										      <tr>
										        <td colspan="5">스터디원이 존재하지 않습니다.</td>
										      </tr>
										    </c:when>
										    <c:otherwise>
										      <tbody>
										        <c:forEach items="${studyMem }" var="studyMem">
										          <tr>
										            <td>${studyMem.stdNm}</td>
										            <td>${studyMem.stdNo}</td>
										            <td>${studyMem.deptNm}</td>
										          </tr>
										        </c:forEach>
										      </tbody>
										    </c:otherwise>
										  </c:choose>
										</table>					
									</div>
								</div>
								<div class="tab-pane fade" id="contact1" style="display: flex;">
									<div style="width: 30%; margin-top: 45px">
										<table style="width: 40%" class="table">
										<thead class="thead-dark">
											<tr>
										    	<th>이름</th><th>학번</th><th>학과</th>
										    </tr>
										</thead>
										  <c:choose>
										    <c:when test="${empty studyMem }">
										      <tr>
										        <td colspan="3">스터디원이 존재하지 않습니다.</td>
										      </tr>
										    </c:when>
										    <c:otherwise>
										      <tbody>
										        <c:forEach items="${studyMem }" var="studyMem">
										          <tr>
										            <td>${studyMem.stdNm}</td>
										            <td>${studyMem.stdNo}</td>
										            <td>${studyMem.deptNm}</td>
										          </tr>
										        </c:forEach>
										      </tbody>
										    </c:otherwise>
										  </c:choose>
										</table>
									</div>		
									<div style="width: 70%; margin-top: 45px">
										<table style="width:100%">
											<tr>
												<th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
											</tr>
											<tr>
												<th>1교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>2교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>3교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>4교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>5교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>6교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>7교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>8교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>9교시</th><td></td><td></td><td></td><td></td><td></td>
											</tr>
									</table>
									</div>
									
								</div>
								<div class="tab-pane fade" id="message1">
									<div class="pt-4">
										
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
<script>
$(function(){
	var delBtn = $('#delBtn');
	var delForm = $('#delForm');
	  
	delBtn.on('click', function(){
		if(confirm("정말로 해체하시겠습니까?")){
		delForm.submit();
		}
		location.href = "http://localhost/hku/student/study";

  	});
});
</script>