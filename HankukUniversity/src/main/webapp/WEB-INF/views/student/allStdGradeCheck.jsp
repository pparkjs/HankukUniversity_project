<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/std-jh.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">성적</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">전체학기
					성적조회</a></li>
		</ol>
	</div>
	<div class="container-fluid">
		<div class="card" style="width: 100%; margin-bottom: 0.563rem;">
			<div class="card-header  cardTitle">
				<h4 class="card-title"
					style="font-weight: bold; font-size: 1.2em; color: #800000;">학생기본정보</h4>
			</div>
			<div class="card-body stdInfo">
				<table id="stdInfoTb" style="width: 100%; height: 100%;">
					<tr>
						<td><span>성명</span><input type="text" value="${std.stdNm}"
							disabled="disabled"></td>
						<td><span>학번</span><input type="text" value="${std.stdNo}"
							disabled="disabled"></td>
						<td><span>학적상태</span><input type="text"
							value="${map.stdInfo[0].stdSttsNm}" disabled="disabled"></td>
						<td><span>생년월일</span><input type="text"
							value="${std.stdBrdt}" disabled="disabled"></td>
					</tr>
					<tr>
						<td><span>단과대학</span><input type="text"
							value="${map.stdInfo[0].colNm}" disabled="disabled"></td>
						<td><span>소속학과</span><input type="text"
							value="${map.stdInfo[0].deptNm}" disabled="disabled"></td>
						<td><span>년도</span> <select class="selectC" id="selYear">
								<option value="">전체연도</option>
								<c:forEach items="${map.subjectYr}" var="year">
									<option value="${year}">${year}</option>
								</c:forEach>
						</select></td>
						<td><span>학기</span> <select class="selectC" id="selSem">
								<option value="">전체학기</option>
								<option value="1">1학기</option>
								<option value="2">2학기</option>
						</select></td>
					</tr>

				</table>

			</div>
		</div>

		<div></div>
	</div>
	<div class="all-grade-wrap">
		<div class="card"
			style="width: 62%; margin-bottom: 0.563rem; margin-right: 8px; margin-left: 30px;">
			<div class="card-header  cardTitle">
				<h4 class="card-title"
					style="font-weight: bold; font-size: 1.2em; color: #800000;">학점이수정보</h4>
			</div>
			<div class="card-body allCrd" style="padding: 0;">
				<table border="1" style="width: 100%; height: 124px;">
					<thead>
						<tr>
							<th colspan="3" style="width: 25%;">졸업기준학점</th>
							<th colspan="3" style="width: 25%;">총 취득학점</th>
							<th colspan="3"
								style="width: 25%; background-color: #ccced0; color: #800000;">필요학점</th>
							<th rowspan="2" style="width: 12.5%;">평점합계</th>
							<th rowspan="2" style="width: 12.5%;">평점평균</th>
						</tr>
						<tr>
							<th>전공</th>
							<th>교양</th>
							<th>총점</th>
							<th>전공</th>
							<th>교양</th>
							<th>총점</th>
							<th style="background-color: #ccced0; color: #800000;">전공</th>
							<th style="background-color: #ccced0; color: #800000;">교양</th>
							<th style="background-color: #ccced0; color: #800000;">총점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="gradMjr">${crtrVO.depcrMjrGrdtnCrd }</td>
							<td id="gradCtrl">${crtrVO.depcrCtrlGrdtnCrd }</td>
							<td id="gradAll">${crtrVO.depcrCtrlGrdtnCrd }+${crtrVO.depcrMjrGrdtnCrd }</td>
							<td id="getMjr"></td>
							<td id="getCtrl"></td>
							<td id="getAll"></td>
							<td id="needMjr" style="background-color: #ccced0;"></td>
							<td id="needCtrl" style="background-color: #ccced0;"></td>
							<td id="needAll" style="background-color: #ccced0;"></td>
							<td>-</td>
							<td>-</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card" style="width: 34%; margin-bottom: 0.563rem;">
			<div class="card-header  cardTitle">
				<h4 class="card-title" id="selectedSem"
					style="font-weight: bold; font-size: 1.2em; color: #800000;">학기별
					이수학점</h4>
			</div>
			<div class="card-body allCrd" style="padding: 0;">
				<table border="1" style="width: 100%; height: 124px;">
					<thead>
						<tr>
							<th colspan="3">이수학점</th>
							<th rowspan="2">평점합계</th>
							<th rowspan="2">평점평균</th>
						</tr>
						<tr>
							<th>전공</th>
							<th>교양</th>
							<th>총점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="semMjr" style="width: 20%;">-</td>
							<td id="semCtrl" style="width: 20%;">-</td>
							<td id="semAll" style="width: 20%;">-</td>
							<td style="width: 20%;">-</td>
							<td style="width: 20%;">-</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div
		style="width: 100%; margin-bottom: 0.563rem; height: 470px; overflow: scroll">
		<table id="allGradeTable"
			style="width: 96.5%; margin: 0 auto; border: 1px;">
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
				</tr>
				<tr>
					<th>과제</th>
					<th>출석</th>
					<th>중간</th>
					<th>기말</th>
				</tr>
			</thead>
			<tbody id="allGradeTb">
				<c:forEach items="${map.subject}" var="subject">
					<tr>
						<td>${subject.lecapYr}</td>
						<td>${subject.lecapSem}</td>
						<td style="width: 200px;">${subject.deptNm}</td>
						<td>${subject.crsClassfCd}</td>
						<td style="width: 300px;">${subject.subNm}</td>
						<td>${subject.subNo}</td>
						<td>${subject.subCrd}</td>
						<td>생략</td>
						<td>생략</td>
						<td>생략</td>
						<td>생략</td>
						<td>생략</td>
						<td>${subject.crsScr}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
let stdInfo = [];
let one;
let subject = [];
let two;


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

<c:forEach items="${map.subject}" var="subject">
	<script>
	 two = {
			 subNo:'${subject.subNo}' ,
			 subNm:'${subject.subNm}',
			 subCrd:'${subject.subCrd}',
			 crsClassfCd:'${subject.crsClassfCd}',
			 crsScr:'${subject.crsScr}',
			 lecapYr:'${subject.lecapYr}',
			 lecapSem:'${subject.lecapSem}',
			 deptNm:'${subject.deptNm}'
	}
	subject.push(two);
</script>
</c:forEach>

<script>
let mjrCrd = 0 ;
let ctrlCrd  = 0 ;
let semCrd  = 0;
var stdNo = ${std.stdNo};
console.log(stdInfo);
console.log(subject);
for (let i = 0; i < subject.length; i++) {
	if (subject[i].crsClassfCd === '전필'|| subject[i].crsClassfCd === '전선') {
		mjrCrd += parseInt(subject[i].subCrd);
	}else{
		ctrlCrd += parseInt(subject[i].subCrd);
	}
	semCrd += parseInt(subject[i].subCrd);
}
$('#getMjr').text(mjrCrd);
$('#getCtrl').text(ctrlCrd);
$('#getAll').text(ctrlCrd+mjrCrd);
console.log("mjr",mjrCrd);
console.log("ctrl",ctrlCrd);
console.log("semCrd",ctrlCrd);
var deptMjr = parseInt(${crtrVO.depcrMjrGrdtnCrd});
var deptCtrl = parseInt(${crtrVO.depcrCtrlGrdtnCrd});
$('#gradAll').text(deptMjr+deptCtrl);

$('#needMjr').text(deptMjr-mjrCrd);
$('#needCtrl').text(deptCtrl-ctrlCrd);
$('#needAll').text((deptCtrl-ctrlCrd)+(deptMjr-mjrCrd));


$('#selYear').change(function(){
	console.log("선택연도",$('#selYear option:selected').val());
	getAllGrade();
})
$('#selSem').change(function(){
	console.log($('#selSem option:selected').val()[0]);
	getAllGrade();
})

function getAllGrade(){
	var  lecapYr = $('#selYear option:selected').val();
	var lecapSem = $('#selSem option:selected').val();
	
	data = {
			lecapYr : lecapYr,
			lecapSem :lecapSem
	}
	console.log("data",data);
	$.ajax({
        url: '/hku/student/getAllgrade',
        method: 'post',
        data: JSON.stringify(data),
        contentType: 'application/json',
        beforeSend : function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
        success: function (res) {
        	console.log(res);
         gradeStr = '';
        	for(let i=0; i <res.length; i++){
        		gradeStr += '<tr>'
        		gradeStr += '<td>'+res[i].lecapYr+'</td>';
        		gradeStr += '<td>' + res[i].lecapSem+'</td>';
      			gradeStr += '<td  style="width:200px;">' + res[i].deptNm+'</td>';
      			gradeStr += '<td>' + res[i].crsClassfCd+'</td>';
      			gradeStr += '<td style="width:300px;">' + res[i].subNm+'</td>';
      			gradeStr += '<td>' + res[i].subNo+'</td>';
      			gradeStr += '<td>' + res[i].subCrd+'</td>';
      			gradeStr += '<td>' + '생략' +'</td>';
      			gradeStr += '<td>' + '생략' +'</td>';
      			gradeStr += '<td>' + '생략' +'</td>';
      			gradeStr += '<td>' + '생략' +'</td>';
      			gradeStr += '<td>' + '생략' +'</td>';
      			gradeStr += '<td>' + res[i].crsScr+'</td>';
      			gradeStr += '</tr>'
        	}
        	
        	$('#allGradeTb').html(gradeStr);
        	
        	let mjr= 0;
        	let ctrl = 0;
        	for(let i=0; i <res.length; i++){
        		if (res[i].crsClassfCd === '전필'|| res[i].crsClassfCd === '전선') {
        			mjr += parseInt(res[i].subCrd);
        		}else{
        			ctrl += parseInt(res[i].subCrd);
        		}
        	}
		let all = mjr + ctrl ;
		console.log(all);
        	
        	$('#semMjr').text(mjr);
        	$('#semCtrl').text(ctrl);
        	$('#semAll').text(all);
        	if(lecapYr == '' && lecapSem != ''){
        		console.log("1");
        		$('#selectedSem').text('전체연도'+" "+lecapSem+'학기 이수학점');
        	}else if(lecapSem  == '' && lecapYr != '' ){
        		console.log("2");
        		$('#selectedSem').text(lecapYr+"년 "+'전체학기 이수학점');
        	}else if(lecapYr == ''&& lecapSem  == ''){
        		console.log("3");
        		$('#selectedSem').text('전체연도 전체학기 이수학점');
        	}else{
        		console.log("4");
        	$('#selectedSem').text(lecapYr+'년 '+lecapSem+'학기 이수학점');
        	}
        },
        error: function (xhr, status, error) {
            swal("출력실패");
        }	
	
	
	})
}
	
</script>