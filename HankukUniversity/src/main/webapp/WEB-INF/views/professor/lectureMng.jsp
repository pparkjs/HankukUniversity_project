<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<div class="content-body" style="min-height: 975px;">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">강의개설신청</a></li>
		</ol>
	</div>
	<div class="container-fluid" style="padding-top: 0.875rem;">
<!-- 		<button type="button" class="btn btn-primary pro1" -->
<!-- 			data-bs-toggle="modal" data-bs-target=".bd-example-modal-md" -->
<!-- 			id="statusBtn" -->
<!-- 			style="margin-left: 1519px; margin-bottom: 10px; padding: 0;">나의 -->
<!-- 			신청현황</button> -->
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 나의신청현황 버튼 모달 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div class="modal fade bd-example-modal-md" tabindex="-1"
			style="display: none;" aria-hidden="true" id="statusModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"
							style="font-weight: bold; font-size: 1.5em; color: #800000;">나의
							신청내역</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal">
						</button>
					</div>
					<div class="modal-body" style="padding: 0;">

						<div class="basic-form" id="regDiv">
							<div class="form-validation">
								<form class="needs-validation" id="planFrm">
									<div class="mb-3">
										<div style="margin-left: 20px; margin-top: 30px;">
											<input type="button" value="전체" id="statusAll"
												class="btn btn-primary pro2" style="padding: 0;"> <input
												type="button" value="대기" id="statusWait"
												class="btn btn-primary pro2" style="padding: 0;"> <input
												type="button" value="승인" id="statusAprv"
												class="btn btn-primary pro2" style="padding: 0;"> <input
												type="button" value="반려" id="statusRej"
												class="btn btn-primary pro2" style="padding: 0;"> <input
												type="button" value="회수" id="applyReturn"
												class="btn btn-primary pro2"
												style="padding: 0; margin-left: 490px;">
										</div>
										<div>
											<table class="statusTable" border="1">
												<thead>
													<tr>
														<th>개설신청번호</th>
														<th>신청일</th>
														<th>개설년도</th>
														<th>개설학기</th>
														<th>과목명</th>
														<th>강의건물</th>
														<th>강의호실</th>
														<th>신청상태</th>
													</tr>
												</thead>
												<tbody id="statusTbody">

												</tbody>

											</table>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="">종료</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-6 col-lg-6 bbb" style="width: 55%">
				<div class="card">

					<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교 과 목 조 회 섹 션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">교과목
							조회</h4>
						<select class="selectCustom" name="subject" id="selSub">
							<option value="all">단과선택</option>
							<c:forEach var="col" items="${college}">
								<option value="${col.colCd}">${col.colNm}</option>
							</c:forEach>
						</select> <select class="selectCustom" name="subject" id="selDept">
							<option value="all2">학과선택</option>
						</select>
					</div>
					<div class="card-body ccc"
						style="padding-top: 0; overflow: scroll;">
						<table class="table" style="border-spacing: 0px;">
							<thead >
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
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강 의 실 선 택 섹 션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div class="col-xl-6 col-lg-6 bbb" style="width: 45%">
				<div class="card">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">강의실
							조회</h4>
						<select class="selectCustom a" id="selBuil">
							<option value="all">건물선택</option>
							<c:forEach var="flct" items="${flct}">
								<option value="${flct.flctNo}">${flct.flctNm}</option>
							</c:forEach>
						</select> <select class="selectCustom a" name="classRoom" id="selClass">
							<option value="all2">호수선택</option>
						</select>
					</div>
					<div class="card-body ccc" style="padding-top: 0;">
						<table class="tabletime" border="1"
							style="border-spacing: 1px; margin-top: 0px;">
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
								<c:forEach var="i" step="1" begin="1" end="9">
									<tr>
										<td class="time ">${i}교시</td>
										<td class="mon timeTd"></td>
										<td class="tue timeTd"></td>
										<td class="wed timeTd"></td>
										<td class="thur timeTd"></td>
										<td class="fri timeTd"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 개 설 신 청 폼 섹 션  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
			<div class="col-xl-6 col-lg-6 bbb"
				style="width: 100%; margin-top: 10px; height: 350px;">
				<div class="card" style="height: 295px;">
					<div class="card-header aaa">
						<h4 class="card-title"
							style="font-weight: bold; font-size: 1.2em; color: #800000;">개설신청
						</h4>
						<div>
							<!-- ■■■■■■■■■■■■■■■■■■■ 강의 계획서 첨부 버튼 ■■■■■■■■■■■■■■■■■■■ -->
							<button type="button" class="btn btn-primary pro1"
							data-bs-toggle="modal" data-bs-target=".bd-example-modal-md"
							id="statusBtn"
							style="padding: 0;  margin-right: 20px; background: #0070c0; border-color: #0070c0;">나의	신청현황</button>
							<button type="button" class="btn btn-primary pro1"
								style="padding: 0; margin-right: 15px; background: #ff4343;  background-color: #ff4343;" data-bs-toggle="modal"
								data-bs-target=".bd-example-modal-lg" id="lecturePBtn">강의계획서</button>
							<input type="button" value="신청" class="btn btn-primary pro2"
								id="applyBtn" style="padding: 0;">
						</div>
					</div>
					<div class="card-body apply">
						<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교수 세션에서 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
						<table id="applyTable" style="width: 100%; height: 100%">
							<tr>
								<td><span>교수명</span> <input type="text"
									value="${pro.proNm }" disabled="disabled"></td>
								<td><span>소속학과</span> <input type="text" name="proNo"
									value="${pro.deptCd }" disabled="disabled"></td>
								<td><span>교번</span> <input type="text"
									value="${pro.proNo }" id="inProNo" disabled="disabled"></td>
								<td><span>연락처</span> <input type="text"
									value="${pro.proTelno}" disabled="disabled"></td>
							</tr>

							<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교과목 선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

							<tr>
								<td><span>교과목명</span> <input type="text" name="subNo"
									id="inSubjectNm" disabled="disabled"></td>
								<td><span>과목코드</span> <input type="text" id="inSubjectCd"
									disabled="disabled"></td>
								<td><span>대상학년</span> <input type="text" id="inGrade"
									disabled="disabled"></td>
								<td><span>수업구분</span> <input type="text" id="inSubjectClsf"
									disabled="disabled"></td>
							</tr>
							<tr>
								<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교과목 선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
								<td><span>시수</span> <input type="text" id="inTime"
									disabled="disabled"></td>
								<td><span>학점</span> <input type="text" id="inSubjectCrd"
									disabled="disabled"></td>
								<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강의실 시간표선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
								<td><span>개설연도</span> <input type="text" name="lecapYr"
									id="inYear" disabled="disabled"></td>
								<td><span>개설학기</span> <input type="text" name="lecapSem"
									id="inSem" disabled="disabled"></td>
							</tr>
							<tr>
								<td><span>강의건물</span> <input type="text" id="inFlct"
									disabled="disabled"></td>
								<td><span>강의실</span> <input type="text" name="flctsNo"
									id="inFlcts" disabled="disabled"></td>

								<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 액터가 입력해야함 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
								<td><span>시작교시</span> <input type="text" id="inStart"
									disabled="disabled"></td>
								<td><span>강의요일</span> <input type="text" id="inDay"
									disabled="disabled"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강의계획서 버튼 모달 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<div class="modal fade bd-example-modal-lg" tabindex="-1"
	style="display: none;" aria-hidden="true" id="addModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"
					style="font-weight: bold; font-size: 1.5em; color: #800000;">강의계획서</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="planFrm">
							<div class="mb-3">
								<span
									style="color: #800000; font-size: 1.2em; font-weight: bold;">평가기준</span><br>
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
											<td><input type="text" name="lecpgAtd" id="lecpgAtd">%</td>
											<td><input type="text" name="lecpgHw" id="lecpgHw">%</td>
											<td><input type="text" name="lecpgMdTest"
												id="lecpgMdTest">%</td>
											<td><input type="text" name="lecpgFnTest"
												id="lecpgFnTest">%</td>
											<!--                                                     <td style="background-color: #b0b0b0; color:black;" id="allTd"></td> -->
										</tr>
									</table>
								</div>
								<div style="margin: 0 auto;">
									<span
										style="color: #800000; font-size: 1.2em; font-weight: bold;">수업유형</span><br>
									<span>강의유형</span> <select class="selectCustom c" id="meet">
										<option value="y">대면</option>
										<option value="n">온라인</option>
									</select> <span>강의언어</span> <select class="selectCustom c"
										style="margin-top: 10px;" id="lang">
										<option value="kor">한국어</option>
										<option value="eng">영어</option>
									</select>
								</div>
							</div>
							<div class="mb-3">
								<span
									style="color: #800000; font-size: 1.2em; font-weight: bold;">주교재</span><br>
								<div id="lecturePlan">
									<input type="text" id="" name="lecpgBook">
								</div>
								<div>
									<span
										style="color: #800000; font-size: 1.2em; font-weight: bold;">강의소개</span><br>
									<textarea name="lectureIntro" rows="5" cols="100"></textarea>
								</div>
								<span
									style="color: #800000; font-size: 1.2em; font-weight: bold;">주차별
									계획안</span><br> <span>*주차별 학습계획을 상세히 입력해주세요.</span>
								<div id="lecturePlan">
									<c:forEach var="i" begin="1" end="15" step="1">
                                                ${i}주차 <input
											type="text" name="week${i}">
										<br>
									</c:forEach>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
			</div>
		</div>
	</div>
</div>
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 모달 끝  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>
        
        var year = new Date().getFullYear();
        var month = new Date().getMonth();
        /*■■■■■■■■■■■■전역변수 설정 영역■■■■■■■■■■■ */
            var planJson = {}
            var lecapNo = ''; //과목신청시퀀스번호
            var flag = false; // 강의계획서 작성여부 플래그
            var approval = ''; //대면수업여부
            var lecpgLggCd = ''; //수업언어
            var periodCd = ''; //시작교시

            var sem = '';
            var lecpgAtd = '';
            var lecpgHw = '';
            var lecpgMdTest = $('[name="lecpgMdTest"]').val();
            var lecpgFnTest = $('[name="lecpgFnTest"]').val();
            var lecpgBook = $('[name="lecpgBook"]').val();
            var lectureIntro = $('[name="lectureIntro"]').val();
            var lecscHour = ''; //시작교시
            var lecscDay = '';
            var sem = '';
            var week1 = '';
            var week1 = '';
            var week2 = '';
            var week3 = '';
            var week4 = '';
            var week5 = '';
            var week6 = '';
            var week7 = '';
            var week8 = '';
            var week9 = '';
            var week10 = '';
            var week11 = '';
            var week12 = '';
            var week13 = '';
            var week14 = '';
            var week15 = '';


            /* ■■■■■■ 최초 강의관리 화면 접속시 출력되는 화면 ■■■■■■ */
            $(document).ready(function () {
                var table = $(".table"); // 테이블 객체 가져오기
                $("#inYear").val(year);
                
                if(month >= 6){
                	$('#inSem').val("2학기");
                }else{
                	$('#inSem').val("1학기");
                }
                /* ■■■■■■ 교과목 클릭에 대한 이벤트  ■■■■■■ */
                table.on("click", "tbody tr", function () {
                    var rows = table.find("tbody tr");
                    if (flag === true) {
                        swal({
                            title: "다른과목을 선택하시겠습니까?",
                            text: "저장되어있는 강의계획서가 초기화 됩니다.",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                            .then((willDelete) => {
                                if (willDelete) {
                                    $("#planFrm")[0].reset();
                                    flag = false;
                                    rows.removeClass("selected");
                                    $(this).addClass("selected");
                                }
                            });
                    } else {
                        rows.removeClass("selected");
                        $(this).addClass("selected");
                    }


                    var selectedRow = $(this);
                    var child = selectedRow.children();

                    /* ■■■■■■ 선택한 교과목에 대한 데이터값을 개설신청 폼에 넣어주는 코드  ■■■■■■ */
                    $("#inSubjectNm").val(child.eq(3).text());
                    $("#inSubjectCd").val(child.eq(0).text());
                    $("#inGrade").val(child.eq(2).text());
                    $("#inSubjectClsf").val(child.eq(4).text());
                    $("#inTime").val(child.eq(6).text());
                    $("#inSubjectCrd").val(child.eq(5).text());
                   
                });
                /* ■■■■■■ 시간표 테이블 객체 가져오기  ■■■■■■ */
                var timeTable = $(".tabletime");
                //      console.log("timeTable:", timeTable);
                timeTable.on("click", "tbody td", function () {
                    var tdClass = $(this).attr('class');
                    var tdDay = "";
                    if (tdClass === "mon timeTd") {
                        tdDay = "월요일";
                    } else if (tdClass === "tue timeTd") {
                        tdDay = "화요일"
                    } else if (tdClass === "wed timeTd") {
                        tdDay = "수요일"
                    } else if (tdClass === "thur timeTd") {
                        tdDay = "목요일"
                    } else if (tdClass === "fri timeTd") {
                        tdDay = "금요일"
                    }
                    $("#inDay").val(tdDay);
                });
  

            });
            $(document).ready(function () {
	                    var lecapNo ='';
	                    var lecapStt = '';
     				
     				$(document).on("click", ".statusTable tbody tr", function () {
	     				var statusT = $('.statusTable');
	                    var rows = statusT.find("tbody tr");
     					
                        rows.removeClass("selected");
                        $(this).addClass("selected");
                        
                        var selectedRow = $(this);
                        var tds = selectedRow.find('td');
                        lecapStt = tds[7].textContent;
                        lecapNo = tds[0].textContent;
                    });
     				
            	   /* ■■■■■■ 강의개설 회수버튼 클릭  ■■■■■■ *///
                $('#applyReturn').on("click", function () {
                	if(lecapStt ==='대기'){
	                	swal({
	                		  title: "정말 취소하시겠습니까?",
	                		  text: "취소 완료 후 복구가 불가합니다.",
	                		  icon: "warning",
	                		  buttons: true,
	                		  dangerMode: true,
	                		})
	                		.then((willDelete) => {
	                		  if (willDelete) {
	                			  $.ajax({
	                      		    url: '/hku/lecture/returnLecture.do',
	                                  method: 'get',
	                                  data: {
	                                      lecapNo: lecapNo
	                                  },  beforeSend : function(xhr){
	                                      xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                                  },
	                                  success: function (res) {
	                                	  swal("신청이 정상적으로 취소되었습니다.", {
	                            		      icon: "success",
	                            		    });
	                                	  statusList();
	                                  },
	                                  error: function (xhr, status, error) {
	                                      // swal("출력실패");
	                                  }
	                          })
	                		  } 
	                		});
                	}else{
                		swal("취소가 불가능한 상태입니다.", "교무처에 문의해주세요.", "warning");
                	}
                });
            });
            
           $('#statusBtn').on("click",function(){
        	   statusList();
           });
           
           $('#statusAll').on("click",function(){
       		$.ajax({
       		    url: '/hku/lecture/getLectureStatus.do',
                   method: 'get',
                   data: {
                       proNo: '${pro.proNo}'
                   },
                   beforeSend : function(xhr){
                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                   success: function (res) {
                       /* ■■■■■■ 신청상태에 대한 결과 출력 ■■■■■■ *///
                      	var appv = '';
                      	statusStr = '';
                       for (var i = 0; i < res.length; i++) {
                       	 if(res[i].aprvSttsCd ==='rej'){
                            	aprv = '반려';
                            }else if(res[i].aprvSttsCd ==='wait'){
                            	 aprv = '대기';
                            }else if(res[i].aprvSttsCd ==='CANCLE'){
                            	 aprv = '취소';
                            }else{
                            	aprv = '승인';
                            }
                       	statusStr += '<tr>'
                       		statusStr +='<td>' + res[i].lecapNo + '</td>'
                       	statusStr +='<td>' + res[i].lecapDt + '</td>'
                       	statusStr +='<td>' + res[i].lecapYr + '</td>'
                       	statusStr +='<td>' + res[i].lecapSem + '</td>'
                       	statusStr +='<td>' + res[i].subNm + '</td>'
                       	statusStr +='<td>' + res[i].flctNm + '</td>'
                       	statusStr +='<td>' + res[i].flctsNm + '</td>'
                       	statusStr +='<td>' + aprv + '</td>'
                           statusStr +=  '</tr>';
                       }
                       $('#statusTbody').html(statusStr);
                   },
                   error: function (xhr, status, error) {
                       // swal("출력실패");
                   }
       			
       		});
          	
          });
           $('#statusWait').on("click",function(){
       		$.ajax({
       		    url: '/hku/lecture/getLectureStatus.do',
                   method: 'get',
                   data: {
                       proNo: '${pro.proNo}'
                   },
                   beforeSend : function(xhr){
                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                   success: function (res) {
                       /* ■■■■■■ 신청상태에 대한 결과 출력 ■■■■■■ *///
                      	var appv = '';
                      	statusStr = '';
                       for (var i = 0; i < res.length; i++) {
                       	 if(res[i].aprvSttsCd ==='wait'){
                            	aprv = '대기';
                             	statusStr += '<tr>'
                             		statusStr +='<td>' + res[i].lecapNo + '</td>'
	                           	statusStr +='<td>' + res[i].lecapDt + '</td>'
	                           	statusStr +='<td>' + res[i].lecapYr + '</td>'
	                           	statusStr +='<td>' + res[i].lecapSem + '</td>'
	                           	statusStr +='<td>' + res[i].subNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctsNm + '</td>'
	                           	statusStr +='<td>' + aprv + '</td>'
                           	 	 statusStr +=  '</tr>';
                            }
                      
                       }
                       $('#statusTbody').html(statusStr);
                   },
                   error: function (xhr, status, error) {
                       // swal("출력실패");
                   }
       			
       		});
          	
          });
           $('#statusRej').on("click",function(){
       		$.ajax({
       		    url: '/hku/lecture/getLectureStatus.do',
                   method: 'get',
                   data: {
                       proNo: '${pro.proNo}'
                   },
                   success: function (res) {
                       /* ■■■■■■ 신청상태에 대한 결과 출력 ■■■■■■ *///
                      	var appv = '';
                      	statusStr = '';
                       for (var i = 0; i < res.length; i++) {
                       	 if(res[i].aprvSttsCd ==='rej'){
                            	aprv = '대기';
                             	statusStr += '<tr>'
                             		statusStr +='<td>' + res[i].lecapNo + '</td>'
	                           	statusStr +='<td>' + res[i].lecapDt + '</td>'
	                           	statusStr +='<td>' + res[i].lecapYr + '</td>'
	                           	statusStr +='<td>' + res[i].lecapSem + '</td>'
	                           	statusStr +='<td>' + res[i].subNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctsNm + '</td>'
	                           	statusStr +='<td>' + aprv + '</td>'
                           	 	 statusStr +=  '</tr>';
                            }
                      
                       }
                       $('#statusTbody').html(statusStr);
                   },
                   beforeSend : function(xhr){
                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                   error: function (xhr, status, error) {
                       // swal("출력실패");
                   }
       			
       		});
          	
          });
           $('#statusAprv').on("click",function(){
       		$.ajax({
       		    url: '/hku/lecture/getLectureStatus.do',
                   method: 'get',
                   data: {
                       proNo: '${pro.proNo}'
                   },
                   success: function (res) {
                       /* ■■■■■■ 신청상태에 대한 결과 출력 ■■■■■■ *///
                      	var appv = '';
                      	statusStr = '';
                       for (var i = 0; i < res.length; i++) {
                       	 if(res[i].aprvSttsCd ==='appv'){
                            	aprv = '승인';
                             	statusStr += '<tr>'
                             		statusStr +='<td>' + res[i].lecapNo + '</td>'
	                           	statusStr +='<td>' + res[i].lecapDt + '</td>'
	                           	statusStr +='<td>' + res[i].lecapYr + '</td>'
	                           	statusStr +='<td>' + res[i].lecapSem + '</td>'
	                           	statusStr +='<td>' + res[i].subNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctNm + '</td>'
	                           	statusStr +='<td>' + res[i].flctsNm + '</td>'
	                           	statusStr +='<td>' + aprv + '</td>'
                           	 	 statusStr +=  '</tr>';
                            }
                      
                       }
                       $('#statusTbody').html(statusStr);
                   },
                   beforeSend : function(xhr){
                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                   error: function (xhr, status, error) {
                       // swal("출력실패");
                   }
       			
       		});
          	
          });
        

            /* ■■■■■■ 단과대학 선택시 학과와 교과목 출력해주는 펑션  ■■■■■■ *///
            $(function () {
                /* ■■■■■■ 단과대학선택을 바꿀때마다 발생event  ■■■■■■ *///
                $('#selSub').change(function () {
                            //$('#selDept').chil dren().eq(0).("selected");
                            $('#tbtb').html("");
                            var data = $(this).val();
                            // 					console.log(data);

                            //교과목 출력끝
                            $.ajax({
                                    url: '/hku/lecture/getDept.do',
                                    method: 'get',
                                    data: {
                                        college: data
                                    },  beforeSend : function(xhr){
                                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                    },
                                    success: function (res) {
                                        /* ■■■■■■ 단과대학에 대한 교과목출력  ■■■■■■ *///
                                        subStr = '';
                                        for (var i = 0; i < res.colSubject.length; i++) {
                                            subStr += '<tr class="tbtr">';
                                            subStr += '	<td class="subNo">'
                                                + res.colSubject[i].subNo
                                                + '</td>';
                                            subStr += '<td class="deptCd">'
                                                + res.colSubject[i].deptCd
                                                + '</td>';
                                            subStr += '<td class="subGrade">'
                                                + res.colSubject[i].subGrade
                                                + '</td>';
                                            subStr += '<td class="subNm">'
                                                + res.colSubject[i].subNm
                                                + '</td>';
                                            subStr += '<td class="classFcd">'
                                                + res.colSubject[i].crsClassfCd
                                                + '</td>';
                                            subStr += '<td class="subCrd">'
                                                + res.colSubject[i].subCrd
                                                + '</td>';
                                            subStr += '<td class="subHour">'
                                                + res.colSubject[i].subHour
                                                + '</td>';
                                            subStr += '<tr class="tbtr">';
                                        }
                                        ;
                                        $('#tbtb').html(subStr);
                                        /* ■■■■■■ 단과대학에 대한 학과 출력 ■■■■■■ *///
                                        deptStr = '<option value="all2" selected>학과선택</option>';
                                        for (var i = 0; i < res.dept.length; i++) {
                                            deptStr += '<option value="' + res.dept[i].deptCd + '">'
                                                + res.dept[i].deptNm
                                                + '</option>'
                                        }
                                        $('#selDept').html(deptStr);
                                    },
                                    error: function (xhr, status, error) {
                                        // swal("출력실패");
                                    }
                                });
                        });

                /*■■■■■■■■■■■■교과목 출력이벤트 시작■■■■■■■■■■■ */
                $('#selDept').change(
                    function () {
                        var dept = $(this).val();

                        $.ajax({
                            url: '/hku/lecture/selSubject.do',
                            method: 'get',
                            data: {
                                deptNm: dept
                            },
                            beforeSend : function(xhr){
                                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                             },
                            success: function (res) {
                                subStr = '';
                                for (var i = 0; i < res.length; i++) {
                                    subStr += '<tr class="tbtr">';
                                    subStr += '	<td class="subNo">' + res[i].subNo
                                        + '</td>';
                                    subStr += '<td class="deptCd">' + res[i].deptCd
                                        + '</td>';
                                    subStr += '<td class="subGrade">'
                                        + res[i].subGrade + '</td>';
                                    subStr += '<td class="subNm">' + res[i].subNm
                                        + '</td>';
                                    subStr += '<td class="classFcd">'
                                        + res[i].crsClassfCd + '</td>';
                                    subStr += '<td class="subCrd">' + res[i].subCrd
                                        + '</td>';
                                    subStr += '<td class="subHour">'
                                        + res[i].subHour + '</td>';
                                    subStr += '<tr class="tbtr">';
                                }
                                ;
                                $('#tbtb').html(subStr);
                            },
                            error: function (xhr, status, error) {
                                swal("출력실패");
                            }
                        });
                    });/*■■■■■■■■■■■■교과목 출력이벤트 끝 ■■■■■■■■■■■ */

                /* ■■■■■■ 강의실 조회 부분의 시설,시설물 선택   ■■■■■■ *///
                //건물출력
                $('#selBuil').change(function () {
                            // $('#tbtb').html("");
                            var flct = $(this).val();
                            var flctNm = $('#selBuil option:selected').text();
                            var click = $(this);

                            $('#timeBody').find('.timeTd').css('background-color', '');
                            $('#timeBody').find('.timeTd').text('');
                            $('.timeTd').find('.selected').css('background-color', '');
                            //교과목 출력끝
                            $.ajax({
                                    url: '/hku/lecture/selBuil.do',
                                    method: 'get',
                                    data: {
                                        flct: flct
                                    },
                                    beforeSend : function(xhr){
                                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                     },
                                    success: function (res) {
                                        //                             console.log(res.flcts.length);
                                        flctsStr = '<option selected>강의실선택</option>';
                                        for (var i = 0; i < res.flcts.length; i++) {
                                            flctsStr += '<option value="' + res.flcts[i].flctsNo + '">'
                                                + res.flcts[i].flctsNm
                                                + '</option>'
                                        }

                                        $('#selClass').html(flctsStr);
                                        $('#inFlct').val(flctNm);

                                    },
                                    error: function (xhr, status, error) {
                                        //  swal("출력실패");
                                    }
                                });
                        });
                /*■■■■■■■■■■■■ 강의 건물, 호실 선택시 해당강의실에 등록되어있는 수업 불러오는 이벤트■■■■■■■■■■■ */
                $('#selClass').change(function () {
                    $('#timeBody').find('.timeTd').css('background-color', '');
                    $('#timeBody').find('.timeTd').text('');
                    var flcts = $('#selClass option:selected').val();
                    var click = $(this);
                    var timeBody = $("#timeBody")
                    $('#inFlcts').val($('#selClass option:selected').text());
                    $.ajax({
                        url: '/hku/lecture/selClass.do',
                        method: 'get',
                        data: {
                            flcts: flcts
                           
                        },
                        beforeSend : function(xhr){
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                         },
                        success: function (res) {
                            let data = [];
                            for (let k = 0; k < res.length; k++) {
                                let dataJson = {};
                                dataJson.day = dayChange(res[k].lecscDay),
                                dataJson.start = res[k].periodCd;
                                dataJson.hour = res[k].lecscHour;
                                dataJson.subNm = res[k].subNm;
                                dataJson.proNm = res[k].proNm;
                                data.push(dataJson);
                            }

                            /*■■■■■■■■■■■■ 시간표에 이미있는 수업 색깔뿌려줌■■■■■■■■■■■ */
                            let tabletime = $('.tabletime');
                            for (let i = 0; i < data.length; i++) {
                                for (let j = 0; j < data[i].hour; j++) {
                                	if(j === 0){
                                		$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).text(data[i].subNm);
                                	}else if(j === 1){
                                		$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).text(data[i].proNm+"교수");
                                	}
                                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('background', 'lightGray');
                                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('color', 'black');
                                    
                                }
                            }
                        },
                        error: function (xhr, status, error) {
                            swal("출력실패");
                        }
                    });
                });
                
                /*■■■■■■■■■■■■시간표안의 td클릭할때 다른 강의가 있을경우 신청 불가 이벤트■■■■■■■■■■■ */
                $(document).on('click', '.timeTd', function () {
                	if($('#inTime').val() == null || $('#inTime').val()==''){
                		swal("수업을 먼저 선택해주세요.");
                		return;
                	}else{
                    var timeTable = $(".tabletime");
                    var tds = timeTable.find(".timeTd");
                    tds.removeClass("selected"); // 다른 td를 선택할 때 기존에 선택된 td의 selected 클래스 제거

                    if ($(this).css('background-color') === 'rgb(211, 211, 211)') {
                    	swal("이미 개설된 강의가 있습니다.", "비어있는 시간대를 클릭해주세요.", "info");
                        return false; // 클릭 이벤트 중단
                    } else {
                        tds.removeClass("selected"); // 모든 td의 selected 클래스 제거
                        $(this).addClass("selected");
                        startTime = $(this).parent().children().first().text();
                        start = parseInt(startTime.split('')[0])
						end = parseInt($('#inTime').val());
                         if(start + end - 1 > 9){
                        	 swal("수업종료시간이 9교시를 초과합니다.");
                         }
                        $("#inStart").val(startTime);
                    }
                	}
                });
            });

            /*■■■■■■■■■■■■강의 계획서 작성후 저장버튼 클릭시 이벤트(유효성검사)■■■■■■■■■■■ */
            $('#saveBtn').on("click", function () {

                lecpgAtd = $('[name="lecpgAtd"').val();
                if (lecpgAtd == "") {
                   	swal("확인요청!", "출석 평가 비율이 입력되지않았습니다.", "info");
                    $('[name="lecpgAtd"').focus();
                    return;
                }

                lecpgHw = $('[name="lecpgHw"').val();
                if (lecpgHw == "") {
                	swal("확인요청!", "과제 평가 비율이 입력되지않았습니다.", "info");
                    $('[name="lecpgHw"').focus();
                    return;
                }

                lecpgMdTest = $('[name="lecpgMdTest"').val();
                if (lecpgMdTest == "") {
                	swal("확인요청!", "중간고사 평가 비율이 입력되지않았습니다.", "info");
                    $('[name="lecpgMdTest"').focus();
                    return;
                }

                lecpgFnTest = $('[name="lecpgFnTest"').val();
                if (lecpgFnTest == "") {
                	swal("확인요청!", "기말고사 평가 비율이 입력되지않았습니다.", "info");
                    $('[name="lecpgFnTest"').focus();
                    return;
                }
                lecpgBook = $('[name="lecpgBook"').val();
                if (lecpgBook == "") {
                	swal("확인요청!", "강의교재가 입력되지않았습니다.", "info");
                    $('[name="lecpgBook"').focus();
                    return;
                }
                lectureIntro = $('[name="lectureIntro"').val();
                if (lectureIntro == "") {
                	swal("확인요청!", "강의소개가 입력되지않았습니다.", "info");
                    $('[name="lectureIntro"').focus();
                    return;
                }

                for (let i = 1; i <= 15; i++) {
                    var weekValue = $('[name="week' + i + '"]').val();
                    if (weekValue === "") {
                    	swal("확인요청!", i + "주차 강의계획이 입력되지않았습니다.", "info").then(() => {
                            $('[name="week' + i + '"]').focus();
                        });
                        return; // 함수 실행 종료
                    }
                }
				//대면여부,강의언어
                approval = $('#meet option:selected').val();
                lecpgLggCd = $('#lang option:selected').val();
				//주차별계획
                week1 = $('[name="week1"').val();
                week1 = $('[name="week1"').val();
                week2 = $('[name="week2"').val();
                week3 = $('[name="week3"').val();
                week4 = $('[name="week4"').val();
                week5 = $('[name="week5"').val();
                week6 = $('[name="week6"').val();
                week7 = $('[name="week7"').val();
                week8 = $('[name="week8"').val();
                week9 = $('[name="week9"').val();
                week10 = $('[name="week10"').val();
                week11 = $('[name="week11"').val();
                week12 = $('[name="week12"').val();
                week13 = $('[name="week13"').val();
                week14 = $('[name="week14"').val();
                week15 = $('[name="week15"').val();
				//평가기준 비율입력
                var sum = 0;
                sum += parseInt($("#lecpgAtd").val());
                sum += parseInt($("#lecpgHw").val());
                sum += parseInt($("#lecpgMdTest").val());
                sum += parseInt($("#lecpgFnTest").val());

                if (sum != 100) {
                    console.log("100 아님");
                    swal("확인요청!", "평가기준 총합이 100%가 아닙니다.\n확인 후 수정해주세요.", "info");
                } else {
                    swal({
                        title: "강의계획서를 저장하시겠습니까?",
                        icon: "warning",
                        buttons: true,
                        dangerMode: false,
                    })
                        .then((willDelete) => {
                            if (willDelete) {
                                $('#addModal').modal('hide');
                                flag = true;
                            }
                        });
                };
            });


            /*■■■■■■■■■■■■강의 개설 최종 신청 버튼 클릭시■■■■■■■■■■■ */
            $('#applyBtn').on("click", function () {

                if (flag === false) {
                    swal("확인요청!", "강의계획서가 작성되지않았습니다.\n 확인 후 재시도 해주세요.", "warning");
                } else {
                	
                    swal({
                        title: "강의개설신청을 제출 하시겠습니까?",
                       	text: "제출 후 수정이 불가합니다.",
                        icon: "warning",
                        buttons: true,
                        dangerMode: false,
                    })
                        .then((willDelete) => {
                            if (willDelete) {
                            	 planJson = {
                                         subNo: $("#inSubjectCd").val(),
                                         proNo: $("#inProNo").val(),
                                         subNm: $("#inSubjectNm").val(),
                                         flctsNo: $('#selClass option:selected').val(),
                                         lecapYr: $("#inYear").val(),
                                         lecapSem: $("#inSem").val().split('')[0],
                                         lecapTgGrade: $("#inGrade").val(),
                                         lecapCpct: 30,
                                         lecpgAtd: lecpgAtd,
                                         lecpgHw: lecpgHw,
                                         lecpgMdTest: lecpgMdTest,
                                         lecpgFnTest: lecpgFnTest,
                                         lecpgBook: lecpgBook,
                                         lecpgIntro: lectureIntro,
                                         week1: week1,
                                         week2: week2,
                                         week3: week3,
                                         week4: week4,
                                         week5: week5,
                                         week6: week6,
                                         week7: week7,
                                         week8: week8,
                                         week9: week9,
                                         week10: week10,
                                         week11: week11,
                                         week12: week12,
                                         week13: week13,
                                         week14: week14,
                                         week15: week15,
                                         avlCd1: 'y',
                                         avlCd2: approval,
                                         lecpgLggCd: lecpgLggCd,
                                         periodCd: $("#inStart").val().split('')[0],
                                         lecscDay: $("#inDay").val().split('')[0],
                                         lecscHour: $("#inTime").val().split('')[0]
                                     }
									console.log(planJson);
                                $.ajax({
                                    url: '/hku/lecture/applyLecture.do',
                                    method: 'post',
                                    data: JSON.stringify(planJson),
                                    contentType: "application/json;charset=utf-8",
                                    dataType: "text",
                                    beforeSend : function(xhr){
                                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                                     },
                                    success: function (res) {
                                    	swal("신청완료", "강의 개설이 신청되었습니다.", "success");
                                    	location.reload();
                                    },
                                    error: function (xhr, status, error) {
                                        swal("출력실패");
                                    }
                                });
                            }
                        });
                   
                }

            });
         
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
            
            function statusList(){
            	$.ajax({
        		    url: '/hku/lecture/getLectureStatus.do',
                    method: 'get',
                    data: {
                        proNo: '${pro.proNo}'
                    },
                    beforeSend : function(xhr){
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                     },
                    success: function (res) {
                        /* ■■■■■■ 신청상태에 대한 결과 출력 ■■■■■■ *///
                       	var appv = '';
                        statusStr = '';
                        for (var i = 0; i < res.length; i++) {
                        	 if(res[i].aprvSttsCd ==='rej'){
                             	aprv = '반려';
                             }else if(res[i].aprvSttsCd ==='wait'){
                             	 aprv = '대기';
                             }else if(res[i].aprvSttsCd ==='CANCLE'){
                            	 aprv = '취소';
                             }else{
                             	aprv = '승인';
                             }
                        	statusStr += '<tr>'
                        	statusStr +='<td>' + res[i].lecapNo + '</td>'
                        	statusStr +='<td>' + res[i].lecapDt + '</td>'
                        	statusStr +='<td>' + res[i].lecapYr + '</td>'
                        	statusStr +='<td>' + res[i].lecapSem + '</td>'
                        	statusStr +='<td>' + res[i].subNm + '</td>'
                        	statusStr +='<td>' + res[i].flctNm + '</td>'
                        	statusStr +='<td>' + res[i].flctsNm + '</td>'
                        	statusStr +='<td>' + aprv + '</td>'
                            statusStr +=  '</tr>';
                        }
                        $('#statusTbody').html(statusStr);
                    },
                    error: function (xhr, status, error) {
                        // swal("출력실패");
                    }
        			
        		});
            }
        </script>