<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<meta name="robots" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
	<meta property="og:title" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
	<meta property="og:description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
	<meta property="og:image" content="https://w3crm.dexignzone.com/xhtml/social-image.png">
	<meta name="format-detection" content="telephone=no">
	
	<!-- PAGE TITLE HERE -->
	<title>HANKUK Learning Management System</title>
	
	<!-- FAVICONS ICON -->
	<link rel="shortcut icon" type="image/png" href="/images/hankuk.png">
	<link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
	<link href="/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
    <link href="/css/style.css" rel="stylesheet">
    <!-- toastr -->
	<link href="/resources/vendor/toastr/css/toastr.min.css" rel="stylesheet">
    
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- jquery 추가 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- ckEditor추가 -->
	<script src="/resources/vendor/ckeditor/ckeditor.js"></script>
	
	<!-- toastr -->
	<script type="text/javascript" src="/resources/vendor/toastr/js/toastr.min.js"></script>
	
	<!-- XSS막기용 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/he/1.2.0/he.min.js"></script>
</head>
<body>
	<!-- Preloader start -->
	<div id="preloader">
		<div class="loader">
			<img src="/images/로딩로고.png" width="205px;" height="205px;" style="margin-top: 26px; margin-left: -16px;">
			<svg class="circular" viewBox="25 25 50 50">
	                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
	        </svg>
		</div>
	</div>
    
    <!--***** Main wrapper start *****-->
    <div id="main-wrapper">
    
        <!-- Nav header 부분 -->
        <tiles:insertAttribute name="nav-header"/>
		
		<!-- Chat box start 부분(오른쪽에서 나오는 그거) -->
		<tiles:insertAttribute name="chatbox"/>		
		
		<!-- Header start -->
		<tiles:insertAttribute name="header"/>
        <!-- Header end ti-comment-alt -->

        <!-- Sidebar start -->
		<tiles:insertAttribute name="sidebar"/>
		
		<!-- 여기는 spring 권한별로 달라져야하는 부분 -->
		<sec:authorize access="hasRole('ROLE_STUDENT')">
		<tiles:insertAttribute name="studentContent"/>
<%-- 	<tiles:insertAttribute name="portalContent"/> --%>  
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
	 	<tiles:insertAttribute name="adminContent"/> 
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_PROFESSOR')">
		<tiles:insertAttribute name="professorContent"/>
		</sec:authorize>

		
		<!-- Content body start -->
        <!-- <div class="content-body">
            row
			<div class="container-fluid">
			
            </div>
        </div> -->

        <!-- Footer start -->
        <tiles:insertAttribute name="footer"/>

	</div>
    <!--***** Main wrapper end *****-->
    
    <!-- Required vendors 건들지 마!!!!-->
    <script src="/vendor/global/global.min.js"></script>
	<script src="/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="/js/custom.js"></script>
	<script src="/js/deznav-init.js"></script>
	<!--------------------------------->
</body>