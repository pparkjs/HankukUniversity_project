<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin/notice.css">
<div class="content-body">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Charts</a></li>
			<li class="breadcrumb-item active"><a href="javascript:void(0)">Notice</a></li>
		</ol>
    </div>
	<div class="container-fluid">
		<div class="card" id="card-title-1">
			<div class="card-header border-0 pb-0 ">
				<h5 class="card-title" style="font-weight: bold;">학사공지</h5>
			</div>
			<div class="card-body">
				<div class="basic-form">
					<form action="">
						<div class="input-group mb-3 noticeSearch">
                        	<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
							<button class="btn btn-primary" type="button">검색</button>
                        </div>
					</form>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-responsive-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Status</th>
								<th>Date</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<td>Kolor Tea Shirt For Man</td>
								<td><span class="badge badge-primary">Sale</span>
								</td>
								<td>January 22</td>
								<td class="color-primary">$21.56</td>
							</tr>
							<tr>
								<th>2</th>
								<td>Kolor Tea Shirt For Women</td>
								<td><span class="badge badge-success">Tax</span>
								</td>
								<td>January 30</td>
								<td class="color-success">$55.32</td>
							</tr>
							<tr>
								<th>3</th>
								<td>Blue Backpack For Baby</td>
								<td><span class="badge badge-danger">Extended</span>
								</td>
								<td>January 25</td>
								<td class="text-danger">$14.85</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-body">
				<nav>
					<ul class="pagination pagination-xs">
						<li class="page-item page-indicator">
							<a class="page-link" href="javascript:void(0)">
							<i class="la la-angle-left"></i></a>
						</li>
						<li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a>
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
	noticeList();
	function noticeList(){
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/hankuk/admin/noticeList", true);
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				console.log(JSON.parse(xhr.responseText));
			}
		};
		xhr.send();
	}
</script>
