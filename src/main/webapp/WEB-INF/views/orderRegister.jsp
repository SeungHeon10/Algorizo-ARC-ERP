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
						<h3>발주 등록</h3>
						<p class="text-subtitle text-muted">Give textual form controls
							like input upgrade with custom styles, sizing, focus states, and
							more.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">Input</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">Basic Inputs</h4>
					</div>
					<form action="${contextPath}/order/register" method="post">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">

									<!-- Basic choices start -->
									<section class="basic-choices">

										<div class="row">
											<div class="col-md-12 mb-4">
												<h6>발주 제품</h6>
												<div class="form-group">
													<select class="choices form-select" name="product_p_id">
														<c:forEach var="product" items="${productList }">
															<option value="${product.p_id}">${product.p_name}</option>
														</c:forEach>
													</select>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 mb-4">
												<h6>발주 거래처</h6>
												<div class="form-group">
													<select class="choices form-select" name="company_cp_id">
														<c:forEach var="company" items="${companyList }">
															<option value="${company.cp_id}">${company.cp_name}</option>
														</c:forEach>
													</select>

												</div>
											</div>
										</div>

									</section>
									<!-- Basic choices end -->
									<div class="form-group">
										<label for="basicInput">발주 수량</label> <input type="number"
											class="form-control" name="o_qty" id="o_qty"
											placeholder="발주 수량 입력" required>
									</div>
									<div class="form-group">
										<label for="basicInput">발주 납기</label> <input type="date"
											class="form-control" name="o_delivery" id="o_delivery"  min="2024-04-01"
											placeholder="발주 납기 입력" required>
									</div>
											<div class="form-group">
										<label for="disabledInput">발주 코드</label> <input type="hidden"
											name="o_code" value="${nextOrderCode}"> <input
											type="text" class="form-control" id="o_code"
											disabled value="${nextOrderCode}">
									</div>



										<div class="form-group">
											<label for="disabledInput">담당자</label> <input type="text"
												class="form-control" id="m_name" name="m_name"
												value="${member.m_name}" disabled>
										</div>
										

										<input type="hidden" name="member_m_id"
											value="${sessionScope.m_id}">
									</div>
									<div class="col-sm-12 d-flex justify-content-end">
										<button type="submit"
											class="btn btn-outline-primary me-1 mb-1">등록</button>
										<a href="${contextPath }/order/list"
											class="btn btn-outline-primary me-1 mb-1">취소</a>
									</div>
								</div>
							</div>
						</div>
				</div>
			</section>
		</div>
		</form>
		<footer>
			<%@ include file="include/footer.jsp"%>
		</footer>
	</div>
	</div>
	<!-- 플러그인 -->
	<%@ include file="include/plugin.jsp"%>
	<script
		src="${contextPath }/resources/static/dist/assets/vendors/choices.js/choices.min.js"></script>

</body>

</html>