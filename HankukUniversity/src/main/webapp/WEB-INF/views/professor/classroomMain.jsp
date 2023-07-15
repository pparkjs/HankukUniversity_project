<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.light.btn-primary {
    background-color: rgb(128 0 0 / 0%);
    border-color: #888888;
    margin-bottom: 4px;
    height : 10px;
   }
</style>

<div class="content-body" style="min-height: 975px;">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a style="font-size:25px; color:black;" href="javascript:void(0)">${subNm }</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">
				클래스룸 메인</a></li>
		</ol>		
	</div>
	
	<div class="container-fluid">
	<div class="buttons" style="padding-left:80%; padding-bottom:10px;">
		<button type="button" style="padding: 0.6rem 1.0rem;" class="btn btn-primary">출석관리</button>
		<button type="button" style="padding: 0.6rem 1.2rem;" class="btn btn-primary">이의신청관리</button>
	</div>
		<div class="row">
			<div class="col-xl-6 col-lg-6 bbb" style="width: 45%; height:450px;" >
				<div class="card">

					<!------------- 시험관리 --------------->
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							시험관리</h4>
							<button type="button" id="testMore" class="btn btn-primary light sharp" data-bs-toggle="dropdown" aria-expanded="false">
								<svg width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
								<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<rect x="0" y="0" width="24" height="24"></rect>
								<circle fill="#000000" cx="5" cy="12" r="2"></circle>
								<circle fill="#000000" cx="12" cy="12" r="2"></circle>
								<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
							</button>
					</div>
					<div class="card-body ccc" style="padding-top: 0;">
						<table class="table">
							<thead>
								<tr>
									<th>중간고사</th>
									<th>기말고사</th>
								</tr>
							</thead>
							<tbody id="tbtb">
								<tr class="tbtr">
									<td class="">뿅</td>
									<td class="">뿅</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!------------- 과제관리 --------------->
			<div class="col-xl-6 col-lg-6 bbb" style="width: 55%; height:450px;">
				<div class="card">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							과제관리</h4>
							<button type="button" id="assignMore" class="btn btn-primary light sharp" data-bs-toggle="dropdown" aria-expanded="false">
								<svg width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
								<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<rect x="0" y="0" width="24" height="24"></rect>
								<circle fill="#000000" cx="5" cy="12" r="2"></circle>
								<circle fill="#000000" cx="12" cy="12" r="2"></circle>
								<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
							</button>
					</div>
					<div class="card-body ccc" style="padding-top: 0;">
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="tbtb">
							<c:if test="${not empty asgList }">
								<c:forEach items="${asgList}" var="list" varStatus="status">
									<tr class="tbtr">
										<td class="">${status.index + 1}</td>
										<td class="">${list.asmTtl }</td>
										<td class="">${list.asmRegdate }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${ empty asgList }">
								<tr><td>등록된 게시물이 없습니다</td><tr>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!------------- 공지사항 게시판 --------------->
			<div class="col-xl-6 col-lg-6 bbb"
				style="width: 100%; height: 350px;">
				<div class="card">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							공지사항</h4>
							<button type="button" id="noticeMore" class="btn btn-primary light sharp" data-bs-toggle="dropdown" aria-expanded="false">
								<svg width="18px" height="18px" viewBox="0 0 24 24" version="1.1">
								<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<rect x="0" y="0" width="24" height="24"></rect>
								<circle fill="#000000" cx="5" cy="12" r="2"></circle>
								<circle fill="#000000" cx="12" cy="12" r="2"></circle>
								<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
							</button>
					</div>
					<div class="card-body ccc" style="padding-top: 0;">
						<table class="table">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody id="tbtb">
								<tr class="tbtr">
									<td class="">1</td>
									<td class="">6주차 휴강안내</td>
									<td class="">2023-07-12</td>
								</tr>
								<tr class="tbtr">
									<td class="">2</td>
									<td class="">공결신청 관련 안내</td>
									<td class="">2023-07-10</td>
								</tr> 
								<tr class="tbtr">
									<td class="">3</td>
									<td class="">중간고사 시험 안내</td>
									<td class="">2023-07-21</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	alert("${lecapNo}");
// 	assignList();
	
})	
	assignMore.addEventListener("click", function(){
		location.href = "/hku/professor/assignmentList";
	})
	


</script>
