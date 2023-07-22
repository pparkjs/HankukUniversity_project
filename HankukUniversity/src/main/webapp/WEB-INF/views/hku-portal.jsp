<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/portal/webfonts.css">
    <link rel="stylesheet" href="/css/portal/default.css">
    <link href="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack.min.css" rel="stylesheet"/>
    <title>한국대학교 포탈</title>
</head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/gridstack@8.2.1/dist/gridstack-all.js"></script>
<style>
.grid-stack {
  background: lightgoldenrodyellow;
}

.grid-stack-item-content {
  color: #2c3e50;
  text-align: center;
  background-color: #18bc9c;
}

</style>
<body>
    <div class="main_wrap">
        <div class="main_inner">
            <div class="main_cont_wrap">
                <div class="main_cont my_info">
                    <div class="logo_wrap">
                        <a href="#" onclick="javascript:window.location.reload(true);">
                            <!-- <span class="sr-only">한국포탈서비스</span> -->
                        </a>
                    </div>
                    
                    <div class="login_box">
                        <div class="profile_box" style="text-align: center;">
                            <div class="profile_div" style="margin-top: 10px;">
                                <hr style="margin: 0.5rem 0rem 1rem 0rem; color: white;"/>
                                <img src="/download/주지훈1.jpg" id="profileImg" style="width:200px; height:200px; border-radius: 20%; border: 3px solid white;">

                            </div>
                        </div>
                        <div class="text_wrap">
                            <p class="balloon">환영합니다!</p>
                            <p><span style="margin-right: 10px;">컴퓨터공학과</span><span style="font-size: 25px;">2014161007</span></p>
                            <p class="en title">주지훈 님</p>
                            <ul>
                                <li>
                                    <a class="LK046_A bb" href="#none">로그아웃</a>
                                </li>
                                <li>
                                    <a class="LK047_A bb" href="#none" style="width: 90px;">비밀번호변경</a>
                                </li>
                            </ul>
                            <hr style="margin: 0.5rem 0; color: white;"/>
                            <div style="display: flex; justify-content: center;">
                                <!-- <ul class="std_info">
                                    <li>
                                        <a style="cursor: pointer;">KOR</a>
                                    </li>
                                    <li>
                                        <a style="cursor: pointer;">ENG</a>
                                    </li>
                                </ul> -->
                                <div style="border-right: 2px solid white; padding-right: 20px;">
                                    <div>
                                        <span style="font-size: 20px; color: white;">이수/졸업학점</span>
                                    </div>
                                    <div>
                                        <span style="font-size: 18px; color: #FFC933;">124/130</span>
                                    </div>
                                </div>
                                <div style="padding-left: 20px;">
                                    <div>
                                        <span style="font-size: 20px; color: white;">학적상태</span>
                                    </div>
                                    <div>
                                        <span style="font-size: 18px; color: #FFC933;">재학</span>
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 0.5rem 0; color: white;"/>
                            <!-- <p class="en desc">Hankuk university</p> -->
                        </div>
                    </div>
                    <div class="side_box">
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">통합학사시스템</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/hku/student/studyBoard">스터디게시판</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">공지사항</a>
                        </div>
                        <div class="sidemenu_btn" style="cursor:pointer;">
                            <a href="/main/student">마이페이지</a>
                        </div>
                        <hr style="margin: 1rem 0rem 0rem 0rem; color: white;"/>
                    </div>
                    <div class="footer_txt pers_terms">
                        <a href="#" class="LK052_S pers_terms_s">개인정보처리방침(대덕·국제)</a> <!-- 개인정보처리방침(신촌·국제) -->
                        &nbsp;<span>|</span>&nbsp;
                        <a href="#" class="LK052_F pers_terms_f">개인정보처리방침(미래)</a> <!-- 개인정보처리방침(미래) -->
                    </div>

                </div>
                <div class="main_cont" id="jjgDiv" style="height:auto; overflow: auto;">
                    <div class="main_cont_header" style="height: 50px; border: 1px solid black;">
                        <!-- <form class="search-container">
                            <input type="text" id="search-bar" placeholder="검색어를 입력해주세요">
                            <a href="#"><img class="search-icon" src="/images/portal/search.png" style="width: 30px; height: 30px;"></a>
                        </form> -->
                        <button class="btn btn-primary" id="savePortletBtn">포틀릿저장</button>
                    </div>
                    <!-- tiles 했을 때 content 부분 -->
                    <div class="container-fluid mt-3">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-stack">
                                    <div class="grid-stack-item portlet1" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;1일정</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet2" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;2공지</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet3" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;3날씨</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet4" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;4시간표</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet5" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;5이수정보</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                    <div class="grid-stack-item portlet6" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;6식단표</h4>
                                                        </div>
                                                        <div>
                                                            <a href='/calendar/main' class="ti-plus"></a>&nbsp;&nbsp;
                                                        </div>
                                                    </div>
                                                    <h3 class="title-h3 col" style="font-family: '양진체'!important; text-align: center;">2023년 2월 학사일정</h3>
                                                    <div class="hnu_schedule" id="calendar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="col-lg-6" style="border: 1px solid black;">
                                <div class="card m-3" id="card-title-1">
                                    <div class="card-header border-0 pb-0 ">
                                        <h5 class="card-title">메인 대쉬보드</h5>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            메인대쉬보드 입니다!!
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6" style="border: 1px solid black;">
                                <div class="card m-3" id="card-title-1">
                                    <div class="card-header border-0 pb-0 ">
                                        <h5 class="card-title">메인 대쉬보드</h5>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            메인대쉬보드 입니다!!
                                        </p>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="chatbot chatbot_pulse" onclick="if(0 > 'win16|win32|win64|mac'.indexOf(navigator.platform.toLowerCase())){location.href = 'https://chat.cau.ac.kr/v2/index.html'}else{window.open('https://chat.cau.ac.kr/v2/index.html', '_blank', 'width = 450, height = 720, top = 100, left = 200, location = no, resizable = yes');}">
            <!-- <img src="/images/portal/mic.png"> -->
        </div>
    </div>
</body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
    var grid = GridStack.init({ // 여기에 그리드 스택 옵션 삽입
        disableOneColumnMode: true, // jfidle 작은 창 크기용
        float: false,
        removable: "#trash", // drag-out delete class
        removeTimeout: 100
    });

    var savePortletBtn = $('#savePortletBtn'); // 포틀렛 저장버튼
    
    const regex = /[^0-9]/g;

    const portletSeq = [
        {pX : "0", pY : "0"},
        {pX : "6", pY : "0"},
        {pX : "0", pY : "4"},
        {pX : "6", pY : "4"},
        {pX : "0", pY : "8"},
        {pX : "6", pY : "8"}
    ];
    

    // 내가 설정한 포틀릿순서대로 보여주는 함수실행
    sortPortlet();

    // 내가 설정한 포틀릿순서대로 보여주는 함수
    function sortPortlet(){
    	let myGrid = JSON.parse(localStorage.getItem("myGrid"));

        var gridItem = document.querySelectorAll(".grid-stack-item");
        if(myGrid != null && myGrid.length > 0){
            // for(let i=0; i<gridItem.length; i++){
            //     gridItem[i].setAttribute('gs-x',myGrid[i].x);
            //     gridItem[i].setAttribute('gs-y',myGrid[i].y);
            // }
            for(let i=0; i<myGrid.length; i++){
                let ptl = document.querySelector('.'+myGrid[i].id);
                ptl.setAttribute('gs-x',myGrid[i].x);
                ptl.setAttribute('gs-y',myGrid[i].y);
            }
        }
    }
//     function sortPortlet(){
//         var mySeq = 0;
//         // 포틀렛 예시
// //         var dataBasePortlet = "251643"; // 1번쨰 케이스
// //         var dataBasePortlet = "123456"; // 2번째 케이스 
//         var dataBasePortlet = "623514"; // 3번쨰 케이스 
//         // var myPortlet = ["2","5","1","6","4","3"];
//         var myPortlet = dataBasePortlet.split("");

//         var gridArea = document.querySelector(".grid-stack");

//         // 클래스 item 을 가지고 있는 포틀렛 배열
//         var gridItem = document.querySelectorAll(".grid-stack-item");
//         console.log(gridItem);
//         for(let i =0; i<myPortlet.length; i++){
//             for(let j=0; j<gridItem.length; j++){
//                 let stack = gridItem[j];
//                 // console.log(stack);
//                 let stackNum = stack.className;
//                 // console.log(stackNum);
//                 stackNum = stackNum.replaceAll(regex, "");
//                 // console.log(stackNum);
//                 if(myPortlet[i] == stackNum){
//                     console.log(stack);
// //                     console.log("몇번 실행되는지" , mySeq);
//                     console.log("x좌표 => " + stack.getAttribute('gs-x'));
//                     console.log("y좌표 => " + stack.getAttribute('gs-y'));
//                     stack.setAttribute('gs-x',portletSeq[mySeq].pX);
//                     stack.setAttribute('gs-y',portletSeq[mySeq++].pY);
//                     // portletSeq += stackNum;
//                     // gridArea.appendChild(stack);
//                     break;
//                 }
//             }
//         }
//     }

    
    // 포틀릿 저장 버튼 눌럿을떄
    savePortletBtn.on('click', function(){
    	var myPortletArr = [];
        var gridItem = document.querySelectorAll(".grid-stack-item");
        for(let i=0; i<gridItem.length; i++){
            let saveData = {};
            let item = gridItem[i];
            saveData.id = $(item).attr('class').split(" ")[1].trim();
            saveData.x = item.getAttribute("gs-x");
            saveData.y = item.getAttribute("gs-y");
            myPortletArr.push(saveData);
        }
        console.log("myPortletArr", myPortletArr);
        localStorage.setItem("myGrid", JSON.stringify(myPortletArr));
    });
});
</script>
