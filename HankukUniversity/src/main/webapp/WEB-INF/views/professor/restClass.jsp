<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/pro-jh.css">	
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script> 

<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">강의관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">휴강신청</a></li>
		</ol>
    </div>
	<div class="container-fluid">
	<div id="outCardBox" >
	<!-- ■■■■■■■ 주차 선택하는 카드  ■■■■■■ -->
        <div class="card" style="width:48%; margin-bottom: 0;">
            <div class="card-header  cardTitle">
                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">날짜 선택</h4>
            </div>
            <div class="card-body" style="padding:0; "> 
            	<div id="calendar"></div>
            </div>
   
        </div>
        <!-- ■■■■■■■ 나의 시간표 출력, 선택하는 카드  ■■■■■■■ -->
        <div class="card" style="width:48%; margin-bottom: 0;">
            <div class="card-header  cardTitle">
                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">나의 시간표</h4>
            </div>

            <table class="tabletime" border="1" style="margin: auto auto;">
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
                                    <tbody id="timeBody">
                                        <c:forEach var="i" step="1" begin="1" end="9">
                                            <tr> 
                                                <td class="time ">${i}교시</td>
                                                <td class="mon myTd"></td>
                                                <td class="tue myTd"></td>
                                                <td class="wed myTd"></td>
                                                <td class="thur myTd"></td>
                                                <td class="fri myTd"></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
        </div>
        </div>
        <!-- ■■■■■■■ 휴강신청폼  ■■■■■■■ -->
        <div class="grade-wrap">
	        <div class="card" style="width:100%; margin-bottom: 0; height:300px;">
		        <div class="card-header  cardTitle">
	                <h4 class="card-title" style="font-weight: bold; font-size :1.5em; color: #800000;">휴강 신청</h4>
	               <button type="button" class="btn btn-primary pro1" id="submitBtn">제출</button>
	            </div>
	            <div class="card-body" style="padding-right:60px; padding-left:0px"> 
	            <table id="restTable" style="width: 100%; height: 100%; margin:auto auto;">
                                    <tr>
                                        <td><span>과목명</span> <input type="text" id ="insubNm"
                                                disabled="disabled"></td>
                                        <td><span>과목코드</span> <input type="text" id="insubNo"
                                                disabled="disabled"></td>
                                        <td><span>교수명</span> <input type="text" value="${pro.proNm}"
                                                disabled="disabled"></td>
                                        <td><span>교번</span> <input type="text" value="${pro.proNo }" id="inProNo"
                                                disabled="disabled"></td>
                                    </tr>

                                    <!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 교과목 선택하면 자동으로 채워짐  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

                                    <tr>
                                        <td><span>휴강주차</span> <input type="text" id="inWeek"
                                                disabled="disabled"></td>
                                        <td><span>강의요일</span> <input type="text" id="inDay" disabled="disabled">
                                        </td>
                                        <td><span>시작교시</span> <input type="text" id="inStart" disabled="disabled"></td>
                                        <td><span>강의시수</span> <input type="text" id="inHour" disabled="disabled">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2" colspan="4"><span>휴가사유</span> <textarea rows="3" cols="198.5" style="resize:none;" id="sunclRsn"></textarea></td>
                                        <td></td>
                                    </tr>
                                </table>
	            </div>
	        </div>
	   </div>
	</div>
</div>
<script>

var mydate = '';
var lecapNo ;
var subclNo;
$(document).ready(function() {
	   var calendarEl = document.getElementById('calendar');

	   var calendar = new FullCalendar.Calendar(calendarEl, {
	      timeZone: 'UTC',
	      selectable: true,
	      locale: "ko",
	      height: 450,
	      aspectRatio: 1.1,
	      headerToolbar: {
	         left: 'today',
	         center: 'title',
	         right: 'prev,next'
	      },
	      dateClick: function(info) {
	    	  mydate = info.dateStr;
	    	  console.log("내가찍은날짜:",mydate);
	    	    var startDate = new Date(2023, 8, 4); 
	    	    var endDate = new Date(2023, 11, 17);

	    	    // 주차 계산
	    	    var startWeek = 1;
	    	    var endWeek = Math.ceil(((endDate - startDate) / (1000 * 3600 * 24) + 1) / 7);

	    	    console.log('시작 주차:', startWeek);
	    	    console.log('종료 주차:', endWeek);

	    	    // 선택 날짜가 몇 주차인지 계산하는 함수
	    	    function calculateWeek(date) {
	    	        var weekNumber = Math.ceil(((date - startDate) / (1000 * 3600 * 24) + 1) / 7);
	    	        return weekNumber;
	    	    }

	    	    var selectedDate = new Date(info.dateStr);
	    	    var selectedWeek = calculateWeek(selectedDate);
				$('#inWeek').val(selectedWeek+"주차");
				$('#inDate').val(info.dateStr);
	    	    console.log('선택한 날짜의 주차:', selectedWeek);
	    	    console.log('clicked ' + info.dateStr);
	    	},
	      editable: true,
	      dayMaxEvents: true 
	   });
	   calendar.render();
});

$(document).ready(function() {
    var click = $(this);
    var timeBody = $("#timeBody")
    $.ajax({
        url: '/hku/professor/myTimeTable',
        method: 'get',
        data: {
            proNo: ${pro.proNo}
        },
        success: function (res) {
        	console.log(res);
            let data = [];
            for (let k = 0; k < res.length; k++) {
                let dataJson = {};
                dataJson.day = dayChange(res[k].lecscDay),
                dataJson.start = res[k].periodCd;
                dataJson.hour = res[k].lecscHour;
                dataJson.subNm = res[k].subNm;
                dataJson.proNm = res[k].proNm;
                data.push(dataJson);
            }

            /*■■■■■■■■■■■■ 시간표에 이미있는 수업 색깔뿌려줌■■■■■■■■■■■ */
            let tabletime = $('.tabletime');
            var colors = [
            	  "#FFC3A0", // 연한 주황색
            	  "#E7D8FF", // 연한 라벤더색
            	  "#FFDFC8", // 연한 분홍색
            	  "#A4C8E1", // 연한 파란색
            	  "#D7E9CA", // 연한 초록색
            	  "#FCE4D6", // 연한 노란색
            	  "#C8C6E2", // 연한 보라색
            	  "#F7C9B5", // 연한 코랄색
            	  "#B5EAEA", // 연한 민트색
            	  "#FFE8B6"  // 연한 금색
            	];
            for (let i = 0; i < data.length; i++) {
            	var color = getRandomColor();
                for (let j = 0; j < data[i].hour; j++) {
                	if(j === 0){
                		$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).text(data[i].subNm);
                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('color', 'black');
                	}else if(j >= 1){
                		$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).text(data[i].subNm);
                		$(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('color', colors[i]);
                	}
                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('background', colors[i]);
                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('border', 'none');
                    $(tabletime).find('tr').eq(parseInt(data[i].start) + j).find('td').eq(data[i].day).css('cursor', 'pointer');
                    
                }
            }
            
            
        },
        error: function (xhr, status, error) {
            swal("출력실패");
        }
    });
    
    
    
	});
	
$('.myTd').click(function(){
	var subNm = $(this).text();
	var proNo = ${pro.proNo};
	var lecscDay ;
	var lecscHour ;
	var periodCd ;
	var subNo;
	
	console.log("교번:",proNo)
	data = {
		 proNo: proNo,
			subNm : subNm
	}

	$('#insubNm').val(subNm);
	console.log(subNm);
	$.ajax({
		url: '/hku/professor/setRestTable',
        type: 'post',
        async:false,
        contentType : "application/json;charset=utf-8",
        data:JSON.stringify(data),
        success: function (res) {
        	console.log("Data",res);
        	lecapNo = res.lecapNo;
        	lecscDay = res.lecscDay;
        	lecscHour = res.lecscHour;
        	periodCd = res.periodCd;
        	subNo = res.subNo;
        	
            $('#inDay').val(res.lecscDay);
            $('#inHour').val(res.lecscHour);
            $('#inStart').val(res.periodCd);
            $('#insubNo').val(res.subNo);
            
            
            
        },
        error: function (xhr, status, error) {
        	alert("출력실패");
        }
		
	});
	
	data2 = {
			 proNo: proNo,
			lecapNo : lecapNo,
			subclAplyWk : $('#inWeek').val()
	}
	
	console.log("데이타2",data2);
	
	$.ajax({
		url: '/hku/professor/ifSameData',
        type: 'post',
        contentType : "application/json;charset=utf-8",
        async:false,
        data:JSON.stringify(data2),
        success: function (res) {
        	console.log(res);
            swal("동일한 내용의 신청 내역이있습니다.");
            subclNo = res;
            $('#submitBtn').text("취소");
            
        },
        error: function (xhr, status, error) {
        	$('#submitBtn').text("제출");
        }
		
	});
	
	
});

$('#submitBtn').click(function(){
	data = {
			lecapNo : lecapNo,
			proNo : ${pro.proNo},
			sunclRsn : $('#sunclRsn').val(),
			subclAplyDt : mydate,
			subclAplyWk : $('#inWeek').val()
		}
	console.log("신청",data);
	if($('#submitBtn').text() == '제출'){
	 
	swal({
		  title: "휴강을 신청하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url: '/hku/professor/insertRestTable',
			        type: 'post',
			        contentType : "application/json;charset=utf-8",
			        data:JSON.stringify(data),
			        success: function (res) {
			          swal("휴강 신청이 완료되었습니다.");
			          $('#inDay').val('');
			            $('#inHour').val('');
			            $('#inStart').val('');
			            $('#insubNo').val('');
			            $('#sunclRsn').val('');
			            $('#inWeek').val('');
			        	$('#inDate').val('');
			        	$('#insubNm').val('');
			            
			        },
			        error: function (xhr, status, error) {
			        	
			        }
					
				});
		  } else {
		    swal("Your imaginary file is safe!");
		  }
		});
	
	
	
	
	console.log("신청내용: ",data);
	
	}else if($('#submitBtn').text() == '취소'){
		console.log(subclNo);
		swal({
			  title: "휴강신청을 취소하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  $.ajax({
						url: '/hku/professor/deleteRestTable',
				        type: 'get',
// 				        contentType : "application/json;charset=utf-8",
				        data:{
				        	subclNo : subclNo
				        	},
				        success: function (res) {
				        
				          swal("휴강 신청이 취소되었습니다.");
				          $('#inDay').val('');
				            $('#inHour').val('');
				            $('#inStart').val('');
				            $('#insubNo').val('');
				            $('#sunclRsn').val('');
				            $('#inWeek').val('');
				        	$('#inDate').val('');
				        	$('#insubNm').val('');
				        	 $('#submitBtn').text("제출");
				            
				        },
				        error: function (xhr, status, error) {
				        	
				        }
						
					});
			  } 
			});
		
	}
	
});

	
function dayChange(day) {
    if (day == "월") {
        return "1";
    } else if (day == "화") {
        return "2";
    } else if (day == "수") {
        return "3";
    } else if (day == "목") {
        return "4";
    } else if (day == "금") {
        return "5";
    }
}
function getRandomColor() {
	 var hue = Math.floor(Math.random() * 360); // 색상의 색조 (0 ~ 359)
	  var saturation = Math.floor(Math.random() * 30) + 70; // 색상의 채도 (70 ~ 100)
	  var lightness = Math.floor(Math.random() * 30) + 50; // 색상의 명도 (50 ~ 80)
	  var alpha = 1; // 투명도 (1: 불투명)

	  var hslColor = 'hsla(' + hue + ', ' + saturation + '%, ' + lightness + '%, ' + alpha + ')';
	  return hslColor;
	}
</script>