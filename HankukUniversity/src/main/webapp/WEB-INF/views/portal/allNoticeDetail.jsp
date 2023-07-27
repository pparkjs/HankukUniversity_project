<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
</style>
<div class="container-fluid mt-3">
    <div class="row" style="background: white; padding: 10px; height: 847px;">
    	<div class="col-xl-12 mb-3">
            <h2><c:out value="${notice.noticeTtl}"/></h2>
            <input type="hidden" value="<c:out value="${notice.noticeNo}"/>">
        </div>
        <hr>
        <div class="col-xl-12 mb-3">
            <div class="row">
                <div class="col-xl-4 mb-1">
                    <p>● 등록일 : <c:out value="${notice.noticeRegdate}"/></p>
                </div>
                <div class="col-xl-4 mb-1">
                    <p>● 작성자 : <c:out value="${notice.noticeWrtrNm}"/></p>
                </div>
                <div class="col-xl-4 mb-1">
                    <p>● 조회수 : <c:out value="${notice.noticeReadCnt}"/></p>
                </div>
            </div>
        </div>
        <hr>
    	<div class="col-xl-12 mb-3" style="height: 570px; overflow: auto;">
            ${notice.noticeCn}
        </div>
        <hr>
    	<div class="col-xl-12 mb-3">
    		<c:forEach items="${notice.fileList }" var="file">
    			<div class="mailbox-attachment-info">
					<a href="/download${file.filePath}" download="${file.fileOrgnlFileNm}" class="mailbox-attachment-name fileDown">
						<i class="fas fa-paperclip"></i> &nbsp;${file.fileOrgnlFileNm} &nbsp;[${file.fileSize}]
					</a>
				</div>
    		</c:forEach>
        </div>
        <div class="col-xl-12 mb-3">
            <div class="row">
                <div class="col-xl-10 mb-1"></div>
                <div class="col-xl-2 mb-1">
                    <button class="btn btn-primary" id="noticeListBtn">목록</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var noticeListBtn = document.querySelector('#noticeListBtn');

    noticeListBtn.addEventListener('click', ()=>{
        location.href = "/hku/portal/all-notice-list";
    });
</script>
