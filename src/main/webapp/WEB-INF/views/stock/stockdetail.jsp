<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	<%@ include file="../include/left_column.jsp"%>
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
						<h3>
							<strong>상세 정보</strong>
						</h3>
						<p class="text-subtitle text-muted"></p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/home">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">Detail</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="row" id="table-striped">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<strong>Umm</strong>
							</div>
							<div class="card-body">
								<table class="table table-striped" id="table1">

									<!-- detail 객체가 null일 경우 처리 -->
									<c:if test="${empty detail}">
										<p class="text-red-500 mt-4">재고 정보를 찾을 수 없습니다.</p>
									</c:if>

									<c:if test="${not empty detail}">
										<c:forEach var="detail" items="${detail}">
											<tr>
												<th>품목 명:</th>
												<td>${detail.product.p_name == null || detail.product.p_name == '' ? 'N/A' : detail.product.p_name}</td>
											</tr>
											<tr>
												<th>품목 코드:</th>
												<td>${detail.product.p_code == null || detail.product.p_code == '' ? 'N/A' : detail.product.p_code}</td>
											</tr>
											<tr>
												<th>재고 번호:</th>
												<td>${detail.s_id == 0 ? 'N/A' : detail.s_id}</td>
											</tr>
											<tr>
												<th>입고일</th>
												<td>${detail.in_date == null || detail.in_date == '' ? 'N/A' : detail.in_date }</td>
											</tr>
											<tr>
												<th>출고 예정일</th>
												<td>${detail.out_date == null || detail.out_date == '' ? 'N/A' : detail.out_date }</td>
											</tr>
											<tr>
												<th>재고 상태:</th>
												<td>${detail.s_status == null || detail.s_status == '' ? 'N/A' : detail.s_status}</td>
											</tr>
											<tr>
												<th>비고:</th>
												<td>${detail.etc == null || detail.etc == '' ? 'N/A' : detail.etc}</td>
											</tr>
										</c:forEach>
									</c:if>

								</table>
								<!-- 돌아가기 버튼 -->
								<div class="button-container"
									style="display: flex; justify-content: flex-end; margin-top: 20px;">
									<c:forEach var="dto" items="${detail}">
										<button type="button"
											onclick="location.href='${contextPath}/stock/stocklist'"
											class="btn btn-outline-primary">목록</button>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<footer>
		<%@include file="../include/footer.jsp"%>
	</footer>

	<%@ include file="../include/plugin.jsp"%>
	<!-- jQuery 먼저 로드 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		
	</script>
</body>

</html>
