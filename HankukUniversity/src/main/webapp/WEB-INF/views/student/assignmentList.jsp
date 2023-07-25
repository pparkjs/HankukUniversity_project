<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">

<style>
.table thead th {
	border: none;
    padding: 8px;
    font-size: 16px;
	color: #fff;
}
.table tbody th, .table tbody td {
    border: none;
    padding: 11px;
    font-size: 17px;
    color: black;
}
.table-wrap{
	overflow: scroll;
    height: 771px;
}

</style>
<div class="content-body">
	<!-- row -->
	<div class="container-fluid">
		<div class="col-xl-6 col-lg-6 bbb" style="width: 100%; height: 100%;">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; height: 61px;">
				<input type="hidden" name="lecapNo" id="lecapNo" value="${lecapNo }">	
				<input type="hidden" name="stdNo" id="stdNo" value="${std.stdNo }">	
					<h4 class="card-title" 
						style="font-weight: bold; font-size: 1.2em; color: #800000;">
						과제목록</h4>
					<button type="button" id="backBtn"
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary">메인</button>
				</div>
				<div class="card-body ccc" style="padding-top: 0; height:40%;">
					<div class="table-wrap" style="margin-top: 10px;">
						<table class="table" style="margin-top: -22px;">
							<thead class="thead-dark">
								<tr>
									<th>No</th>
									<th>작성자</th>
									<th>제목</th>
									<th>작성일시</th>
								</tr>
							</thead>
							<tbody id="tbtb">
								<c:set value="${asmList }" var="list"/>
								<c:choose>
									<c:when test="${empty list }">
										<tr>
											<td colspan="5">등록된 게시글이 없습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${list }" var="list" varStatus="status"> 
									<tr class="tbtr">
										<td class="">${status.index + 1}</td>
										<td class="">${list.proNm }</td>
										<td class="">
											<a href="/hku/student/assignmentDetail/${list.asmNo}">${list.asmTtl }</a>
										</td>
										<td class="">${list.asmRegdate }</td>
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
</div>
<script>
$(function(){
	var backBtn = $("#backBtn");
	backBtn.on("click", function(){
		var lecapNo = $("#lecapNo").val();
		location.href="/hku/student/classroomMain/" + lecapNo;
	})
})

</script>