<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/admin/kyw.css">
<link rel="stylesheet" href="/css/table.css">

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사 관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학과 관리</a></li>
		</ol>
    </div>
    
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">영우 해삼</h5>
			</div>
			<div class="card-body">
				<p class="card-text">
					영우 말미잘
				</p>
			</div>
		</div>
		
		
	</div>
	
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">학과</h5>
			</div>
			<hr/>
			<div class="card-body dept-body">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>대학 코드</th>
								<th>학과 코드</th>
								<th>시설 번호</th>
								<th>학과 이름</th>
								<th>학과 연락처</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${deptList }" var="dept">
								<tr>
									<td>${dept.colCd }</td>
									<td>${dept.deptCd }</td>
									<td>${dept.flctNo }</td>
									<td>${dept.deptNm }</td>
									<td>${dept.deptTelno }</td>
								</tr>
							</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		
	</div>
</div>
