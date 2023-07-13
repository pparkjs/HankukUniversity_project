<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="deznav">
	<div class="deznav-scroll">
	<!--  각 액터별 side bar도 권한에 따라 배분해야함! -->
		<ul class="metismenu" id="menu">
		<c:if test="${not empty std }">
	<!--------------------------------------- 학생에대한 side bar --------------------------------------->

			<li class="menu-title">HANKUK UNIVERSITY (학생)</li>
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">학적</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/hku/student/record">기본사항</a></li>
					<li><a href="/hku/student/recordChange">학적변동</a></li>
					<li><a href="#">졸업</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">수강정보</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/hku/search-subject">교과목 조회</a></li>
					<li><a href="/hku/course-req">수강신청</a></li>
					<li><a href="/hku/course-record">수강이력</a></li>
					<li><a href="/hku/present-course">수강중인 강의</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">성적</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">전체학기 성적 조회</a></li>
					<li><a href="#">당학기 성적 조회</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">시험</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">응시과목 정보</a></li>
				</ul>
			</li>
			
			<li>
				<a href="/hku/student/stdClassroomMain" class="" aria-expanded="false">
					<div class="menu-icon">
						<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 14.0673C7.4407 14.0673 4.41309 14.6034 4.41309 16.7501C4.41309 18.8969 7.4215 19.4521 10.986 19.4521C14.5313 19.4521 17.5581 18.9152 17.5581 16.7693C17.5581 14.6234 14.5505 14.0673 10.986 14.0673Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 11.0054C13.3126 11.0054 15.1983 9.11881 15.1983 6.79223C15.1983 4.46564 13.3126 2.57993 10.986 2.57993C8.65944 2.57993 6.77285 4.46564 6.77285 6.79223C6.76499 9.11096 8.63849 10.9975 10.9563 11.0054H10.986Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">클래스룸</span>
				</a>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">상담</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">상담신청</a></li>
					<li><a href="#">신청내역 조회</a></li>
				</ul>
			</li>
			
			<li>
				<a href="/hku/student/study" class="" aria-expanded="false">
					<div class="menu-icon">
						<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 14.0673C7.4407 14.0673 4.41309 14.6034 4.41309 16.7501C4.41309 18.8969 7.4215 19.4521 10.986 19.4521C14.5313 19.4521 17.5581 18.9152 17.5581 16.7693C17.5581 14.6234 14.5505 14.0673 10.986 14.0673Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 11.0054C13.3126 11.0054 15.1983 9.11881 15.1983 6.79223C15.1983 4.46564 13.3126 2.57993 10.986 2.57993C8.65944 2.57993 6.77285 4.46564 6.77285 6.79223C6.76499 9.11096 8.63849 10.9975 10.9563 11.0054H10.986Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">스터디</span>
				</a>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">시설예약</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">시설예약</a></li>
					<li><a href="#">사물함예약</a></li>
					<li><a href="#">나의 예약 현황 </a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">등록금</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">등록금 납부내역</a></li>
					<li><a href="#">등록금 고지서</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">장학금</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">장학금 신청</a></li>
					<li><a href="#">장학금 수혜 내역 확인</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">증명서</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">증명서 발급</a></li>
				</ul>
			</li>
	</c:if>
	<c:if test="${not empty emp}">		
	<!--------------------------------------- 교직원에대한 side bar --------------------------------------->
			
			<li class="menu-title">HANKUK UNIVERSITY (교직원)</li>
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">학사관리</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/hku/admin/dept-administration">학과 관리</a></li>
					<li><a href="#">학적 관리</a></li>
					<li><a href="/hku/admin/subject-administration">교과목 관리</a></li>
					<li><a href="#">시설관리</a></li>
					<li><a href="#">사물함관리</a></li>
					<li><a href="#">학사 일정 관리</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">사용자관리</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/hku/admin/user-management">사용자관리</a></li>
					<li><a href="#">문자 발송</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">교수행정</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">개설신청 관리</a></li>
					<li><a href="#">휴강신청 관리</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">장학금</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">장학금 정보 등록</a></li>
					<li><a href="#">장학금 신청 내역</a></li>
				</ul>
			</li>
			
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">게시판 관리</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/hankuk/admin/academicnotice">학사공지 게시판</a></li>
					<li><a href="#">채용정보 게시판</a></li>
					<li><a href="#">학과공지 게시판</a></li>
				</ul>
			</li>
			
			<li>
				<a href="#" class="" aria-expanded="false">
					<div class="menu-icon">
						<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 14.0673C7.4407 14.0673 4.41309 14.6034 4.41309 16.7501C4.41309 18.8969 7.4215 19.4521 10.986 19.4521C14.5313 19.4521 17.5581 18.9152 17.5581 16.7693C17.5581 14.6234 14.5505 14.0673 10.986 14.0673Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 11.0054C13.3126 11.0054 15.1983 9.11881 15.1983 6.79223C15.1983 4.46564 13.3126 2.57993 10.986 2.57993C8.65944 2.57993 6.77285 4.46564 6.77285 6.79223C6.76499 9.11096 8.63849 10.9975 10.9563 11.0054H10.986Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">총지표</span>
				</a>
			</li>
		</c:if>
	<!--------------------------------------- 교수에대한 side bar --------------------------------------->
		<c:if test="${not empty pro}">
			<li class="menu-title">HANKUK UNIVERSITY (교수)</li>
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">강의 관리</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="/lecture/open">강의 개설신청</a></li>
					<li><a href="#">휴강 신청</a></li>
				</ul>
			</li>
			
			<li>
				<a href="/hku/professor/classroomList" class="" aria-expanded="false">
					<div class="menu-icon">
						<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 14.0673C7.4407 14.0673 4.41309 14.6034 4.41309 16.7501C4.41309 18.8969 7.4215 19.4521 10.986 19.4521C14.5313 19.4521 17.5581 18.9152 17.5581 16.7693C17.5581 14.6234 14.5505 14.0673 10.986 14.0673Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path fill-rule="evenodd" clip-rule="evenodd" d="M10.986 11.0054C13.3126 11.0054 15.1983 9.11881 15.1983 6.79223C15.1983 4.46564 13.3126 2.57993 10.986 2.57993C8.65944 2.57993 6.77285 4.46564 6.77285 6.79223C6.76499 9.11096 8.63849 10.9975 10.9563 11.0054H10.986Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">클래스룸</span> 
				</a>
			</li>
			<li>
				<a class="has-arrow " href="javascript:void(0);" aria-expanded="false">
					<div class="menu-icon">
						<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M2.5 7.49999L10 1.66666L17.5 7.49999V16.6667C17.5 17.1087 17.3244 17.5326 17.0118 17.8452C16.6993 18.1577 16.2754 18.3333 15.8333 18.3333H4.16667C3.72464 18.3333 3.30072 18.1577 2.98816 17.8452C2.67559 17.5326 2.5 17.1087 2.5 16.6667V7.49999Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M7.5 18.3333V10H12.5V18.3333" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"/>
						</svg>
					</div>	
					<span class="nav-text">상담 관리</span>
				</a>
				<ul aria-expanded="false">
					<li><a href="#">학생상담 신청 내역</a></li>
				</ul>
			</li>
			</c:if>
		</ul>
	</div>
</div>