,<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<div class="basic-form">
			<form class="row g-3 custom-form" action="">
				<div class="col-md-2">
					<select class="default-select  form-control">
						<option>대학구분</option>
						<option>학과명</option>
						<option>대학구분</option>
					</select>
				
				</div>
				<div class="col-md-3">
                          <input type="text" class="form-control input-default " placeholder="검색어를 입력해주세요">
                       </div>
				<div class="col-auto">
                          <button type="submit" class="btn btn-primary">검색</button>
                       </div>
				<div class="col-auto">
                          <button type="button" class="btn btn-primary">학과개설</button>
                       </div>
				<div class="col-auto">
                       <button type="button" class="btn btn-primary" onclick="delDept()">삭제</button>
                   </div>
			</form>
		</div>
	</div>
	
	<div class="container-fluid deptDiv">
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
								<th>
									<div class="form-check custom-checkbox checkbox-danger">
										<input type="checkbox" class="form-check-input" onclick="selectAll(this)">
									</div>
								</th>
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
									<td>
										<div class="form-check custom-checkbox checkbox-danger">
											<input type="checkbox" class="form-check-input deptCheck" value="${dept.deptCd }">
										</div>
									</td>
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
<script>
function selectAll(target){
	// console.log(target);
	const checkboxes = document.querySelectorAll(".deptCheck");
	// console.log(checkboxes);
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}

function delDept(){
	let data = {};
	
	let delDepts = document.querySelectorAll(".deptCheck");
	console.log(delDepts);
	for(let i=0; i<delDepts.length; i++){
		if(delDepts[i].checked == true){
			data[i] = delDepts[i].value;
		}
	}
	console.log(data);
	console.log(JSON.stringify(data));

	let xhr = new XMLHttpRequest();
	xhr.open("DELETE","/hku/admin/dept-administration",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText == 'SUCCESS'){
				console.log("삭제 완료!");
			}
		}
	}
	xhr.send(JSON.stringify(data));

}
</script>