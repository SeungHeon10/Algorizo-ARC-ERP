<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
<style>

.dataTable-new {
	display: flex;
	align-items: center;
}
</style>
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
						<h3 style="margin-left: 13px; margin-bottom: 50px;">재고 조회</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">list</li>
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
									<th class="text-center">재고ID</th>
									<th class="text-center">품목 코드</th>
									<th class="text-center">품목 이름</th>
									<th class="text-center">재고 수량</th>
									<th class="text-center">재고 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="in" items="${list}">
									<tr>
										<td>${in.s_id == null || in.s_id == 0 ? 'N/A' : in.s_id}</td>
										<td><c:choose>
												<c:when test="${not empty in.product.p_code}">
													<a href="stockdetail?s_id=${in.s_id}">${in.product.p_code}</a>
												</c:when>
												<c:otherwise>
								                    N/A
								                </c:otherwise>
											</c:choose></td>
										<td>${in.product.p_name == null || in.product.p_name == '' ? 'N/A' : in.product.p_name}</td>
										<td>${in.s_quantity == null || in.s_quantity == 0 ? 'N/A' : in.s_quantity}</td>
										<c:set var="s_status"
											value="${in.s_status == null || in.s_status == '' ? 'N/A' : in.s_status}" />
										<td>
											<c:choose>
												<c:when test="${s_status == '재고 충족'}">
													<span class="badge bg-success">재고 충족</span>
												</c:when>
												<c:when test="${s_status == '재고 부족'}">
													<span class="badge bg-warning">재고 부족</span>
												</c:when>
												<c:when test="${s_status == '재고 없음'}">
													<span class="badge bg-danger">재고 없음</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">상태 미정</span>
												</c:otherwise>
											</c:choose> 
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<h4>검수 수량</h4>
						<table class="table table-striped" id="table2">
							<thead>
								<tr>
									<th class="text-center">상품 이름</th>
									<th class="text-center">상품 코드</th>
									<th class="text-center">입고 수량</th>
									<th class="text-center">불량 수량</th>
									<th class="text-center">검출 수량</th>
									<th class="text-center">재고 수량</th>
									<th class="text-center">검사관</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sum" items="${summary}">
									<tr>
										<td>${sum.p_name == null || sum.p_name == '' ? 'N/A' : sum.p_name}</td>
										<td>${sum.p_code == null || sum.p_code == '' ? 'N/A' : sum.p_code}</td>
										<td>
											<c:choose>
												<c:when
													test="${sum.in_quantity == null || sum.in_quantity == '' || sum.in_quantity == 0}">
										            N/A
										        </c:when>
												<c:otherwise>
									            ${sum.in_quantity}
									       	    </c:otherwise>
											</c:choose>
										</td>
										<td>
										    <c:choose>
												<c:when
													test="${sum.i_defective_quantity == null || sum.i_defective_quantity == '' || sum.i_defective_quantity == 0}">
										            N/A
										        </c:when>
												<c:otherwise>
									            ${sum.i_defective_quantity}
									       	    </c:otherwise>
											</c:choose>
										</td>
											<td>
											<c:choose>
												<c:when
													test="${sum.oi_quantity == null || sum.oi_quantity == '' || sum.oi_quantity == 0}">
										            N/A
										        </c:when>
												<c:otherwise>
									            ${sum.oi_quantity}
									        </c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when
													test="${sum.s_quantity == null || sum.s_quantity < 0}">
								                    N/A
								                </c:when>
												<c:otherwise>
								                    ${sum.s_quantity}
								                </c:otherwise>
											</c:choose></td>
										<td>${sum.i_inspector}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>

		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</div>
	<script
		src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
		let table2 = document.querySelector('#table2');
		let dataTable1 = new simpleDatatables.DataTable(table2);
	</script>
	<!-- 플러그인 -->
	<%@ include file="../include/plugin.jsp"%>
</body>

</html>