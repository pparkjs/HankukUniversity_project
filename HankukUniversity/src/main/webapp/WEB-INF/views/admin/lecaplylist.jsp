<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.table-wrap {
    overflow: scroll;
    height: 619px;
    margin-top: 13px;
}
.thead-dark{
	position: sticky;
	top: 0px;
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
</style>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">교수행정</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">개설신청 관리</a></li>
		</ol>
    </div>
	<div class="container-fluid">
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
				<h5 class="card-title">개설 신청 관리</h5>
			</div>
			<div class="card-body" style="height: 656px">
				<div class="tab-content">
					<div class="tab-pane fade show active" id="profile1">
						<div class="table-wrap">
							<table class="table" style="margin-top: -22px;">
								<thead class="thead-dark">
									<tr>
										<th style="width:100px;">개설년도</th>
										<th style="width:80px;">개설학기</th>
										<th style="width:120px;">교수이름</th>
										<th style="width:300px;">과목명</th>
										<th style="width:120px;">신청일자</th>
										<th style="width:80px;">승인상태</th>
										<th style="width:80px;">강의계획서</th>
									</tr>
								</thead>
								<tbody id="allTbody">
									<!-- 전체 내용 추가 -->
									<c:forEach var="lecap" items="${lecApList}">
										<tr>
											<td>
												<c:out value="${lecap.LECAP_YR }"/>
											</td>
											<td>
												<c:out value="${lecap.LECAP_SEM }"/>
											</td>
											<td>
												<input type="hidden" class="proNo" value="<c:out value="${lecap.PRO_NO }"/>">
												<c:out value="${lecap.PRO_NM }"/>
											</td>
											<td>
												<input type="hidden" class="subNo" value="<c:out value="${lecap.SUB_NO }"/>">
												<c:out value="${lecap.SUB_NM }"/>
											</td>
											<td>
												<c:out value="${lecap.LECAP_DT }"/>
											</td>
											<td>
												<c:choose>
													<c:when test="${lecap.APRV_STTS_CD eq 'wait'}">
														<span class="badge badge-light">대기</span>
													</c:when>
													<c:when test="${lecap.APRV_STTS_CD eq 'appv'}">
														<span class="badge badge-success">승인</span>
													</c:when>
													<c:when test="${lecap.APRV_STTS_CD eq 'rej'}">
														<span class="badge badge-danger">반려</span>
													</c:when>
												</c:choose>
											</td>
											<td>
												<button type="button" class="btn btn-outline-info lecApBtn" id="<c:out value="${lecap.LECAP_NO }"/>">
													<span class="btn-icon-start text-info">
														<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
															<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
														</svg>
													</span>강의계획서
												</button>
												<input type="hidden" class="lecapNo" value="<c:out value="${lecap.LECAP_NO }"/>">
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
										<th style="width:100px;">개설년도</th>
										<th style="width:80px;">개설학기</th>
										<th style="width:120px;">교수이름</th>
										<th style="width:300px;">과목명</th>
										<th style="width:120px;">신청일자</th>
										<th style="width:80px;">승인상태</th>
										<th style="width:80px;">강의계획서</th>
									</tr>
								</thead>
								<tbody>
									<!-- 대기 중인 내용 추가 -->
									<c:forEach var="lecap" items="${lecApList}">
										<c:if test="${lecap.APRV_STTS_CD eq 'wait'}">
											<tr>
												<td>
													<c:out value="${lecap.LECAP_YR }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_SEM }"/>
												</td>
												<td>
													<input type="hidden" class="proNo" value="<c:out value="${lecap.PRO_NO }"/>">
													<c:out value="${lecap.PRO_NM }"/>
												</td>
												<td>
													<input type="hidden" class="subNo" value="<c:out value="${lecap.SUB_NO }"/>">
													<c:out value="${lecap.SUB_NM }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_DT }"/>
												</td>
												<td>
													<span class="badge badge-light">대기</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info lecApBtn" id="<c:out value="${lecap.LECAP_NO }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>강의계획서
													</button>
													<input type="hidden" class="lecapNo" value="<c:out value="${lecap.LECAP_NO }"/>">
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
										<th style="width:100px;">개설년도</th>
										<th style="width:80px;">개설학기</th>
										<th style="width:120px;">교수이름</th>
										<th style="width:300px;">과목명</th>
										<th style="width:120px;">신청일자</th>
										<th style="width:80px;">승인상태</th>
										<th style="width:80px;">강의계획서</th>
									</tr>
								</thead>
								<tbody>
									<!-- 승인만 보이게 -->
									<c:forEach var="lecap" items="${lecApList}">
										<c:if test="${lecap.APRV_STTS_CD eq 'appv'}">
											<tr>
												<td>
													<c:out value="${lecap.LECAP_YR }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_SEM }"/>
												</td>
												<td>
													<input type="hidden" class="proNo" value="<c:out value="${lecap.PRO_NO }"/>">
													<c:out value="${lecap.PRO_NM }"/>
												</td>
												<td>
													<input type="hidden" class="subNo" value="<c:out value="${lecap.SUB_NO }"/>">
													<c:out value="${lecap.SUB_NM }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_DT }"/>
												</td>
												<td>
													<span class="badge badge-success">승인</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info lecApBtn" id="<c:out value="${lecap.LECAP_NO }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>강의계획서
													</button>
													<input type="hidden" class="lecapNo" value="<c:out value="${lecap.LECAP_NO }"/>">
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
										<th style="width:100px;">개설년도</th>
										<th style="width:80px;">개설학기</th>
										<th style="width:120px;">교수이름</th>
										<th style="width:300px;">과목명</th>
										<th style="width:120px;">신청일자</th>
										<th style="width:80px;">승인상태</th>
										<th style="width:80px;">강의계획서</th>
									</tr>
								</thead>
								<tbody>
									<!-- 반려 내용 추가 -->
									<c:forEach var="lecap" items="${lecApList}">
										<c:if test="${lecap.APRV_STTS_CD eq 'rej'}">
											<tr>
												<td>
													<c:out value="${lecap.LECAP_YR }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_SEM }"/>
												</td>
												<td>
													<input type="hidden" class="proNo" value="<c:out value="${lecap.PRO_NO }"/>">
													<c:out value="${lecap.PRO_NM }"/>
												</td>
												<td>
													<input type="hidden" class="subNo" value="<c:out value="${lecap.SUB_NO }"/>">
													<c:out value="${lecap.SUB_NM }"/>
												</td>
												<td>
													<c:out value="${lecap.LECAP_DT }"/>
												</td>
												<td>
													<span class="badge badge-danger">반려</span>
												</td>
												<td>
													<button type="button" class="btn btn-outline-info lecApBtn" id="<c:out value="${lecap.LECAP_NO }"/>">
														<span class="btn-icon-start text-info">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M14.2882 15.3585H8.88818" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
																<path d="M12.2432 11.606H8.88721" stroke="#888888" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
															</svg>
														</span>강의계획서
													</button>
													<input type="hidden" class="lecapNo" value="<c:out value="${lecap.LECAP_NO }"/>">
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
	</div>
</div>
<script type="text/javascript">
$(function(){
	var lecModal = $('#lecModal');
	var rejModal = $('#rejModal');
	var lecApBtn = $('.lecApBtn');
	var rejBtn = $('#rejBtn');
	var appvBtn = $('#appvBtn');
	var rejSendBtn = $('#rejSendBtn');
// 	var allTbody = $('#allTbody');


	// 강의계획서 보는 버튼 눌럿을때
	lecApBtn.on('click',function(){
		let check = $(this).parents('tr').find('span').text().trim();

		if(check != '대기'){
			rejBtn.css('display','none');
			appvBtn.css('display','none');
		}else{
			rejBtn.css('display','block');
			appvBtn.css('display','block');
		}			

		let lecApNo = this.id;
		$('#lecApNo').val(lecApNo);
		console.log("강의 계획서 번호", lecApNo);
		// 비동기로 데이터 가져오기
		$.ajax({
			type:"get",
			url: "/hku/admin/lecaplylist/"+lecApNo,
			dataType: "json",
			success: function(res){
				console.log("강의계획서 뿌려주기 데이터", res);

				var lecBasic = res.lecBasic;
				var lecProgram = res.lecProgram;
				var scheduleList = res.scheduleList;
				
				if (lecBasic == null || lecProgram == null || scheduleList == null || scheduleList.length == 0) {
					swal({
						title: "강의계획서가 없습니다.", 
						icon: "error"
					});
					return;
				}
				
				
				//가져온 데이터 넣어주기
				$('#subNo').val(lecBasic.subNo);				
				$('#subNm').val(lecBasic.subNm);				
				$('#deptNm').val(lecBasic.deptNm);
				$('#grade').val(lecBasic.subGrade);
				$('#lecapCpct').val(lecBasic.lecapCpct);
				$('#lecapYr').val(lecBasic.lecapYr);
				$('#lecapSem').val(lecBasic.lecapSem);
				$('#subCrd').val(lecBasic.subCrd);
				$('#crsClassfCd').val(getCrsClassfNm(lecBasic.crsClassfCd));
				$('#proNm').val(lecBasic.proNm);
				$('#proMail').val(lecBasic.proMail);
				$('#proTel').val(lecBasic.proTelno);

				$('#lecpgAtd').val(lecProgram.lecpgAtd);
				$('#lecpgHw').val(lecProgram.lecpgHw);
				$('#lecpgMdTest').val(lecProgram.lecpgMdTest);
				$('#lecpgFnTest').val(lecProgram.lecpgFnTest);
				$('#meet').val(getAvlNm(lecProgram.avlCd));
				$('#lang').val(getLanguage(lecProgram.lecpgLggCd));
				$('#lecpgBook').val(lecProgram.lecpgBook);
				$('#lectureIntro').val(lecProgram.lecpgIntro);

				$('#week1').val(lecProgram.week1);
				$('#week2').val(lecProgram.week2);
				$('#week3').val(lecProgram.week3);
				$('#week4').val(lecProgram.week4);
				$('#week5').val(lecProgram.week5);
				$('#week6').val(lecProgram.week6);
				$('#week7').val(lecProgram.week7);
				$('#week8').val(lecProgram.week8);
				$('#week9').val(lecProgram.week9);
				$('#week10').val(lecProgram.week10);
				$('#week11').val(lecProgram.week11);
				$('#week12').val(lecProgram.week12);
				$('#week13').val(lecProgram.week13);
				$('#week14').val(lecProgram.week14);
				$('#week15').val(lecProgram.week15);

				$('#flctsNm').val(lecBasic.flctNm);
				$('#flctNm').val(lecBasic.flctsNm);
				
				$('#timeBody').find('.timeTd').css('background-color', '');
				
				let data = [];
				let mySchedule = {
					day : dayChange(lecBasic.lecscDay),
					start: lecBasic.periodCd,
					hour: lecBasic.lecscHour
				};
				data.push(mySchedule);
				for (let k = 0; k < scheduleList.length; k++) {
					let dataJson = {};
					dataJson.day = dayChange(scheduleList[k].lecscDay),
					dataJson.start = scheduleList[k].periodCd;
					dataJson.hour = scheduleList[k].lecscHour;
					data.push(dataJson);
				}
				console.log("시간데이터", data);

				let tabletime = $('.tabletime');
				for (let i = 0; i < data.length; i++) {
					for (let j = 0; j < data[i].hour; j++) {
						if(i === 0){
							$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('background', 'green');
						}else{
							$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('background', 'lightGray');
						}
					}
				}
				


				// 모달 열어주기
				lecModal.modal('show');
			},
			err: function(err){
				console.log("err:", err)
			}
		});
	});

	// 승인 버튼
	appvBtn.on('click',function(){
		let lecApNo = $('#lecApNo').val();
		swal({
			   title: '해당 강의를 승인 하시겠습니까?',
			   icon: 'warning',
			   buttons: true,
			   dangerMode: true,
		}).then((willDelete) => {
			$.ajax({
				type:"post",
				url: "/hku/admin/lecaplylist",
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				data: JSON.stringify({lecApNo:lecApNo}),
				contentType: "application/json;charset=utf-8",
				dataType: "text",
				success: function(res){
					if (parseInt(res) == 1) {
						swal({
							title: "정상적으로 승인 되었습니다.", 
							icon: "success"
						});
						location.reload();
					}else{
						swal({
							title: "서버에러 다시 시도해주세요.", 
							icon: "error"
						});
					}
				},
				err: function(err){
					console.log("err:", err)
				}
			});
		});
	});
	
	// 반려 모달창 띄우기
	rejBtn.on('click',function(){
		lecModal.modal('hide');
		rejModal.modal('show');
	});
	
	rejModal.on('hidden.bs.modal', function(e){
		console.log("반려모달창 닫힘");
		lecModal.modal('show');
	});
	
	function getCrsClassfNm(pCode) {
		var result = "";
		switch(pCode){
			case 'MR': result = '전필'; break;
			case 'MS': result = '전선'; break;
			case 'ER': result = '교필'; break;
			case 'ES': result = '교선'; break;
		}
		return result;
	}

	function getAvlNm(pCode) {
		var result = "";
		switch(pCode){
			case 'y': result = '대면'; break;
			case 'n': result = '비대면'; break;
		}
		return result;
	}

	function getLanguage(pCode) {
		var result = "";
		switch(pCode){
			case 'kor': result = '한국어'; break;
			case 'eng': result = '영어'; break;
		}
		return result;
	}

	function dayChange(day) {
		if (day == "월") {
			return "1";
		} else if (day == "화") {
			return "2";
		} else if (day == "수") {
			return "3";
		} else if (day == "목") {
			return "4";
		} else if (day == "금") {
			return "5";
		}
	}


	rejSendBtn.on('click',function(){
		let lecApNo = $('#lecApNo').val();
		let lecapRjctRsn = $('#lecapRjctRsn').val();

		if(lecapRjctRsn == null || lecapRjctRsn == ""){
			swal({
				title: "반려사유를 입력해주세요.", 
				icon: "error"
			});
			return false;
		}

		var sendData = {
			lecapNo:lecApNo,
			lecapRjctRsn:lecapRjctRsn
		};


		swal({
			   title: '해당 강의를 반려 하시겠습니까?',
			   icon: 'warning',
			   buttons: true,
			   dangerMode: true,
		}).then((willDelete) => {
			$.ajax({
				type:"put",
				url: "/hku/admin/lecaplylist",
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				data: JSON.stringify(sendData),
				contentType: "application/json;charset=utf-8",
				dataType: "text",
				success: function(res){
					if (parseInt(res) == 1) {
						swal({
							title: "정상적으로 반려 되었습니다.", 
							icon: "success"
						});
						location.reload();
					}else{
						swal({
							title: "서버에러 다시 시도해주세요.", 
							icon: "error"
						});
					}
				},
				err: function(err){
					console.log("err:", err)
				}
			});
		});
	});
});
</script>
<!--모달창 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="lecModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">강의계획서</h5>
				<input type="hidden" id="lecApNo">
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<div class="row mb-1">
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="lec1" data-bs-toggle="pill" data-bs-target="#pills-contact3" type="button" role="tab" aria-controls="pills-contact3" aria-selected="true">강의기본</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="lec2" data-bs-toggle="pill" data-bs-target="#pills-contact4" type="button" role="tab" aria-controls="pills-contact4" aria-selected="false">수업내용</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="lec3" data-bs-toggle="pill" data-bs-target="#pills-contact5" type="button" role="tab" aria-controls="pills-contact5" aria-selected="false">강의실정보</button>
						</li>
					</ul>
					<hr>
				</div>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-contact3" role="tabpanel" aria-labelledby="pills-contact-tab3">
						<div class="row">
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									과목코드
								</label>
								<input type="text" class="form-control" id="subNo" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									과목명
								</label>
								<input type="text" class="form-control" id="subNm" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									대상학과
								</label>
								<input type="text" class="form-control" id="deptNm" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									대상학년
								</label>
								<input type="text" class="form-control" id="grade" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									학점
								</label>
								<input type="text" class="form-control" id="subCrd" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									수강정원
								</label>
								<input type="text" class="form-control" id="lecapCpct" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									개설년도
								</label>
								<input type="text" class="form-control" id="lecapYr" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									개설학기
								</label>
								<input type="text" class="form-control" id="lecapSem" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									이수구분코드
								</label>
								<input type="text" class="form-control" id="crsClassfCd" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									담당교수 이름
								</label>
								<input type="text" class="form-control" id="proNm" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									담당교수 이메일
								</label>
								<input type="text" class="form-control" id="proMail" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									담당교수 연락처
								</label>
								<input type="text" class="form-control" id="proTel" disabled>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="pills-contact4" role="tabpanel" aria-labelledby="pills-contact-tab4">
						<!-- 수업 내용 -->
						<div class="basic-form" id="regDiv">
                            <div class="form-validation">
                                <form class="needs-validation" id="planFrm">
                                    <div class="mb-3">
                                        <span style="color: #800000; font-size: 1.2em; font-weight: bold;">
											평가기준
										</span>
										<br>
                                        <span>*평가기준은 비율(%)로 계산하여 입력해주세요. </span>
                                        <div>
                                            <table class="planTable" border="1">
                                                <tr>
                                                    <th>출석</th>
                                                    <th>과제</th>
                                                    <th>중간</th>
                                                    <th>기말</th>
                                                    <!--                                                     <th>총점</th> -->
                                                </tr>
                                                <tr>
                                                    <td><input type="text" name="lecpgAtd" id="lecpgAtd" disabled>%</td>
                                                    <td><input type="text" name="lecpgHw" id="lecpgHw" disabled>%</td>
                                                    <td><input type="text" name="lecpgMdTest" id="lecpgMdTest" disabled>%</td>
                                                    <td><input type="text" name="lecpgFnTest" id="lecpgFnTest" disabled>%</td>
                                                    <!--                                                     <td style="background-color: #b0b0b0; color:black;" id="allTd"></td> -->
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin: 0 auto;">
                                            <span style="color: #800000; font-size: 1.2em; font-weight: bold;">
												수업유형
											</span>
											<br>
                                            <span>강의유형</span> 
											<input  type="text" class="selectCustom c" id="meet" disabled>
											<span>강의언어</span>
											<input  type="text" class="selectCustom c" style="margin-top: 10px;" id="lang" disabled>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <span style="color: #800000; font-size: 1.2em; font-weight: bold;">
											주교재
										</span>
										<br>
                                        <div id="lecturePlan">
                                            <input type="text" id="lecpgBook" name="lecpgBook" disabled>
                                        </div>
                                        <div>
                                            <span style="color: #800000; font-size: 1.2em; font-weight: bold;">
												강의소개
											</span>
											<br>
                                            <textarea name="lectureIntro" id="lectureIntro" rows="5" cols="100" disabled></textarea>
                                        </div>
                                        <span style="color: #800000; font-size: 1.2em; font-weight: bold;">
											주차별 계획안
										</span>
										<br> 
										<span>*주차별 학습계획을 상세히 입력해주세요.</span>
                                        <div id="lecturePlan">
                                            <c:forEach var="i" begin="1" end="15" step="1">
                                                ${i}주차 <input type="text" id="week${i}" name="week${i}" disabled>
                                                <br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
					</div>
					<div class="tab-pane fade" id="pills-contact5" role="tabpanel" aria-labelledby="pills-contact-tab5">
						<div class="row">
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									건물명
								</label>
								<input type="text" class="form-control" id="flctsNm" disabled>
							</div>
							<div class="col-sm-6 m-b30 mb-2">
								<label class="form-label" style="color: #800000; font-size: 1.2em; font-weight: bold;">
									강의실
								</label>
								<input type="text" class="form-control" id="flctNm" disabled>
							</div>
						</div>
						<table class="tabletime" border="1">
							<thead>
								<tr>
									<th style="width: 20%;">구분</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
								</tr>
							</thead>
							<tbody id="timeBody">
								<tr>
									<td class="time ">1교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">2교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">3교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">4교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">5교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">6교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">7교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">8교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							
								<tr>
									<td class="time ">9교시</td>
									<td class="mon timeTd"></td>
									<td class="tue timeTd"></td>
									<td class="wed timeTd"></td>
									<td class="thur timeTd"></td>
									<td class="fri timeTd"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-danger light" id="rejBtn">반려</button>
				<button type="button" class="btn btn-primary" id="appvBtn">승인</button>
			</div>
		</div>
	</div>
</div>

<!-- 반려 사유 모달창 -->
<div class="modal fade" id="rejModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">반려 사유</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="rejFrm">
          <div class="mb-3">
          	<label class="col-lg-4 col-form-label" for="validationCustom01">
				반려사유 <span class="text-danger">*</span>
			</label>
            <textarea class="form-control" cols="30" rows="10" id="lecapRjctRsn" name="lecapRjctRsn"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="rejSendBtn">반려</button>
      </div>
    </div>
  </div>
</div>