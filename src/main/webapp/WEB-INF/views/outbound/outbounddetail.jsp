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
								<strong></strong>
							</div>
							<div class="card-body">
								<table class="table table-striped" id="table1">

									<!-- detail 객체가 null일 경우 처리 -->
									<c:if test="${empty detail}">
										<p class="text-red-500 mt-4">입고 정보를 찾을 수 없습니다.</p>
									</c:if>

									<!-- detail 객체가 null이 아닐 경우 정보 출력 -->
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
												<th>출고 수량:</th>
												<td>${detail.out_quantity == 0 ? 'N/A' : detail.out_quantity}</td>
											</tr>
											<tr>
												<th>회사명:</th>
												<td>${detail.company.cp_name == null || detail.company.cp_name == '' ? 'N/A' : detail.company.cp_name}</td>
											</tr>
											<tr>
												<th>담당자:</th>
												<td>${detail.company.cp_manager == null || detail.company.cp_manager == '' ? 'N/A' : detail.company.cp_manager}</td>
											</tr>
											<tr>
												<th>fax:</th>
												<td>${detail.company.cp_fax == null || detail.company.cp_fax == '' ? 'N/A' : detail.company.cp_fax}</td>
											</tr>
											<tr>
												<th>출고 날짜:</th>
												<td>${detail.out_date == null || detail.out_date == '' ? 'N/A' : detail.out_date}</td>
											</tr>
											<tr>
												<th>수정 날짜:</th>
												<td>${detail.update_date == null || detail.update_date == '' ? 'N/A' : detail.update_date}</td>
											</tr>
											<tr>
												<th>출고 상태:</th>
												<td>${detail.out_status == null || detail.out_status == '' ? 'N/A' : detail.out_status}</td>
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
									<c:forEach var="detail" items="${detail}">
										<button type="button"
											onclick="location.href='${contextPath}/outbound/outboundlist'"
											class="btn btn-outline-primary">목록</button>
										<c:if test="${not empty detail.out_id}">
											<button type="button"
												onclick="location.href='outboundupdate?out_id=${detail.out_id}'"
												class="btn btn-outline-warning">수정</button>
										</c:if>
										<form action="${contextPath}/outbound/outbounddelete"
											method="post" class="inline-form">
											<input type="hidden" name="out_id" value="${detail.out_id}">
											<button type="submit" class="btn btn-outline-danger"
												onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
										</form>
										<button type="button" class="btn btn-outline-primary" onclick="location.href='${contextPath}/outboundReceipt/insertOutboundReceipt?out_id=${detail.out_id }'">거래명세서 등록</button>
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
