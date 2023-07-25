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
input[type=email]{
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
<title>한국대학교 계정찾기</title>
</head>
<body>
<div class="default-tab" style="padding:10px;">
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="tab" href="#home"><i class="la la-home me-2"></i>계정찾기</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="tab" href="#profile"><i class="la la-user me-2"></i> PW찾기</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade show active" id="home" role="tabpanel">
			<div class="pt-4" style="padding-left: 35px;">
				<div style="display: flex; align-items: center; justify-content: space-around; ">
				<div class="radioBtn">
				 <label class="col-sm-2 col-form-label" style="width:25px;">학생</label>
					<input type="radio" name="type" value="student" checked="checked">
					</div>
					<div class="radioBtn">
				 <label class="col-sm-2 col-form-label" style="width:25px;">교수</label>
					<input type="radio" name="type" value="professor" >
					</div>
					<div class="radioBtn">
				 <label class="col-sm-2 col-form-label" style="width:25px;">직원</label>
					<input type="radio" name="type" value="employee">
					</div>
				</div>
				<div class="mb-3 row">
                <label class="col-sm-2 col-form-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="forgetName" placeholder="ex)홍길동">
                </div>
                </div>
				<div class="mb-3 row" >
                <label class="col-sm-2 col-form-label">생년월일</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="forgetBday" placeholder="ex)19991212">
                </div>
                </div>
                <br>
				<button type="button" class="btn btn-primary" style="background:#800000; width:300px; border:none;" id="searchId">아이디 찾기</button>
				<div style="height: 50px; width:300px; margin:0px; display: flex; justify-content: center; align-items: center;">
				 <p id="resultID" style="color:blue; font-size: 1.3em; font-weight: bold;"> </p>
				 </div>
			</div>
		</div>
		<div class="tab-pane fade" id="profile">
				<div id="pwArea" class="pt-4" style="padding-left: 35px;">
				<div class="mb-3 row">
                <label class="col-sm-2 col-form-label">계정</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="forgetNo" placeholder="ex)20011234">
                </div>
                </div>
				<div class="mb-3 row" >
                <label class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="forgetEmail" placeholder="ex)hankuk@naver.com">
                </div>
                </div>
                <br>
				<button type="button" class="btn btn-primary" style="background:#800000; width:300px; border:none;" id="sendPw">임시비밀번호 발급</button>
				<div style="height: 50px; width:300px; margin:0px; display: flex; justify-content: center; align-items: center;">
				 <p id="resultContent" style="color:blue; font-size: 1.3em; font-weight: bold;"> </p>
				 </div>
				 <div id="addHtml"></div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var userNo ;
	$('#searchId').click(function(){
		var userName = $('#forgetName').val();
		var userBd = $('#forgetBday').val();
		var type = $('input[name="type"]:checked').val();
		
		if(userName == null || userName==''){
			$('#resultID').text("이름을 입력해주세요.")
			$('#forgetName').focus();
			return;
		}
		if(userBd == null || userBd==''){
			$('#resultID').text("생년월일을 입력해주세요.")
			$('#forgetBday').focus();
			return;
		}
		
		$.ajax({
			url: '/main/forgetProcess',
	        method: 'post',
	        data:{
	        	userName : userName,
	        	userBd : userBd,
	        	type : type
	        },
	        beforeSend : function(xhr){
	        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
	        success: function (res) {
	        	alert(res);
	        	if(res ==null || res == ''){
	        		$('#resultID').text("일치하는 계정이 없습니다.")
	        	}else{
	        	$('#resultID').text(userName + "님의 계정은 ["+ res + "] 입니다.");
	        		
	        	}
	        },
	        error:function(){
	        	
	        }
		})
	})
	
	$('#sendPw').click(function(){
		userNo = $('#forgetNo').val();
		var userEmail = $('#forgetEmail').val();
		
		if(userNo == null || userNo==''){
			$('#resultContent').text("계정을 입력해주세요.")
			$('#forgetNo').focus();
			return;
		}
		if(userEmail == null || userEmail==''){
			$('#resultContent').text("이메일을 입력해주세요.")
			$('#forgetEmail').focus();
			return;
		}
		
		$.ajax({
			url: '/main/sendPassword',
	        method: 'post',
	        data:{
	        	userNo : userNo,
	        	userEmail : userEmail
	        },
	        beforeSend : function(xhr){
	        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
	        success: function (res) {
	        	changeStr = "<div class='mb-3 row'>";
	        	changeStr += "<label class='col-sm-2 col-form-label'>임시비밀번호</label>";
	        	changeStr += "<div class='col-sm-10'>";
	        	changeStr += "<input type='text' class='form-control' id='temporary'></div>";
	        	changeStr += "<label class='col-sm-2 col-form-label'>새로운 비밀번호</label>";
	        	changeStr += "<div class='col-sm-10'>";
	        	changeStr += "<input type='text' class='form-control' id='newPw'></div>";
	        	changeStr += "<label class='col-sm-2 col-form-label'>비밀번호 확인</label>";
	        	changeStr += "<div class='col-sm-10'>";
	        	changeStr += "<input type='text' class='form-control' id='renewpw'></div></div>";
	        	changeStr += "<div><button type='button' class='btn btn-primary' style='background:#800000; width:300px; border:none;' id='changePw'>비밀번호 변경</button>";
	        	changeStr += "</div>";
	        	swal("임시비밀번호가 발송되었습니다.\n\r개인정보 보호를 위해 \n\r즉시 비밀번호를 변경해주세요.")
	        	.then((value) => {
	        		$('#pwArea').html(changeStr);
	        	});
	        },
	        error:function(){
	        	
	        }
		})
	})
	
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
		        	userNo : userNo
		        },
		        beforeSend : function(xhr){
		        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); },
		        success: function (res) {
		        	console.log("Res"+res);
		        	if(res == 'success'){
		        		swal("","비밀번호변경완료!","success").then((value) => {
			        		window.close();
			        		location.reload();
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
			swal("","새로운비밀번호가 일치하지않습니다.","warning");
			
		}
	})

</script>