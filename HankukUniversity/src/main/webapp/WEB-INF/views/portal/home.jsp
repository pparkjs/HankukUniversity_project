<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.table-wrap2{
	margin-top: -297px;
	width: 96%;
    max-height: 275px;
    margin-left: 17px;
    position: relative;
    z-index: 999;
}
.table thead th {
    border: none;
    padding: 7px;
    font-size: 20px;
}
</style>
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
                <div class="grid-stack-item portlet2" gs-w="12" gs-h="6" gs-no-resize="true">
                    <div class="grid-stack-item-content">
                        <div class="card portlet-item" style="margin-bottom: -31px; height: 416px;">
                            <div class="card-body">
                                <div style="display: flex; justify-content: space-between;">
                                    <div>
                                        <a href='/calendar/main'><i class="fa-solid fa-school"></i></a>
                                        <h4 class="card-title mb-5" style="display: inline-block;">&nbsp;한국대학교 공지사항</h4>
                                    </div>
                                </div>
                                <div class="custom-tab-1" style="display: flex; align-items: center;">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-bs-toggle="tab" href="#profile1">학사공지</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#contact1">채용공지</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-bs-toggle="tab" href="#message1" id="calRender">학과공지</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="grid-stack-item-content">
                        	<div class="tab-content">
                                <div class="tab-pane fade show active" id="profile1">
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
                                                    <th style="width:30px;">등록일자</th>
                                                </tr>
                                            </thead>
                                            <tbody id="acTbody">
                                                <tr>
                                                    <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="contact1">
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
                                                    <th style="width:30px;">등록일자</th>
                                                </tr>
                                            </thead>
                                            <tbody id="epTbody">
                                                 <tr>
                                                    <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="message1">
                                    <div class="table-wrap2">
                                        <table class="table table-hover">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th style="width:300px;">제목</th>
                                                    <th style="width:30px;">등록일자</th>
                                                </tr>
                                            </thead>
                                            <tbody id="dpTbody">
                                                 <tr>
                                                    <td rowspan="5" colspan="2">공지사항이 없습니다.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
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
<script type="text/javascript">
$(document).ready(function () {
	var grid = GridStack.init({ // 여기에 그리드 스택 옵션 삽입
        disableOneColumnMode: true, // jfidle 작은 창 크기용
        float: false,
        removable: "#trash", // drag-out delete class
        removeTimeout: 100
    });

    var savePortletBtn = $('#savePortletBtn'); // 포틀렛 저장버튼
    
    const regex = /[^0-9]/g;
    
    // 내가 설정한 포틀릿순서대로 보여주는 함수실행
    sortPortlet();

    // 내가 설정한 포틀릿순서대로 보여주는 함수
    function sortPortlet(){
    	// 지금 로컬 스토리지 쓰는데 이거를 데이터 베이스 에서 끌고 오면 됨
    	let myGrid = JSON.parse(localStorage.getItem("myGrid"));
    	console.log("로컬스토리지 저장한거 가져오기", myGrid);
//     	myGrid ="";
		console.log("myGrid, ", myGrid);
        var gridItem = document.querySelectorAll(".grid-stack-item");
        if(myGrid != null && myGrid.length > 0){
            for(let i=0; i<myGrid.length; i++){
                let ptl = document.querySelector('.'+myGrid[i].id);
//                 console.log("포틀릿 섞기 ", ptl);
//                 console.log("포틀릿 섞기 ", parseInt(myGrid[i].x));
//                 console.log("포틀릿 섞기 ", parseInt(myGrid[i].y));
                grid.update(ptl, {x:parseInt(myGrid[i].x) , y:parseInt(myGrid[i].y)});
            }
        }
    }

    
    // 포틀릿 저장 버튼 눌럿을떄
    savePortletBtn.on('click', function(){
    	console.log("저장했을떄 grid.save() =>", grid.save());
    	var myPortletArr = [];
        var gridItem = document.querySelectorAll(".grid-stack-item");
        for(let i=0; i<gridItem.length; i++){
            let saveData = {};
            let item = gridItem[i];
            saveData.id = $(item).attr('class').split(" ")[1].trim();
            console.log("itemitem", item);
            saveData.x = item.getAttribute("gs-x");
            saveData.y = item.getAttribute("gs-y");
            myPortletArr.push(saveData);
        }
        console.log("저장배열", myPortletArr);
        // 지금 로컬 스토리지로 저장하는데 이걸 데이터베이스에 저장하면됨
        localStorage.setItem("myGrid", JSON.stringify(myPortletArr));
        toastr.options = {
		    "closeButton": false,
		    "debug": false,
		    "newestOnTop": false,
		    "progressBar": true,
		    "positionClass": "toast-top-center",
		    "preventDuplicates": false,
		    "onclick": null,
		    "showDuration": "100",
		    "hideDuration": "1000",
		    "timeOut": "2000",
		    "extendedTimeOut": "1000",
		    "showEasing": "swing",
		    "hideEasing": "linear",
		    "showMethod": "fadeIn",
		    "hideMethod": "fadeOut"
		};
    			
		toastr.success('화면 설정이 저장되었습니다.');
    });
    
    getAllNoticeData();

    // 공지사항 가져오기
    function getAllNoticeData(){
        let deptCd = "${std.deptCd}";
//         console.log(deptCd);

        $.ajax({
            type: 'get',
            url: '/hku/portal/all-notice',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            data: {deptCd:deptCd},
            success: function(res){
                console.log("공지사항 데이터", res);
                let acNotice = res.acNotice;
                let epNotice = res.epNotice;
                let deptNotice = res.deptNotice;

                let acStr = "";
                for(let i = 0; i < acNotice.length; i++){
                    acStr += `<tr>
                                <td><input type="hidden" id="acNo" value="\${acNotice[i].NOTICE_NO}">\${acNotice[i].NOTICE_TTL}</td>
                                <td>\${acNotice[i].REGDATE}</td>
                              </tr>`;
                }
                $('#acTbody').html(acStr);
                let epStr = "";
                for(let i = 0; i < epNotice.length; i++){
                    epStr += `<tr>
                        <td><input type="hidden" id="epNo" value="\${epNotice[i].NOTICE_NO}">\${epNotice[i].NOTICE_TTL}</td>
                        <td>\${epNotice[i].REGDATE}</td>
                        </tr>`;
                    }
                $('#epTbody').html(epStr);
                
                let dpStr = "";
                for(let i = 0; i < deptNotice.length; i++){
                    dpStr += `<tr>
                        <td><input type="hidden" id="dpNo" value="\${deptNotice[i].DEPNT_NO}">\${deptNotice[i].DEPNT_TTL}</td>
                        <td>\${deptNotice[i].REGDATE}</td>
                        </tr>`;
                    }
                $('#dpTbody').html(dpStr);
            }
        });
    }
    
    $('#acTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "uni";
        geDetail(noticeNo,noticeClsf);
    });
    
    $('#epTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "rcrt";
        geDetail(noticeNo,noticeClsf);
    });
    
    $('#dpTbody').on('click','tr',function(){
        let noticeNo = $(this).find('input[type="hidden"]').val();
        let noticeClsf = "${std.deptCd}";
        geDetail(noticeNo,noticeClsf);
    });
    
    // detail전송 frm
    function geDetail(pObjVal, pClsf){
    	location.href = `/hku/portal/notice-detail?noticeNo=\${pObjVal}&noticeDiv=\${pClsf}`;
    }
});
</script>