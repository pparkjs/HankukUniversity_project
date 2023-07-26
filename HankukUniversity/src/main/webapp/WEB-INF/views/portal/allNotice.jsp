<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<style>
.table-wrap2 {
    width: 100%;
    max-height: 100%;
    height: 88%;
}
.table tbody td {
    padding: 11px;
}
</style>
<div class="container-fluid mt-3">
    <div class="row">
    	<div class="custom-tab-1" style="display: flex; align-items: center;">
            <div class="card" style="width: 100%; height: 800px;">
                <div class="card-header border-0 pb-0">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#profile1" id="acBtn">학사공지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#contact1" id="epBtn">채용공지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#message1" id="dpBtn">학과공지</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" style="height: 746px;">
                        <div class="basic-form">
                                <form class="row g-3 custom-form" action="">
                                    <div class="col-md-2">
                                       <select class="default-select form-control" id="stype">
                                          <option value="">== 선택 ==</option>
                                          <option value="title">제목</option>
                                          <option value="writer">작성자</option>
                                       </select>
                                    </div>
                                    <div class="col-md-3" style="margin-left: 6%;">
                                        <input type="text" class="form-control input-default" placeholder="검색어를 입력해주세요" id="sword">
                                    </div>
                                    <input type="hidden" name="page" id="page">
                                    <div class="col-auto">
                                        <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
                                    </div>
                                 </form>
                            </div>
                        <div class="tab-pane fade show active" id="profile1" style="height: 92%;">
                            <div class="table-wrap2">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th style="width:294px;">제목</th>
                                            <th style="width:30px;">작성자</th>
                                            <th style="width:30px;">등록일자</th>
                                            <th style="width:30px;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="acTbody">
                                        <tr>
                                            <td rowspan="5" colspan="4">공지사항이 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-body" id="pageNation">
                                <nav>
                                    <ul class="pagination pagination-xs">
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-left"></i></a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" href="javascript:void(0)">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact1" style="height: 92%;">
                            <div class="table-wrap2">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th style="width:294px;">제목</th>
                                            <th style="width:30px;">작성자</th>
                                            <th style="width:30px;">등록일자</th>
                                            <th style="width:30px;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="epTbody">
                                         <tr>
                                            <td rowspan="5" colspan="4">공지사항이 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-body" id="pageNation">
                                <nav>
                                    <ul class="pagination pagination-xs">
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-left"></i></a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" href="javascript:void(0)">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="message1" style="height: 92%;">
                            <div class="table-wrap2">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th style="width:294px;">제목</th>
                                            <th style="width:30px;">작성자</th>
                                            <th style="width:30px;">등록일자</th>
                                            <th style="width:30px;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="dpTbody">
                                         <tr>
                                            <td rowspan="5" colspan="4">공지사항이 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-body" id="pageNation">
                                <nav>
                                    <ul class="pagination pagination-xs">
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-left"></i></a>
                                        </li>
                                        <li class="page-item active">
                                            <a class="page-link" href="javascript:void(0)">1</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                                        <li class="page-item page-indicator">
                                            <a class="page-link" href="javascript:void(0)">
                                            <i class="la la-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- ?${_csrf.parameterName}=${_csrf.token} --%>
<script>
$(function(){
    var profile1 = document.querySelector("#profile1");
    var contact1 = document.querySelector("#contact1");
    var message1 = document.querySelector("#message1");
    
    var acBtn = $("#acBtn");
    var epBtn = $("#epBtn");
    var dpBtn = $("#dpBtn");

    var sendData = {};
    sendData.deptCd = "${std.deptCd}"

    noticeList();

    function noticeList(){
        let stype = $('#stype').val();
        let sword = $('#sword').val();
        let page = $('#page').val();
        
        console.log(stype + sword + page);
        let clsf = "uni";
        console.log("노티스 리스트 조회", clsf);
        
        var queryStr = "?stype=" + stype + "&sword=" + sword + "&page=" + page
        + "&noticeClsf="+clsf;
        var xhr = new XMLHttpRequest();
        xhr.open("get", `/hankuk/admin/noticeList` + queryStr, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = function() {
        if(xhr.readyState == 4 && xhr.status == 200) {
            var noticeData = JSON.parse(xhr.responseText);
            console.log(noticeData);
            var noticeList = noticeData.dataList;
            var tblStr = ``;
            for(let i=0; i<noticeList.length; i++){
                tblStr += `<tr class="noticeTr">
                    <td>
                        \${noticeList[i].noticeTtl.substr(0, 45)}
                        <input type="hidden" value="\${noticeList[i].noticeNo}">
                        </td>
                        <td>\${noticeList[i].noticeWrtrNm}</td>
                        <td>\${noticeList[i].noticeRegdate}</td>
                        <td>\${noticeList[i].noticeReadCnt}</td>
                        </tr>`
                    }
                    if(noticeList.length == 0){
                        tblStr = `<tr><td colspan="4" style="text-align:center">조회하신 게시글이 없습니다.</td></tr>`;
                    }
                    $('#acTbody').html(tblStr);
                    $(profile1).find('#pageNation').html(noticeData.pagingHTML);
                }
            };
        xhr.send();
    }

    function epNoticeList(){
        let stype = $('#stype').val();
        let sword = $('#sword').val();
        let page = $('#page').val();
        
        console.log(stype + sword + page);
        let clsf = "rcrt";
        console.log("노티스 리스트 조회", clsf);
        
        var queryStr = "?stype=" + stype + "&sword=" + sword + "&page=" + page
        + "&noticeClsf="+clsf;
        var xhr = new XMLHttpRequest();
        xhr.open("get", `/hankuk/admin/noticeList` + queryStr, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = function() {
        if(xhr.readyState == 4 && xhr.status == 200) {
            var noticeData = JSON.parse(xhr.responseText);
            console.log(noticeData);
            var noticeList = noticeData.dataList;
            var tblStr = ``;
            for(let i=0; i<noticeList.length; i++){
                tblStr += `<tr class="noticeTr">
                    <td>
                        \${noticeList[i].noticeTtl.substr(0, 45)}
                        <input type="hidden" value="\${noticeList[i].noticeNo}">
                        </td>
                        <td>\${noticeList[i].noticeWrtrNm}</td>
                        <td>\${noticeList[i].noticeRegdate}</td>
                        <td>\${noticeList[i].noticeReadCnt}</td>
                        </tr>`
                    }
                    if(noticeList.length == 0){
                        tblStr = `<tr><td colspan="4" style="text-align:center">조회하신 게시글이 없습니다.</td></tr>`;
                    }
                    $('#epTbody').html(tblStr);
                    $(contact1).find('#pageNation').html(noticeData.pagingHTML);
                }
            };
        xhr.send();
    }

    function deptNoticeList(){
		sendData.stype = $('#stype').val();
		sendData.sword = $('#sword').val();
		sendData.page = $('#page').val();

		console.log(sendData);
		
		$.ajax({
			type: 'get',
			url: '/hankuk/dept/noticeList',
			data: sendData,
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			success: function(res){
				console.log("deptNoticeList 결과", res);
				var deptNoticeList = res.dataList;
				var tblStr = ``;
				for(let i=0; i<deptNoticeList.length; i++){
					tblStr += `<tr class="deptNoticeTr">
								 <td>
								 	<input type="hidden" id="depntNo" value="\${deptNoticeList[i].depntNo}">
								 	\${deptNoticeList[i].depntTtl.substr(0, 45)}
								 </td>
								 <td>\${deptNoticeList[i].depntWrtrNm}</td>
								 <td>\${deptNoticeList[i].depntRegdate}</td>
								 <td>\${deptNoticeList[i].depntReadCnt}</td>
							   </tr>`
				}
                if(deptNoticeList.length == 0){
                    tblStr = `<tr><td colspan="4" style="text-align:center">조회하신 게시글이 없습니다.</td></tr>`;
                }

				$("#dpTbody").html(tblStr);
				$(message1).find("#pageNation").html(res.pagingHTML);
			}
		});
	}

    $('#searchBtn').on('click',function(){
        const activeTab = document.querySelector(".nav-link.active");
        if (activeTab) {
            const selectedTabId = activeTab.id;
            whatSelectTab(selectedTabId);
        } else {
            console.log("선택된 탭이 없습니다.");
        }
    });

    function whatSelectTab(pId){
        switch(pId){
            case "acBtn": noticeList(); break;
            case "epBtn": epNoticeList(); break;
            case "dpBtn": deptNoticeList(); break;
        }
    }

    $(profile1).on('click','#pageNation a',function(event){
        event.preventDefault();
        pageNo = $(this).data('page'); // 페이지 번호 날라옴
        $('#page').val(pageNo);
        console.log("페이지번호 클릭", $('#page').val());
        noticeList();
    });

    $(contact1).on('click','#pageNation a',function(event){
        event.preventDefault();
        pageNo = $(this).data('page'); // 페이지 번호 날라옴
        $('#page').val(pageNo);
        console.log("페이지번호 클릭", $('#page').val());
        epNoticeList();
    });

    $(message1).on('click','#pageNation a',function(event){
        event.preventDefault();
        pageNo = $(this).data('page'); // 페이지 번호 날라옴
        $('#page').val(pageNo);
        console.log("페이지번호 클릭", $('#page').val());
        deptNoticeList();
    });

    acBtn.on('click',function(){
        clearSearch();
        noticeList();
    });

    epBtn.on('click',function(){
        clearSearch();
        epNoticeList();
    });

    dpBtn.on('click',function(){
        clearSearch();
        deptNoticeList();
    });

    function clearSearch(){
        $('#stype').val("");
        $('#sword').val("");
        $('#page').val("");
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
        let noticeClsf = sendData.deptCd;
        geDetail(noticeNo,noticeClsf);
    });
    
    // detail전송 frm
    function geDetail(pObjVal, pClsf){
    	location.href = `/hku/portal/notice-detail?noticeNo=\${pObjVal}&noticeDiv=\${pClsf}`;
    }
});
</script>
