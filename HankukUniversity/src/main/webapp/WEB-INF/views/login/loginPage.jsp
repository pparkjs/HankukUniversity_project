<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>

<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.1.18/jquery.backstretch.min.js"></script>
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

        table {
        	color : white;
            width: 1000px;
            position: absolute;
            top: 35%;
            right: 20%;
            opacity: 0;
            /* 초기에는 투명하게 설정 */
            transition: opacity 0.5s;
            /* 투명도 변경에 대한 트랜지션 효과 설정 */
            background-color: rgba(0,0,0,0.4);
            border-radius: 20px;
            border : 2px csolid white;

        }

        table.show {
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
            height: 200px;
            text-align: center;
            font-size : 1.5em;
        }

        #trtwo td:first-child {
        	padding-left : 50px;
            padding-right: 30px;
            text-align: left;
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
        }

        #loginBtn {
            height: 130px;
            background-color: rgba(0,0,0,0.4);
            cursor: pointer;
            border-radius: 20px;
            color : white;
            font-weight: bold;
            
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

/*         #loginForm { */
/*             display: flex; */
/*             align-items: center; */
/*             background-color: rgba(0, 0, 0, 0.5); */
/*             border-radius: 30px; */
/*             width: 500px; */
/*             height: 400px; */
/*             color: white; */
/*             text-align: center; */


/*         } */

/*         #loginForm.show { */
/*             opacity: 1; */
/*             /* 스크롤 80 이상일 때 투명도를 1로 설정하여 서서히 나타나도록 함 */ */
/*             animation: loginslide 2s ease-out forwards; */
/*             /* 서서히 나타나는 애니메이션 추가 */ */
/*         } */

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

/*         	     span{  */
/*                  display : inline-block;  */
/*                   height : 30px;  */
/*         		text-align:  right;  */
/*                 }  */
        form {
            margin: 0px;

        }

        .container {
            position: absolute;
            top: 30px;


        }
        img{
        	width : 500px;
        	height: auto;
        }
    </style>
</head>

<body>
    <div id='backstretch'>

    </div>
    <h1 id="mainName"> Hankuk <br>University</h1>

  <form action="/main/login" method="post">
    <table >
        <tr id="trone">
        	<td rowspan="3" style="width : 300px">
        		<img src="/images/logo2.png">
        	</td>
            <td colspan="2">
                <input type="radio" name="userClsCd" id="idtStd" value='student' checked="checked" />
                <label for='idtStd'>&nbsp;학생&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input type="radio" name="userClsCd" id="idtPro" value='professor' />
                <label for='idtPro'>&nbsp;교수&nbsp;&nbsp;&nbsp;&nbsp; </label>
                <input type="radio" name="userClsCd" id="idtEmp" value='admin' />
                <label for='idtEmp'>&nbsp;직원</label>
            </td>
        </tr>

        <tr id="trtwo">
            <td>
                    <span>학번</span><br>
                    <input type="text" id="userNo" name="userNo" style="width:100%; height:30px; " placeholder="학번/교번/사번을 입력해주세요"><br>
                    <span>비밀번호</span><br>
                    <input type="password" id="userPw" name="userPw" style="width:100%; height:30px; "><br>
            </td>
            <td>
                <input type="submit" id="loginBtn" value="포털입장하기">
            </td>
        </tr>
        <tr id="trthree">
            <td colspan="2">
                <a href="#">계정이 기억나지않으시나요?</a>
            </td>
        </tr>
    </table>
  </form>
    <!--  <div id='loginArea'> -->

    <!--         <form id='loginForm'> -->
    <!--             <div class="loginCon"> -->
    <!--                 <div class="radioCk"> -->
    <!--                     <input type="radio" name="idt" id="idtStd" value='std' checked="checked" /> -->
    <!--                     <label for='idtStd'>학생</label> -->
    <!--                     <input type="radio" name="idt" id="idtPro" value='pro' /> -->
    <!--                     <label for='idtPro'>교수</label> -->
    <!--                     <input type="radio" name="idt" id="idtEmp" value='emp' /> -->
    <!--                     <label for='idtEmp'>직원</label> -->
    <!--                 </div> -->
    <!--                 <div class="container"> -->
    <!--                     <div id="textArea"> -->
    <!--                         <span>학번</span> -->
    <!--                         <input type="text" id="userId"><br> -->
    <!--                         <span>비밀번호</span> -->
    <!--                         <input type="password" id="password"><br> -->
    <!--                     </div> -->
    <!--                     <input type="button" id="loginBtn" value="포털 입장하기"><br> -->
    <!--                 </div> -->
    <!--                 <a href="#">계정을 잊어버리셨나요?</a> -->
    <!--             </div> -->
    <!--         </form> -->

    <!--     </div> -->

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
    //     	let logo = document.querySelector("#logo");
    console.log("내용", mainName.value);
    window.addEventListener("scroll", function () {
        let value = window.scrollY;
        console.log(value);

        if (value > 80) {
            mainName.style.animation = 'downslide 1s ease-out forwards';
            loginFrm.classList.add("show");
            //     			logo.classList.add("show");

        } else {

            mainName.style.animation = 'upslide 1s ease-out';
            loginFrm.classList.remove("show");
            //     			logo.classList.remove("show");
        }
    })

</script>

</html>