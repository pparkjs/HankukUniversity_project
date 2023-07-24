<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/tuition.css">
<link rel="stylesheet" href="/css/student/tut-bill.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">등록금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 고지서</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tutInfo">
					<span class="aa">
						학과:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.deptNm }" disabled>
					<span class="aa">
						학번:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.stdNo }" disabled>
					<span class="aa">
						이름:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.stdNm }" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">등록 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tutInfo">
					<span class="aa">
						등록년도:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentYear }년" disabled>
					<span class="aa">
						학기:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentSem }학기" disabled>
					<span class="aa">
						등록기한:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.stdNm }" disabled>
				</div>
				<div class="tutInfo" style="margin-top: 13px;">
					<span class="aa">
						수업료:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentYear }년" disabled>
					<span class="aa">
						감면금액:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentSem }학기" disabled>
					<span class="aa">
						납부금액:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentSem }학기" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">등록금 고지서</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tut-bill-wrap">
					<div class="tb-wrap">
						<table class="table" border="1">
							<tr>
								<td style="width: 22%;">학과</td>
								<td style="width: 28%;">${std.deptNm }</td>
								<td style="width: 22%;">학번</td>
								<td style="width: 28%;">${std.stdNo }</td>
							</tr>
							<tr>
								<td>학년/학기</td>
								<td>${std.currentYear }년 ${std.currentSem }학기</td>
								<td>성명</td>
								<td>${std.stdNm }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
