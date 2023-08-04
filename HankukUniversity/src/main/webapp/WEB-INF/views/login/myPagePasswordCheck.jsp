<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
label{
width: 100px;
text-align: left;
}
input[type=text]{
width :300px;
margin:0px;
}
input[type=password]{
width :300px;
margin:0px;
}
input[type=radio]{
min-width : 0px;
 width: 20px;
  height: 20px;
  margin-left:10px;
  margin-right: 30px; /* 라디오 버튼과 텍스트 사이의 간격을 조정합니다. */
}

</style>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/portal/webfonts.css">
    <link rel="stylesheet" href="/css/portal/default.css">
    <link href="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack.min.css" rel="stylesheet"/>
    <!-- toastr -->
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />	
	<!-- 제이쿼리 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- toastr -->
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>	
<title>마이페이지 비밀번호 확인</title>
</head>
<body>
<div class="default-tab" style="padding:10px;">
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" href="#home"><i class="la la-home me-2"></i>비밀번호 확인</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="home" role="tabpanel">
			<div class="pt-4" style="padding-left: 35px;">
				<form class="mb-3 row">
                	<label class="col-sm-2 col-form-label">비밀번호 입력</label>
	                <div class="col-sm-10">
	                    <input type="text" class="form-control" id="temporary">
	                </div>
                </form>
                <br>
				<button type="button" class="btn btn-primary" style="background:#800000; width:300px; border:none;" id='changePw'>확인</button>
				<div style="height: 50px; width:300px; margin:0px; display: flex; justify-content: center; align-items: center;">
				 <p id="result" style="color:blue; font-size: 1.3em; font-weight: bold;"> </p>
				 </div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>
