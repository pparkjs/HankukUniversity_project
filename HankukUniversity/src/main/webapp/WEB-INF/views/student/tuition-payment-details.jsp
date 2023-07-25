<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/tuition.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">등록금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">등록금 납부내역</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
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
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">등록내역</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="table-wrap">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>등록 년도</th>
								<th>등록 학기</th>
								<th>수업료</th>
								<th>감면금액</th>
								<th>납부금액</th>
								<th>등록일자</th>
								<th>납부 확인서</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty tuitionList }">
									<c:forEach items="${tuitionList}" var="tuition" varStatus="stat">
									<c:set value="${tuition.tutAmt }" var="tutAmt"/>
									<c:set value="${tuition.tutSclsAmt }" var="tutSclsAmt"/>
										<tr>
											<input type="hidden" value="${tuition.tutNo}"/>
											<input type="hidden" value="${tuition.tutSem}"/>
											<input type="hidden" value="${tuition.tutAmt}"/>
											<input type="hidden" value="${tuition.tutSclsAmt}"/>
											<input type="hidden" value="${tuition.tutPayDt}"/>
											<input type="hidden" value="${tuition.bankNm}"/>
											<input type="hidden" value="${tuition.tutPayActno}"/>
											<td>${stat.count}</td>
											<td>${tuition.tutYr}</td>
											<td>${tuition.tutSem} 학기</td>
											<td><fmt:formatNumber value="${tuition.tutAmt}" pattern="#,###"/></td>
											<td><fmt:formatNumber value="${tuition.tutSclsAmt}" pattern="#,###"/></td>
											<td>
												<fmt:formatNumber value="${tutAmt-tutSclsAmt }" pattern="#,###"/>
											</td>
											<td>
<%-- 												<c:choose> --%>
<%-- 													<c:when test="${tuition.tutPayDt ne '-' }"> --%>
<%-- 														<fmt:parseDate value="${tuition.tutPayDt}" var="tutPayDt" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
<%-- 														<fmt:formatDate value="${tutPayDt}" pattern="yyyy-MM-dd"/> --%>
<%-- 													</c:when> --%>
<%-- 													<c:otherwise> --%>
														${tuition.tutPayDt}
<%-- 													</c:otherwise> --%>
<%-- 												</c:choose> --%>
											</td>
											<td>
												<c:choose>
													<c:when test="${tuition.avlCd eq 'Y'}">
														<button type="button" class="btn btn-sm btn-danger" stat="1" style="background: #0070c0; border-color: #0070c0;" onclick="tuitionCertifi(this)">확인서 출력</button>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-sm btn-danger" stat="0" style="background: #ff4343; border-color: #ff4343;" onclick="tuitionCertifi(this)">미납</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">조회 내역이 없습니다.</td>
									</tr>
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

});

function tuitionCertifi(target){
	if($(target).attr('stat') == '0'){
		swal({
			title: "등록이 완료된 확인서만 확인 가능합니다!",
			icon: "error"
		})
		return false;
	}

	var tutNo = $(target).parents("tr").children().eq(0).val();
	var tutYr = $(target).parents("tr").children().eq(8).text();
	var tutSem = $(target).parents("tr").children().eq(1).val();
	var tutAmt = $(target).parents("tr").children().eq(2).val();
	var tutSclsAmt = $(target).parents("tr").children().eq(3).val();
	var tutPayDt = $(target).parents("tr").children().eq(4).val();
	var bankNm = $(target).parents("tr").children().eq(5).val();
	var tutPayActno = $(target).parents("tr").children().eq(6).val();

	let certifiData = {
		"tutNo": tutNo,
		"tutYr": tutYr,
		"tutSem": tutSem,
		"tutAmt": tutAmt,
		"tutSclsAmt": tutSclsAmt,
		"tutPayDt": tutPayDt,
		"bankNm": bankNm,
		"tutPayActno": tutPayActno
	};
	// console.log(certifiData);

	$.ajax({
		type:"POST",
		url:"/hku/tuitionCertifi",
		data: JSON.stringify(certifiData),
		dataType:"text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
// 			alert("등록확인서 잘 갔다옴");
			// console.log("res",res);
			window.open("/hku/preload?preload="+res, '등록확인서', 'width=900px,height=900px,scrollbars=yes');
		},
		error: function(){
			alert("등록확인서 실패");
		}
	});
}
</script>
