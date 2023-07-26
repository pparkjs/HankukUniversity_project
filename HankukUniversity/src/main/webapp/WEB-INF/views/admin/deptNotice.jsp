<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/admin/notice.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">게시판관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">학과공지 게시판</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="font-weight: bold;">학과공지관리</h5>
			</div>
			<div class="card-body">
				<div class="basic-form">
					<form class="row g-3 custom-form" action="">
						<div class="col-md-2">
						   <select class="form-control" id="college">
							  <option value="">== 단과선택 ==</option>
						   	  <c:forEach items="${college }" var="item">
					   	  	  	<option value="${item.COL_CD}">${item.COL_NM}</option>
						   	  </c:forEach>
						   </select>
						</div>					
						<div class="col-md-2">
						   <select class="form-control" id="dept">
							  <option value="" selected>== 학과선택 ==</option>
						   </select>
						</div>					
						<div class="col-md-2">
						   <select class="form-control" id="stype">
							  <option value="">== 검색선택 ==</option>
							  <option value="title">제목</option>
							  <option value="writer">작성자</option>
						   </select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control input-default" placeholder="검색어를 입력해주세요" id="sword">
						</div>
						<input type="hidden" name="page" id="page">
						<div class="col-auto">
							<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">글쓰기</button>
						</div>	
					 </form>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="display table" style="min-width: 845px">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="deptNoticeTbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-body" id="pageNation">
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	// 변수들======================
	const myName = "${emp.empName}";
	var college = $('#college');
	var dept = $('#dept');
	var deptNoticeTbody = $('#deptNoticeTbody');
	var nModal = $('#nModal');
	var noticeFile = $('#noticeFile');
	var sNoticeBtn = $('#sNoticeBtn');
	var noticeTtl = $('#noticeTtl');
	var noticeFrm = $('#noticeFrm');
	var previewFile = $('.previewFile');
	var pageNation = $('#pageNation');
	
	var sendData = {};
	
	CKEDITOR.replace("noticeCn",{
		footnotesPrefix : "a"
// 		filebrowserUploadUrl : '/imageUpload.do?${_csrf.parameterName }=${_csrf.token}'
	});
// 	CKEDITOR.config.allowedContent = true;
	//============================
		
	// 대학 선택
	college.on('change', function(){
		let colData = $(this).val();
		console.log("대학코드",colData);
		if (colData == null || colData == "") {
			return false;
		}
		
		// 학과 동적 생성
		$.ajax({
			type: 'get',
			url: '/hankuk/dept/list',
			data: {colData:colData},
			dataType: 'json',
			success: function(res){
// 					console.log(res);

				let deptStr = `<option value="" selected>== 학과선택 ==</option>`;
				for(let i=0; i<res.length; i++){
					let deptData = res[i];
					deptStr += `<option value="\${deptData.DEPT_CD}">\${deptData.DEPT_NM}</option>`;
				}
				// console.log("deptStr",deptStr);
				dept.html(deptStr);
			}
		});
	});

	// 학과 선택
	dept.on('change', function(){
		let deptCd = $(this).val();
		sendData.deptCd = deptCd;
		deptNoticeList();
	});
	
	$('#mcollege').on('change', function(){
		let colData = $(this).val();
		console.log("대학코드",colData);
		if (colData == null || colData == "") {
			return false;
		}
		
		// 학과 동적 생성
		$.ajax({
			type: 'get',
			url: '/hankuk/dept/list',
			data: {colData:colData},
			dataType: 'json',
			success: function(res){
// 					console.log(res);

				let deptStr = `<option value="" selected>학과선택</option>`;
				for(let i=0; i<res.length; i++){
					let deptData = res[i];
					deptStr += `<option value="\${deptData.DEPT_CD}">\${deptData.DEPT_NM}</option>`;
				}
				// console.log("deptStr",deptStr);
				$('#mdept').html(deptStr);
			}
		});
	});
	
	// 학과 공지사항 리스트 뽑아오기
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
				var tblStr = ``
				for(let i=0; i<deptNoticeList.length; i++){
					tblStr += `<tr class="deptNoticeTr">
								 <td>
								 	<input type="hidden" id="depntNo" value="\${deptNoticeList[i].depntNo}">
								 	\${deptNoticeList[i].depntTtl}
								 </td>
								 <td>\${deptNoticeList[i].depntWrtrNm}</td>
								 <td>\${deptNoticeList[i].depntRegdate}</td>
								 <td>\${deptNoticeList[i].depntReadCnt}</td>
							   </tr>`
				}
				deptNoticeTbody.html(tblStr);
				pageNation.html(res.pagingHTML);
			}
		});
	}
	
	// 등록버튼
	
	
	// 학과공지 상세 보기
	$(document).on('click',".deptNoticeTr",function(){
		let cntTd = $(this).find('td').eq(3);
		cntTd.text(parseInt(cntTd.text()) + 1);
		let	depntNo = $(this).find('#depntNo').val();
// 		console.log(depntNo);
		$.ajax({
			type: 'get',
			url: '/hankuk/dept/deptNoticeDetail',
			data: {depntNo:depntNo},
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			success: function(res){
				console.log("상세 보기 결과", res);
				
				$('#hideDept').val(res.deptCd);
				$('#sNoticeBtn').text("수정"); // 등록 버튼 수정으로 바꿈
				$('#noticeFrm').css('display', 'none'); // 등록폼 안보이게
				$('#detailDiv').css('display', 'block');// 상세div 보이게
				$('#deleteBtn').css('display', 'block');// 삭제 버튼 보이게
				nModal.modal('show'); // 모달창 등장
				
				$('#noticeNo').val(res.depntNo);
				$('#atchFileNo').val(res.atchFileNo);
				$('#detailTtl').html(res.depntTtl);
				$('#detailRegDt').html(res.depntRegdate);
				$('#detailWrtr').html(res.depntWrtrNm);
				$('#detailCnt').html(res.depntReadCnt);
				$('#detailCn').html(res.depntCn);
				let noticeFileList = $('#noticeFileList');
				if(res.fileList != null && res.fileList.length > 0){
					let fileStr = "<br>";
					$.each(res.fileList, function(i,v){
						fileStr += `<div class="mailbox-attachment-info">
											<a href="/download\${v.filePath}" download="\${v.fileOrgnlFileNm}" class="mailbox-attachment-name fileDown">
												<input type="hidden" value="\${v.atchFileNo}">
												<input type="hidden" value="\${v.atchFileSeq}">
												<i class="fas fa-paperclip"></i> &nbsp;\${v.fileOrgnlFileNm} &nbsp;[\${v.fileSize}]
											</a>
										</div>`;
					});
					$(noticeFileList).html(fileStr);
					$('.previewFile').html(fileStr);
				}
			}
		});
	});
	

	sNoticeBtn.on('click',function(){
		// 등록 했을떄
		if($(this).text() == "등록"){
			$('#mselect').show();
			console.log("등록버튼");

			var formData = new FormData();

			let mdept = $('#mdept').val();

			let title = noticeTtl.val();
			let content = CKEDITOR.instances.noticeCn.getData();

				
			if(title == null || title == ""){
				swal({
					title: "제목을 입력해주세요!", 
					icon: "error"
				});
				return false;
			}
			
			if(content == null || content == ""){
				swal({
					title: "내용을 입력해주세요!", 
					icon: "error"
				});
				return false;
			}

			if(mdept == null || mdept == ""){
				swal({
					title: "학과를 선택해주세요!", 
					icon: "error"
				});
				return false;
			}
			
			let files = noticeFile[0].files;
			if(files != null && files.length > 0){
				for(let i=0; i<files.length; i++){
					formData.append("files", files[i]);
				}
			}
			
			formData.append("deptCd", mdept);
			formData.append("depntWrtrNm", myName);
			formData.append("depntTtl", title);
			formData.append("depntCn", content);

			$.ajax({
				type : "post",
				url : "/hankuk/dept/notice",
				data : formData,
				processData : false,
				contentType : false,
				cache: false,
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				success : function(res) {
					if(res === "success"){
						swal({
							title: "정상적으로 글이 등록되었습니다.", 
							icon: "success"
						});
					}else{
						swal({
							title: "서버에러 다시 시도해 주세요.", 
							icon: "error"
						});
					}
					nModal.modal('hide');
					let mcollege = $('#mcollege').val();
					college.val(mcollege).prop('selected', true);
					college.trigger('change');
					setTimeout(() => {
						dept.val(mdept).prop('selected', true);
						dept.trigger('change');
					}, 300);
				}
			});
		}else if($(this).text() == "수정"){
			console.log("수정버튼");
			$('#mselect').hide();
			$('#deleteBtn').text("취소");
			this.innerText = "저장";

			$('#detailDiv').css("display","none");
			$('#noticeFrm').css("display","block");
			$('#noticeTtl').val($("#detailTtl").html());
			CKEDITOR.instances.noticeCn.setData($("#detailCn").html());
		}else if($(this).text() == "저장"){
			console.log("저장버튼");
			
			var formData = new FormData();


			let title = noticeTtl.val();
			let content = CKEDITOR.instances.noticeCn.getData();

				
			if(title == null || title == ""){
				swal({
					title: "제목을 입력해주세요!", 
					icon: "error"
				});
				return false;
			}
			
			if(content == null || content == ""){
				swal({
					title: "내용을 입력해주세요!", 
					icon: "error"
				});
				return false;
			}
			
			let files = noticeFile[0].files;
			if(files != null && files.length > 0){
				for(let i=0; i<files.length; i++){
					formData.append("files", files[i]);
				}
			}
			
			let noticeNo = $('#noticeNo').val();
			let atchFileNo = $('#atchFileNo').val();
			
			formData.append("depntNo", noticeNo);
			formData.append("depntTtl", title);
			formData.append("atchFileNo",atchFileNo);
			formData.append("depntCn", content);
			
			$.ajax({
				type : "put",
				url : "/hankuk/dept/notice",
				data : formData,
				processData : false,
				beforeSend : function(xhr){
	               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
				contentType : false,
				cache: false,
				success : function(res) {
				 	swal("정상적으로 글이 수정 되었습니다.", {
			      		icon: "success",
				    });
					console.log("수정 내용 ", res);
					// 여기
					$('#hideDept').val(res.deptCd);
					$('#sNoticeBtn').text("수정"); // 등록 버튼 수정으로 바꿈
					$('#noticeFrm').css('display', 'none'); // 등록폼 안보이게
					$('#detailDiv').css('display', 'block');// 상세div 보이게
					$('#deleteBtn').css('display', 'block');// 삭제 버튼 보이게
					
					$('#deleteBtn').text('삭제');
					$('#noticeNo').val(res.depntNo);
					$('#atchFileNo').val(res.atchFileNo);
					$('#detailTtl').html(res.depntTtl);
					$('#detailRegDt').html(res.depntRegdate);
					$('#detailWrtr').html(res.depntWrtrNm);
					$('#detailCnt').html(res.depntReadCnt);
					$('#detailCn').html(res.depntCn);
					let noticeFileList = $('#noticeFileList');
					if(res.fileList != null && res.fileList.length > 0){
						let fileStr = "<br>";
						$.each(res.fileList, function(i,v){
							fileStr += `<div class="mailbox-attachment-info">
												<a href="/download\${v.filePath}" download="\${v.fileOrgnlFileNm}" class="mailbox-attachment-name fileDown">
													<input type="hidden" value="\${v.atchFileNo}">
													<input type="hidden" value="\${v.atchFileSeq}">
													<i class="fas fa-paperclip"></i> &nbsp;\${v.fileOrgnlFileNm} &nbsp;[\${v.fileSize}]
												</a>
											</div>`;
						});
						$(noticeFileList).html(fileStr);
						$('.previewFile').html(fileStr);
					}
				}
			});
		}else{
			return false;
		}
	});
	
	$('#deleteBtn').on('click',function(){
		if(this.innerText == "삭제"){
			swal({
				   title: '정말로 해당 글을 삭제 하시겠습니까?',
				   text: '글이 삭제되면 되돌릴 수 없습니다.',
				   icon: 'warning',
				   buttons: true,
				   dangerMode: true,
				}).then((willDelete) => {
				   // 만약 Promise리턴을 받으면,
				   if (willDelete) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   		console.log("삭제");
				   
						let noticeNo = $('#noticeNo').val();
						let atchFileNo = $('#atchFileNo').val();
						
						let deleteData = {
							noticeNo:noticeNo,
							atchFileNo:atchFileNo
						};
						
						$.ajax({
							type : "delete",
							url : "/hankuk/dept/notice",
							data : JSON.stringify(deleteData),
							beforeSend : function(xhr){
				               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				            },
							contentType : "application/json;charset=utf-8",
							success : function(res) {
								if (res === "success") {
									swal('정상적으로 글이 삭제 되었습니다.', {
										icon: "success"
									});
								}else{
									swal('서버에러 다시 시도해주세요.', {
										icon: "error"
									});
								}
								nModal.modal("hide");
								let trs = deptNoticeTbody.find('.deptNoticeTr');
								console.log(trs);
								for(let i=0; i<trs.length; i++){
									if (trs.eq(i).find('#depntNo').val() == noticeNo) {
										deptNoticeTbody.find('.deptNoticeTr').eq(i).remove();
										break;
									}
								}
							}
						});
				   }
				});
		}else if(this.innerText == "취소"){
			console.log("취소 버튼 눌림");
			this.innerText = "삭제";
			$('#sNoticeBtn').text("수정");
			$('#detailDiv').css("display","block");
			$('#noticeFrm').css("display","none");
		}
	});
	
	// 등록할때 파일 변경했을떄 밑에 갑 출력
	noticeFile.on('change', function(e){
		previewFile.html("");
		let files = e.target.files;
		if(files.length == 0 || files == null){
			return false;
		}
		for(let i=0; i<files.length; i++){
			let file = files[i];
			var pTag = document.createElement("p");
			pTag.textContent = file.name;
			previewFile.append(pTag);
		}
	});
	
	$('#searchBtn').on('click',function(){
		if(college.val() == null || college.val() == ""){
			swal({
				title: "단과대를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		if(dept.val() == null || dept.val() == ""){
			swal({
				title: "학과를 선택해주세요.", 
				icon: "error"
			});
			return false;
		}
		
		deptNoticeList();
	});
	
	// 페이징
	pageNation.on('click','a',function(event){
		event.preventDefault();
		pageNo = $(this).data('page'); // 페이지 번호 날라옴
		$('#page').val(pageNo);
		console.log("페이지번호 클릭", $('#page').val());
// 		noticeList();
		deptNoticeList();
	});

	// 모달창 닫힐떄 이벤트
	nModal.on('hidden.bs.modal', function(e){
		$(this).find('form')[0].reset();
		CKEDITOR.instances.noticeCn.setData("");
		$('#deleteBtn').css('display', 'none');
		$('#detailDiv').css('display', 'none');
		$('#noticeFrm').css('display', 'block');
		$('#sNoticeBtn').text("등록");
		$('#deleteBtn').text("삭제");
		$('.previewFile').html("");
		$('#noticeFileList').html("");
	});
	
	
});// function 끝
</script>
<!-- 게시판 등록&수정  모달창 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="nModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="font-weight: bold;">학사공지 게시판</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="noticeNo">
				<input type="hidden" id="atchFileNo">
				<div class="basic-form" id="regDiv">
					<div class="form-validation">
						<form class="needs-validation" id="noticeFrm" name="noticeFrm" enctype="multipart/form-data" method="post">
							<div class="row g-3" id="mselect">
								<div class="col-md-2">
									<label class="col-lg-6 col-form-label" for="validationCustom01">
										단과대 <span class="text-danger">*</span>
									</label>
									<select class="form-control" id="mcollege">
								  		<option value="">단과선택</option>
							   	  		<c:forEach items="${college }" var="item">
						   	  	  		<option value="${item.COL_CD}">${item.COL_NM}</option>
							   	  		</c:forEach>
							   		</select>
								</div>
								<div class="col-md-2">
									<label class="col-lg-6 col-form-label" for="validationCustom01">
										학과 <span class="text-danger">*</span>
									</label>
									<select class="form-control" id="mdept">
								  		<option value="" selected>학과선택</option>
							   		</select>
								</div>
							</div>
							<input type="hidden" id="hideDept" value="">
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom01">
									제목 <span class="text-danger">*</span>
								</label>
								<input type="text" name="noticeTtl" id="noticeTtl" class="form-control" id="validationCustom01" placeholder="제목을 입력하세요." required>
								<div class="invalid-feedback">
									제목을 입력해주세요.
								</div>
							</div>
							<div class="mb-3">
								<label class="col-lg-4 col-form-label" for="validationCustom04">
									내용 <span class="text-danger">*</span>
								</label>
								<textarea name="noticeCn" id="noticeCn" class="form-control h-50" id="validationCustom04" rows="5" placeholder="내용을 입력하세요." required></textarea>
								<div class="invalid-feedback">
									내용을 입력해주세요.
								</div>
							</div>
							<div class="mb-3">
								<input class="form-control form-control-sm" id="noticeFile" type="file" multiple>
							</div>
							<!-- 파일 이미지  -->
							<div class="row previewFile"></div>
						</form>
					</div>
				</div>
				<div class="basic-form" id="detailDiv">
					<div class="mb-3">
						<h1 id="detailTtl">몰라?</h1>
					</div>
					<div class="mb-3 g-3 row detailInfo">
						<div class="col-auto">
							<label>● 등록일 : <span id="detailRegDt">1</span></label>
						</div>
						<div class="col-auto">
							<label>● 작성자 : <span id="detailWrtr">2</span></label>
						</div>
						<div class="col-auto">
							<label>● 조회수 : <span id="detailCnt">3</span></label>
						</div>	
					</div>
					<div class="mb-3" id="detailCn" style="height: 447px; overflow-y: scroll;">
						내용
					</div>
					<!-- 파일들 -->
					<div class="row" id="noticeFileList">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-danger light" id="deleteBtn">삭제</button>
				<button type="button" class="btn btn-primary" id="sNoticeBtn">등록</button>
			</div>
		</div>
	</div>
</div>