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
                        
                    </div>
                    <!-- tiles 했을 때 content 부분 -->
                    <div class="container-fluid mt-3">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="grid-stack">
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;일정</h4>
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
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;공지</h4>
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
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;날씨</h4>
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
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;시간표</h4>
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
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;이수정보</h4>
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
                                    <div class="grid-stack-item portlet0" gs-w="6" gs-h="4">
                                        <div class="grid-stack-item-content">
                                            <div class="card portlet-item">
                                                <div class="card-body">
                                                    <div style="display: flex; justify-content: space-between;">
                                                        <div>
                                                            <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                                            <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;식단표</h4>
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
var options = { // 여기에 그리드 스택 옵션 삽입
    disableOneColumnMode: true, // jfidle 작은 창 크기용
    float: false,
    removable: "#trash", // drag-out delete class
    removeTimeout: 100
};
var grid = GridStack.init(options);

</script>
