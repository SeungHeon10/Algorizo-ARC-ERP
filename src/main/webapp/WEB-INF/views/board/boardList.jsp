<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	
		<%@include file="../include/left_column.jsp"%>
		
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
							<h3>공지사항</h3>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">공지사항</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">번호</th>
										<th class="text-center">등록일</th>
										<th class="text-center">제목</th>
										<th class="text-center">내용</th>
										<th class="text-center">수정일</th>
										<th class="text-center">담당자</th>
										<th class="text-center">담당부서</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${list }">
										<tr>
											<td>${board.b_id}</td>
											<td>${board.b_regdate}</td>
											<td><a href="detail?b_id=${board.b_id}">
													${board.b_title} </a></td>
											<td>${board.b_content}</td>
											<td>${board.b_moddate}</td>
											<td>${board.b_writer}</td>
											<td></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>

				</section>
			</div>

			 <footer>
                <%@ include file="../include/footer.jsp" %>
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
    <%@ include file="../include/plugin.jsp" %>
</body>

</html>