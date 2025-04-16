<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	<div id="app">
				<%@include file="../include/left_column.jsp"%>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i></a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>공급업체 목록</h3>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Company List</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<section class="section">
				<div class="card">
					<div class="card-body">
						<table class="table table-striped" id="table1">
							<thead>
								<tr>
									<th class="text-center">회사명</th>
									<th class="text-center">업종</th>
									<th class="text-center">대표이사</th>
									<th class="text-center">대표전화</th>
									<th class="text-center">팩스번호</th>
									<th class="text-center">이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="company" items="${companylist}">
									<tr>
										<td><a href="${contextPath }/company/companydetail?cp_id=${company.cp_id}" class="text-primary">${company.cp_name }</a></td>
										<td>${company.cp_ctg}</td>
										<td>${company.cp_manager}</td>
										<td>${company.cp_pno }</td>
										<td>${company.cp_fax}</td>
										<td>${company.cp_mail}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-sm-12 d-flex justify-content-end">
							<button type="button" onclick="location.href='companyinsert'" class="btn btn-outline-primary">업체등록</button>
						</div>
					</div>
				</div>
			</section>

			<footer>
				<%@include file="../include/footer.jsp"%>
			</footer>
		</div>
	</div>
	<script
		src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

	<script
		src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>

	<script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
</body>

</html>