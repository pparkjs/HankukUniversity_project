<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/counseling-style.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">상담</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">신청내역조회</a></li>
		</ol>
    </div>
	<div class="container-fluid subCon">
		<div class="custom-tab-1">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-bs-toggle="tab" href="#home1">대기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#profile1">승인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#contact1">반려</a>
				</li>
			</ul>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="color: maroon;  font-weight: 900;">상담신청 내역</h5>
			</div>
			<hr>
			<div class="card-body" style="padding-top: 0px; color: black; font-size: 18px; padding: 0.75rem;">
				<!-- Nav tabs -->
				<div class="tab-content">
					<div class="tab-pane fade show active" id="home1" role="tabpanel">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:300px;">교수명</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty counseList }">
											<tr>
												<td colspan="8">신청 대기중인 내역이 존재하지 않습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:set value="0" var="count"/>
											<c:forEach items="${counseList }" var="counse">
												<c:if test="${counse.aprvSttsCd == 'wait' }">
													<tr>
														<td><c:out value="${counse.stdNo }"></c:out></td>
														<td><c:out value="${counse.stdNm }"></c:out></td>
														<td><c:out value="${counse.proNm }"></c:out></td>
														<td><c:out value="${counse.dscsnAplyDt }"></c:out></td>
														<td><c:out value="${counse.periodCd }"></c:out></td>
														<td><c:out value="${counse.dscsnRsn }"></c:out></td>
														<td><c:out value="${counse.attendModeCd }"></c:out></td>
														<td style="display: flex; justify-content: center;">
															<div class="wait">대기</div>
														</td>
													<tr>
													<c:set value="${count + 1 }" var="count"/>
												</c:if>
											</c:forEach>
											<c:if test="${count == 0 }">
												<tr>
													<td colspan="8">신청 대기중인 내역이 존재하지 않습니다.</td>
												</tr>
											</c:if>		
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="profile1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:300px;">교수명</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty counseList }">
											<tr>
												<td colspan="8">승인된 상담 내역이 존재하지 않습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:set value="0" var="count"/>
											<c:forEach items="${counseList }" var="counse">
												<c:if test="${counse.aprvSttsCd == 'appv' }">
													<tr>
														<td><c:out value="${counse.stdNo }"></c:out></td>
														<td><c:out value="${counse.stdNm }"></c:out></td>
														<td><c:out value="${counse.proNm }"></c:out></td>
														<td><c:out value="${counse.dscsnAplyDt }"></c:out></td>
														<td><c:out value="${counse.periodCd }"></c:out></td>
														<td><c:out value="${counse.dscsnRsn }"></c:out></td>
														<td><c:out value="${counse.attendModeCd }"></c:out></td>
														<c:if test="${counse.attendModeCd == '비대면'}">
															<td>
																<a href="https://b02e-1-212-157-150.ngrok-free.app/rtc?dscsnNo=${counse.dscsnNo }" class="btn btn-primary" id="regBtn" style="background: #0070c0; border-color:#0070c0;">입장</a>
															</td>
														</c:if>
														<c:if test="${counse.attendModeCd == '대면'}">
															<td style="display: flex; justify-content: center;">
																<div class="appv">승인</div>
															</td>
														</c:if>
													</tr>
													<c:set value="${count + 1 }" var="count"/>
												</c:if>
											</c:forEach>
											<c:if test="${count == 0 }">
												<tr>
													<td colspan="8">승인된 상담 내역이 존재하지 않습니다.</td>
												</tr>
											</c:if>		
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="contact1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:200px;">학번</th>
										<th style="width:300px;">이름</th>
										<th style="width:300px;">교수명</th>
										<th style="width:200px;">상담일자</th>
										<th style="width:200px;">상담시간</th>
										<th style="width:500px;">상담사유</th>
										<th style="width:100px;">상담유형</th>
										<th style="width:300px;">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty counseList }">
											<tr>
												<td colspan="8">반려된 상담 내역이 존재하지 않습니다.</td>
											<tr>
										</c:when>
										<c:otherwise>
											<c:set value="0" var="count"/>
											<c:forEach items="${counseList }" var="counse">
												<c:if test="${counse.aprvSttsCd == 'rej' }">
													<tr>
														<td><c:out value="${counse.stdNo }"></c:out></td>
														<td><c:out value="${counse.stdNm }"></c:out></td>
														<td><c:out value="${counse.proNm }"></c:out></td>
														<td><c:out value="${counse.dscsnAplyDt }"></c:out></td>
														<td><c:out value="${counse.periodCd }"></c:out></td>
														<td><c:out value="${counse.dscsnRsn }"></c:out></td>
														<td><c:out value="${counse.attendModeCd }"></c:out></td>
														<td style="display: flex; justify-content: center;">
															<div class="rej" data-bs-toggle="modal" data-rejcon="${fn:escapeXml(counse.rejCon) }" data-bs-target="#rejModal" style="cursor: pointer;">반려 내용</div>
														</td>
													<tr>
													<c:set value="${count + 1 }" var="count"/>
												</c:if>
											</c:forEach>
											<c:if test="${count == 0 }">
												<tr>
													<td colspan="8">반려된 상담 내역이 존재하지 않습니다.</td>
												</tr>
											</c:if>		
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade sModal" id="rejModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="font-size: 18px; font-weight: 800;">반려 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
				<textarea rows="10" cols="10" class="form-control" id="rej-con" readonly="readonly"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
$(".rej").on("click", function(){
	var rejcon = $(this).data("rejcon")
	$("#rej-con").val(rejcon)
})
</script>