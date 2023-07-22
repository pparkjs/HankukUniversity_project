<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/tuition.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">등록금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 납부내역</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					년도:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.currentYear }년" disabled>
					학기:&nbsp;&nbsp;&nbsp;
					<input type="text" class="semText" value="${std.currentSem }학기" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">등록내역</h5>
			</div>
			<div class="card-body">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>등록년도</th>
								<th>등록학기</th>
								<th>수업료</th>
								<th>감면금액</th>
								<th>납부금액</th>
								<th>등록일자</th>
								<th>확인서</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tuitionList}" var="tuition" varStatus="stat">
								<tr>
									<td>${stat.count}</td>
									<td>${tuition.tutYr}</td>
									<td>${tuition.tutSem}</td>
									<td>${tuition.tutAmt}</td>
									<td>${tuition.tutSclsAmt}</td>
									<td>${tuition.tutAmt}-${tuition.tutSclsAmt}</td>
									<td>${tuition.tutPayDt}</td>
									<td>보기</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
