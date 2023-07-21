<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${division eq 'N' }">
	<c:set value="학사" var="dvs"/>
</c:if>
<c:if test="${division eq 'E' }">
	<c:set value="채용" var="dvs"/>
</c:if>
<c:forEach items="${commonData }" var="cmData">
	<c:if test="${cmData.comCdNm eq dvs}">
		<c:set var="noticeClsf" value="${cmData.comCd}"/>
	</c:if>
</c:forEach>
<link rel="stylesheet" href="/css/admin/notice.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">게시판관리</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">${dvs }공지 게시판</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="font-weight: bold;">${dvs }공지관리</h5>
			</div>
			<div class="card-body">
				<div class="basic-form">
					<form class="row g-3 custom-form" action="">
						<div class="col-md-2">
						   <select class="default-select form-control" id="stype">
							  <option value="">== 선택 ==</option>
							  <option value="title">제목</option>
							  <option value="writer">작성자</option>
						   </select>
						</div>
						<div class="col-md-3">
							<input type="text" class="form-control input-default" placeholder="검색어를 입력해주세요" id="sword">
						</div>
						<input type="hidden" name="page" id="page">
						<div class="col-auto">
							<button type="button" class="btn btn-primary" id="searchBtn" onclick="searchClick()">검색</button>
						</div>
						<div class="col-auto">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">글쓰기</button>
						</div>	
					 </form>
				</div>
			</div>
			<script>
				// 검색 
				function searchClick(){
					noticeList();
				}
			</script>
			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="display table" style="min-width: 845px">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="noticeTbody">
						</tbody>
					</table>
				</div>
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
<script type="text/javascript">
	const myName = "${emp.empName}";
	var noticeClsf = "${noticeClsf}";
	var pageNo;
	noticeList(); // 노티스 리스트 가져오기
	console.log(noticeClsf);
	$(function(){
		CKEDITOR.replace("noticeCn",{
			footnotesPrefix : "a"
// 			filebrowserUploadUrl : '/imageUpload.do?${_csrf.parameterName }=${_csrf.token}'
		});
// 		CKEDITOR.config.allowedContent = true;
		
		var sNoticeBtn = $('#sNoticeBtn');
		var noticeTtl = $('#noticeTtl');
		var noticeFrm = $('#noticeFrm');
		var noticeFile = $('#noticeFile');
		var addModal = $('#addModal');

		// 등록버튼
		sNoticeBtn.on('click',function(){
			// 등록 했을떄
			if(this.innerText == "등록"){

				let formData = new FormData();

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

				
				let noticeFile = document.querySelector('#noticeFile');
				console.log(noticeFile.files);

				formData.append("noticeTtl", title);
				formData.append("noticeCn",content);
				formData.append("noticeWrtrNm", myName);
				formData.append("noticeClsf", noticeClsf);
				
				let files = noticeFile.files;
				if(files.length > 0 && files !=null){
					for(let i=0; i<files.length; i++){
						formData.append("files", files[i]);
					}
				}
				
				console.log(formData);
					
				$.ajax({
					type:"post",
					url: "/hankuk/admin/addNotice",
					contentType: false, // 필수 
					processData: false, // 필수
					cache: false,
					data: formData,
					dataType: "text",
					success: function(res){
						if(res === "success"){
							swal({
								title: "정상적으로 글이 등록되었습니다.", 
								icon: "success"
							});
							$('#addModal').modal("hide");
							noticeList();
						}
					},
					err: function(err){
						console.log("err:", err)
					}
				})


			}else if(this.innerText == "수정"){ // 수정 버튼 눌럿 을떄
				console.log("수정 버튼 클릭");
				$('#deleteBtn').text("취소");
				this.innerText = "저장";

				$('#detailDiv').css("display","none");
				$('#noticeFrm').css("display","block");
				$('#noticeTtl').val($("#detailTtl").html());
				CKEDITOR.instances.noticeCn.setData($("#detailCn").html());
			}else if(this.innerText == "저장"){

				// 공지사항 변경했을때 처리 로직
				
				console.log("저장 하기");
				let formData = new FormData();
				let title = noticeTtl.val();
				let content = CKEDITOR.instances.noticeCn.getData();

				
				if(title == null || title == ""){
					alert("제목을 입력해주세요");
					return false;
				}
				
				if(content == null || content == ""){
					alert("내용을 입력해주세요");
					return false;
				}

				
				let noticeFile = document.querySelector('#noticeFile');
				let noticeNo = $('#noticeNo').val();
				let atchFileNo = $('#atchFileNo').val();
				console.log(noticeFile.files);
				formData.append("noticeNo", noticeNo);
				formData.append("noticeTtl", title);
				formData.append("atchFileNo",atchFileNo);
				formData.append("noticeCn",content);
				
				let files = noticeFile.files;
				if(files != null && files.length > 0){
					for(let i=0; i<files.length; i++){
						formData.append("files", files[i]);
					}
				}
				
				$.ajax({
					type:"put",
					url: "/hankuk/admin/updateNotice",
					contentType: false, // 필수 
					processData: false, // 필수
					cache: false,
					data: formData,
					dataType: "json",
					success: function(res){
						console.log("수정된 파일",res);
						if(res != null){
							swal({
								title: "정상적으로 글이 수정 되었습니다.", 
								icon: "success"
							});
						}

						$('#noticeNo').val(res.noticeNo);
						$('#atchFileNo').val(res.atchFileNo);
						$('#sNoticeBtn').text("수정"); // 등록 버튼 수정으로 바꿈
						$('#deleteBtn').text("삭제"); // 등록 버튼 수정으로 바꿈
						$('#noticeFrm').css('display', 'none'); // 등록폼 안보이게
						$('#detailDiv').css('display', 'block');// 상세div 보이게
						$('#deleteBtn').css('display', 'block');// 삭제 버튼 보이게
						
						noticeList();

						$('#detailTtl').html(res.noticeTtl);
						$('#detailRegDt').html(res.noticeRegdate);
						$('#detailWrtr').html(res.noticeWrtrNm);
						$('#detailCnt').html(res.noticeReadCnt);
						$('#detailCn').html(res.noticeCn);
						let noticeFileList = $('#noticeFileList');
						if(res.fileList != null && res.fileList.length > 0){
							let fileStr = "<br>";
							$.each(res.fileList, function(i,v){
								// console.log("파일 하나하나",$(this));
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
					},
					err: function(err){
						console.log("err:", err)
					}
				});
			}else{
				return false;
			}
			
		});
		
		// 삭제 & 취소 버튼
		$('#deleteBtn').on('click',function(){
			if(this.innerText == "삭제"){
				swal({
					   title: '정말로 해당 글을 삭제 하시겠습니까?',
					   text: '글이 삭제되면 되돌릴 수 없습니다.',
					   icon: 'warning',
					   buttons: true,
					   dangerMode: true,
				}).then((willDelete) => {
					if (willDelete) {
						console.log("삭제 버튼 눌림");
						let noticeNo = $('#noticeNo').val();
						let atchFileNo = $('#atchFileNo').val();
						
						let deleteData = {
							noticeNo:noticeNo,
							atchFileNo:atchFileNo
						}
						$.ajax({
							type:"delete",
							url: "/hankuk/admin/deleteNotice",
							contentType: "application/json;charset=utf-8", // 필수 
							data: JSON.stringify(deleteData),
							dataType: "text",
							success: function(res){
								swal({
									title: res, 
									icon: "success"
								});
								$('#addModal').modal("hide");
								noticeList();
							},
							err: function(err){
								console.log("err:", err)
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
	});



	// 게시판 테이블
	const noticeTbody = document.querySelector("#noticeTbody");

	// 노티스 리스트 가져오기
	function noticeList(){
// 		var searchData = {};
		let stype = $('#stype').val();
		let sword = $('#sword').val();
		let page = $('#page').val();
// 		searchData.stype = stype;
// 		searchData.sword = sword;
		
// 		console.log("검색");
// 		console.log(searchData);

		let clsf = "${noticeClsf}";
		console.log("노티스 리스트 조회", clsf);
		
		var queryStr = "?stype=" + stype + "&sword=" + sword + "&page=" + page
				+ "&noticeClsf=${noticeClsf}";
	/* 	let noticeListClsf = {
			"noticeClsf" : clsf
		}; */
		var xhr = new XMLHttpRequest();
		xhr.open("get", `/hankuk/admin/noticeList` + queryStr, true);
		xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var noticeData = JSON.parse(xhr.responseText);
				console.log(noticeData);
				var noticeList = noticeData.dataList;
				var tblStr = ``
				for(let i=0; i<noticeList.length; i++){
					tblStr += `<tr class="noticeTr">
								 <td>\${noticeList[i].noticeNo}</td>
								 <td>\${noticeList[i].noticeTtl}</td>
								 <td>\${noticeList[i].noticeWrtrNm}</td>
								 <td>\${noticeList[i].noticeRegdate}</td>
								 <td>\${noticeList[i].noticeReadCnt}</td>
							   </tr>`
				}
				noticeTbody.innerHTML = tblStr;
				$('#pageNation').html(noticeData.pagingHTML);
			}
		};
		xhr.send();
	}
	
	// 상세보기
	$(function(){
		$(document).on('click',".noticeTr",function(){
			var addModal = $('#addModal');
			let noticeNo = $(this).children().eq(0).text();
			let noticeCnt = parseInt($(this).children().eq(4).text()) + 1;
			$(this).children().eq(4).text(noticeCnt)
// 			console.log(noticeNo);
			let data = {
				"noticeNo" : noticeNo
			};
			$.ajax({
				type: "get",
				url:"/hankuk/admin/getNoticeOne",
				contentType : "application/json;charset=UTF-8",
				data: data,
				dataType: "json",
				success : function(res){
					// 번호 업데이트
					$('#noticeNo').val(res.noticeNo);
					$('#atchFileNo').val(res.atchFileNo);

					console.log(res);
					$('#sNoticeBtn').text("수정"); // 등록 버튼 수정으로 바꿈
					$('#noticeFrm').css('display', 'none'); // 등록폼 안보이게
					$('#detailDiv').css('display', 'block');// 상세div 보이게
					$('#deleteBtn').css('display', 'block');// 삭제 버튼 보이게
					addModal.modal('show'); // 모달창 등장
					
					// 데이터 삽입
					console.log(res);
					$('#detailTtl').html(res.noticeTtl);
					$('#detailRegDt').html(res.noticeRegdate);
					$('#detailWrtr').html(res.noticeWrtrNm);
					$('#detailCnt').html(res.noticeReadCnt);
					$('#detailCn').html(res.noticeCn);
					let noticeFileList = $('#noticeFileList');
					if(res.fileList != null && res.fileList.length > 0){
						let fileStr = "<br>";
						$.each(res.fileList, function(i,v){
							// console.log("파일 하나하나",$(this));
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

// 			$(document).on('click','.deleteFile',function(){
// 				console.log("삭제 클릭");
// 				$(this).parent("div").remove();
// 			});
// 			$('#noticeFileList').on('click',".fileDown",function(){
// 				let atchFileNo = $(this).find("input")[0];
// 				let atchFileSeq = $(this).find("input")[1];
				
// 				var downFileData = {
// 					atchFileNo: atchFileNo,
// 					atchFileSeq: atchFileSeq
// 				};
// 				$.ajax({
// 					type : 'post',
// 					url : '/common/file/download',
// 					contentType : "application/json;charset=UTF-8",
// 					data: downFileData,
// 					dataType: "json",
// 					success : function(res){
// 						console.log(res);
// 					}
// 				});
// 			});
		});
		

		// 파일 이벤트
		var noticeFile = document.querySelector('#noticeFile');
		// 파일 미리보기
		var previewFile = document.querySelector('.previewFile');

		// 파일 변경 했을떄
		noticeFile.addEventListener('change', function(e){
			$('.previewFile').html("");
			let files = e.target.files;
			
			if(files.length == 0 || files == null){
				return false;
			}
			for(let i=0; i<files.length; i++){
				let file = files[i];
				var pTag = document.createElement("p");
				pTag.textContent = file.name;
				previewFile.appendChild(pTag);
			}
// 			let formData = new FormData();
// 			console.log(files);
			
// 			for(let i=0; i<files.length; i++){
// 				formData.append("preivewFiles",files[i]);
// 			}
// 			var xhr = new XMLHttpRequest();
// 			xhr.open("post", "/common/file/upload", true); 
// 			xhr.onreadystatechange = function(){
// 				if(xhr.readyState == 4 && xhr.status == 200){
// 					let data = xhr.responseText;
// 					data = data.split(',');
// 					console.log(data);
// 					var str = "";
// 					for(let i=0; i<data.length; i++){
// 						if(checkImageType(data[i])){	// 이미지 면 이미지 태그를 이용하려 출력
// 							str += `<div>
// 										<a href='/common/file/displayFile?fileName=\${data[i]}'>
// 											<img src='/common/file/displayFile?fileName=\${getThumnailName(data[i])}'>
// 										</a>
// 										<span>X</span>
// 									</div>`;
// 						}else{
// 							str += `<div>
// 										<a href='/common/file/displayFile?fileName=\${data[i]}'>\${getOriginalName(data[i])}</a>
// 										<span>X</span>
// 									</div>`;
// 						}
// 						previewFile.innerHTML = str;
// 					}
// 				}
// 			}
// 			xhr.send(formData); 
		});
		
		// 파일 스판테그 x눌럿을때
// 		$(previewFile).on('click','span',function(){
// 			let files = noticeFile.files;
// 			let fileName = $(this).parent("p").text().trim();
// 			var idx = 0;
// 			console.log("삭제", fileName);
// 			const dataTransfer = new DataTransfer();

// 			for(let i=0; i<files.length; i++){
// 				if(files[i].name  == fileName){
// 					alert("files[i]" + files[i].name  + " : " + fileName);
// 					let fileArray = Array.from(files);	//변수에 할당된 파일을 배열로 변환(FileList -> Array)
    
// 					fileArray.splice(i, 1);	//해당하는 index의 파일을 배열에서 제거
					
// 					fileArray.forEach(file => { dataTransfer.items.add(file); });
					
// 					noticeFile.files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
// 					break;
// 				}
// 			}
			
// 			console.log("삭제후 파일", files);
// 			$(this).parents("div").remove();
// 		});

// 		function getThumnailName(fileName) {
// 			var front = fileName.substr(0,12);	// /2023/06/07 폴더
// 			var end = fileName.substr(12);		// 뒤 파일명
// 			console.log("front : " + front);
// 			console.log("end : " + end);
// 			return front + "s_" + end;
// 		}
		
// 		function getOriginalName(fileName) {
// 			if(checkImageType(fileName)){
// 				return;
// 			}
// 			let idx = fileName.indexOf("_") + 1;
// 			return fileName.substr(idx);
// 		}
		
		
		// 이미지 파일인지 확인한다.
// 		function checkImageType(fileName) {
// 			var pattern = /jpg|gif|png|jpeg/;
// 			return fileName.match(pattern); // 패턴과 일치하면 true 
// 		}
		
		// 페이징
		var pageNation = $('#pageNation');
		
		pageNation.on('click','a',function(event){
			event.preventDefault();
			pageNo = $(this).data('page'); // 페이지 번호 날라옴
			$('#page').val(pageNo);
			console.log("페이지번호 클릭", $('#page').val());
			noticeList();
		});

		// 모달창 닫힐떄 이벤트
		$('#addModal').on('hidden.bs.modal', function(e){
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
	});
</script>
<!-- 게시판 등록&수정  모달창 -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" style="display: none;" aria-hidden="true" id="addModal">
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
					<div class="mb-3" id="detailCn">
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