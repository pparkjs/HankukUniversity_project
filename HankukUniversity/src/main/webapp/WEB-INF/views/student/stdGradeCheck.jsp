<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/table.css">
<link rel="stylesheet" href="/css/student/std-jh.css">	
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">성적</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">당학기 성적조회</a></li>
		</ol>
    </div>
	<div class="container-fluid">
        <div class="card" style="width:100%; margin-bottom: 0.563rem;">
            <div class="card-header  cardTitle">
                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">학생기본정보</h4>
            </div>
            <div class="card-body stdInfo"> 
            	<table id="stdInfoTb" style="width:100%; height:100%;">
            		<tr>
            			<td><span>성명</span><input type="text" value="${std.stdNm}" disabled="disabled"></td>
            			<td><span>학번</span><input type="text" value="${std.stdNo}" disabled="disabled"></td>
            			<td><span>단과대학</span><input type="text" value="${map.stdInfo[0].colNm}" disabled="disabled"></td>
            			<td><span>학과</span><input type="text" value="${map.stdInfo[0].deptNm}" disabled="disabled"></td>
            		</tr>
            		<tr>
            			<td><span>학적상태</span><input type="text" value="${map.stdInfo[0].stdSttsNm}" disabled="disabled"></td>
            			<td><span>신청학점</span><input type="text" id="applyCrd" disabled="disabled"></td>
            			<td><span>년도</span><input type="text" id="year" disabled="disabled"></td>
            			<td><span>학기</span><input type="text" id="sem" disabled="disabled"></td>
            		</tr>
            		
            	</table>
            
            </div>
        </div>
        <div class="card" style="width:100%; margin-bottom: 0.563rem;">
            <div class="card-body stdGrade"> 
            </div>
        </div>
        <div class="grade-wrap">
	        <div class="card" style="width:50%; margin-bottom: 0.563rem;">
		        <div class="card-header  cardTitle">
	                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">이의신청</h4>
	               <button type="button" class="btn btn-primary pro1" id="submitBtn">제출</button>
	            </div>
	            <div class="card-body" style="padding-left:40px;"> 
	            	<div style="display:flex; padding-left:90px; ">
	            	 <span style="font-size:19px; margin-right:10px;">과목명</span>
	            	 <select class="selectCustom a" id="selSubject">
                          <option value="all">과목선택</option>
                          <c:forEach var="subject" items="${map.subject}">
                              <option value="${subject.lecapNo}">${subject.subNm}</option>
                          </c:forEach>
                    </select>
					    <div class="radio-group">
					    <input type="radio" id="mdTest" name="exam" value="중간" checked>
					    <label for="mdTest">중간</label>
					    
					    <input type="radio" id="fnTest" name="exam" value="기말">
					    <label for="fnTest">기말</label>
					    
					    <input type="radio" id="assign" name="exam" value="과제">
					    <label for="assign">과제</label>
					    
					    <input type="radio" id="attend" name="exam" value="출석">
					    <label for="attend">출석</label>
					    </div>
                    </div>
                      <textarea id="grdDmrCn" rows="7" cols="100" placeholder="이의신청 사유와 내용을 자세하게 입력해주세요."></textarea>
	            </div>
	        </div>
	        <div class="card" style="width:50%; margin-bottom: 0.563rem;">
		        <div class="card-header  cardTitle">
	                <h4 class="card-title" style="font-weight: bold; font-size: 1.2em; color: #800000;">이의신청 결과</h4>
	            </div>
	            <div class="card-body"> 
	            </div>
	        </div>
	   </div>
	</div>
</div>
<script>
let stdInfo = [];
let one;


</script>
<c:forEach items="${map.stdInfo}" var="stdVO">
<script>
	 one = {
		stdNo:'${stdVO.stdNo}' ,
		stdNm:'${stdVO.stdNm}',
		stdMjrCrd:'${stdVO.stdMjrCrd}',
		stdCtrlCrd:'${stdVO.stdCtrlCrd}',
		subCrd:'${stdVO.subCrd}',
		deptNm:'${stdVO.deptNm}',
		colNm:'${stdVO.colNm}',
		stdSttsNm:'${stdVO.stdSttsNm}',
		crsClassfNm:'${stdVO.crsClassfNm}'
	}
	stdInfo.push(one);
</script>	
</c:forEach>
<script>
let mjrCrd = 0 ;
let ctrlCrd  = 0 ;
let semCrd  = 0;
var stdNo = ${std.stdNo};
var year = new Date().getFullYear();
var month = new Date().getMonth();
if(month >= 6){
	$('#sem').val("2학기");
}else{
	$('#sem').val("1학기");
}
console.log(stdInfo);
for (let i = 0; i < stdInfo.length; i++) {
	if (stdInfo[i].crsClassfNm === '전필'|| stdInfo[i].crsClassfNm === '전선') {
		mjrCrd += parseInt(stdInfo[i].subCrd);
	}else{
		ctrlCrd += parseInt(stdInfo[i].subCrd);
	}
	semCrd += parseInt(stdInfo[i].subCrd);
}
	
	$('#year').val(year);
// 	$('#sem').val(sem);
	$('#applyCrd').val(semCrd);
	
		console.log("전공",mjrCrd);
		console.log("교양",ctrlCrd);
		console.log("총학점",semCrd);

$('#submitBtn').on("click",function(){
	
	var content = $('#grdDmrCn').val();
	var lecapNo = $('#selSubject option:selected').val();
	var examType = $("input[name='exam']:checked").val();
	var grdDmrCn = "이의항목: "+ examType + " / 내용: "+content;
	console.log("content",content);
	console.log("lecapNo",lecapNo);
	console.log("grdDmrCn",grdDmrCn);
	console.log("examType",examType);
	
   	swal({
		  title: "이의신청을 등록하시겠습니까?",
		  text: "신청 완료 후 회수가 불가합니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url : '/hku/student/submitObjec',
			        method: 'post',
			        data: {
			            stdNo: stdNo,
			            grdDmrCn : grdDmrCn,
			            lecapNo : lecapNo
			        },
			        success: function (res) {
			        	  swal("신청이 정상적으로 완료되었습니다.", {
			    		      icon: "success"
			    		    });
			        },
			        error:function(xhr){
			        	  swal("신청에실패하였습니다.", {
			    		      icon: "warning"
			    		    });
			        }
				})
		  } 
		});
	
	
	
	
})		
		
</script>