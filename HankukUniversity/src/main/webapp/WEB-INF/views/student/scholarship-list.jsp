<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/scholarship.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">장학금</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">장학금 수혜 내역</a></li>
		</ol>
    </div>
	<div class="container-fluid" style="margin-top: -14px;">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">기본 정보</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div class="myInfo">
					학과:&nbsp;&nbsp;&nbsp;
					<input type="text" class="deptText" value="${std.deptNm }" disabled>
					학번:&nbsp;&nbsp;&nbsp;
					<input type="text" class="noText" value="${std.stdNo }" disabled>
					이름:&nbsp;&nbsp;&nbsp;
					<input type="text" class="nameText" value="${std.stdNm }" disabled>
					학년:&nbsp;&nbsp;&nbsp;
					<input type="text" class="yearText" value="${std.grade}" disabled>
					상태:&nbsp;&nbsp;&nbsp;
					<c:set value="${std.stdSttsCd}" var="sttsCd"/>
					<input type="text" class="semText" value="${std.stdSttsNm}" disabled>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0">
				<h5 class="card-title">유의 사항</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<div>
					<span><h5>▶ 교내 등록금감면 장학금 신청 안내</h5></span>
					<span class="uu">교내 등록금감면 장학금 및 신청방법을 아래와 같이 안내드리오니<span><br/>
					<span class="uu">장학대상자는 공지사항의 내용과 붙임자료를 모두 필독하신 후 신청하여 주시기 바랍니다.</span><br/><br/>
					
					<span><h5>▶ 문의사항: 학생지원팀 교내장학 042-456-7890</h5></span>
					
					<!-- <span><h5>▶ 증명서를 제출(전송)할 경우, 반드시 보안증명서 사용법 파일(.html)과 증명서 파일(.min)을 함께 제출(전송)해주십시요.</h5></span> -->
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row g-2 custom-form">
			<div class="col-md-1">
				<select class="default-select form-control form-control-sm" id="lockerRsvtYear">
					<option value="">년도 선택</option>
					<option value="2022">2022학년도</option>
					<option value="2023">2023학년도</option>
				</select>
			</div>
			<div class="col-md-1">
				<select class="default-select form-control form-control-sm" id="lockerRsvtSem">
					<option value="">학기 선택</option>
					<option value=1>1학기</option>
					<option value=2>2학기</option>
				</select>
			</div>
			<div class="col-md-2">
				<input type="text" class="form-control input-default form-control-sm" id="sclsNm" placeholder="검색 할 장학명을 입력해주세요"/>
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-sm btn-primary sclsListBtn" onclick="lockerRsvtList()">검색</button>
			</div>
		</div>
	</div>
	
	<div class="container-fluid sclsCF">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title">장학금 수혜 내역</h5>
			</div>
			<hr style="margin: 0rem;"/>
			<div class="card-body">
				<p class="card-text">
					장학금 수혜 내역
				</p>
			</div>
		</div>
	</div>
</div>
