<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/facility-rsvt.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">시설예약</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">나의 예약현황</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					년도:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.currentYear }년" disabled>
					학기:&nbsp;&nbsp;&nbsp;
					<input type="text" class="semText" value="${std.currentSem }학기" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;  font-weight: 900;">사물함 예약현황</h5>
			</div>
			<div class="card-body" style="padding-top: 0px;">
				<div class="table-wrap">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark">
							<tr>
								<th style="width:200px;">사물함번호</th>
								<th style="width:600px;">시설명</th>
								<th style="width:150px;">층수</th>
								<th style="width:300px;">신청년도</th>
								<th style="width:150px;">신청학기</th>
								<th style="width:200px;">학번</th>
								<th style="width:200px;"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty lockerRsvtList }">
									<tr>
										<td colspan="8">예약하신 사물함 정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${lockerRsvtList }" var="locker">
										<tr>
											<td><c:out value="${locker.lockerNo }"/></td>
											<td><c:out value="${locker.flctNm }"/></td>
											<td><c:out value="${locker.floor }"/></td>
											<td><c:out value="${locker.lockerYr }"/></td>
											<td><c:out value="${locker.rsvtSem }"/></td>
											<td><c:out value="${locker.stdNo }"/></td>
											<c:if test="${locker.presentCheck eq 0}">
												<td></td>
											</c:if>
											<c:if test="${locker.presentCheck eq 1}">
												<td><button class="btn btn-primary useCancleBtn" id="${locker.lockerRsvtNo }">사용취소</button></td>
											</c:if>
											<td id="data1" class="${locker.flctNo }" style="display: none;"></td>
											<td id="data2" class="${locker.lockerNo }" style="display: none;"></td>
											<td id="data3" class="${locker.floor }" style="display: none;"></td>
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
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;  font-weight: 900;">시설물 예약현황</h5>
			</div>
			<div class="card-body" style="padding-top: 0px;">
				<div class="table-wrap">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark">
							<tr>
								<th style="width:200px;">시설명</th>
								<th style="width:200px;">시설물명</th>
								<th style="width:80px;">사용인원</th>
								<th style="width:350px;">사용목적</th>
								<th style="width:250px;">사용 예약일</th>
								<th style="width:150px;">시작시간</th>
								<th style="width:150px;">종료시간</th>
								<th style="width:240px;"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty flctsRsvtList }">
									<tr>
										<td colspan="8">예약하신 시설물 정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${flctsRsvtList }" var="flcts">
										<tr>
											<td><c:out value="${flcts.flctNm }"/></td>
											<td><c:out value="${flcts.flctsNm }"/></td>
											<td><c:out value="${flcts.useUsers }"/></td>
											<td><c:out value="${flcts.usePrps }"/></td>
											<td><c:out value="${flcts.rsvtDate }"/></td>
											<td><c:out value="${flcts.startHours }"/></td>
											<td><c:out value="${flcts.endHours }"/></td>
											<c:if test="${flcts.passCheck eq 0}">
												<td></td>
											</c:if>
											<c:if test="${flcts.passCheck eq 1}">
												<td><button class="btn btn-primary rsvtCancleBtn" id="${flcts.flctsRsvtNo}">예약취소</button></td>
											</c:if>
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
<script>
$(function(){
})

var useCancleBtn = $(".useCancleBtn");
var rsvtCancleBtn = $(".rsvtCancleBtn");

// 사물함 사용취소
useCancleBtn.on("click", function(){
	var nextAlls = $(this).nextAll("td");
	
	var flctNo = $(this).parent().nextAll("#data1").attr("class")
	var lockerNo = $(this).parent().nextAll("#data2").attr("class")
	var floor = $(this).parent().nextAll("#data3").attr("class")
	var lockerRsvtNo = $(this).attr("id")
	var tr = $(this).parents("tr");
	console.log(flctNo, lockerNo, floor)
	console.log(tr);
	var lockerObj = {
		"flctNo": flctNo,
		"lockerNo": lockerNo,
		"floor": floor,
		"lockerRsvtNo":lockerRsvtNo
	}
	
	
	$.ajax({
		url: "/hku/locker-cancle",
		type:"delete",
		data:JSON.stringify(lockerObj),
		contentType:"application/json; charset=utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			if(res === "success"){
				swal({
					title: "사용신청이 취소되었습니다.",
					icon: "success",
					button: "닫기"
				})
				tr.remove();
			}else{
				swal({
					title: "사용신청 취소에 실패하였습니다. 다시 시도해주세요.",
					icon: "error",
					button: "닫기"
				})
			}
		}
	})		
})

// 시설물 예약취소
rsvtCancleBtn.on("click", function(){
	var flctsRsvtNo = $(this).attr("id");
	var tr = $(this).parents("tr");
	console.log(tr)
	$.ajax({
		url: `/hku/flcts-cancle/\${flctsRsvtNo}`,
		type:"delete",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			if(res === "success"){
				swal({
					title: "예약이 취소되었습니다.",
					icon: "success",
					button: "닫기"
				})
				tr.remove();
			}else{
				swal({
					title: "예약 취소에 실패하였습니다. 다시 시도해주세요.",
					icon: "error",
					button: "닫기"
				})
			}
			
		}
	})	
	
})

</script>