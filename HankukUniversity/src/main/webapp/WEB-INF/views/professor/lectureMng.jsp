<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link rel="stylesheet" href="/css/table.css">
        <link rel="stylesheet" href="/css/pro-jh.css">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <div class="content-body" style="min-height: 975px;">
            <div class="page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">강의개설신청</a></li>
                </ol>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 bbb" style="width: 55%">
                        <div class="card">

                            <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교 과 목 조 회 섹 션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                            <div class="card-header aaa">
                                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">교과목
                                    조회</h4>
                                <select class="selectCustom" name="subject" id="selSub">
                                    <option value="all">단과선택</option>
                                    <c:forEach var="col" items="${college}">
                                        <option value="${col.colCd}">${col.colNm}</option>
                                    </c:forEach>
                                </select> <select class="selectCustom" name="subject" id="selDept">
                                    <option value="all2">학과선택</option>
                                </select>
                            </div>
                            <div class="card-body ccc" style="padding-top: 0;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>과목코드</th>
                                            <th>학과</th>
                                            <th>학년</th>
                                            <th>과목명</th>
                                            <th>구분</th>
                                            <th>학점</th>
                                            <th>시수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbtb">
                                        <c:forEach var="sub" items="${subject}">
                                            <tr class="tbtr">
                                                <td class="subNo">${sub.subNo}</td>
                                                <td class="deptCd">${sub.deptCd}</td>
                                                <td class="subGrade">${sub.subGrade}</td>
                                                <td class="subNm">${sub.subNm}</td>
                                                <td class="classFcd">${sub.crsClassfCd}</td>
                                                <td class="subCrd">${sub.subCrd}</td>
                                                <td class="subHour">${sub.subHour}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강 의 실 선 택 섹 션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                    <div class="col-xl-6 col-lg-6 bbb" style="width: 45%">
                        <div class="card">
                            <div class="card-header aaa">
                                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">강의실
                                    조회</h4>
                                <select class="selectCustom a" id="selBuil">
                                    <option value="all">건물선택</option>
                                    <c:forEach var="flct" items="${flct}">
                                        <option value="${flct.flctNo}">${flct.flctNm}</option>
                                    </c:forEach>
                                </select> <select class="selectCustom a" name="classRoom" id="selClass">
                                    <option value="all2">호수선택</option>
                                </select>
                            </div>
                            <div class="card-body ccc" style="padding-top: 0;">
                                <table class="tabletime" border="1">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%;">구분</th>
                                            <th>월</th>
                                            <th>화</th>
                                            <th>수</th>
                                            <th>목</th>
                                            <th>금</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" step="1" begin="1" end="8">
                                            <tr>
                                                <td class="time">${i}교시</td>
                                                <td class="mon"></td>
                                                <td class="tue"></td>
                                                <td class="wed"></td>
                                                <td class="thur"></td>
                                                <td class="fri"></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 개 설 신 청 폼 섹 션  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                    <div class="col-xl-6 col-lg-6 bbb" style="width: 100%; margin-top: 10px; height: 350px;">
                        <div class="card">
                            <div class="card-header aaa">
                                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">개설신청
                                </h4>
                                <div>
                                    <!-- ■■■■■■■■■■■■■■■■■■■ 강의 계획서 첨부 버튼 ■■■■■■■■■■■■■■■■■■■ -->
                                    <button type="button" class="btn btn-primary pro1" style="padding: 0;"
                                        data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg" id="lecturePBtn">강의계획서</button>
                                    <input type="button" value="신청" class="btn btn-primary pro2" id="applyBtn" style="padding: 0;">
                                </div>
                            </div>
                            <div class="card-body apply">
                                <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교수 세션에서 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                                <table id="applyTable" style="width: 100%; height: 100%">
                                    <tr>
                                        <td><span>교수명</span> <input type="text" value="${pro.proNm }"
                                                disabled="disabled"></td>
                                        <td><span>교수명</span> <input type="text" name="proNo" value="${pro.deptCd }"
                                                disabled="disabled"></td>
                                        <td><span>교번</span> <input type="text" value="${pro.proNo }" id="inProNo"
                                                disabled="disabled"></td>
                                        <td><span>연락처</span> <input type="text" value="${pro.proTelno}"
                                                disabled="disabled"></td>
                                    </tr>

                                    <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교과목 선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

                                    <tr>
                                        <td><span>교과목명</span> <input type="text" name="subNo" id="inSubjectNm"
                                                disabled="disabled"></td>
                                        <td><span>과목코드</span> <input type="text" id="inSubjectCd" disabled="disabled">
                                        </td>
                                        <td><span>대상학년</span> <input type="text" id="inGrade" disabled="disabled"></td>
                                        <td><span>수업구분</span> <input type="text" id="inSubjectClsf" disabled="disabled">
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교과목 선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                                        <td><span>시수</span> <input type="text" id="inTime" disabled="disabled"></td>
                                        <td><span>학점</span> <input type="text" id="inSubjectCrd" disabled="disabled">
                                        </td>
                                        <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강의실 시간표선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                                        <td><span>개설연도</span> <input type="text" value="2023" name="lecapYr" id="inYear"
                                                disabled="disabled"></td>
                                        <td><span>개설학기</span> <input type="text" value="1학기" name="lecapSem" id="inSem"
                                                disabled="disabled"></td>
                                    </tr>
                                    <tr>
                                        <td><span>강의건물</span> <input type="text" id="inFlct" disabled="disabled"></td>
                                        <td><span>강의실</span> <input type="text" name="flctsNo" id="inFlcts"
                                                disabled="disabled"></td>

                                        <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 액터가 입력해야함 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
                                        <td><span>시작교시</span> <input type="text" id="inStart" disabled="disabled"></td>
                                        <td><span>강의요일</span> <input type="text" id="inDay" disabled="disabled"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 강의계획서 버튼 모달 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true"
            id="addModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" style="font-weight: bold;">강의계획서</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="basic-form" id="regDiv">
                            <div class="form-validation">
                                <form class="needs-validation" id="noticeFrm">
                                    <div class="mb-3">
                                        <span
                                            style="color: #800000; font-size: 1.2em; font-weight: bold;">평가기준</span><br>
                                        <span>*평가기준은 비율(%)로 계산하여 입력해주세요. </span>
                                        <div>
                                            <table class="planTable" border="1">
                                                <tr>
                                                    <th>출석</th>
                                                    <th>과제</th>
                                                    <th>중간</th>
                                                    <th>기말</th>
                                                    <th>총점</th>
                                                </tr>
                                                <tr>
                                                    <td><input type="text" name="lecpgAtd" id="attendance">%</td>
                                                    <td><input type="text" name="lecpgHw">%</td>
                                                    <td><input type="text" name="lecpgMdTest">%</td>
                                                    <td><input type="text" name="lecpgFnTest">%</td>
                                                    <td style="background-color: #b0b0b0;"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin: 0 auto;">
                                            <span
                                                style="color: #800000; font-size: 1.2em; font-weight: bold;">수업유형</span><br>
                                            <span>강의유형</span> <select class="selectCustom c" id="meet">
                                                <option value="avl">대면</option>
                                                <option value="rej">온라인</option>
                                            </select> <span>강의언어</span> <select class="selectCustom c"
                                                style="margin-top: 10px;" id="lang">
                                                <option value="ko">한국어</option>
                                                <option value="eng">영어</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <span
                                            style="color: #800000; font-size: 1.2em; font-weight: bold;">주교재</span><br>
                                        <div id="lecturePlan">
                                            <input type="text" id="" name="lecpgBook">
                                        </div>
                                        <div>
                                            <span
                                                style="color: #800000; font-size: 1.2em; font-weight: bold;">강의소개</span><br>
                                            <textarea name="lectureIntro" rows="5" cols="100"></textarea>
                                        </div>
                                        <span style="color: #800000; font-size: 1.2em; font-weight: bold;">주차별
                                            계획안</span><br> <span>*주차별 학습계획을 상세히 입력해주세요.</span>
                                        <div id="lecturePlan">
                                            <c:forEach var="i" begin="1" end="15" step="1">
                                                ${i}주차 <input type="text" name="week${i}">
                                                <br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 모달 끝  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
        <script>
        var planJson = {

        }
        var lecapNo =''; //과목신청시퀀스번호
        var flag = false; // 강의계획서 작성여부 플래그
        var approval =''; //대면수업여부
        var lecpgLggCd= ''; //수업언어
        var periodCd = ''; //시작교시
          
        var sem = '';
      	var lecpgAtd ='';
        var lecpgHw = '';
        var lecpgMdTest = $('[name="lecpgMdTest"').val();
        var lecpgFnTest = $('[name="lecpgFnTest"').val();
        var lecpgBook = $('[name="lecpgBook"').val();
        var lectureIntro = $('[name="lectureIntro"').val();
        var lecscHour = ''; //시작교시
        var lecscDay ='';
        var sem = '';
        var week1 = '';
        var week1 = '';
        var week2 = '';
        var week3 = '';
        var week4 = '';
        var week5 = '';
        var week6 = '';
        var week7 = '';
        var week8 = '';
        var week9 = '';
        var week10 = '';
        var week11 = '';
        var week12 = '';
        var week13 = '';
        var week14 = '';
        var week15 = ''; 
        

            /* ■■■■■■ 최초 강의관리 화면 접속시 출력되는 화면 ■■■■■■ */
            $(document).ready(function () {
                var table = $(".table"); // 테이블 객체 가져오기

                /* ■■■■■■ 교과목 클릭에 대한 이벤트  ■■■■■■ */
                table.on("click", "tbody tr", function () {
                    var rows = table.find("tbody tr");
                    rows.removeClass("selected");
                    $(this).addClass("selected");

                    var selectedRow = $(this);
                    var child = selectedRow.children();

                    /* ■■■■■■ 선택한 교과목에 대한 데이터값을 개설신청 폼에 넣어주는 코드  ■■■■■■ */
                    $("#inSubjectNm").val(child.eq(3).text());
                    $("#inSubjectCd").val(child.eq(0).text());
                    $("#inGrade").val(child.eq(2).text());
                    $("#inSubjectClsf").val(child.eq(4).text());
                    $("#inTime").val(child.eq(6).text());
                    $("#inSubjectCrd").val(child.eq(5).text());
                });
                /* ■■■■■■ 시간표 테이블 객체 가져오기  ■■■■■■ */
                var timeTable = $(".tabletime");
                //      console.log("timeTable:", timeTable);
                timeTable.on("click", "tbody td", function () {
                    var tdClass = $(this).attr('class');
                    var tdDay = "";
                    if (tdClass === "mon") {
                        tdDay = "월요일";
                    } else if (tdClass === "tue") {
                        tdDay = "화요일"
                    } else if (tdClass === "wed") {
                        tdDay = "수요일"
                    } else if (tdClass === "thur") {
                        tdDay = "목요일"
                    } else if (tdClass === "fri") {
                        tdDay = "금요일"
                    }
                    $("#inDay").val(tdDay);

                    startTime = $(this).parent().children().first().text();
                    $("#inStart").val(startTime);
                    // 	    console.log("교시",classTime);

                    var clickedIndex = $(this).index(); // 클릭한 td 요소의 인덱스를 가져옵니다.
                    // 		console.log(clickedIndex);
                    // 클릭한 td 요소의 다음 n개의 td 요소에 배경색을 적용합니다.
                    // 	    var n = 3; // 원하는 n 값으로 변경 가능
                    // 	    for (var i = clickedIndex ; i <= clickedIndex + n-1; i++) {
                    // 	      $('td').eq(i).css('background-color', 'yellow'); // 원하는 배경색으로 변경 가능
                    // 	    }
                });
            });
            /* ■■■■■■ 단과대학 선택시 학과와 교과목 출력해주는 펑션  ■■■■■■ *///
            $(function () {

                /* ■■■■■■ 단과대학선택을 바꿀때마다 발생event  ■■■■■■ *///
                $('#selSub')
                    .change(
                        function () {
                            // 					$('#selDept').chil dren().eq(0).("selected");
                            $('#tbtb').html("");
                            var data = $(this).val();
                            // 					console.log(data);

                            //교과목 출력끝
                            $
                                .ajax({
                                    url: '/lecture/getDept.do',
                                    method: 'get',
                                    data: {
                                        college: data
                                    },
                                    success: function (res) {
                                        /* ■■■■■■ 단과대학에 대한 교과목출력  ■■■■■■ *///
                                        subStr = '';
                                        for (var i = 0; i < res.colSubject.length; i++) {
                                            subStr += '<tr class="tbtr">';
                                            subStr += '	<td class="subNo">'
                                                + res.colSubject[i].subNo
                                                + '</td>';
                                            subStr += '<td class="deptCd">'
                                                + res.colSubject[i].deptCd
                                                + '</td>';
                                            subStr += '<td class="subGrade">'
                                                + res.colSubject[i].subGrade
                                                + '</td>';
                                            subStr += '<td class="subNm">'
                                                + res.colSubject[i].subNm
                                                + '</td>';
                                            subStr += '<td class="classFcd">'
                                                + res.colSubject[i].crsClassfCd
                                                + '</td>';
                                            subStr += '<td class="subCrd">'
                                                + res.colSubject[i].subCrd
                                                + '</td>';
                                            subStr += '<td class="subHour">'
                                                + res.colSubject[i].subHour
                                                + '</td>';
                                            subStr += '<tr class="tbtr">';
                                        }
                                        ;
                                        $('#tbtb').html(subStr);
                                        /* ■■■■■■ 단과대학에 대한 학과 출력 ■■■■■■ *///
                                        deptStr = '<option value="all2" selected>학과선택</option>';
                                        for (var i = 0; i < res.dept.length; i++) {
                                            deptStr += '<option value="' + res.dept[i].deptCd + '">'
                                                + res.dept[i].deptNm
                                                + '</option>'
                                        }
                                        $('#selDept').html(deptStr);
                                    },
                                    error: function (xhr, status, error) {
                                        // alert("출력실패");
                                    }
                                });
                        });

                //교과목 출력시작
                $('#selDept').change(
                    function () {
                        var dept = $(this).val();

                        $.ajax({
                            url: '/lecture/selSubject.do',
                            method: 'get',
                            data: {
                                deptNm: dept
                            },
                            success: function (res) {
                                subStr = '';
                                for (var i = 0; i < res.length; i++) {
                                    subStr += '<tr class="tbtr">';
                                    subStr += '	<td class="subNo">' + res[i].subNo
                                        + '</td>';
                                    subStr += '<td class="deptCd">' + res[i].deptCd
                                        + '</td>';
                                    subStr += '<td class="subGrade">'
                                        + res[i].subGrade + '</td>';
                                    subStr += '<td class="subNm">' + res[i].subNm
                                        + '</td>';
                                    subStr += '<td class="classFcd">'
                                        + res[i].crsClassfCd + '</td>';
                                    subStr += '<td class="subCrd">' + res[i].subCrd
                                        + '</td>';
                                    subStr += '<td class="subHour">'
                                        + res[i].subHour + '</td>';
                                    subStr += '<tr class="tbtr">';
                                }
                                ;
                                $('#tbtb').html(subStr);
                            },
                            error: function (xhr, status, error) {
                                alert("출력실패");
                            }
                        });
                    });//교과목 출력 끝

                /* ■■■■■■ 강의실 조회 부분의 시설,시설물 선택   ■■■■■■ *///
                //건물출력
                $('#selBuil')
                    .change(
                        function () {
                            // 					$('#tbtb').html("");
                            var flct = $(this).val();
                            var flctNm = $('#selBuil option:selected').text();
                            var click = $(this);

                            //교과목 출력끝
                            $
                                .ajax({
                                    url: '/lecture/selBuil.do',
                                    method: 'get',
                                    data: {
                                        flct: flct
                                    },
                                    success: function (res) {
                                        //                             console.log(res.flcts.length);
                                        flctsStr = '<option selected>강의실선택</option>';
                                        for (var i = 0; i < res.flcts.length; i++) {
                                            flctsStr += '<option value="' + res.flcts[i].flctsNo + '">'
                                                + res.flcts[i].flctsNm
                                                + '</option>'
                                        }

                                        $('#selClass').html(flctsStr);
                                        $('#inFlct').val(flctNm);

                                    },
                                    error: function (xhr, status, error) {
                                        //  alert("출력실패");
                                    }
                                });
                        });

                $('#selClass').change(function () {
                    var flct = $('#selBuil option:selected').val();
                    var flcts = $('#selClass option:selected').val();
                    var click = $(this);
                    $('#inFlcts').val($('#selClass option:selected').text());
                    //                     console.log("건물코드",flct);
                    //                     console.log("호실",flcts);
                    //교과목 출력끝
                    $.ajax({
                        url: '/lecture/selClass.do',
                        method: 'get',
                        data: {
                            flcts: flcts
                        },
                        success: function (res) {
                        	console.log(res);
                            alert("성공");
                        },
                        error: function (xhr, status, error) {
                        	console.log(xhr);
                            alert("출력실패");
                        }
                    });
                });
            });
            
            $('#lecturePBtn').on("click",function(){
            
//             	 $.ajax({
//                      url: '/lecture/applyLecture.do',
//                      method: 'post',
                   
//                      data: JSON.stringify(applyData),
//                      dataType: "text",
//                      success: function (res) {
//                     	 console.log(res);
//                     	 lecapNo = res;
//                          alert(res);
//                      },
//                      error: function (xhr, status, error) {
//                          alert("출력실패");
//                      }
//                  });
            	
            });
            

            $('#saveBtn').on("click", function () {

            	sem = $("#inSem").val().split('')[0];
            	
         	  lecpgAtd = $('[name="lecpgAtd"').val();
                if(lecpgAtd == ""){
                	alert("출석평가 비율이 입력되지않았습니다.");
                	 $('[name="lecpgAtd"').focus();
                	 return;
                }
                
               lecpgHw = $('[name="lecpgHw"').val();
                if(lecpgHw == ""){
                	alert("과제 평가 비율이 입력되지않았습니다.");
                	 $('[name="lecpgHw"').focus();
                	 return;
                }
                
               lecpgMdTest = $('[name="lecpgMdTest"').val();
                if(lecpgMdTest == ""){
                	alert("중간고사 평가 비율이 입력되지않았습니다.");
                	 $('[name="lecpgMdTest"').focus();
                	 return;
                }
                
               lecpgFnTest = $('[name="lecpgFnTest"').val();
                if(lecpgFnTest == ""){
                	alert("기말고사 평가 비율이 입력되지않았습니다.");
                	 $('[name="lecpgFnTest"').focus();
                	 return;
                }
               lecpgBook = $('[name="lecpgBook"').val();
                if(lecpgBook == ""){
                	alert("강의 교재가 입력되지않았습니다.");
                	 $('[name="lecpgBook"').focus();
                	 return;
                }
               lectureIntro = $('[name="lectureIntro"').val();
                if(lectureIntro == ""){
                	alert("강의 소개가 입력되지않았습니다.");
                	 $('[name="lectureIntro"').focus();
                	 return;
                }
                
                for (let i = 1; i <= 15; i++) {
                	  var weekValue = $('[name="week' + i + '"]').val();

                	  if (weekValue === "") {
                	    alert(i + "주차 강의계획이 입력되지 않았습니다.");
                	    $('[name="week' + i + '"]').focus();
                	    return;
                	  }
                	}
                
                approval = $('#meet option:selected').val();
                lecpgLggCd = $('#lang option:selected').val();
                
                
                
                week1 = $('[name="week1"').val();
                week1 = $('[name="week1"').val();
                week2 = $('[name="week2"').val();
                week3 = $('[name="week3"').val();
                week4 = $('[name="week4"').val();
                week5 = $('[name="week5"').val();
                week6 = $('[name="week6"').val();
                week7 = $('[name="week7"').val();
                week8 = $('[name="week8"').val();
                week9 = $('[name="week9"').val();
                week10 = $('[name="week10"').val();
                week11 = $('[name="week11"').val();
                week12 = $('[name="week12"').val();
                week13 = $('[name="week13"').val();
                week14 = $('[name="week14"').val();
                week15 = $('[name="week15"').val(); 

                if (confirm("강의계획서를 저장하시겠습니가?")) {
                    $('#addModal').modal('hide');
                    flag = true;
                    
                    console.log(flag);
                }
            });
            
            
            $('#applyBtn').on("click", function () {
            	
                   
            	if(flag === false){
            		alert("강의계획서가 작성되지않았습니다.\n 확인 후 재시도 해주세요.");
            		
            	}else{
            		 planJson = {
                        		subNo : $("#inSubjectCd").val(),
                                proNo :  $("#inProNo").val(),
								subNm : $("#inSubjectNm").val(),
                                flctsNo : $('#selClass option:selected').val(),
                                lecapYr : $("#inYear").val(),
                                lecapSem : sem,
                                lecapTgGrade : $("#inGrade").val(),
                                lecapCpct : 30,
                                lecpgAtd: lecpgAtd,
                                lecpgHw: lecpgHw,
                                lecpgMdTest : lecpgMdTest,
                                lecpgFnTest : lecpgFnTest,
                                lecpgBook : lecpgBook,
                                lecpgIntro : lectureIntro,
                                week1 : week1,
                                week2 : week2,
                                week3 : week3,
                                week4 : week4,
                                week5 : week5,
                                week6 : week6,
                                week7 : week7,
                                week8 : week8,
                                week9 : week9,
                                week10 : week10,
                                week11 : week11,
                                week12 : week12,
                                week13 : week13,
                                week14 : week14,
                                week15 : week15,
                                avlCd1 : 'avl',
                                avlCd2 : approval,
            		 		  lecpgLggCd: lecpgLggCd,
            		 		  lecscHour : $("#inStart").val().split('')[0],
            		 		  lecscDay : $("#inDay").val(),
            		 		  periodCd : $("#inTime").val()
                            }
            		
            	}
                console.log(planJson);
            	
                $.ajax({
                    url: '/lecture/applyLecture.do',
                    method: 'post',
                    data: JSON.stringify(planJson),
                    contentType: "application/json;charset=utf-8",
                    dataType: "text",
                    success: function (res) {
                        alert("성공");
                    },
                    error: function (xhr, status, error) {
                        alert("출력실패");
                    }
                });

           
            });
        </script>