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
   .table thead th {
	border: none;
    padding: 8px;
    font-size: 16px;
	color: #fff;
}
.table tbody th, .table tbody td {
    border: none;
    padding: 9px;
    font-size: 15px;
    color: black;
}
.container {
  display: flex; 
}

.section {
  flex: 1;
  border:1px solid gray; 
  border-radius:20%; 
  height:150px; 
  padding-top:5px;
  margin-right: 20px; 
  margin-left: 20px; 
  
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
	
	<div class="container-fluid" style="padding-top: 1rem;">
	<div class="buttons" style="padding-left:80%; padding-bottom:10px;">
		<button type="button" id="attendBtn" onClick="" style="padding: 0.6rem 1.0rem;" class="btn btn-primary">출석관리</button>
		<button type="button" id="attendDmrBtn" onClick="" style="padding: 0.6rem 1.2rem;" class="btn btn-primary">이의신청관리</button>
	</div>
		<div class="row">
		<input type="hidden" name="lecapNo" value="${lecapNo }">	
			<div class="col-xl-6 col-lg-6 bbb" style="width: 45%; height:350px;" >
				<div class="card">
				

			<!------------- 시험관리 --------------->
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							온라인시험</h4>
							<a href="/hku/test-presentation" class="btn btn-primary" id="testBtn">출제하기</a>
      
      							<!-------------- 더보기버튼 필요없으면 삭제  -------------->		
<!-- 							<button type="button" id="testMore" class="btn btn-primary light sharp" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 								<svg width="18px" height="18px" viewBox="0 0 24 24" version="1.1"> -->
<!-- 								<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> -->
<!-- 								<rect x="0" y="0" width="24" height="24"></rect> -->
<%-- 								<circle fill="#000000" cx="5" cy="12" r="2"></circle> --%>
<%-- 								<circle fill="#000000" cx="12" cy="12" r="2"></circle> --%>
<%-- 								<circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg> --%>
<!-- 							</button> -->
					</div>
					<div class="container" style="padding-top: 0; margin-top: 1.8rem; width: 95%;">
						<div class="section">
							<button type="button" class="btn btn-primary" id="middleBtn">상세보기</button>
						</div>
						<div class="section" >
							<button type="button" class="btn btn-primary" id="finalBtn">상세보기</button>
						</div>
					</div>
				</div>
			</div>

			<!------------- 과제관리 --------------->
			<div class="col-xl-6 col-lg-6 bbb" style="width: 55%; height:350px;">
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
									<th>작성일시</th>
								</tr>
							</thead>
							<tbody id="tbtb">
							<c:set value="${asgList }" var="asgList"/>
							<c:choose>
								<c:when test="${empty asgList }">
									<tr>
										<td colspan="5">등록된 게시글이 없습니다</td>
									</tr>
								</c:when>
								<c:when test="${not empty asgList }">
									<c:forEach items="${asgList}" var="list" varStatus="status">
										<tr class="tbtr">
											<td class="">${status.index + 1}</td>
											<td class="">
												<a href="/hku/professor/assignmentDetail/${list.asmNo}">${list.asmTtl }</a>
											</td>
											<td class="">${list.asmRegdate }</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<!------------- 공지사항 게시판 --------------->
			<div class="col-xl-5 col-lg-5 bbb"
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
$('#noticeMore').click(function(){
	console.log(${lecapNo});
	location.href = `/hku/professor/noticeList`;
})

$(function(){
// 	alert("${lecapNo}");
// 	assignList();
	
	var assignMore = document.querySelector("#assignMore");
	
	assignMore.addEventListener("click", function(){
		location.href = `/hku/professor/assignmentList/${lecapNo}`;
	})

})

var middleBtn = $("#middleBtn");
var finalBtn = $("#finalBtn");

middleBtn.on("click", function(){

	var obj = {
		lecapNo: "${sessionScope.lecapNo}",
		testSe: "middle"
	}

	$.ajax({
		url:"/hku/testCheck",
		type:"get",
		data:obj,
		success:function(res){
			if(res === "exist"){
				location.href = `/hku/testUpdate?lecapNo=\${obj.lecapNo}&testSe=middle`;
			}else{
				swal({
					title: "시험을 출제해주세요",
                    icon: "warning",
                    button: "닫기"
				})
			}
		}
	})
})
finalBtn.on("click", function(){

	var obj = {
		lecapNo: "${sessionScope.lecapNo}",
		testSe: "final"
	}

	$.ajax({
		url:"/hku/testCheck",
		type:"get",
		data:obj,
		success:function(res){
			if(res === "exist"){
				location.href = `/hku/testUpdate?lecapNo=\${obj.lecapNo}&testSe=final`;
			}else{
				swal({
					title: "시험을 출제해주세요",
                    icon: "warning",
                    button: "닫기"
				})
			}
		}
	})
})



if("${msg}" == "success"){
	swal({
		title: "시험이 정상적으로 출제되었습니다.",
		icon: "success",
		button: "닫기"
	})
}else if("${msg}" == "update-success"){
	swal({
		title: "시험 수정을 완료하였습니다.",
		icon: "success",
		button: "닫기"
	})
}


</script>
