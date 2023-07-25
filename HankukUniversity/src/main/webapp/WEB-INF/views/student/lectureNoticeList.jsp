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
				</div>
				<div class="card-body ccc" style="padding-top: 0; height:40%;">
					<div class="table-wrap" style="margin-top: 10px;">
										
					<div class="input-group" style="width:20%; float:right; margin-bottom: 10px;">
				<input type="text" class="form-control" id="searchWord" placeholder="검색어를 입력하세요">
				<span class="input-group-append">
					<button type="button" id="searchBtn" class="btn btn-primary btn-flat">검색</button>
				</span>
			</div>
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
							<tbody id="noticeTb">
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

$('#searchBtn').click(function(){
	var searchWord = $('#searchWord').val();
	console.log(searchWord);
	
	$.ajax({
		url : '/hku/professor/search',
		type: 'get',
		data : {
			searchWord : searchWord
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			console.log(res);
			searchStr = '';
		for(let i=0; i < res.length; i++){
				searchStr+= '<tr>'
				searchStr+= '<td>'+ (i+1) +'<input type="hidden" value="'+res[i].lecntNo+'" id="lecntNo"></td>'
				searchStr+= '<td style="text-align: left;">'+res[i].lecntTtl+'</td>';
				searchStr+= '<td>'+res[i].lecntRegdate+'</td>';
				searchStr+= '<td>'+res[i].lecntWriter+'</td>';
				searchStr+= '<td>'+res[i].lecntReadCnt+'</td>';
				searchStr+= '</tr>'	;
		}
			$('#noticeTb').html(searchStr);
	
		},
		error: function(){
			
		}
		
	})
	
})
	
$('#noticeTb').on('click','tr',function(){
	var lecntNo = $(this).find('#lecntNo').val();
	console.log(lecntNo);
	location.href= "/hku/student/detailNotice/"+lecntNo;
})



</script>
</html>
