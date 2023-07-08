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
			<form class="row g-3 custom-form" action="" name="searchForm">
				<div class="col-md-2">
					<select class="default-select form-control" name="searchType">
						<option value="colCd">대학코드</option>
						<option value="deptCd">학과코드</option>
						<option value="deptNm">학과명</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control input-default" name="searchWord" value="${searchWord }" placeholder="검색어를 입력해주세요">
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" onclick="deptList()">검색</button>
				</div>
				<div class="col-auto">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deptInsertModal">학과개설</button>
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
			<div class="card-body dept-body" id="dept-body">
				
			</div>
		</div>
	</div>
</div>

<!-- 학과 개설 modal -->
<div class="modal fade" id="deptInsertModal" tabindex="-1" aria-labelledby="deptInsertLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-center">
	  <div class="modal-content">
		<div class="modal-header">
		    <h1 class="modal-title fs-5" id="deptInsertLabel">학과 개설</h1>
		    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col-xl-12">
					<label class="form-label">Email ID<span class="text-danger">*</span></label>
					<input type="email" class="form-control" placeholder="hello@gmail.com">
					<label class="form-label mt-3">Employment date<span class="text-danger">*</span></label>
					<input class="form-control" type="date">
					<div class="row">
						<div class="col-xl-6">
							<label class="form-label mt-3">First Name<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Name">
							</div>
						</div>
						<div class="col-xl-6">
							<label class="form-label mt-3">Last Name<span class="text-danger">*</span></label>
							<div class="input-group">
								<input type="text" class="form-control" placeholder="Surname">
							</div>
						</div>
					</div>
					<div class="mt-3 invite">
						<label class="form-label">Send invitation email<span class="text-danger">*</span></label>
						<input type ="email" class="form-control " placeholder="+ invite">
					</div>
			  
				</div>
			</div>
		</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">개설</button>
			</div>
	  	</div>
	</div>
</div>
<script>

var deptBody = document.querySelector("#dept-body");

function deptList(){
	var searchForm = document.forms.searchForm;
	var searchType = searchForm.elements.searchType.value;
	var searchWord = searchForm.elements.searchWord.value.trim().toUpperCase();
	// console.log("searchType=" + searchType);
	// console.log("searchWord=" + searchWord);

	let searchData = {
		"searchType": searchType,
		"searchWord": searchWord
	};
	// console.log("searchData=" + JSON.stringify(searchData));
	let xhr = new XMLHttpRequest();
	xhr.open("POST","/hku/admin/dept-list",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let tbWrap = "<div class='table-wrap'>";
			tbWrap += "<table class='table'>";

			tbWrap += "<thead class='thead-dark'>";
			tbWrap += "<tr>";
			tbWrap += "<th>";
			tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
			tbWrap += "<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>";
			tbWrap += "</div>";
			tbWrap += "</th>";
			tbWrap += "<th>대학 코드</th>";
			tbWrap += "<th>학과 코드</th>";
			tbWrap += "<th>시설 번호</th>";
			tbWrap += "<th>학과 이름</th>";
			tbWrap += "<th>학과 연락처</th>";
			tbWrap += "</tr>";
			tbWrap += "</thead>";

			tbWrap += "<tbody>";

			// console.log("deptList",xhr.responseText);
			if(xhr.responseText != null && xhr.responseText.length > 0) {
				// console.log("값이 있음");
				let deptList = JSON.parse(xhr.responseText);
				// console.log("parsedeptList",deptList);
	
				for(let i = 0; i <deptList.length; i++) {
					tbWrap += "<tr>";
					tbWrap += "<td>";
					tbWrap += "<div class='form-check custom-checkbox checkbox-danger'>";
					tbWrap += `<input type='checkbox' class='form-check-input deptCheck' value='\${deptList[i].deptCd }'>`;
					tbWrap += "</div>";
					tbWrap += "</td>";
					
					tbWrap += `<td>\${deptList[i].colCd }</td>`;
					tbWrap += `<td>\${deptList[i].deptCd }</td>`;
					tbWrap += `<td>\${deptList[i].flctNo }</td>`;
					tbWrap += `<td>\${deptList[i].deptNm }</td>`;
					tbWrap += `<td>\${deptList[i].deptTelno }</td>`;
					tbWrap += "</tr>";
				}
			} else {
				// console.log("값 없음")
				tbWrap += "<tr><td colspan=6>데이터가 존재하지 않습니다.</td></tr>";
			}


			tbWrap += "</tbody>";
			tbWrap += "</table>";
			tbWrap += "</div>"
			
			deptBody.innerHTML = tbWrap;
		}
	}
	xhr.send(JSON.stringify(searchData));
}

function selectAll(target){
	// console.log(target);
	const checkboxes = document.querySelectorAll(".deptCheck");
	// console.log(checkboxes);
	checkboxes.forEach(function(i){
		i.checked = target.checked;
	})
}

function delDept(){
	var delDeptArr = new Array();


	// let data = {};
	
	let Depts = document.querySelectorAll(".deptCheck");
	// console.log(delDepts);
	for(let i=0; i<Depts.length; i++){
		if(Depts[i].checked == true){
			delDeptArr.push(Depts[i].value);
		}
	}
	if(delDeptArr.length == 0){
		failedAlert();
		return false;
	}
	// console.log(delDeptArr);
	// console.log(JSON.stringify(delDeptArr));

	let xhr = new XMLHttpRequest();
	xhr.open("DELETE","/hku/admin/dept-administration",true);
	xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			if(xhr.responseText === 'SUCCESS'){
				deptList();
				successAlert("삭제");
			} else if(xhr.responseText === 'FAILED'){
				console.log("삭제 실패!");
			}
		}
	}
	xhr.send(JSON.stringify(delDeptArr));

}

function successAlert(text){
    swal({
		title: text+"가 완료되었습니다!", 
		icon: "success"
	});
}
function failedAlert(){
    swal({
		title: "항목을 선택해주세요!", 
		icon: "error"
	});
}

window.addEventListener("DOMContentLoaded", function(){  // 태그 해석만 끝나면 발생
    deptList();
});
</script>