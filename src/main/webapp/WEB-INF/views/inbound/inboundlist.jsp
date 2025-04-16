<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3 style="margin-left: 13px; margin-bottom: 50px;">입고 조회</h3>
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
				<div class="card-header">
						<h4 class="card-title"></h4>
					</div>
					<div class="card-body">
						<table class="table table-striped" id="table1">
							<thead>
								<tr>
									<th class="text-center">입고ID</th>
									<th class="text-center">품목 코드</th>
									<th class="text-center">품목 이름</th>
									<th class="text-center">입고 수량</th>
									<th class="text-center">입고일자</th>
									<th class="text-center">담당자</th>
									<th class="text-center">입고상태</th>
									<th class="text-center">✅</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="in" items="${list}">
									<tr>
										<td>${in.in_id == 0 ? 'N/A' : in.in_id}</td>
										<td><a href="inbounddetail?in_id=${in.in_id}">
												${in.product.p_code == null ? 'N/A' : in.product.p_code} </a></td>
										<td>${in.product.p_name == null || in.product.p_name == '' ? 'N/A' : in.product.p_name}</td>
										<td>${in.in_quantity == 0 ? 'N/A' : in.in_quantity}</td>
										<td>${in.in_date == null ? 'N/A' : in.in_date}</td>
										<td>${in.company.cp_manager == null || in.company.cp_manager == '' ? 'N/A' : in.company.cp_manager}</td>
										<c:set var="in_status"
											value="${in.in_status == null || in.in_status == '' ? 'N/A' : in.in_status}" />
										<td><c:choose>
												<c:when test="${in_status == '입고 확정 대기'}">
													<span class="badge bg-primary">입고 확정 대기</span>
												</c:when>
												<c:when test="${in_status == '입고 완료'}">
													<span class="badge bg-success">입고 완료</span>
												</c:when>
												<c:when test="${in_status == '입고 대기'}">
													<span class="badge bg-warning">입고 대기</span>
												</c:when>
												<c:when test="${in_status == '입고 실패'}">
													<span class="badge bg-danger">입고 실패</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-secondary">상태 미정</span>
												</c:otherwise>
											</c:choose> 
											<c:choose>
											    <c:when test="${in.inspection != null && (in.inspection.i_id != null || in.inspection.i_id == 0)}">
											        <c:set var="i_id" value="${in.inspection.i_id}" />
											    </c:when>
											    <c:otherwise>
											        <c:set var="i_id" value="0" />
											    </c:otherwise>
											</c:choose>
											<c:choose>
											    <c:when test="${in.stock != null && in.stock.s_id != null}">
											        <c:set var="s_id" value="${in.stock.s_id}" />
											    </c:when>
											    <c:otherwise>
											        <c:set var="s_id" value="0" />
											    </c:otherwise>
											</c:choose>
										</td>
										<td>
											<button type="button"
												style="border: none; background: none; padding: 0;"
												onclick="showAlert('${in_status}', '${in.in_id}','${i_id}','${s_id }')">
												<span class="badge bg-secondary">입고 확정</span>
											</button>
										</td>
										<script>
											function showAlert(status, inId, i_id, s_id) {
												if (!inId || isNaN(inId)) {
											        alert('유효한 입고 ID가 아닙니다.');
											        return;
											    }
												 if (i_id === "" || i_id == null || isNaN(i_id)) {
											        alert('유효한 i_id가 아닙니다.');
											        return;
											    }
												 if (s_id === "" || s_id == null || isNaN(s_id)) {
												        alert('유효한 s_id가 아닙니다.');
												        return;
												    }
												let message = '';
												switch (status) {
													case '입고 완료':
														message = '이미 입고가 완료된 제품입니다.';
														break;
													case '입고 실패':
														message = '입고가 실패한 제품입니다. 다시 검수해 주세요.';
														break;
													case '입고 대기':
														message = '입고 대기 상태입니다. 검수를 먼저 진행해 주세요.';
														break;
													case '상태 미정':
														message = '입고 상태가 확인되지 않은 제품입니다. 다시 확인해 주세요.';
														break;
													case '입고 확정 대기':
														if (confirm('입고를 진행하시겠습니까?')) {
															// 입고 확정 프로세스
															processInboundConfirmation(inId,i_id,s_id);
														}
														return;
													default:
														message = '알 수 없는 상태입니다.';
												}
												if (message) {
													alert(message);
												}
											}

											function processInboundConfirmation(inId,i_id,s_id) {
												 console.log("Sending inId:", inId, "and i_id:", i_id, "and s_id:", s_id); // 확인
												    fetch(`${contextPath}/inbound/confirm`, {
												        method: 'POST',
												        headers: {
												            'Content-Type': 'application/json'
												        },
												        body: JSON.stringify({ in_id: inId, i_id: i_id, s_id: s_id})
												})
												.then(response => {
													if (response.ok) {
														alert('입고가 확정되었습니다.');
														location.reload(); // 페이지 새로고침
													} else {
														alert('입고 확정 중 오류가 발생했습니다.');
													}
												})
												.catch(error => {
													console.error('Error:', error);
													alert('서버와의 통신 중 문제가 발생했습니다.');
												});
											}
										</script>
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
		src="${contextPath}/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	<%@ include file="../include/plugin.jsp"%>
</body>
</html>
