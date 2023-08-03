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
<title>한국대학교 비밀번호 변경</title>
</head>
<body>
<div class="default-tab" style="padding:10px;">
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" href="#home"><i class="la la-home me-2"></i>비밀번호 변경</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="home" role="tabpanel">
			<div class="pt-4" style="padding-left: 35px;">
			<p style="color:red;">최초 로그인시, 1회에 한해 비밀번호를 필수로 변경해야합니다.</p>
				<div class="mb-3 row">
                <label class="col-sm-2 col-form-label">현재 비밀번호 입력</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="temporary" placeholder='소문자, 숫자, 특수기호가 포함된 8글자 이상'>
                </div>
                </div>
				<div class="mb-3 row" >
                <label class="col-sm-2 col-form-label">새로운 비밀번호 입력</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="newPw" >
                </div>
                </div>
				<div class="mb-3 row" >
                <label class="col-sm-2 col-form-label">새로운 비밀번호 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="renewpw" >
                </div>
                </div>
                <br>
				<button type="button" class="btn btn-primary" style="background:#800000; width:300px; border:none;" id='changePw'>비밀번호 변경</button>
				<div style="height: 50px; width:300px; margin:0px; display: flex; justify-content: center; align-items: center;">
				 <p id="result" style="color:blue; font-size: 1.3em; font-weight: bold;"> </p>
				 </div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>
<script>
var userNo ;
	
	$(document).on('click','#changePw',function(){
		console.log("바껴?");
		var temporary =  $('#temporary').val();
		var newPw =  $('#newPw').val();
		var renewpw =$('#renewpw').val();
		
		console.log("temporary"+temporary);
		console.log("newPw"+newPw);
		console.log("renewpw"+renewpw);
		if(newPw === renewpw){
			$.ajax({
				url: '/main/changePassword',
		        method: 'post',
		        data:{
		        	temporary : temporary,
		        	newPw : newPw,
		        	userNo : ${std.stdNo}
		        },
		        beforeSend : function(xhr){
		        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		        success: function (res) {
		        	console.log("Res"+res);
		        	if(res == 'success'){
		        		swal("비밀번호변경완료!","보안을 위해 다시 로그인해주세요.","success").then((value) => {
		        			window.opener.location.href = '/main/logout';
			        		window.close();
			        	});
		        	}
		        	if(res == 'fail'){
		        		swal("","비밀번호 변경실패!","warning");
		        		return;
		        	}
		        },
		        error:function(){
		        }
			})
		}else{
			$('#result').text("비밀번호가 일치하지않습니다.");
			
		}
	})

</script>