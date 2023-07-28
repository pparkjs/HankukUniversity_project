<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<style>
.table-wrap {
    overflow: scroll;
    height: 433px;
    margin-top: -12px;
}
.thead-dark{
	position: sticky;
	top: 0px;
}
.table-info-td{
	font-size: 1.2em;
	font-weight: bold;
	text-align: center;
	color: whitesmoke;
	background-color: #800000;
}
.form-label{
	color: #800000;
}
.custom-tab-1 .nav-link {
    font-weight: 800;
    color: #444444;
    font-size: 17px;
}
.badge-light{
	background-color: #e6b9b8;
}
.badge-success{
	background-color: #0070c0;
}
.table .thead-dark th {
    padding: 7px;
}
.table tbody tr td {
    padding: 0px;
}
</style>
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">학사관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학적 관리</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -16px;">
		<div class="custom-tab-1" style="display: flex; align-items: center;">
			<ul class="nav nav-tabs ">
				<li class="nav-item">
					<a class="nav-link active" data-bs-toggle="tab" href="#profile1" id="allBtn">전체</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#contact1" id="stdBtn">대기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#message1" id="proBtn">승인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#message2" id="empBtn">반려</a>
				</li>
			</ul>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">휴학, 복학 신청관리</h5>
			</div>
			<div class="card-body">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="profile1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">시작학기</th>
										<th style="width:100px;">종료학기</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="academicAply" items="${academicAplyList}">
										<tr>
											<td>
												<c:out value="${academicAply.stdNo}"/>
												<input type="hidden" id="changeTypeCd" value="${academicAply.changeTypeCd }">
												<input type="hidden" id="changeRsn" value="${academicAply.changeRsn }">
											</td>
											<td>
												<c:out value="${academicAply.stdNm}"/>
											</td>
											<td>
												<c:out value="${academicAply.changeStartYr}"/>년도 <c:out value="${academicAply.changeStartSem}"/>학기
											</td>
											<td>
												<c:out value="${academicAply.changeEndYr}"/>년도 <c:out value="${academicAply.changeEndSem}"/>학기
											</td>
											<td>
												<fmt:parseDate var="aplyDt" value="${academicAply.changeAplyDt }" pattern="yyyy-MM-dd"/>
												<fmt:formatDate var="adt" value="${aplyDt}" pattern="yyyy-MM-dd"/>
												<c:out value="${adt}"/>
											</td>
											<td>
												<c:choose>
													<c:when test="${academicAply.aprvSttsCd eq '대기'}">
														<span class="badge badge-light">
															<c:out value="${academicAply.aprvSttsCd}"/>
														</span>
													</c:when>
													<c:when test="${academicAply.aprvSttsCd eq '승인'}">
														<span class="badge badge-success">
															<c:out value="${academicAply.aprvSttsCd}"/>
														</span>
													</c:when>
													<c:when test="${academicAply.aprvSttsCd eq '반려'}">
														<span class="badge badge-danger">
															<c:out value="${academicAply.aprvSttsCd}"/>
														</span>
													</c:when>
												</c:choose>
											</td>
											<td>
												<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${academicAply.changeNo }"/>">
													<span class="btn-icon-start text-info">
														<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
															<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
													</span>보기
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="contact1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">시작학기</th>
										<th style="width:100px;">종료학기</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="academicAply" items="${academicAplyList}">
										<c:if test="${academicAply.aprvSttsCd eq '대기'}">
											<tr>
												<td>
													<c:out value="${academicAply.stdNo}"/>
													<input type="hidden" id="changeTypeCd" value="${academicAply.changeTypeCd }">
													<input type="hidden" id="changeRsn" value="${academicAply.changeRsn }">
												</td>
												<td>
													<c:out value="${academicAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${academicAply.changeStartYr}"/>년도 <c:out value="${academicAply.changeStartSem}"/>학기
												</td>
												<td>
													<c:out value="${academicAply.changeEndYr}"/>년도 <c:out value="${academicAply.changeEndSem}"/>학기
												</td>
												<td>
													<fmt:parseDate var="aplyDt" value="${academicAply.changeAplyDt }" pattern="yyyy-MM-dd"/>
													<fmt:formatDate var="adt" value="${aplyDt}" pattern="yyyy-MM-dd"/>
													<c:out value="${adt}"/>
												</td>
												<td>
													<span class="badge badge-light">
														<c:out value="${academicAply.aprvSttsCd}"/>
													</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${academicAply.changeNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="message1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">시작학기</th>
										<th style="width:100px;">종료학기</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="academicAply" items="${academicAplyList}">
										<c:if test="${academicAply.aprvSttsCd eq '승인'}">
											<tr>
												<td>
													<c:out value="${academicAply.stdNo}"/>
													<input type="hidden" id="changeTypeCd" value="${academicAply.changeTypeCd }">
													<input type="hidden" id="changeRsn" value="${academicAply.changeRsn }">
												</td>
												<td>
													<c:out value="${academicAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${academicAply.changeStartYr}"/>년도 <c:out value="${academicAply.changeStartSem}"/>학기
												</td>
												<td>
													<c:out value="${academicAply.changeEndYr}"/>년도 <c:out value="${academicAply.changeEndSem}"/>학기
												</td>
												<td>
													<fmt:parseDate var="aplyDt" value="${academicAply.changeAplyDt }" pattern="yyyy-MM-dd"/>
													<fmt:formatDate var="adt" value="${aplyDt}" pattern="yyyy-MM-dd"/>
													<c:out value="${adt}"/>
												</td>
												<td>
													<span class="badge badge-success">
														<c:out value="${academicAply.aprvSttsCd}"/>
													</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${academicAply.changeNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="message2">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">학번</th>
										<th style="width:100px;">성명</th>
										<th style="width:100px;">시작학기</th>
										<th style="width:100px;">종료학기</th>
										<th style="width:100px;">신청일자</th>
										<th style="width:100px;">승인상태</th>
										<th style="width:100px;">상세보기</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="academicAply" items="${academicAplyList}">
										<c:if test="${academicAply.aprvSttsCd eq '반려'}">
											<tr>
												<td>
													<c:out value="${academicAply.stdNo}"/>
													<input type="hidden" id="changeTypeCd" value="${academicAply.changeTypeCd }">
													<input type="hidden" id="changeRsn" value="${academicAply.changeRsn }">
												</td>
												<td>
													<c:out value="${academicAply.stdNm}"/>
												</td>
												<td>
													<c:out value="${academicAply.changeStartYr}"/>년도 <c:out value="${academicAply.changeStartSem}"/>학기
												</td>
												<td>
													<c:out value="${academicAply.changeEndYr}"/>년도 <c:out value="${academicAply.changeEndSem}"/>학기
												</td>
												<td>
													<fmt:parseDate var="aplyDt" value="${academicAply.changeAplyDt }" pattern="yyyy-MM-dd"/>
													<fmt:formatDate var="adt" value="${aplyDt}" pattern="yyyy-MM-dd"/>
													<c:out value="${adt}"/>
												</td>
												<td>
													<span class="badge badge-danger">
														<c:out value="${academicAply.aprvSttsCd}"/>
													</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info infoBtn" id="<c:out value="${academicAply.changeNo }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>보기
													</button>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">신청 상세</h5>
			</div>
			<div class="card-body" style="height: 333px; overflow: visible">
				<form class="row" method="post" action="/hku/admin/academic/fluctuation-list" id="detailFrm">
					<div class="col-lg-6">
						<div class="row detail">
							<div class="col-lg-4 mb-1">
								<input type="hidden" id="changeNo" name="changeNo">
								<input type="hidden" id="aprvSttsCd" name="aprvSttsCd">
								<label class="text-label form-label">학번</label>
								<input type="text" name="place" class="form-control" disabled id="stdNo">
							</div>
							<div class="col-lg-4 mb-1">
								<label class="text-label form-label">성명</label>
								<input type="text" name="place" class="form-control" disabled id="stdNm">
							</div>
							<div class="col-lg-4 mb-1">
								<label class="text-label form-label">학적변동</label>
								<input type="text" name="place" class="form-control" disabled id="changeTypeCd">
							</div>
							<div class="col-lg-4 mb-1">
								<label class="text-label form-label">시작학기</label>
								<input type="text" name="place" class="form-control" disabled id="changeStart">
							</div>
							<div class="col-lg-4 mb-1">
								<label class="text-label form-label">종료학기</label>
								<input type="text" name="place" class="form-control" disabled id="changeEnd">
							</div>
							<div class="col-lg-4 mb-1">
								<label class="text-label form-label">신청일자</label>
								<input type="text" name="place" class="form-control" disabled id="changeAplyDt">
							</div>
							<div class="col-lg-12 mb-1">
								<label class="text-label form-label">사유</label>
								<textarea rows="5" cols="30" class="form-control" disabled id="changeRsn"></textarea>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="col-lg-12 mb-4">
							<label class="text-label form-label">처리의견</label>
							<textarea rows="10" cols="30" class="form-control" id="rejRsn" name="changeRjctRsn"></textarea>
						</div>
						<div class="col-lg-12 mb-1" style="text-align: right;">
							<button type="button" class="btn btn-danger light" id="rejBtn">반려</button>
							<button type="button" class="btn btn-primary" id="appvBtn">승인</button>
						</div>
					</div>
					<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
</div>
<c:if test="${not empty msg and msg eq 'appvSuccess'}">
	<script type="text/javascript">
		$(document).ready(function() {
			swal({
				title: "성공적으로 승인 되었습니다.", 
				icon: "success"
			});
		});
	</script>
</c:if>
<c:if test="${not empty msg and msg eq 'rejSuccess'}">
	<script type="text/javascript">
		$(document).ready(function() {
			swal({
				title: "성공적으로 반려 되었습니다.", 
				icon: "success"
			});
		});
	</script>
</c:if>
<script type="text/javascript">
$(function(){
	var infoBtn = $('.infoBtn');
	var appvBtn = $('#appvBtn'); //승인 버튼
	var rejBtn = $('#rejBtn'); // 반려 버튼
	var detail = $('.detail');
	var detailFrm = $('#detailFrm');
	
	infoBtn.on('click',function(){
		console.log(this.id);
		
		// 기본키
		let changeNo = this.id;
		detail.find('#changeNo').val(this.id);
		
		let clickTr = $(this).parents('tr');
		console.log(clickTr.find('td').eq(0).text().trim());
		detail.find('#stdNo').val(clickTr.find('td').eq(0).text().trim());
		detail.find('#stdNm').val(clickTr.find('td').eq(1).text().trim());
		
		let start = clickTr.find('td').eq(2).text().trim().replace(/\s+/g, ' ').replaceAll("\n"," ");
		let end = clickTr.find('td').eq(3).text().trim().replace(/\s+/g, ' ').replaceAll("\n"," ");
		
		detail.find('#changeStart').val(start);
		detail.find('#changeEnd').val(end);
		detail.find('#changeAplyDt').val(clickTr.find('td').eq(4).text().trim());
		detail.find('#changeTypeCd').val(clickTr.find('#changeTypeCd').val());
		detail.find('#changeRsn').val(clickTr.find('#changeRsn').val());
		
		$('#aprvSttsCd').val(clickTr.find('td').eq(5).text().trim())
	});
	
	appvBtn.on('click',function(){
		if ($('#aprvSttsCd').val() != "대기") {
			swal({
				title: "이미 처리된 정보 입니다.", 
				icon: "error"
			});
			return false;
		}
		let changeNo = detail.find('#changeNo').val().trim();
		if (changeNo == "" || changeNo == null) {
			swal({
				title: "신청 정보를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		$('#aprvSttsCd').val('appv');
		swal({
			   title: '승인 하시겠습니까?',
			   icon: 'warning',
			   buttons: true,
			   dangerMode: true,
		}).then((willDelete) => {
			if (willDelete) {
				detailFrm[0].submit();
			}
		});
	});
	
	rejBtn.on('click',function(){
		if ($('#aprvSttsCd').val() != "대기") {
			swal({
				title: "이미 처리된 정보 입니다.", 
				icon: "error"
			});
			return false;
		}
		let changeNo = detail.find('#changeNo').val().trim();
		let rejRsn = $('#rejRsn').val().trim();
		if (changeNo == "" || changeNo == null) {
			swal({
				title: "신청 정보를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		if (rejRsn == "" || rejRsn == null) {
			swal({
				title: "반려사유를 입력해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		$('#aprvSttsCd').val('rej');
		
		swal({
			   title: '반려하시겠습니까?',
			   icon: 'warning',
			   buttons: true,
			   dangerMode: true,
		}).then((willDelete) => {
			if (willDelete) {
				detailFrm[0].submit();
			}
		});
	});
});
</script>
