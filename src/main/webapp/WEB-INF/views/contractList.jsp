<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="include/head.jsp"%>
</head>

<body>
	
		<%@include file="include/left_column.jsp"%>
		
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>계약 조회</h3>
							<p class="text-subtitle text-muted">For user to check they
								list</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">DataTable</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-header">Simple Datatable</div>
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">계약코드</th>
										<th class="text-center">등록일자</th>
										<th class="text-center">계약명</th>
										<th class="text-center">거래처</th>
										<th class="text-center">수정일자</th>
										<th class="text-center">진행상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="contract" items="${list }">
										<tr>
											<td><a href="detail?cr_code=${contract.cr_code}">
													${contract.cr_code} </a></td>
											<td>${contract.cr_regdate}</td>
											<td>${contract.cr_name}</td>
											<td>거래처 가져오기</td>
											<td>${contract.cr_moddate }</td>
											<td><span class="badge bg-success">${contract.cr_state }</span></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>

				</section>
			</div>

			 <footer>
                <%@ include file="include/footer.jsp" %>
            </footer>
		</div>
	</div>
	  <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
  
		<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	 <!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
</body>

</html>