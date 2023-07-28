<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.1.18/jquery.backstretch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            height: 120vh;
            margin: 0px;
        }

        #backstretch {
            position: fixed;
            top: 0;
            left: 0;
            a width: 100%;
            height: 100%;
            z-index: -1;
        }

        #loginTable{
           color : white;
            width: 1000px;
            position: absolute;
            top: 35%;
            right: 22%;
            opacity: 0;
            /* 초기에는 투명하게 설정 */
            transition: opacity 0.5s;
            /* 투명도 변경에 대한 트랜지션 효과 설정 */
            background-color: rgba(0,0,0,0.4);
            border-radius: 20px;
            border : 2px csolid white;

        }

        #loginTable.show {
            opacity: 1;
            /* 스크롤 80 이상일 때 투명도를 1로 설정하여 서서히 나타나도록 함 */
            animation: loginslide 2.5s ease-out forwards;
            /* 서서히 나타나는 애니메이션 추가 */
        }

        #trone {
            height: 50px;
            text-align: center;
            font-size : 1.5em;
        }

        #trtwo {
            height: 280px;
            text-align: center;
            font-size : 1.5em;
        }

        #trtwo td:first-child {
           padding-left : 15px;
            padding-right: 0px;
            text-align: left;
            padding-bottom: 60px;
        }
        
         #trtwo span{
            display : inline-block;
            margin-top : 30px;
         }
      input[type="text"],input[type="password"]{
         border-radius: 10px;
         border : 1px solid black;
         background-color: rgba(0,0,0,0.5);
         color : white;
         margin-top : 10px;
         padding : 5px;
      }

        #trthree {
            text-align: center;
            font-size: 0.7em;
            color: white;
            height:70px;
            padding-bottom: 18px;
        }

        #loginBtn {
            height: 155px;
            background-color: rgba(0,0,0,0.4);
            cursor: pointer;
            border-radius: 20px;
            color : white;
            font-weight: bold;
            width:90px;
        }

        #pwdDiv {
            margin: 20px;

        }

        body:before {
            content: '';
            background: linear-gradient(to top, black, transparent);
            position: absolute;
            width: 100%;
            height: 100%;
            top: 300px;

        }

        #mainName {
            font-size: 10em;
            position: absolute;
            top: 20%;
            left: 10%;
            color: white;
            font-family: sans-serif;
            animation: upslide 1s ease-out;
            text-align: right;
            text-shadow: 5px 5px 5px black;
        }


        .container label {
            display: inline-block;
        }

        a {
            color: white;
            font-size: 20px;

        }


        @keyframes upslide {
            from {
                top: 15%;
                opacity: 0;
            }

            to {
                top: 20%;
                opacity: 1;
            }
        }


        @keyframes downslide {
            from {
                top: 20%;
                opacity: 1;
            }

            to {
                top: 15%;
                opacity: 0;
            }
        }

        form {
            margin: 0px;

        }

        .container {
            position: absolute;
            top: 30px;


        }
        img{
        padding-top:20px;
           width : 300px;
           height: auto;
        }
        #newsTable{
        color:white;
         width:480px;
         font-size:12px;
         height :460px;
         padding-bottom:20px;
        }
        #newsTable th{
        	height:20px;
        	font-size: 16px;
        }
        
        #newsTable td:first-child{
        	height:20px;
        	text-align: left;
        	padding-left: 10px;
        }
        #newsTable td:first-child:hover{
        	cursor: pointer;
        	text-decoration: underline;
        }
        .line{
         border-bottom: 1px solid white;
        }
    </style>
</head>
<body>
<%!
	int cnt=0;
%>
<%
	String err = (String) request.getAttribute("msg");
	if(err != null){
		cnt++;
	}else{
		cnt = 0;
	}

%>
	<c:set value="<%=cnt %>" var="cnt"/>
	
    <div id='backstretch'>
    </div>
    <h1 id="mainName"> Hankuk${cnt} <br>University</h1>
<!--   <form action="/main/login" method="post"> -->
  <form action="/login" method="post">
    <table id="loginTable">
        <tr id="trone">
           <td rowspan="3" style="width : 500px; padding-left: 10px;">
              	<table id="newsTable" style="color:white; width:480px;">
              	<tr class="line">
              		<th colspan="2" style="text-align: left; font-size: 25px; height:30px;">HKU NEWS</th>
              		</tr>
              	<tr >
              		<th class="line">제목</th><th class="line" style="width:90px;">등록일</th>
              		</tr>
              		<tr >
              		<td class="line">한국대학교,소프트엔지니어 육성위해 나서</td><td class="line">23.07.12</td>
              		</tr>
              		<tr >
              		<td class="line">한국대학교,에너지융합 대학원 사업선정..</td><td class="line">23.07.05</td>
              		</tr>
              		<tr >
              		<td class="line">한국대학교,AI영상데이터 분석 기술개발</td><td class="line">23.06.22</td>
              		</tr>
              		<tr >
              		<td class="line">한국대학교,'대학ICT연구센터 사업'차세대 컴퓨팅 분야선정</td><td class="line">23.06.15</td>
              		</tr>
              		<tr >
              		<td class="line">한국대학교 컴퓨터공학과 교수진, 비전기반 딥러닝 모델 개발..</td><td class="line">23.06.07</td>
              		</tr>
              		<tr>
              		<td class="line">'한국'에서 마음껏 배우고, 마음껏 꿈꾸다.</td><td class="line">23.06.02</td>
              		</tr>
              		<tr>
              		<td class="line">한국대학교 컴퓨터공학부 학생들, 제28회 휴먼테크..</td><td class="line">23.06.02</td>
              		</tr>
              		<tr>
              		<td class="line">한국대학교 메타버스 교육 플랫폼 구축...</td><td class="line">23.06.02</td>
              		</tr>
              	</table>
           </td>
           <td rowspan="3" style="border-left:1px solid white; width:0.5px; padding-top:5px; padding-bottom: 5px;">
            <td colspan="2">
               <img src="/images/흰색로고lg.png">
            </td>
        </tr>
        <tr id="trtwo">
            <td>
           
                    <span>ID</span><br>
                    <input type="text" id="username" name="username" style="width:100%; height:30px; " placeholder="학번/교번/사번을 입력하세요"><br>
                    <span>Password</span><br>
                    <input type="password" id="password" name="password" style="width:100%; height:30px; " placeholder="비밀번호를 입력하세요"><br>
               
            </td>
            <td>
                <input type="submit" id="loginBtn" value="L&nbsp;O&nbsp;G&nbsp;I&nbsp;N">
            </td>
        </tr>
        <tr id="trthree">
            <td colspan="2">
                <a href="" onclick="forget()" >계정이 기억나지않으시나요?</a>
            </td>
        </tr>
    </table>
     <sec:csrfInput/>
  </form>
</body>

<script type="text/javascript">
    $.backstretch(['/images/login/imgSub135000_01.jpg',
        '/images/login/imgSub340000_01.jpg',
        '/images/login/DJI_0886s.jpg'], { duration: 3500, fade: true, resize: true, firstfade: true });

    window.onload = function () {
        setTimeout(function () {
            scrollTo(0, 0);
        }, 100);
    }

    let mainName = document.querySelector("h1");
    let loginFrm = document.querySelector("table");
    //        let logo = document.querySelector("#logo");
    console.log("내용", mainName.value);
    window.addEventListener("scroll", function () {
        let value = window.scrollY;
//         console.log(value);

        if (value > 80) {
            mainName.style.animation = 'downslide 1s ease-out forwards';
            loginFrm.classList.add("show");
            //              logo.classList.add("show");

        } else {

            mainName.style.animation = 'upslide 1s ease-out';
            loginFrm.classList.remove("show");
            //              logo.classList.remove("show");
        }
    })
    
    function forget(){
       event.preventDefault();
       window.open("/main/forget","_blank","width=400,height=450,left=600,top=350");
    }
// 	var cnt = 0;
    if(location.href.includes("?error")){
    	swal("올바르지않은 접근입니다.");
        
    }
</script>

</html>