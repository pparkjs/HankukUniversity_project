<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<link rel="stylesheet" href="/css/table.css">
		<link rel="stylesheet" href="/css/pro-jh.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<div class="content-body">
			<div class="page-titles">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
					<li class="breadcrumb-item active"><a href="javascript:void(0)">강의개설신청</a></li>
				</ol>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-xl-6 col-lg-6 bbb" style="width:55%">
						<div class="card">
							<div class="card-header aaa">
								<h4 class="card-title" style="font-weight:bold; font-size:1.2em;">교과목 조회</h4>
								<select class="selectCustom" name="subject" id="selSub">
									<option value="all">단과선택</option>
									<c:forEach var="col" items="${college}">
										<option value="${col.colCd}">${col.colNm}</option>
									</c:forEach>
								</select>
								<select class="selectCustom" name="subject" id="selDept">
									<option value="all2">학과선택</option>
								</select>
							</div>
							<div class="card-body ccc" >
								

<!-- 								<input type="button" value="조회"> -->
								<table class="table">
									<thead>
										<tr>
											<th>과목코드</th>
											<th>학과</th>
											<th>학년</th>
											<th>과목명</th>
											<th>구분</th>
											<th>학점</th>
											<th>시수</th>
										</tr>
									</thead>
									<tbody id="tbtb">
										<c:forEach var="sub" items="${subject}">
											<tr class="tbtr">
												<td class="subNo">${sub.subNo}</td>
												<td class="deptCd">${sub.deptCd}</td>
												<td class="subGrade">${sub.subGrade}</td>
												<td class="subNm">${sub.subNm}</td>
												<td class="classFcd">${sub.crsClassfCd}</td>
												<td class="subCrd">${sub.subCrd}</td>
												<td class="subHour">${sub.subHour}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 bbb" style="width:45%">
						<div class="card">
							<div class="card-header aaa">
								<h4 class="card-title" style="font-weight:bold; font-size:1.2em;">강의실 조회</h4>
								<select class="selectCustom a" id="selBuil">
									<option value="all">건물선택</option>
									<c:forEach var="flct" items="${flct}">
										<option value="${flct.flctNo}">${flct.flctNm}</option>
									</c:forEach>
								</select>
								<select class="selectCustom a" name="classRoom" id="selClass">
									<option value="all2">호수선택</option>
								</select>
							</div>
							<div class="card-body ccc">
								<table class="table time">
									<thead>
										<tr>
											<th>교시</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
										</tr>
									</thead>
									<tbody>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
											<tr class="tbtr">
												<td class="time"></td>
												<td class="mon"></td>
												<td class="tue"></td>
												<td class="wedn"></td>
												<td class="thur"></td>
												<td class="fri"></td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
						<div class="col-xl-6 col-lg-6 bbb" style="width:100%; margin-top:10px; height : 350px;" >
						<div class="card">
							<div class="card-header aaa">
								<h4 class="card-title" style="font-weight:bold; font-size:1.2em;">개설신청</h4>
								<div>
									<input type="button" value="강의계획서" class="btn btn-primary pro1" style="padding:0;">
									<input type="button" value="신청"  class="btn btn-primary pro2" style="padding:0;">
								</div>
							</div>
							<div class="card-body apply">
								<table id="applyTable" border="1" style="width:100%;height:100%">
									<tr>
										<td>
											<span>교수명</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>교수명</span>
											<input type="text" value="${pro.deptCd }" disabled="disabled">
										</td>
										<td>
											<span>교번</span>
											<input type="text" value="${pro.proNo }" disabled="disabled">
										</td>
										<td>
											<span>연락처</span>
											<input type="text" value="${pro.proTelno}" disabled="disabled">				
										</td>
									</tr>
									<tr>
										<td>
											<span>교과목명</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>과목코드</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>대상학년</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>수업구분</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
									</tr>
									<tr>
										<td>
											<span>시수</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>학점</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>강의건물</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>강의실</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
									</tr>
									<tr>
										<td>
											<span>시작교시</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>강의요일</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>강의유형</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
										<td>
											<span>강의언어</span>
											<input type="text" value="${pro.proNm }" disabled="disabled">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>

			document.addEventListener("DOMContentLoaded", function () {
				var table = document.querySelector(".table");
				var rows = table.querySelectorAll("tbody tr");
				var columns = table.querySelectorAll("tbody tr");
				
				var selectedRow = null;

				rows.forEach(function (row) {
					row.addEventListener("click", function () {
						if (selectedRow !== null) {
							selectedRow.classList.remove("selected");
						}
						this.classList.add("selected");
						selectedRow = this;
					});
				});
			});

			$(function () {
				$('#selSub').change(function () {
// 					$('#selDept').chil dren().eq(0).("selected");
					$('#tbtb').html("");
					var data = $(this).val();
// 					console.log(data);
	
	
					//교과목 출력끝
					$.ajax({
						url: '/lecture/getDept.do',
						method: 'get',
						data: {
							college: data
						},
						success: function (res) {
							subStr = '';
							for (var i = 0; i < res.colSubject.length; i++) {
								subStr += '<tr class="tbtr">';
								subStr += '	<td class="subNo">' + res.colSubject[i].subNo + '</td>';
								subStr += '<td class="deptCd">' + res.colSubject[i].deptCd + '</td>';
								subStr += '<td class="subGrade">' + res.colSubject[i].subGrade + '</td>';
								subStr += '<td class="subNm">' + res.colSubject[i].subNm + '</td>';
								subStr += '<td class="classFcd">' + res.colSubject[i].crsClassfCd + '</td>';
								subStr += '<td class="subCrd">' + res.colSubject[i].subCrd + '</td>';
								subStr += '<td class="subHour">' + res.colSubject[i].subHour + '</td>';
								subStr += '<tr class="tbtr">';
							};
							$('#tbtb').html(subStr);
							
							deptStr = '<option value="all2" selected>학과선택</option>';
							for (var i = 0; i < res.dept.length; i++) {
								deptStr += '<option value="' + res.dept[i].deptCd + '">' + res.dept[i].deptNm + '</option>'
							}
							$('#selDept').html(deptStr);
						},
						error: function (xhr, status, error) {
							// 						        alert("출력실패");
						}
					});
				});//학과 출력 끝
				
				//교과목 출력시작
				$('#selDept').change(function () {
					var dept = $(this).val();

					$.ajax({
						url: '/lecture/selSubject.do',
						method: 'get',
						data: {
							deptNm: dept
						},
						success: function (res) {
							subStr = '';
							for (var i = 0; i < res.length; i++) {
								subStr += '<tr class="tbtr">';
								subStr += '	<td class="subNo">' + res[i].subNo + '</td>';
								subStr += '<td class="deptCd">' + res[i].deptCd + '</td>';
								subStr += '<td class="subGrade">' + res[i].subGrade + '</td>';
								subStr += '<td class="subNm">' + res[i].subNm + '</td>';
								subStr += '<td class="classFcd">' + res[i].crsClassfCd + '</td>';
								subStr += '<td class="subCrd">' + res[i].subCrd + '</td>';
								subStr += '<td class="subHour">' + res[i].subHour + '</td>';
								subStr += '<tr class="tbtr">';
							};
							$('#tbtb').html(subStr);
						},
						error: function (xhr, status, error) {
								 alert("출력실패");
						}
					});
				});//교과목 출력 끝
				
				
				
				
				
				//건물출력
				$('#selBuil').change(function () {
// 					$('#tbtb').html("");
					var flct = $(this).val();
					var click = $(this);
					//교과목 출력끝
					$.ajax({
						url: '/lecture/timeTable.do',
						method: 'get',
						data: {
							flct: flct
						},
						success: function (res) {
							console.log(res.flcts.length);
// 							subStr = '';
// 							for (var i = 0; i < res.colSubject.length; i++) {
// 								subStr += '<tr class="tbtr">';
// 								subStr += '	<td class="subNo">' + res.colSubject[i].subNo + '</td>';
// 								subStr += '<td class="deptCd">' + res.colSubject[i].deptCd + '</td>';
// 								subStr += '<td class="subGrade">' + res.colSubject[i].subGrade + '</td>';
// 								subStr += '<td class="subNm">' + res.colSubject[i].subNm + '</td>';
// 								subStr += '<td class="classFcd">' + res.colSubject[i].crsClassfCd + '</td>';
// 								subStr += '<td class="subCrd">' + res.colSubject[i].subCrd + '</td>';
// 								subStr += '<td class="subHour">' + res.colSubject[i].subHour + '</td>';
// 								subStr += '<tr class="tbtr">';
// 							};
// 							$('#tbtb').html(subStr);
							
							flctsStr = '<option selected>강의실선택</option>';
							for (var i = 0; i < res.flcts.length; i++) {
								flctsStr += '<option value="' + res.flcts[i].flctsNo + '">' + res.flcts[i].flctsNm + '</option>'
							}
							$('#selClass').html(flctsStr);
						},
						error: function (xhr, status, error) {
							// 						        alert("출력실패");
						}
					});
				});
				
				
				
				

			});



		</script>