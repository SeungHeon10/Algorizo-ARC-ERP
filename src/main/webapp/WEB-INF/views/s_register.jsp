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
		<div class="col-md-6 col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">재고 등록</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/stock/s_register"
							method="post" class="form form-vertical">
							<div class="form-body">
								<div class="row">
									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">품목 선택</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-collection-fill"></i>
												</div>
												<select class="form-control" id="product_p_id"
													name="product_p_id">
													<c:forEach var="product" items="${product}">
														<option value="${product.p_id}">${product.p_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<!--  	<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">회사 선택</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-stack"></i>
												</div>
												<select class="form-control" id="company_cp_id"
													name="company_cp_id">
													<c:forEach var="company" items="${company}">
														<option value="${company.cp_id }">${company.cp_name }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">사원 선택</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-person"></i>
												</div>
												<select class="form-control" id="member_m_id"
													name="member_m_id">
													<c:forEach var="member" items="${member }">
														<option value="${member.m_id }">${member.m_name }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div> -->

									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="inbound_in_id">입고 선택</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-box-arrow-in-down"></i>
												</div>
												<select class="form-control" name="inbound_in_id"
													id="inbound_in_id" required>
													<c:forEach var="inbound" items="${inbound}">
														<option value="${inbound.in_id}">
															${inbound.in_date} - 수량: ${inbound.in_quantity}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>

									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="outbound_out_id">출고 선택</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-box-arrow-up"></i>
												</div>
												<select class="form-control" name="outbound_out_id"
													id="outbound_out_id" required>
													<option value="" selected>N/A</option>
													<c:forEach var="outbound" items="${outbound}">
														<option value="${outbound.out_id}">
															${outbound.update_date} - 수량: ${outbound.out_quantity}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>


									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">재고 상태</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-grid-1x2-fill"></i>
												</div>
												<select class="form-control" name="s_status" id="s_status">
													<option value="재고 충족">재고 충족</option>
													<option value="재고 부족">재고 부족</option>
													<option value="재고 없음">재고 없음</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-12">
										<label for="etc" style="display: flex;">기타:</label>
										<textarea style="resize: none;" name="etc" id="etc"></textarea>
									</div>
									<label for="inbound_in_id"></label> <select
										name="inbound_in_id" id="inbound_in_id" hidden>
										<c:forEach var="inbound" items="${inbound }">
											<option value="${inbound.in_id}"></option>
										</c:forEach>
									</select> <br> <label for="outbound_out_id"></label> <select
										name="outbound_out_id" id="outbound_out_id" hidden>
										<c:forEach var="outbound" items="${outbound }">
											<option value="${outbound.out_id}"></option>
										</c:forEach>
									</select> <br>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit" class="btn btn-primary me-1 mb-1">등록</button>
										<button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="include/footer.jsp"%>
	</footer>
	<!-- 플러그인 -->
	<%@ include file="include/plugin.jsp"%>
</body>

</html>