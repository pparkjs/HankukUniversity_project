<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/certificate.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">증명서</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">증명서 발급 내역</a></li>
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
					<input type="text" class="deptText" id="deptNm" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" id="stdNo" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" id="stdNm" value="${std.stdNm }" disabled>
					학년:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" id="stdGrade" value="${std.grade}" disabled>
					상태:&nbsp;&nbsp;&nbsp;
					<c:set value="${std.stdSttsCd}" var="sttsCd"/>
					<input type="text" class="semText" value="${std.stdSttsNm}" disabled>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid cc">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">유의 사항</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div>
					<span><h5>▶ 잠깐! 학교에 확인하셨나요?</h5></span>
					<span class="uu">졸업 증명서/성적 증명서와 같이 학기가 변경된 직후에 최신 내용이<span><br/>
					<span class="uu">업데이트 되는 증명서는 학교에서 전산 입력을 완료하였는지 발급 전 필히 확인하신 후 신청하시기 바랍니다.</span><br/><br/>

					<span><h5>▶ 문의 : 한국대학교 042-123-4567</h5></span>

					<span class="uu">목록에 없는 증명서는 학교 및 학적 상태에 따라 인터넷 발급이 불가한 증명서입니다. 발급 가능여부를 학교에 문의하시기 바랍니다.</span><br/><br/>

					<span><h5>▶ 이용기간 안내</h5></span>
					<span class="uu">전자증명서는 신청(결제)한 날로부터 30일간 다운로드가 가능합니다.</span><br/>
					<span class="uu">열람내역, 열람차단 설정은 신청(결제)한 날로부터 90일간 이용 가능하며, 이후 [증명서보관함]에서 사라집니다.</span><br/><br/>

					<span><h5>▶ 취소/환불 규정</h5></span>
					<span class="uu">증명서 내용에 문제가 있는 경우 결제 후 30일 이내 취소/환불이 가능하며, 단순변심이나 사용자 과실에 의한 취소/환불은 불가합니다.</span><br/><br/>

					<span><h5>▶ 본 서비스를 통해 출력한 증명서는 원본증명서 입니다.</h5></span>
					
					<!-- <span><h5>▶ 증명서를 제출(전송)할 경우, 반드시 보안증명서 사용법 파일(.html)과 증명서 파일(.min)을 함께 제출(전송)해주십시요.</h5></span> -->
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid cc">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">증명서 보관함</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="cerIssu-wrap" style="font-size: 18px;">
					<table id="certifiIssuTable" border="1">
						<thead>
							<tr>
								<th>구분</th>
								<th>신청 증명서</th>
								<th>발급 일자</th>
								<th>다운로드 만료</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty certifiIssuList}">
									<c:forEach items="${certifiIssuList}" var="certifiIssu">
										<tr>
											<input type="hidden" value="${certifiIssu.ctfctisNo}"/>
											<input type="hidden" value="${certifiIssu.ctfctNo}"/>
											<td>PDF</td>
											<td>${certifiIssu.ctfctisCtfctNm}</td>
											<td>
												<fmt:parseDate value="${certifiIssu.ctfctisIssuDt}" var="ctfctisIssuDt" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${ctfctisIssuDt}" var="ctfctisIssuDt" pattern="yyyy-MM-dd"/>
												${ctfctisIssuDt}
											</td>
											<td>
												<fmt:parseDate value="${certifiIssu.ctfctisExpryYmd}" var="ctfctisExpryYmd" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${ctfctisExpryYmd}" var="ctfctisExpryYmd" pattern="yyyy-MM-dd"/>
												${ctfctisExpryYmd}
											</td>
											<td>
												<c:choose>
													<c:when test="${certifiIssu.avlCd eq 'Y'}">
														<button type="button" class="btn btn-sm btn-danger" style="background: #0070c0; border-color: #0070c0;" onclick="certificate(this)">확인서 출력</button>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-sm btn-danger" disabled="disabled" style="background: #ff4343; border-color: #ff4343;" onclick="certificate(this)">기간 만료</button>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">발급한 증명서가 없습니다.</td>
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
function certificate(target){
	var ctfctisNo = $(target).parents('tr').children().eq(0).val();
	var ctfctNo = $(target).parents('tr').children().eq(1).val();

	var stdNo = $("#stdNo").val();
	// var stdNm = $("#stdNm").val();
	// var deptNm = $("#deptNm").val();
	// var stdGrade = $("#stdGrade").val();
	// var stdBrdt = "${std.stdBrdt}";

	let certifiData = {
		"ctfctisNo": ctfctisNo,
		"ctfctNo": ctfctNo,
		"stdNo": stdNo
	};
	// console.log("certifiData",certifiData);

	$.ajax({
		type: "POST",
		url: "/hku/certifi-print",
		data: JSON.stringify(certifiData),
		dataType: "text",
		contentType: 'application/json;charset=UTF-8',
		beforeSend : function(xhr){xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		success: function(res){
			// alert("print~~");
			window.open("/hku/preload?preload="+res, '증명서 출력', 'width=900px,height=900px,scrollbars=yes');
		},
		error : function(){

		}
	});



}
</script>
