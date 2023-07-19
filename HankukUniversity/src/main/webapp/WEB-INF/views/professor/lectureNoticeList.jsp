<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/classroom-jh.css">
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
						${subNm} 공지사항</h4>
					<button type="button" id="regBtn"
						style="padding: 0.5rem 1.0rem; width: 80px; "
						class="btn btn-primary">글쓰기</button>
				</div>
				<div class="card-body ccc" style="padding-top: 0; height:40%;">
					<div class="table-wrap" style="margin-top: 10px;">
						<table id="noticeTable">
							<thead>
								<tr>
									<td>NO</td>
									<td>제목</td>
									<td>등록일</td>
									<td>작성자</td>
									<td>조회수</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="notice" varStatus="status">
									<tr>
										<td>${status.index+1}<input type="hidden" value="${notice.lecntNo }" id="lecntNo"></td>
										<td style="text-align: left;">${notice.lecntTtl }</td>
										<td>${notice.lecntRegdate }</td>
										<td>${notice.lecntWriter }</td>
										<td>${notice.lecntReadCnt }</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$('#regBtn').click(function(){
	location.href = "/hku/professor/noticeform";
})

$('#noticeTable tr').click(function(){
	var lecntNo = $(this).find('#lecntNo').val();
	console.log(lecntNo);
	location.href= "/hku/professor/detailNotice/"+lecntNo;
})

</script>
</html>
