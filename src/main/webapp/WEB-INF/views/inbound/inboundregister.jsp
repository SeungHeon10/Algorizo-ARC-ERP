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

		<div class="col-md-6 col-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">입고 등록</h4>
				</div>
				<div class="card-content">
					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/inbound/inboundregister"
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
									<div class="col-12">
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
													name="member_m_id" disabled>
													<option value="${sessionScope.m_id}">
														${sessionScope.m_name}</option>
												</select> <input type="hidden" name="member_m_id"
													value="${sessionScope.m_id}" />
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">입고 수량</label>
											<div class="position-relative" style="width: 20%">
												<div class="form-control-icon"
													style="position: absolute; top: 50%; transform: translateY(-50%); z-index: 2; color: #607080;">
													<i class="bi bi-cash"></i>
												</div>

												<input
													style="display: block; width: 100%; padding: .375rem .75rem .375rem 3rem; font-size: 1rem; font-weight: 400; line-height: 1.5; color: #607080; background-color: #fff; background-clip: padding-box; border: 1px solid #dce7f1; appearance: none; border-radius: .25rem; transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out; position: relative; z-index: 1;"
													type="number" name="in_quantity" id="in_quantity"
													required="required" />
											</div>


										</div>
									</div>
									<div class="col-12">
										<div class="form-group has-icon-left">
											<label for="first-name-icon">입고 상태</label>
											<div class="position-relative">
												<div class="form-control-icon">
													<i class="bi bi-grid-1x2-fill"></i>
												</div>
												<select class="form-control" name="in_status" id="in_status">
													<option value="입고 대기">입고 대기</option>
													<option value="입고 완료">입고 완료</option>
													<option value="입고 중">입고 중</option>
													<option value="입고 취소">입고 취소</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-12">
										<label for="etc" style="display: flex;">기타:</label>
										<textarea style="resize: none;" name="etc" id="etc"></textarea>
									</div>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit" class="btn btn-outline-primary">등록</button>
										<button type="reset" class="btn btn-outline-secondary">초기화</button>
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
		<%@ include file="../include/footer.jsp"%>
	</footer>
	<!-- 플러그인 -->
	<%@ include file="../include/plugin.jsp"%>
</body>

</html>