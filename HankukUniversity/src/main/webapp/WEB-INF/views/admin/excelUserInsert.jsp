<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${sessionScope.excelInsList}" var="excelList"/>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Charts</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">Flot</a></li>
		</ol>
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
								<th>
									<div class='form-check custom-checkbox checkbox-danger'>
										<input type='checkbox' class='form-check-input' onclick='selectAll(this)'>
									</div>
								</th>
								<th>학번/교번</th>
								<th>이름</th>
								<th>사용자 종류</th>
								<th>학과코드</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>연락처</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${excelList }" var="excel">
							<tr onclick='studentDetail(this)'>
								<td>
									<div class='form-check custom-checkbox checkbox-danger'>
										<input type='checkbox' class='form-check-input userCheck' value='${excel.userNo }' onclick="onlyCheck(this)">
									</div>
								</td>
								<td>${excel.userNo }</td>
								<td>${excel.userNm }</td>
								<td>${excel.userClsCd }</td>
								<td>${excel.deptCd }</td>
								<td>${excel.userBrdt }</td>
								<td>${excel.sexCd }</td>
								<td>${excel.userTelno }</td>
								<td>${excel.userMail }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
