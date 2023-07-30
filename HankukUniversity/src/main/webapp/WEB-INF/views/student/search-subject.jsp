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
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid subCon">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0" style="justify-content: flex-start;">
				<div class="card-title" style="color: maroon;  font-weight: 900; font-size: 1rem;">학점이수현황</div>
				<div class="exp" style=" margin-bottom:0px; margin-right:0px; margin-left: 39px; font-weight: 400;"></div>
			</div>
			<div class="card-body" style="padding-top: 0px;">
				<div class="table-wrap" style="height: 425px;">
					<table class="table" style="margin-top: -22px;">
						<thead class="thead-dark">
							<tr>
								<th style="width:260px;">과목코드</th>
								<th style="width:400px;">교과목명</th>
								<th style="width:230px;">이수구분</th>
								<th style="width:130px;">학년</th>
								<th style="width:130px;">학점</th>
								<th style="width:130px;">시수</th>
								<th style="width:400px;">학과</th>
							</tr>
						</thead>
						<tbody>
							<!-- 동적추가 -->
						</tbody>
					</table>
				</div>
				<div class="subInfo">
					<p style="color: maroon;  font-weight: 900;">교과목 개요</p>
					<hr>
					<div class="otlContent">
						<!-- 동적 추가 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>

var searchBtn = $("#searchBtn");
var more = 0; // 무한스크롤 페이징 위한 더보기 횟수
var tbody = $("tbody");

subList(0);

$(document).on("click","tr", function(){
	$('tr').css('background', '');
	$(this).css('background', '#6e6e6e26');
	var subOtl = $(this).find('.otl');
	$(".otlContent").html(subOtl.text());
})

// 조회버튼 클릭시 동작
searchBtn.on("click", function(){
	more = 0;
	tbody.empty();
	subList(0);
})

// 과목 리스트 가져오는 함수
function subList(moreData){
	var clsfSel = $(".clsfSel").val();
	var deptSel = $(".deptSel").val();
	var gradeSel = $(".gradeSel").val();
	var subNm = $("#subName").val();
	
	var selData = {
		"com_cd_nm":clsfSel,
		"dept_nm":deptSel,
		"sub_grade":gradeSel,
		"sub_nm":subNm,
		"more":moreData
	}
	
	$.ajax({
		type:"get",
		data:selData,
		url : "/hku/sub-list",
		dataType : "json",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			data = '';
			if(res.length > 0){
				$(".exp").text(`전체 과목 수 : \${res[0].totalCnt}개`)
			}
			for(var i = 0; i < res.length; i++){
				data += `<tr>
							<td id="\${res[i].subNo}">\${res[i].subNo}</th>
							<td id="\${res[i].subNo}" style="text-align:left">\${res[i].subNm}</td>
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
			tbody.append(data);
		}
	})
}

// 무한 스크롤을 위한 곳
const tableWrap = document.querySelector('.table-wrap');

tableWrap.addEventListener("scroll", tableScrollHandler);
function tableScrollHandler(){
	var scrollTop = tableWrap.scrollTop; // 얼마큼 올라갔는지?
	var clientHeight = tableWrap.clientHeight; // 브라우저에서 사용자가 눈으로 보는 크기
	var scrollHeight = tableWrap.scrollHeight; // 문서 전체 크기(높이)
	 
	var tunningVal = 50
	if((scrollTop + clientHeight) >= (scrollHeight - tunningVal)) {
        more++;
        subList(more);
    }
}
</script>