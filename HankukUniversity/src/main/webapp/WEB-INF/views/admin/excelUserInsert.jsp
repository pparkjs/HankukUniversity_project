<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${sessionScope.excelInsList}" var="excelList"/>
<style>
	.content-body .container-fluid {
		padding-top: 0.875rem;
	}
	.card-title {
		font-size: 1.1rem;
		font-weight: bold;
		color: #800000;
	}
	.excelSvg {
		width: 40px;
		height: 33px;
	}
	.poiDownBtn {
		padding: 4px;
		padding-right: 15px;
		background-color: #8bc2a4;
		border: 2px solid #107c42;
		color: #000;
		font-size: 16px;
		font-weight: 600;
	}
	.poiDownBtn:hover {
		border-color: #8bc2a4;
		background-color: #107c42;
	}
	.poiDownBtn:focus {
		border-color: #8bc2a4;
		background-color: #107c42;
	}
	.poiDownBtn:first-child:active {
		border-color: #8bc2a4;
		background-color: #107c42; 
	}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">사용자관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">일괄등록</a></li>
		</ol>
    </div>
    
    <div class="container-fluid">
    	<div class="row justify-content-end">
			<div class="col-auto">
				<button type="button" class="btn btn-primary poiDownBtn" style="color: #000;" onclick="ilgualGoGo()">
					<img src="\icons\icons8-microsoft-excel-2019.svg" class="excelSvg"/> 일괄등록
				</button>
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary" onclick="cancel()">취소</button>
			</div>
		</div>
	</div>
    
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">엑셀 일괄등록 리스트</h5>
			</div>
			<div class="card-body">
				<div class='table-wrap'>
					<table class='table'>
						<thead class='thead-dark'>
							<tr>
								<th>사용자 종류</th>
								<th>학번/교번</th>
								<th>이름</th>
								<th>학과코드</th>
								<th>생년월일</th>
								<th>주민등록번호</th>
								<th>성별</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>우편번호</th>
								<th>기본주소</th>
								<th>상세주소</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${excelList }" var="excel">
							<tr>
								<td>${excel.userClsCd }</td>
								<td>${excel.userNo }</td>
								<td>${excel.userNm }</td>
								<td>${excel.deptCd }</td>
								<td>${excel.userBrdt }</td>
								<td>${excel.userRrno }</td>
								<td>${excel.sexCd }</td>
								<td>${excel.userTelno }</td>
								<td>${excel.userMail }</td>
								<td>${excel.userZip }</td>
								<td>${excel.userAddr }</td>
								<td>${excel.userDaddr }</td>
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
function ilgualGoGo(){
	swal({
		title: "일괄등록을 진행하시겠습니까??",
		buttons: true,
		dangerMode: false,
	})
	.then((willDelete) => {
		if (willDelete) {
			window.location.href = "/hku/admin/excel-insert";
		} else {
			return false;
		}
	});
	console.log("일괄 고고");
}

function cancel(){
	swal({
		title: "일괄등록을 취소하시겠습니까??",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			window.location.href = "/hku/admin/user-management";
		} else {
			return false;
		}
	});
}
</script>