<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

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
						<h3>발주 수정</h3>
						<p class="text-subtitle text-muted"></p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a
									href="${contextPath}/order/list">발주 조회</a></li>
								<li class="breadcrumb-item active" aria-current="page">발주
									수정</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<form action="${contextPath}/order/update" method="post">
				<!-- 주요 ID 값들을 hidden 필드로 추가 -->
				<input type="hidden" name="company.cp_id" value="${order.company.cp_id}" />
				<input type="hidden" name="product.p_id" value="${order.product.p_id}" />
				<input type="hidden" name="o_code" value="${order.o_code}" />
				
				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">발주 상세</h4>
						</div>
						<div class="card-body">
							<div style="display: flex; justify-content: space-between;">
								<!-- 공급받는 자 (자사) -->
								<div style="width: 48%;">
									<h5>공급받는 자 (자사)</h5>
									<table class="table">
										<thead>
											<tr>
												<th>회사명</th>
												<th>주소</th>
												<th>FAX</th>
												<th>업태</th>
												<th>대표자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Algorizo</td>
												<td>수원시 팔달구</td>
												<td>031-213-6912</td>
												<td>유통, 판매업</td>
												<td>빡쌍쭌</td>
											</tr>
										</tbody>
									</table>
								</div>

								<!-- 공급자 (거래처) -->
								<div style="width: 48%;">
									<h5>공급자 (거래처)</h5>
									<table class="table">
										<thead>
											<tr>
												<th>회사명</th>
												<th>주소</th>
												<th>FAX</th>
												<th>업태</th>
												<th>담당자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${order.company.cp_name}</td>
												<td>${order.company.cp_addr}</td>
												<td>${order.company.cp_fax}</td>
												<td>${order.company.cp_ctg}</td>
												<td>${order.company.cp_manager}
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!-- 상품 정보 -->
							<h5>발주 정보</h5>
							<table class="table">
								<thead>
									<tr>
										<th>발주 제품</th>
										<th>발주 코드</th>
										<th>납기 일자</th>
										<th>가격</th>
										<th>수량</th>
										<th>총 금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${order.product.p_name}</td>
										<td>${order.o_code}</td>
										<td>${order.o_delivery}</td>
										<td><fmt:formatNumber value="${order.product.p_price}"
												pattern="#,###" /></td>
										<td><div class="form-group">
												<input type="text" name="o_qty" class="form-control"
													value="${order.o_qty}" />
											</div></td>
										<td><fmt:formatNumber
												value="${order.product.p_price* order.o_qty}"
												pattern="#,###" /></td>
									</tr>
								</tbody>
							</table>
							<div class="col-md-12 mb-6">
								<h6>진행 상태</h6>
								<fieldset class="form-group">
									<select class="form-select" id="o_state" name="o_state"
										style="width: 150px;">
										<option value="진행" ${order.o_state == '진행' ? 'selected' : ''}>진행</option>
										<option value="완료" ${order.o_state == '완료' ? 'selected' : ''}>완료</option>
										<option value="보류" ${order.o_state == '보류' ? 'selected' : ''}>보류</option>
									</select>
								</fieldset>
							</div>
							<div class="col-sm-12 d-flex justify-content-end">
								<button type="submit" class="btn btn-outline-primary me-1 mb-1">저장</button>
								<a href="${contextPath}/order/list"
									class="btn btn-outline-primary me-1 mb-1">목록으로</a>
							</div>
						</div>
					</div>
				</section>
			</form> <!-- 폼 태그 닫기 추가 -->
		</div>
	</div>

	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>

	<%@ include file="../include/plugin.jsp"%>
</body>
</html>