<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="/css/style.css" rel="stylesheet">
	
</head>
<body>
	<!-- Preloader start(사이트 이동할 때 로딩되는 것 같은 부분) -->
    <div id="preloader">
		<div class="lds-ripple">
			<div></div>
			<div></div>
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
<%-- 		<tiles:insertAttribute name="studentContent"/> --%>
<<<<<<< HEAD
	 	<tiles:insertAttribute name="adminContent"/> 
=======
<%-- 	 	<tiles:insertAttribute name="adminContent"/>  --%>
>>>>>>> 8c511b5665393345c4ca7621e433ae02fbd0faed
<%-- 		<tiles:insertAttribute name="professorContent"/> --%>
<%-- 		<tiles:insertAttribute name="portalContent"/>   --%>
		
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