<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">졸업</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">이수학점 계</h5>
			</div>
			<div style="margin-top: 10px;">
				<div class="col-xl-12">
						<table class="table" style="margin-top: 0px; margin-bottom: 0px; width: 95%;"">
							<thead class="thead-dark">
								<tr>
									<th style="width: 120px;">과정</th>
									<th style="width: 120px;">입학</th>
									<th style="width: 150px;">학번</th>
									<th style="width: 140px;">이름</th>
									<th style="width: 120px;">상태</th>
									<th style="width: 180px;">학과</th>
									<th style="width: 120px;">계열</th>
								</tr>
							</thead>
							<tbody id="tBody">
								<tr>
									<td>일반</td>
									<td>신입</td>
									<td>${student.stdNo }</td>
									<td>${student.stdNm } </td>
									<td>${student.comCdNm1 }</td>
									<td>${student.deptNm }</td>
									<td>공학</td>
								</tr>
							</tbody>
						</table>
							<table class="table" style="margin-top: -20px; margin-bottom: 0px; width: 95%;">
							<thead class="thead-dark">
								<tr>   
									<th style="width: 10%;">주야</th>
									<th style="width: 10%;">학년</th>
									<th style="width: 10%;">학제</th>
									<th style="width: 36%;" colspan="3">졸업기준</th>
									<th style="width: 36%;" colspan="3">이수학점</th>
								</tr>
							</thead>
							<tbody id="tBody" style="margin-top: -30px;">
								<tr>
									<td rowspan="2">주 </td>
									<td rowspan="2">4 </td>
									<td rowspan="2">4 </td>
									<th>전공 </th>
									<th>교양 </th>
									<th>졸업학점 </th>
									<th>전공 </th>
									<th>교양 </th>
									<th>총학점 </th>
								</tr>
								<tr>
									<td>70</td>
									<td>50</td>
									<td>120</td>
									
									<td>${student.stdMjrCrd }</td>
									<td>${student.stdCtrlCrd }</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
			</div>
				
			<div class="col-xl-12">
				<ul class="nav nav-pills mb-4 light">
					<li class=" nav-item">
						<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false">졸업유예</a>
					</li>
					<li class="nav-item">
						<a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false">조기졸업</a>
					</li>
				</ul>
				<div class="tab-content">
					<div id="navpills-1" class="tab-pane active">
						<div class="col-xl-12">
							<div class="row">
								<div class="col-md-12">
									졸업유예 신청
									<form name="form1">
										<div class="row" style="margin: 10px;">
											<div style=" display: flex; justify-content: space-between;">
												<div class="input-group" style="width: 25%; margin: 10px; font-size: 20px;">
													이름 &nbsp; <input type="text" class="form-control" value="${student.stdNm }" placeholder="Surname" name="${student.stdNm }" readonly="readonly">
												</div>
												<div class="input-group" style="width: 30%; margin: 10px; font-size: 20px;">
													학과 &nbsp; <input type="text" class="form-control" value="${student.deptNm }" placeholder="Surname" name="${student.deptNm }" readonly="readonly">
												</div>
												<div class="input-group" style="width: 35%; margin: 10px; font-size: 20px;">
													학번 &nbsp; <input type="text" class="form-control" value="${student.stdNo }" placeholder="Surname" name="${student.stdNo }" readonly="readonly">
												</div>
											</div>
											<div style=" display: flex; justify-content: space-between;">
												<div class="input-group" style="width: 30%;">
													<div style="font-size: 20px;">
														끝년도  &nbsp; &nbsp;
													</div>
													<select class="default-select form-control" name="changeEndYr">
														<option value="">년도 선택</option>
															<option value="2023">2023</option>
													        <option value="2024">2024</option>
													        <option value="2025">2025</option>
													        <option value="2026">2026</option>
													        <option value="2027">2027</option>
													        <option value="2028">2028</option>
													        <option value="2029">2029</option>
													        <option value="2030">2030</option>
													</select>
												</div>
												<div class="input-group"  style="width: 30%;">
													<div style="font-size: 20px;">
														끝학기  &nbsp; &nbsp; 
													</div>
													<select class="default-select form-control" name="changeEndSem">
										               <option value="" >학기선택</option>
										               <option value="1">1 학기</option>
										               <option value="2">2 학기</option>
										           </select>
												</div>
											</div>
											</div>
											<div style="font-size: 20px;">
												유예 사유 &nbsp;
												<textarea rows="5" class="form-control" name="changeRsn"></textarea>
											</div>
											<div style="font-size: 20px;">
												공지사항 &nbsp;
												<textarea rows="20" class="form-control" name="changeRsn" readonly="readonly">2022학년도 전기(2023.2.17 졸업) 학사학위취득(졸업) 유예 신청 안내
 (2022.6.30일자로 "졸업유예"가 "학사학위취득 유예"로 명칭 변경)

학칙 제70조 및 학사운영규정 제85조에 따라 학사과정 학생이 졸업요건이 충족되어도 특별한 사정이 있는 경우 학사학위취득을 유예할 수 있으므로, 학사학위취득을 유예하고자하는 학생은 다음과 같이 신청하시기 바랍니다.

학사학위취득 유예 신청기한 후에는 철회 또는 추가신청이 불가하니 신중히 결정한 후 신청하시기 바랍니다.
1. 신청기한 : 2023. 1. 26.(목)까지

2. 신청대상 : 2023년 2월 졸업요건이 충족되어 학사학위취득이 가능하나 학사학위취득을 유예하고자 희망하는 학생
    - 반드시 졸업요건이 충족되었는지 소속 학과사무실에 확인 후 신청하시기 바람

3. 방법 : 본교 통합학사정보시스템을 통하여 신청

4. 처리절차
  ① 학생이 통합학사정보시스템에 로그인하여 “졸업관리-학사학위취득유예관리-학사학위취득유예신청”에 신청
  ② 학과 접수
  ③ 단과대학, 교무처 검토
  ④ 졸업유예 승인
  ⑤ 학생이 통합학사정보시스템에 로그인하여 처리결과 확인

5. 학사학위취득 유예기간 : 재학연한의 범위에서 1년까지 가능

6. 학사학위취득 유예 후 다음 학기 등록금 납부(문의: 사무국 관리팀(042-821-1817))
   - 수강신청 학점이 없는 경우 : 해당 학기 등록금의 10%
   - 수강신청 학점이 있는 경우
     ∙ 1~3학점 : 해당 학기 등록금의 6분의 1
     ∙ 4~6학점 : 해당 학기 등록금의 3분의 1
     ∙ 7~9학점 : 해당 학기 등록금의 2분의 1
     ∙ 10학점 이상 : 해당 학기 등록금의 전액

※ 학사학위취득 유예 확정 후 학기개시 2주 경과 시점까지 등록금을 납부하지 않을 경우, 당초 졸업예정 시기에 졸업 처리됩니다.</textarea>
											</div>
											
											<br>
											<div style="display: flex; justify-content: end; margin-right: 80px; margin-top: 10px;">
												<button type="button" class="btn btn-primary" onclick="gradutePostpone()">신청</button>																	
											</div>
										</div>
									</form>		
								</div>
							</div>
						</div>
					</div>

					<div id="navpills-2" class="tab-pane">
						<div class="row">
							<div class="col-md-12">
								<form name="form2">
									<div style="display: flex; justify-content: space-between; margin: 30px; margin-top: -20px;">
									  <div style="display: flex; flex-direction: column; width: 50%;">
									    <div>1</div>
									    <div>2</div>
									    <div>3</div>
									  </div>
									  <div style="font-size: 20px; width: 50%;">
									    공지사항 &nbsp;
									    <textarea rows="20" class="form-control" name="changeRsn" readonly="readonly">
2022학년도 전기(2023.2.17. 졸업) 조기졸업 신청 안내

학칙 제69조 및 학사운영규정 제84조에 따라 학사과정 학생이 수업연한을 단축하여 조기졸업을 할 수 있으므로, 조기졸업을 하고자하는 학생은 다음과 같이 신청하시기 바랍니다.

조기졸업 신청기한 후에는 철회 또는 추가신청이 불가하니 신중히 결정한 후 신청하시기 바랍니다.
1. 신청기한 : 2023. 1. 26.(목)까지
2. 신청대상 : 6학기(건축학과 8학기, 편입생 3학기) 이상 이수하고, 성적평점평균이 4.00(A0) 이상인 학생으로 2023년 2월 졸업이 가능한 학생
    - 반드시 졸업요건이 충족되었는지 소속 학과사무실에 확인 후 신청
3. 방법 : 본교 통합학사정보시스템을 통하여 신청
4. 처리절차
  ① 학생이 통합학사정보시스템에 로그인하여 “졸업관리-조기졸업관리-조기졸업신청”에 신청
  ② 학과, 단과대학, 교무처 검토
  ③ 조기졸업 승인
  ④ 학생이 통합학사정보시스템에 로그인하여 처리결과 확인
    (별도로 개인에게 처리결과를 통보하지 않음)
									    </textarea>
									  </div>
									</div>
								</form>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function gradutePostpone(){

}
</script>
