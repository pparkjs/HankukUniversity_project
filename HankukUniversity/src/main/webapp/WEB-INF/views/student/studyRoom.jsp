<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
				<div style="display: flex; justify-content: end; margin-right: 80px; margin-top: 10px;">
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
				<div>
					<div class="custom-tab-1" style="margin-left:20px;">
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
																<form action="/hku/student/assignStudy" method="post" id="applForm">
																	<input type="hidden" name="joinNo" id="joinNo" value="${appli.joinNo}">																	
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
									<table style="width: 400px" class="table">
									<thead class="thead-dark">
										<tr>
									    	<th>이름</th><th>학번</th><th>학과</th>
									    </tr>
									</thead>
									<tbody id="tbody">
										<c:forEach items="${studyMem}" var="study" varStatus="status">
											<tr>
												<td>${study.stdNm}</td>
												<td>${study.stdNo}</td>
												<td>${study.deptNm}</td>
												<td id="${study.stdNo}">
													<button type="button" id="sListBtn">조회</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									
									</table>
								</div>		
								<div style="width: 70%; margin-top: 45px">
									<div class="schedule-wrap">
										<table class="schedule" border=1>
											<thead class="thead-dark">
												<tr>
													<th style="width: 90px;"></th>
													<th style="width: 90px;">월</th>
													<th style="width: 90px;">화</th>
													<th style="width: 90px;">수</th>
													<th style="width: 90px;">목</th>
													<th style="width: 90px;">금</th>
												</tr>
											</thead>
											<tbody id="sBody">
												<!-- 동적추가 -->

											</tbody>
										</table>
									</div>
								</div>		
							</div>
						</div>
					</div>
				</div>
			</div>
<script>

$(function(){
	$("#sListBtn").on("click", function() {
        sList(this);
    });
	
})
	function sList(btn) {
	    var sBody = $("#sBody");
	    var stdNo = $(btn).parent().attr('id');
	    console.log("stdNo:",stdNo);
	    $.ajax({
	        type: "get",
	        url: "/hku/student/scheduleList",
	        data: {
	            "stdNo": stdNo
	        },
	        dataType: "json",
	        success: function(res) {
	            console.log("res:",res);
	            
	            var schedule = [];
	            for (var i = 0; i < res.length; i++) {
	                var period = [];
	                for (var j = 0; j < res[i].lecscHour; j++) {
	                    period.push(res[i].periodCd + j);
	                }
	                schedule.push(period);
	            }
	            console.log("schedule: ", schedule);
	            
	            // 테이블 만들기
	            var timeTable = '';
	            for (var i = 1; i <= 9; i++) {
	                timeTable += `<tr class="${i}" style="font-size: 13px; font-weight: 900;">
	                                <td style="font-size:16px; font-weight:400;">${i} 교시</td>
	                                <td class="mon"></td>
	                                <td class="tue"></td>
	                                <td class="wed"></td>
	                                <td class="thu"></td>
	                                <td class="fri"></td>
	                            </tr>`;
	            }
	            sBody.html(timeTable);
	           
	            for(var i = 0; i < res.length; i++){
		            var day = dayChange(`\${res[i].lecscDay}`);
		            // 시간표 채우기
		            for (var i = 0; i < schedule.length; i++) {
		                for (var j = 0; j < schedule[i].length; j++) {
	// 	                	var scheduleObj = $('.' + schedule[i][j]);
		                	var scheduleObj = $(`.\${schedule[i][j]} .\${day}`);
		                    scheduleObj.css("background-color", "red");
		                }
		            }          	
	            }
	            
	        },
	        error: function(err) {
	            console.log(err);
	        }
	    });
	}
function dayChange(day){
	if(day == "월"){
		return "mon";
	}else if(day == "화"){
		return "tue";
	}else if(day == "수"){
		return "wed";
	}else if(day == "목"){
		return "thu";
	}else if(day == "금"){
		return "fri";
	}
}

$(function(){
	
	var delBtn = $('#delBtn');
	var exitBtn = $('#exitBtn');
	var delForm = $('#delForm');
	
	var tbody = $('#tbody');
	  
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
	var btn1 = $('.applBtn1'); 
	var btn2 = $('.applBtn2');
	var form = $('#applForm');
	
	$(document).on("click", ".searchBtn", function() {
		  var stdNo = $(this).closest("tr").find("td:eq(1)").text();
		  console.log(stdNo);
		});

	
	btn1.on('click', function(){
		form.attr("action", "/hku/student/assignStudy");
	    form.submit();
	    });
});
</script>