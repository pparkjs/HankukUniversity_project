<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-body">
	<!-- row -->
	<div class="container-fluid">
		<div class="col-xl-6 col-lg-6 bbb" style="width: 100%; height: 100%;">
			<div class="card">
				<div class="card-header" style="display: flex; justify-content: space-between; height: 61px;">
				<input type="hidden" name="lecapNo" value="${lecapNo }">	
					<h4 class="card-title" 
						style="font-weight: bold; font-size: 1.2em; color: #800000;">
						공지사항</h4>
					<button type="button" id="regBtn"
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary">등록</button>
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
								<c:set value="${list }" var="list"/>
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
										<td class="">${pro.proNm }</td>
										<td class="">
											<a href="/hku/professor/assignmentDetail/${list.asmNo}">${list.asmTtl }</a>
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
</body>
</html>