<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/tuition.css">
<link rel="stylesheet" href="/css/student/tut-bill.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">등록금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 고지서</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tutInfo">
					<span class="aa">
						학과:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.deptNm }" disabled>
					<span class="aa">
						학번:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.stdNo }" disabled>
					<span class="aa">
						이름:&nbsp;&nbsp;&nbsp;
					</span>
						<input type="text" class="tutText" value="${std.stdNm }" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">등록 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tutInfo">
					<span class="aa">
						등록년도:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentYear }년" disabled>
					<span class="aa">
						학기:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="${std.currentSem }학기" disabled>
					<span class="aa">
						등록기한:&nbsp;&nbsp;&nbsp;
					</span>
					<input type="text" class="tutText" value="2023/08/31" disabled>
				</div>
				<div class="tutInfo" style="margin-top: 13px;">
					<span class="aa">
						수업료:&nbsp;&nbsp;&nbsp;
					</span>
					<fmt:formatNumber value="${tuition.tutAmt}" pattern="#,###" var="tutAmt"/>
					<input type="text" class="tutText" value="${tutAmt}" disabled>
					<span class="aa">
						감면금액:&nbsp;&nbsp;&nbsp;
					</span>
					<fmt:formatNumber value="${tuition.tutSclsAmt}" pattern="#,###" var="tutSclsAmt"/>
					<input type="text" class="tutText" value="${tutSclsAmt}" disabled>
					<span class="aa">
						납부금액:&nbsp;&nbsp;&nbsp;
					</span>
					<fmt:formatNumber value="${tuition.tutAmt - tuition.tutSclsAmt}" pattern="#,###" var="tutTotal"/>
					<input type="text" class="tutText" value="${tutTotal}" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 " style="display: flex; justify-content: space-between;">
				<h5 class="card-title">등록금 고지서</h5>
				<button type="button" class="btn btn-sm btn-primary" style="margin-bottom: 8px;" onclick="tutBillPrint()">고지서 출력</button>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="tut-bill-wrap">
					<div class="tb-wrap">
						<table id="tutTable" border="1">
							<tr>
								<td class="tt" style="width: 22%;">학과</td>
								<td style="width: 28%;">${std.deptNm }</td>
								<td class="tt" style="width: 22%;">학번</td>
								<td style="width: 28%;">${std.stdNo }</td>
							</tr>
							<tr>
								<td class="tt">학년/학기</td>
								<td>${std.currentYear }년 ${std.currentSem }학기</td>
								<td class="tt">성명</td>
								<td>${std.stdNm }</td>
							</tr>
						</table>
					</div>
					<div class="tb-wrap" style="margin-top: 20px;">
						<table id="tutTable1" border="1" style="width: 39%; margin-right: 32px;">
							<tr>
								<td colspan="4" class="tt">등록금 내역</td>
							</tr>
							<tr>
								<td class="tt">수업료</td>
								<td><c:out value="${tutAmt}"/></td>
								<!-- <td class="tt">성명</td>
								<td>${std.stdNm }</td> -->
							</tr>
							<tr>
								<td class="tt" style="width: 45%;">장학금</td>
								<td style="width: 55%;"><c:out value="${tutSclsAmt}"/></td>
								<!-- <td class="tt" style="width: 22%;">학번</td>
								<td style="width: 28%;">${std.stdNo }</td> -->
							</tr>
							<tr>
								<td class="tt">계</td>
								<td><c:out value="${tutTotal}"/></td>
								<!-- <td class="tt">성명</td>
								<td>${std.stdNm }</td> -->
							</tr>
						</table>
						<table id="tutTable2" border="1" style="width: 39%;">
							<tr>
								<td class="tt" style="width: 21%;">등록기한</td>
								<td style="width: 28%;">2023/08/31</td>
								<!-- <td class="tt" style="width: 22%;">학번</td>
								<td style="width: 28%;">${std.stdNo }</td> -->
							</tr>
							<tr>
								<td class="tt">입금전용계좌(신한은행)</td>
								<td>${tuition.tutPayActno}</td>
								<!-- <td class="tt">성명</td>
								<td>${std.stdNm }</td> -->
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
function tutBillPrint(){
	var stdNo = "${std.stdNo }";
	var stdNm = "${std.stdNm }";
	var deptNm = "${std.deptNm }";
	var grade = "${std.grade }";
	var currentYear = "${std.currentYear }";
	var currentSem = "${std.currentSem }";
	var tutAmt = "${tuition.tutAmt}";
	var tutSclsAmt = "${tuition.tutSclsAmt}";
	var deadLine = "2023/08/31";
	var tutPayActno = "${tuition.tutPayActno}"

	let tutBillData = {
		"stdNo": stdNo,
		"stdNm": stdNm,
		"deptNm": deptNm,
		"grade": grade,
		"currentYear": currentYear,
		"currentSem": currentSem,
		"tutAmt": tutAmt,
		"tutSclsAmt": tutSclsAmt,
		"deadLine": deadLine,
		"tutPayActno": tutPayActno
	};

	// console.log("tutBillData",tutBillData);

	$.ajax({
		type:"POST",
		url:"/hku/tuiBillPrint",
		data: JSON.stringify(tutBillData),
		dataType:"text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			// alert("등록금고지서 잘 갔다옴");
			// console.log("res",res);
			window.open("/hku/preload?preload="+res, '등록금고지서', 'width=900px,height=900px,scrollbars=yes');
		},
		error: function(){
			alert("등록금고지서 실패");
		}
	});
}
</script>