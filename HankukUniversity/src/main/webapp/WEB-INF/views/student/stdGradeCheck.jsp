<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/std-jh.css">	
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">성적</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">당학기 성적조회</a></li>
		</ol>
    </div>
	<div class="container-fluid">
        <div class="card" style="width:100%; margin-bottom: 0.563rem;">
            <div class="card-header  cardTitle">
                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">학생기본정보</h4>
            </div>
            <div class="card-body stdInfo"> 
            	<table id="stdInfoTb" style="width:100%; height:100%;">
            		<tr>
            			<td><span>성명</span><input type="text" value="${std.stdNm}" disabled="disabled"></td>
            			<td><span>학번</span><input type="text" value="${std.stdNo}" disabled="disabled"></td>
            			<td><span>단과대학</span><input type="text" value="${map.stdInfo[0].colNm}" disabled="disabled"></td>
            			<td><span>학과</span><input type="text" value="${map.stdInfo[0].deptNm}" disabled="disabled"></td>
            		</tr>
            		<tr>
            			<td><span>학적상태</span><input type="text" value="${map.stdInfo[0].stdSttsNm}" disabled="disabled"></td>
            			<td><span>신청학점</span><input type="text" id="applyCrd" disabled="disabled"></td>
            			<td><span>년도</span><input type="text"  value="${map.subject[0].lecapYr}" id="year" disabled="disabled"></td>
            			<td><span>학기</span><input type="text" value="${map.subject[0].lecapSem}" id="sem" disabled="disabled"></td>
            		</tr>
            		
            	</table>
            
            </div>
        </div>
        <div  style="width:100%; margin-bottom: 0.563rem;">
        	<table id="gradeTable" style="width:100%">
		        <thead>
				    <tr>
				        <th rowspan="2">이수연도</th>
				        <th rowspan="2">이수학기</th>
				        <th rowspan="2">이수학과</th>
				        <th rowspan="2">이수구분</th>
				        <th rowspan="2">교과목명</th>
				        <th rowspan="2">교과코드</th>
				        <th rowspan="2">이수학점</th>
				        <th colspan="4">평가내용</th>
				        <th rowspan="2">등급</th>
				        <th rowspan="2">평점</th>
				        <th rowspan="2">강의평가</th>
				    </tr>
				    <tr>
				        <th>과제</th>
				        <th>출석</th>
				        <th>중간</th>
				        <th>기말</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${map.subject}" var="subject" >
						<tr>
							<td>${subject.lecapYr}</td>
							<td>${subject.lecapSem}</td>
							<td>${subject.deptNm}</td>
							<td>${subject.crsClassfCd}</td>
							<td>${subject.subNm}</td>
							<td>${subject.subNo}</td>
							<c:choose>
								<c:when test="${subject.evalYnCd eq 'Y'}">
									<td>${subject.subCrd}</td>
									<td>생략</td>
									<td>생략</td>
									<td>생략</td>
									<td>생략</td>
									<td>생략</td>
									<td>${subject.crsScr}</td>
									<td>
									<input type="hidden" value="${subject.lecapNo}" class="hlecapNo">
									<button type="button" class="btn btn-primary pro1" style="background-color: gray; color: white; border:none; cursor:default;">평가완료</button>
									</td>
								</c:when>
								<c:otherwise>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td>
									<input type="hidden" value="${subject.lecapNo}" class="hlecapNo">
									<button type="button" class="btn btn-primary pro1 testBtn" style="border:none;">강의평가</button>
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
        	</table>
            <div > 
            </div>
        </div>
        <div class="grade-wrap">
	        <div class="card" style="width:50%; margin-bottom: 0.563rem;">
		        <div class="card-header  cardTitle">
	                <h4 class="card-title" style="font-weight: bold; font-size :1.5em; color: #800000;">이의신청</h4>
	               <button type="button" class="btn btn-primary pro1" id="submitBtn">제출</button>
	            </div>
	            <div class="card-body" style="padding-left:40px;"> 
	            	<div style="display:flex; padding-left:90px; ">
	            	 <span style="font-size:19px; margin-right:10px;">과목명</span>
	            	 <select class="selectCustom a" id="selSubject">
                          <option value="all">과목선택</option>
                          <c:forEach var="subject" items="${map.subject}">
                              <option value="${subject.lecapNo}">${subject.subNm}</option>
                          </c:forEach>
                    </select>
					    <div class="radio-group">
					    <input type="radio" id="mdTest" name="exam" value="중간" checked>
					    <label for="mdTest">중간</label>
					    
					    <input type="radio" id="fnTest" name="exam" value="기말">
					    <label for="fnTest">기말</label>
					    
					    <input type="radio" id="assign" name="exam" value="과제">
					    <label for="assign">과제</label>
					    
					    <input type="radio" id="attend" name="exam" value="출석">
					    <label for="attend">출석</label>
					    </div>
                    </div>
                      <textarea id="grdDmrCn" rows="7" cols="100" placeholder="이의신청 사유와 내용을 자세하게 입력해주세요."></textarea>
	            </div>
	        </div>
	        <div class="card" style="width:50%; margin-bottom: 0.563rem;">
		        <div class="card-header  cardTitle">
	                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">이의신청 결과</h4>
	            </div>
	            <div class="card-body"> 
	            	<table id="dmrSttTable" style="width:100%">
		        <thead>
				    <tr>
				        <th>이수연도</th>
				        <th>이수학기</th>
				        <th>이수구분</th>
				        <th>교과코드</th>
				        <th>교과목명</th>
				        <th>등급</th>
				        <th>상태</th>
				    </tr>
				</thead>
				<tbody>
					<c:forEach items="${map.subject}" var="subject">
						<c:if test="${not empty subject.grdDmrSttsCd}">
							<tr>
								<td>${subject.lecapYr}</td>
								<td>${subject.lecapSem}</td>
								<td>${subject.crsClassfCd}</td>
								<td>${subject.subNo}</td>
								<td>${subject.subNm}</td>
								<td>
									생략
									<input type="hidden" class="grdDmrAns" value="${subject.grdDmrAns}">
									<input type="hidden" class="grdDmrCn" value="${subject.grdDmrCn}">
								</td>
								<c:choose>
									<c:when test="${subject.grdDmrSttsCd eq 'wait'}">
										 <td style="color:green; font-weight:bold;"><c:out value="대기"/></td>
									</c:when>
									<c:when test="${subject.grdDmrSttsCd eq 'rej'}">
										 <td style="color:red; font-weight:bold;"><c:out value="반려"/></td>
									</c:when>
									<c:when test="${subject.grdDmrSttsCd eq 'appv'}">
										 <td style="color:blue; font-weight:bold;"><c:out value="승인"/></td>
									</c:when>
								</c:choose>
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
<!-- ■■■■■■■■■■■■■■■■■■■■ 모달 ■■■■■■■■■■■■■■■■■■■-->
<div class="modal fade" id="rejModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="font-weight:bold; color:#800000;">이의신청 상세</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="mb-3">
             <label class="col-lg-4 col-form-label" for="validationCustom01">
           <span style="font-size:15px;">신청상태 : </span><span id="dmrStts" style="font-size:15px;"></span>
         </label>
            <textarea class="form-control" cols="30" rows="5" id="dmrCn" style="font-size: 18px;" disabled></textarea>
          </div>
          <div class="mb-3">
             <label class="col-lg-4 col-form-label" for="validationCustom01">
            반려사유 <span class="text-danger">*</span>
         </label>
            <textarea class="form-control" cols="30" rows="10" id="dmrAns" style="font-size: 18px;" disabled></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="conBtn">확인</button>
      </div>
    </div>
  </div>
</div>
	
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true"
            id="testModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" style="font-weight: bold; font-size :1.5em; color: #800000;">강의평가</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="basic-form" id="regDiv">
                            <div class="form-validation">
                                <form class="needs-validation" id="planFrm">
                                    <div class="mb-3">
                                        <span
                                            style="color: #800000; font-size: 1.5em; font-weight: bold;" id="testSubject">평가기준</span><br>
                                        <span>*본 평가는 강의개선의 기초 및 교육의 질적인 향상을 위하여 실시합니다. </span><br>
                                        <span>*본 평가는 익명으로 진행된 성실하게 작성하여 주시기를 바랍니다. </span>
                                        <br>
                                        <br>
                                        <div>
                                        	<table style="width:100%;" id="testTable">
                                        		<tr>
                                        			<th style="width:65%">
                                        			설 문 항 목                 			
                                        			</th>
                                        			<th>1점</th>
                                        			<th>2점</th>
                                        			<th>3점</th>
                                        			<th>4점</th>
                                        			<th>5점</th>
                                        		</tr>
                                        		<tr>
                                        			<td>
                                        			강의내용이 강의계획서대로 진행되었다. 			
                                        			</td>
                                        			<td><input type="checkbox" class="myCheckbox1" name="lecevAns1" value="1" ></td>
                                        			<td><input type="checkbox" class="myCheckbox1" name="lecevAns1" value="2"></td>
                                        			<td><input type="checkbox" class="myCheckbox1" name="lecevAns1" value="3"></td>
                                        			<td><input type="checkbox" class="myCheckbox1" name="lecevAns1" value="4"></td>
                                        			<td><input type="checkbox" class="myCheckbox1" name="lecevAns1" value="5"></td>
                                        		</tr>
                                        		<tr>
                                        			<td>
                                        			교육 시설과 환경이 적절하였다.          			
                                        			</td>
                                        			<td><input type="checkbox" class="myCheckbox2" name="lecevAns2" value="1"></td>
                                        			<td><input type="checkbox" class="myCheckbox2" name="lecevAns2" value="2"></td>
                                        			<td><input type="checkbox" class="myCheckbox2" name="lecevAns2" value="3"></td>
                                        			<td><input type="checkbox" class="myCheckbox2" name="lecevAns2" value="4"></td>
                                        			<td><input type="checkbox" class="myCheckbox2" name="lecevAns2" value="5"></td>
                                        		</tr>
                                        		<tr>
                                        			<td>
                                        			수업을 위한 적절한 자료와 교육매체가 준비되었다.                 			
                                        			</td>
                                        			<td><input type="checkbox" class="myCheckbox3" name="lecevAns3" value="1"></td>
                                        			<td><input type="checkbox" class="myCheckbox3" name="lecevAns3" value="2"></td>
                                        			<td><input type="checkbox" class="myCheckbox3" name="lecevAns3" value="3"></td>
                                        			<td><input type="checkbox" class="myCheckbox3" name="lecevAns3" value="4"></td>
                                        			<td><input type="checkbox" class="myCheckbox3" name="lecevAns3" value="5"></td>
                                        		</tr>
                                        		<tr>
                                        			<td>
                                        			나는 이수업을 통하여 관련 지식을 많이 얻었다.               			
                                        			</td>
                                        			<td><input type="checkbox" class="myCheckbox4" name="lecevAns4" value="1"></td>
                                        			<td><input type="checkbox" class="myCheckbox4" name="lecevAns4" value="2"></td>
                                        			<td><input type="checkbox" class="myCheckbox4" name="lecevAns4" value="3"></td>
                                        			<td><input type="checkbox" class="myCheckbox4" name="lecevAns4" value="4"></td>
                                        			<td><input type="checkbox" class="myCheckbox4" name="lecevAns4" value="5"></td>
                                        		</tr>
                                        		<tr>
                                        			<td>
                                        			나는 이 수업을 다른 학생에게 추천해주고싶다.               			
                                        			</td>
                                        			<td><input type="checkbox" class="myCheckbox5" name="lecevAns5" value="1"></td>
                                        			<td><input type="checkbox" class="myCheckbox5" name="lecevAns5" value="2"></td>
                                        			<td><input type="checkbox" class="myCheckbox5" name="lecevAns5" value="3"></td>
                                        			<td><input type="checkbox" class="myCheckbox5" name="lecevAns5" value="4"></td>
                                        			<td><input type="checkbox" class="myCheckbox5" name="lecevAns5" value="5"></td>
                                        		</tr>
                                        		<tr>
                                        			<th colspan="6">
                                        			종 합 의 견               			
                                        			</th>
                                        		</tr>
                                        		<tr>
                                        			<td rowspan="2" colspan="6" >
                                        				<textarea rows="7" cols="100" id="lecevOverallOpinion"></textarea>
                                        			</td>
                                        		</tr>
                                        		<tr>
                                        			<td></td>
                                        		</tr>
                                        	</table>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="saveTest">저장</button>
                    </div>
                </div>
            </div>
        </div>
<!-- ■■■■■■■■■■■■■■■■■■■■ 모달 끝 ■■■■■■■■■■■■■■■■■■■-->

<script>
let stdInfo = [];
let one;


</script>
<c:forEach items="${map.stdInfo}" var="stdVO">
<script>
	 one = {
		stdNo:'${stdVO.stdNo}' ,
		stdNm:'${stdVO.stdNm}',
		stdMjrCrd:'${stdVO.stdMjrCrd}',
		stdCtrlCrd:'${stdVO.stdCtrlCrd}',
		subCrd:'${stdVO.subCrd}',
		deptNm:'${stdVO.deptNm}',
		colNm:'${stdVO.colNm}',
		stdSttsNm:'${stdVO.stdSttsNm}',
		crsClassfNm:'${stdVO.crsClassfNm}'
	}
	stdInfo.push(one);
</script>	
</c:forEach>
<script>
let mjrCrd = 0 ;
let ctrlCrd  = 0 ;
let semCrd  = 0;
var stdNo = ${std.stdNo};
// var year = new Date().getFullYear();
// var month = new Date().getMonth();
// if(month >= 6){
// 	$('#sem').val("2학기");
// }else{
// 	$('#sem').val("1학기");
// }
console.log(stdInfo);
for (let i = 0; i < stdInfo.length; i++) {
	if (stdInfo[i].crsClassfNm === '전필'|| stdInfo[i].crsClassfNm === '전선') {
		mjrCrd += parseInt(stdInfo[i].subCrd);
	}else{
		ctrlCrd += parseInt(stdInfo[i].subCrd);
	}
	semCrd += parseInt(stdInfo[i].subCrd);
}
	
// 	$('#year').val(year);
// 	$('#sem').val(sem);
	$('#applyCrd').val(semCrd);
	
		console.log("전공",mjrCrd);
		console.log("교양",ctrlCrd);
		console.log("총학점",semCrd);

$('#submitBtn').on("click",function(){
	
	var content = $('#grdDmrCn').val();
	var lecapNo = $('#selSubject option:selected').val();
	var examType = $("input[name='exam']:checked").val();
	var grdDmrCn = "이의항목: "+ examType + " / 내용: "+content;
	console.log("content",content);
	console.log("lecapNo",lecapNo);
	console.log("grdDmrCn",grdDmrCn);
	console.log("examType",examType);
	
   	swal({
		  title: "이의신청을 등록하시겠습니까?",
		  text: "신청 완료 후 회수가 불가합니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url : '/hku/student/submitObjec',
			        method: 'post',
			        data: {
			            stdNo: stdNo,
			            grdDmrCn : grdDmrCn,
			            lecapNo : lecapNo
			        },
			        success: function (res) {
			        	  swal("신청이 정상적으로 완료되었습니다.", {
			    		      icon: "success"
			    		    });
			        },
			        error:function(xhr){
			        	  swal("신청에실패하였습니다.", {
			    		      icon: "warning"
			    		    });
			        }
				})
		  } 
		});
})		
$(document).ready(function() {
	var lecapNo = "";
	$('.testBtn').click(function(){
		var btnText = $(this).text().trim();
		var testSubject = $(this).parents('tr').find('td').eq(4).text();
		lecapNo = $(this).siblings('.hlecapNo').val();
		console.log("lecapNo:",lecapNo);
		$('#testSubject').text(testSubject);
		
// 		console.log("과목",subject);
		if(btnText === '강의평가'){
			$('#testModal').modal('show');
		}
	})
	
	
  $('#dmrSttTable tr').click(function() {
	$('#dmrAns').val($(this).find('.grdDmrAns').eq(0).val());
	var dmrCn = $(this).find('.grdDmrCn').eq(0).val();
	var dmrCnre = dmrCn.split('/ ').join('\n');
	$('#dmrCn').val(dmrCnre);
	console.log("상태",$(this).find('td').eq(6).text());
	$('#dmrStts').text($(this).find('td').eq(6).text());
    $(this).addClass('selected').siblings().removeClass('selected');
    $('#rejModal').modal('show');
  });
	
	for(let i=1; i<6; i++){
	$('.myCheckbox'+i).click(function() {
		  var checkedCount = $('.myCheckbox'+i+':checked').length;
		  if (checkedCount > 1) {
		    $(this).prop('checked', false);
		    swal("한개만 선택가능합니다.")
		  }
		});
	}
	
	$('#saveTest').click(function(){

		var stdNo = ${std.stdNo};
		var lecevAns1 = $('.myCheckbox1:checked').val();
		var lecevAns2 = $('.myCheckbox2:checked').val();
		var lecevAns3 = $('.myCheckbox3:checked').val();
		var lecevAns4 = $('.myCheckbox4:checked').val();
		var lecevAns5 = $('.myCheckbox5:checked').val();
		var lecevOverallOpinion = $('#lecevOverallOpinion').val();
		
		if (lecevAns1 == null) {
			  swal("확인 요청!", "1번 문항 답변이 선택되지 않았습니다.", "info");
			  return;
			}
		if (lecevAns2 == null) {
		  swal("확인 요청!", "2번 문항 답변이 선택되지 않았습니다.", "info");
		  return;
		}
		if (lecevAns3 == null) {
		  swal("확인 요청!", "3번 문항 답변이 선택되지 않았습니다.", "info");
		  return;
		}
		if (lecevAns4 == null) {
		  swal("확인 요청!", "4번 문항 답변이 선택되지 않았습니다.", "info");
		  return;
		}
		if (lecevAns5 == null) {
		  swal("확인 요청!", "5번 문항 답변이 선택되지 않았습니다.", "info");  return;
		}
		
		if(lecevOverallOpinion == ""){
			swal("확인 요청!", "종합의견이 작성되지않았습니다.", "info");
			return;
		}
		
		swal({
  		  title: "강의평가를 제출 하시겠습니까?",
  		  text: "제출 완료 후 복구가 불가합니다.",
  		  icon: "warning",
  		  buttons: true,
  		  dangerMode: true,
  		})
  		.then((willDelete) => {
  		  if (willDelete) {
  			$.ajax({
				url : '/hku/student/insertEvaluation',
		        method: 'post',
		        data: {
		            stdNo: stdNo,
		            lecapNo : lecapNo,
		            lecevAns1 : lecevAns1,
		            lecevAns2 : lecevAns2,
		            lecevAns3 : lecevAns3,
		            lecevAns4 : lecevAns4,
		            lecevAns5 : lecevAns5,
		            lecevOverallOpinion : lecevOverallOpinion
		        },
		        success: function (res) {
		        	  swal("강의평가 완료", {
		    		      icon: "success"
		    		    });
		        	  $('#testModal').modal('hide');
		        	  location.reload();
		        },
		        error:function(xhr){
		        	  swal("강의평가에 실패하였습니다.", {
		    		      icon: "warning"
		    		    });
		        }
			});
            
  		   
  		  } 
  		});
		
	});
});
$('#conBtn').click(function(){
	  $('#rejModal').modal('hide');
})


</script>