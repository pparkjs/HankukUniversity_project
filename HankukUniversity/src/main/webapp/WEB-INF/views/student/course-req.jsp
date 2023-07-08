<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/course-info.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">수강정보</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">교과목 조회</a></li>
		</ol>
    </div>
	<div class="container-fluid searchCon">
		<div class="card" id="card-title-1">
			<div class="card-body">
				<div class="search1">
					이수구분:&nbsp;&nbsp;&nbsp;
					<select class="clsfSel">
						<option value="">전체</option>
						<c:forEach items="${commonList}" var="common">
							<c:if test="${common.comCdGrp eq 'COURSE_CLSF' }">
								<option value="${common.comCdNm }">${common.comCdNm }</option>
							</c:if>
						</c:forEach>
					</select>
					학과:&nbsp;&nbsp;&nbsp;
					<select class="deptSel">
						<option value="">전체</option>
						<c:forEach items="${deptList}" var="dept">
							<option value="${dept.deptNm }">${dept.deptNm }</option>
						</c:forEach>
					</select>
					학년:&nbsp;&nbsp;&nbsp;
					<select class="gradeSel">
						<option value="">전체</option>
						<option value="1">1학년</option>
						<option value="2">2학년</option>
						<option value="3">3학년</option>
						<option value="4">4학년</option>
					</select>
					교과목명:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="subName" placeholder="교과목명을 입력하세요.">
					<button type="button" class="btn btn-primary" id="searchBtn">조회</button>
					<div class="cart">
						<img class="timeImg" src="/images/시간.png" alt="">
						<div>오전 11:52:23</div>
						<img class="cartImg" src="/images/shopping-cart(white).png" alt="">
						<button type="button" class="btn btn-primary" id="cartBtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과목담기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-body" style="padding-top: 0px;">
				<div class="course-wrap">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th style="width: 130px;">과목코드</th>
								<th style="width: 330px;">교과목명</th>
								<th style="width: 40px;">이수구분</th>
								<th style="width: 130px">담당교수</th>
								<th style="width: 15px;">학년</th>
								<th style="width: 15px;">학점</th>
								<th style="width: 15px;">시수</th>
								<th style="width: 40px;">강의시간</th>
								<th style="width: 250px;">학과</th>
								<th style="width: 20px;">정원</th>
								<th style="width: 20px;">잔여</th>
							</tr>
						</thead>
						<tbody>
							<!-- 동적추가 -->
						</tbody>
					</table>
				</div>
				<div class="middle">
					<div class="middleLeft">
						<div class="lTitle">
							<p style="color: maroon;  font-weight: 900; margin-bottom: -10px;">장바구니</p>
						</div>
						<div class="table-wrap">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th style="width: 130px;">과목코드</th>
										<th style="width: 330px;">교과목명</th>
										<th style="width: 100px">담당교수</th>
										<th style="width: 15px;">학년</th>
										<th style="width: 15px;">학점</th>
										<th style="width: 200px;">학과</th>
										<th style="width: 20px;">신청</th>
										<th style="width: 20px;">취소</th>
									</tr>
								</thead>
								<tbody>
									<!-- 동적추가 -->
								</tbody>
							</table>
						</div>
					</div>
					<div class="middleRight">
						<div class="rTitle">
							<p style="color: maroon;  font-weight: 900; margin-bottom: -10px;">시간표 배정</p>
						</div>
						<div class="schedule-wrap">
							<table class="schedule" border=1>
								<thead class="thead-dark">
									<tr>
										<th style="width: 30px;"></th>
										<th style="width: 30px;">월</th>
										<th style="width: 30px;">화</th>
										<th style="width: 30px;">수</th>
										<th style="width: 30px;">목</th>
										<th style="width: 30px;">금</th>
									</tr>
								</thead>
								<tbody>
									<!-- 동적추가 -->
									<tr class="1">
										<td>1교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="2">
										<td>2교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="3">
										<td>3교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="4">
										<td>4교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="5">
										<td>5교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="6">
										<td>6교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="7"> 
										<td>7교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="8">
										<td>8교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
									<tr class="9">
										<td>9교시</td>
										<td class="mon"></td>
										<td class="tue"></td>
										<td class="wed"></td>
										<td class="thu"></td>
										<td class="fri"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function(){
	
	/* subList(); */
	
	var searchBtn = $("#searchBtn");
	
	// 조회버튼 클릭시 동작
	searchBtn.on("click", function(){
		subList();
	})
	
	$(document).on("click","tr", function(){
		$('tr').css('background', '');
		$(this).css('background', '#6e6e6e26');
		var subOtl = $(this).find('.otl');
		$(".otlContent").html(subOtl.text());
	})
})

// 과목 리스트 가져오는 함수
function subList(){
	var tbody = $("tbody");
	var clsfSel = $(".clsfSel").val();
	var deptSel = $(".deptSel").val();
	var gradeSel = $(".gradeSel").val();
	var subNm = $("#subName").val();
	
	var selData = {
		"com_cd_nm":clsfSel,
		"dept_nm":deptSel,
		"sub_grade":gradeSel,
		"sub_nm":subNm
	}
	
	$.ajax({
		type:"get",
		data:selData,
		url : "/hku/student/lecture-list",
		dataType : "json",
		success : function(res){
			console.log(res)

			data = '';
			for(var i = 0; i < res.length; i++){
				data += `<tr>
							<td id="\${res[i].subNo}">\${res[i].subNo}</th>
							<td id="\${res[i].subNo}">\${res[i].subNm}</td>
							<td id="\${res[i].subNo}">\${res[i].crsClassfCd}</td>
							<td id="\${res[i].subNo}">\${res[i].subGrade}</td>
							<td id="\${res[i].subNo}">\${res[i].subCrd}</td>
							<td id="\${res[i].subNo}">\${res[i].subHour}</td>
							<td id="\${res[i].subNo}">\${res[i].deptCd}</td>`
				if(`\${res[i].subOtl}` == "null" || `\${res[i].subOtl}` == null){
					data +=	`<td id="\${res[i].subNo}" class="otl" style="display:none;">개요가 존재하지 않습니다.</td>`
				}else{
					data +=	`<td id="\${res[i].subNo}" class="otl" style="display:none;">\${res[i].subOtl}</td>`
				}	
				data +=	`</tr>`;
			}
			tbody.html(data);
		}
	})
}
</script>