<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>

table, th, td {
   border: 1px solid black;
   border-collapse: collapse;
   text-align: center;
   width : 100px;
   height: 40px;
}
th, td {
   padding: 20px;
}
th{
  	text-align: center;
	font-size: 1.5em;
}

	</style>
		<meta charset="UTF-8">
		<div class="content-body">
			<div class="page-titles">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active"><a href="javascript:void(0)">study room</a></li>
				</ol>
			</div >
			
			
			<div class="container-fluid">
				<div class="card" id="card-title-1">
					<div class="card-header border-0 pb-0 ">
						<h5 class="card-title">study room</h5>
					</div>
					<div style="display: flex; justify-content: end; margin-right: 80px;">
						<a class="btn btn-primary" href="#" role="button" id="btn1" style="margin: 10px">화상채팅</a>
						
						<form action="/hku/student/delStudy" method="post" id="delForm">
							<input type="hidden" name="studyNo" value="${study.studyNo}" id="studyNo">
						</form>
						<!-- 스터디장은 스터디 해체 버튼 보여주기 -->
						<button type="button" class="btn btn-primary" style="margin: 10px" id="delBtn">
							<i class="fa-solid fa-circle-exclamation me-2"></i>스터디 삭제
						</button>									
						<button type="button" class="btn btn-primary" style="margin: 10px" id="exitBtn"> 스터디 탈퇴</button>																							

					</div>
					<div class="card-body">
						<div class="custom-tab-1">
							<ul class="nav nav-tabs">
								<li class="nav-item">
									<a class="nav-link active" data-bs-toggle="tab" href="#home1"> <i class="fa-solid fa-user-plus me-2"></i> 신청인원</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#profile1"><i class="far fa-user me-2"></i> 스터디원</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#contact1"><i class="far fa-clock me-2"></i> 시간표</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-bs-toggle="tab" href="#message1"><i class="ti-calendar me-2"></i> 일정</a>
								</li>
							</ul>
							<div class="tab-content">
						
								<div class="tab-pane fade show active" id="home1" role="tabpanel">
									<div class="pt-4">
										<input type="hidden" value="${study.studyNo }" id="studyNo">
										<table style="width: 90%" class="table" id="tbl1">
											<thead class="thead-dark">
												<tr>
													<th>이름 </th><th>학과 </th><th>학번 </th><th>신청일</th><th style="width: 300px;">comment</th><th> </th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${empty appli}">
													<tr><td colspan="5">가입신청 인원이 존재하지 않습니다.</td></tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${appli }" var="appli">
														<tr id="link">
															<td>${appli.stdNm } </td>
															<td>${appli.deptNm } </td>
															<td id="td">${appli.stdNo }</td>
															<td>${appli.joinRegdate }</td>
															<td style="width: 300px;">${appli.joinReason }</td>
															<td>
																<div class="action-button">
																	<form action="" method="post" id="appForm">
																		<input type="hidden" name="joinNo" class="joinNo" value="${appli.joinNo}">																	
																		<a href="#" class="applBtn1">
																			<span class="badge badge-success badge-sm">승인<span class="ms-1 fa fa-check"></span></span>																	
																		</a>
																		<a href="#" class="applBtn2">
																			<span class="badge badge-secondary  badge-sm">반려<span class="ms-1 fa fa-ban"></span></span>
																		</a>
																	</form>
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>											
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="profile1">
									<div class="pt-4">
										<div>
											<h3>스터디 소개</h3>
											<c:choose>
												<c:when test="${empty study }">
													<p>스터디 소개글이 존재하지 않습니다.</p>
												</c:when>
												<c:otherwise>
													<p> ${study.studyIntro }</p>																						
												</c:otherwise>
											</c:choose>
											<br>
										</div>
										<p>스터디원</p>
										<table style="width: 90%" class="table">
										<thead class="thead-dark">
											<tr>
										    	<th>이름</th><th>학번</th><th>학과</th>
										    </tr>
										</thead>
										  <c:choose>
										    <c:when test="${empty studyMem }">
										      <tr>
										        <td colspan="5">스터디원이 존재하지 않습니다.</td>
										      </tr>
										    </c:when>
										    <c:otherwise>
										      <tbody>
										        <c:forEach items="${studyMem }" var="studyMem">
										          <tr>
										            <td>${studyMem.stdNm}</td>
										            <td>${studyMem.stdNo}</td>
										            <td>${studyMem.deptNm}</td>
										          </tr>
										        </c:forEach>
										      </tbody>
										    </c:otherwise>
										  </c:choose>
										</table>					
									</div>
								</div>
								<div class="tab-pane fade" id="contact1" style="display: flex;">
									<div style="width: 30%; margin-top: 45px">
										<table style="width: 40%" class="table">
										<thead class="thead-dark">
											<tr>
										    	<th>이름</th><th>학번</th><th>학과</th>
										    </tr>
										</thead>
										  <c:choose>
										    <c:when test="${empty studyMem }">
										      <tr>
										        <td colspan="3">스터디원이 존재하지 않습니다.</td>
										      </tr>
										    </c:when>
										    <c:otherwise>
										      <tbody>
										        <c:forEach items="${studyMem }" var="studyMem">
										          <tr>
										            <td>${studyMem.stdNm}</td>
										            <td>${studyMem.stdNo}</td>
										            <td>${studyMem.deptNm}</td>
										          </tr>
										        </c:forEach>
										      </tbody>
										    </c:otherwise>
										  </c:choose>
										</table>
									</div>		
									<div style="width: 70%; margin-top: 45px">
										<table style="width:850px; height: 700px;">
											<tr>
												<th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
											</tr>
											<tr>
												<th>1교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>2교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>3교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>4교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>5교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>6교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>7교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>8교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
											<tr>
												<th>9교시</th><td></td><td></td><td></td><td></td><td></td><td></td>
											</tr>
									</table>
									</div>
									
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
<script>
$(function(){
	var delBtn = $('#delBtn');
	var exitBtn = $('#exitBtn');
	var delForm = $('#delForm');
	  
	delBtn.on('click', function(){
	    Swal.fire({
	      title: '정말로 삭제하시겠습니까??',
	      text: '삭제된 스터디룸은 되돌릴 수 없습니다!',
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '삭제합니다!'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        delForm.submit();
	      }
	    });
	});

	exitBtn.on('click', function(){
		delForm.attr("action", "/hku/student/exitStudy");
		Swal.fire({
	      title: '정말로 탈퇴하시겠습니까??',
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '탈퇴합니다!'
	    }).then((result) => {
	      if (result.isConfirmed) {
	        delForm.submit();
	      }
	    });
	})
});

$(function(){
	var btn1 = $('.applBtn1'); 
	var btn2 = $('.applBtn2');
	var form = $('#applForm');
	
	btn1.on('click', function(){
		var studyNo = $("#studyNo").val();
		var pBtn = $(event.currentTarget);
		console.log(pBtn.closest("form")[0]);
		console.log(pBtn.closest("form")[0].joinNo.value);
		
		var joinNo = pBtn.closest("form")[0].joinNo.value;

		$.ajax({
			type: "post",
			url: "/hku/student/assignStudy/"+studyNo +"/"+ joinNo,
			data: JSON.stringify({ joinNo: joinNo, studyNo: studyNo }),
			contentType: "application/json; charset=utf-8",
			success: function(res){
				var tableHtml = '<table style="width: 90%" class="table" id="tbl1">' +
					'<thead class="thead-dark">' +
					'<tr>' +
					'<th>이름</th><th>학과</th><th>학번</th><th>신청일</th><th style="width: 300px;">comment</th><th></th>' +
					'</tr>' +
					'</thead>' +
					'<tbody>';

				if (res.length === 0) {
					tableHtml += '<tr><td colspan="6">가입신청 인원이 존재하지 않습니다.</td></tr>';
				} else {
					for (var i = 0; i < res.length; i++) {
						var row = res[i];
						tableHtml += '<tr id="link">' +
							'<td>' + row.stdNm + '</td>' +
							'<td>' + row.deptNm + '</td>' +
							'<td id="td">' + row.stdNo + '</td>' +
							'<td>' + row.joinRegdate + '</td>' +
							'<td style="width: 300px;">' + row.joinReason + '</td>' +
							'<td>' +
							'<div class="action-button">' +
							'<form action="" method="post" id="appForm">' +
							'<input type="hidden" name="joinNo" class="joinNo" value="' + row.joinNo + '">' +
							'<a href="#" class="applBtn1">' +
							'<span class="badge badge-success badge-sm">승인<span class="ms-1 fa fa-check"></span></span>' +
							'</a>' +
							'<a href="#" class="applBtn2">' +
							'<span class="badge badge-secondary  badge-sm">반려<span class="ms-1 fa fa-ban"></span></span>' +
							'</a>' +
							'</form>' +
							'</div>' +
							'</td>' +
							'</tr>';
					}
				}

				tableHtml += '</tbody>' +
					'</table>';

				$('#tbl1').replaceWith(tableHtml);
			}
		});
	});

	
})
</script>