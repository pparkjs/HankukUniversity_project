<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/search-subject.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">수강정보</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">교과목 조회</a></li>
		</ol>
    </div>
	<div class="container-fluid searchCon">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="search1">
					이수구분:&nbsp;&nbsp;&nbsp;
					<select class="clsfSel">
						<option>전필</option>
						<option>전선</option>
						<option>교선</option>
						<option>교필</option>
					</select>
					학과:&nbsp;&nbsp;&nbsp;
					<select class="clsfSel">
						<option>전필</option>
						<option>전선</option>
						<option>교선</option>
						<option>교필</option>
					</select>
					학년:&nbsp;&nbsp;&nbsp;
					<select class="clsfSel">
						<option>전필</option>
						<option>전선</option>
						<option>교선</option>
						<option>교필</option>
					</select>
					교과목명:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="subName" placeholder="교과목명을 입력하세요.">
					<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;">학점이수현황</h5>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px;">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>과목코드</th>
								<th>교과목명</th>
								<th>이수구분</th>
								<th>학년</th>
								<th>학점</th>
								<th>시수</th>
								<th>학과</th>
							</tr>
						</thead>
						<tbody>
							<!-- 동적추가 -->
						</tbody>
					</table>
				</div>
				<div class="subInfo">
					<p>교과목 개요</p>
					<hr>
					<div class="otlContent">
						내용입니다.
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	subList();

	$(document).on("click","tr", function(){
		var subOtl = $(this).find('.otl');
		$(".otlContent").html(subOtl.text());
		
	})
})

function subList(){
	var tbody = $("tbody");
	$.ajax({
		type:"get",
		url : "/hku/student/sub-list",
		dataType : "json",
		success : function(res){
			console.log(res)

			data = '';
			for(var i = 0; i < res.length; i++){
				data += `<tr>
							<td id="\${res[i].subNo}">\${res[i].subNo}</th>
							<td id="\${res[i].subNo}">\${res[i].subNm}</td>
							<td id="\${res[i].subNo}">\${res[i].crsClassfCd}</td>
							<td id="\${res[i].subNo}">\${res[i].subGrade}</td>
							<td id="\${res[i].subNo}">\${res[i].subCrd}</td>
							<td id="\${res[i].subNo}">\${res[i].subHour}</td>
							<td id="\${res[i].subNo}">\${res[i].deptCd}</td>
							<td id="\${res[i].subNo}" class="otl" style="display:none;">\${res[i].subOtl}</td>
						</tr>`;
			}
			tbody.html(data);
		}
	})
}
</script>