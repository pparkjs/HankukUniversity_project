<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">


<style>
.col-lg-6 {
	flex: 0 0 auto;
	width: 100%;
}

.card-title {
	font-size: 1.8em;
}

label {
	font-size: 20px;
	font-weight: 500;
	color: #6e6e6e;
}

.form-label1{
	  color: #6e6e6e;
}

.form-control{
	width : 400px;
}

.bootstrap-select .btn {
    width: 400px;
}
</style>

<div class="content-body" style="min-height: 975px;">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">출석이의신청</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">클래스룸</a></li>
		</ol>		
	</div>
	<div class="container-fluid">
		<div class="row">
		<div class="col-xl-6 col-lg-12" style="width:100%;">
			<div class="card" >
				<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							출석 이의신청</h4>
				</div>
				<div class="card-body">
					<div class="basic-form">
						<form id="form" action="/hku/student/attendanceDmr" method="post">
							<div class="row">
								<div class="mb-3 col-md-6">
									<label class="form-label1">이름</label> 
									<input type="text" class="form-control" readonly value="${std.stdNm }">
								</div>
								<div class="mb-3 col-md-6">
									<label class="form-label1">학과</label> 
									<input type="text" class="form-control" readonly value="${std.deptNm }">
								</div>
								<div class="mb-3 col-md-6">
									<label>파일첨부</label> 
									<input type="file" class="form-control" style="font-size: 15px;">
								</div>
								<div class="mb-3 col-md-4">
									<label class="form-label">주차</label>
									<div
										class="dropdown bootstrap-select default-select form-control wide">
										<select id="inputState"
											class="default-select form-control wide" style="width :300px;">
											<c:forEach begin="1" end="15" var="i" step="1">
												<option style="font-size: 15px;">${i }주차</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<div class="card">
									<div class="card-header">
										<h4 class=""style="font-size: 20px;">내용</h4>
									</div>
									<div class="card-body">
										<div class="basic-form">
											<div class="mb-3">
												<textarea class="form-txtarea form-control" style="width:100%;" 
												rows="8" id="content"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="mb-3" style="padding-left:92%;">
								<button type="button" id="submitBtn" onclick="submitF()" class="btn btn-primary">신청하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-xl-6 col-lg-12" style="width:100%;">
			<div class="card" >
				<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">
							이의신청현황</h4>
				</div>
				<div class="card-body ccc" style="padding-top: 0;">
						<table class="table">
							<thead class="thead" >
								<tr class="ths">
									<th>No</th>
									<th>이름</th>
									<th>학번</th>
									<th>학과</th>
									<th>신청일자</th>
									<th>승인여부</th>
								</tr>
							</thead>
							<tbody id="tbtb">
			
							</tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		
		
<script> 

//  	var submitBtn = document.querySelector("#submitBtn");
//  	var reason = document.querySelector("#reason").value;
//  	var form = document.querySelector("#form");
// 	var disp = document.querySelector("#disp");
 	
// 	submitBtn.addEventListener("click", function(){
// 		if(reason == " " && reason == null) {
//  		alert("내용을 입력하세요");
//  			return false;
//  			console.log("reason : ", reason);
//  		}
//   		form.submit();
//  	})
 	
//  	$.ajax({
//  		data : "get",
//  		type : "",
//  		url : "/hku/classroom/attendanceDmr",
//  		dataType : "json",
//  		success : function(res){
//  			console.log(res)
 			
//  		}
//  	})
 	
// 	disp.innerHTML = "";
//  	var tblStr = "";
	
//  	tblStr += "<table>";
//  	tblStr += `<tr><th>No</th><th>제목</th><th>신청일</th><th>상태</th></tr>`;
// 	for(let i = 0; i < 5; i++){
// 		tblStr += "<tr>";
// 		tblStr += `<td></td>`;
// 		tblStr += `<td></td>`;
// 	}
// 	tblStr += "</table>";
 	
	
 </script> 