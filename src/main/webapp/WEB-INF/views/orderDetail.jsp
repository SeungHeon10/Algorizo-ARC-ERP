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
						<h3>발주 정보</h3>
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
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>발주 코드</label> <p class="form-control-static">${order.o_code}</p>
								</div>
								<div class="form-group">
									<label>등록 일자</label> <p class="form-control-static">${order.o_regdate}</p>
								</div>
								<div class="form-group">
									<label>발주 제품</label> <input type="text" name="product.p_name"
										class="form-control" value="${order.product.p_name}" readonly />
								</div>
								<div class="form-group">
									<label>발주 수량</label> <input type="text" name="o_qty"
										class="form-control" value="${order.o_qty}" readonly />
								</div>
								<div class="form-group">
									<label>발주 단가</label> <input type="text" name="product.p_price"
										class="form-control" value="${order.product.p_price}" readonly />
								</div>
								<div class="form-group">
									<label>Total</label> <input type="text" name=""
										class="form-control"
										value="${order.product.p_price * order.o_qty}" readonly />
								</div>
								<div class="form-group">
									<label>현재고</label> <input type="text" name="stock.s_quantity"
										class="form-control" value="${order.stock.s_quantity}"
										readonly />
								</div>
								<div class="form-group">
									<label>납기 일자</label> <input type="text" name="order.o_delivery"
										class="form-control" value="${order.o_delivery}" readonly />
								</div>
								<div class="form-group">
									<label>발주 거래처</label> <input type="text" name="company.cp_name"
										class="form-control" value="${order.company.cp_name}" readonly />
								</div>
								<div class="form-group">
									<label>진행 상태</label> <input type="text" name="o_state"
										class="form-control" value="${order.o_state}" readonly />
								</div>
								<div class="form-group">
									<label>담당자</label> <p class="form-control-static">${order.member.m_name }</p>
								</div>
								<div class="form-group">
									<label>담당 부서</label> <p class="form-control-static">${order.dept.team }</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12  d-flex justify-content-end">
							<a href="${contextPath}/order/update?o_code=${order.o_code}"
								class="btn btn-outline-danger me-1 mb-1">수정</a> <a
								href="${contextPath}/order/delete?o_code=${order.o_code}"
								class="btn btn-outline-danger me-1 mb-1"
								onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a> <a
								href="${contextPath }/order/list"
								class="btn btn-outline-primary me-1 mb-1">목록으로</a>
								<button class="btn btn-outline-primary me-1 mb-1" onclick="downloadPdf()">PDF 다운로드</button>
						</div>
					</div>
				</div>
			</section>
		</div>
<script>
function downloadPdf() {
    let o_code = "${order.o_code}";
    let product_name = "${order.product.p_name}";
    let o_qty = "${order.o_qty}";
    let p_price = "${order.product.p_price}";

    let url = "${contextPath}/order/downloadPdf?o_code=" + encodeURIComponent(o_code) +
              "&product_name=" + encodeURIComponent(product_name) +
              "&o_qty=" + encodeURIComponent(o_qty) +
              "&p_price=" + encodeURIComponent(p_price);

    window.location.href = url;
}
</script>

		<footer>
			<%@ include file="include/footer.jsp"%>
		</footer>
	</div>
	</div>
	<!-- 플러그인 -->
	<%@ include file="include/plugin.jsp"%>
</body>

</html>