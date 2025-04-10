<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	<div id="app">
		<%@include file="../include/left_column.jsp"%>
	</div>
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
						<h3>입고 수정</h3>
						<p class="text-subtitle text-muted">입고 수정 화면입니다</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/home">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">Input</li>
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
						<form class="form form-vertical" action="inboundupdate"
							method="post">
							<div class="row">
								<div class="col-md-6">
									<c:forEach var="up" items="${up}">
										<div class="form-group">
											<label for="basicInput ">입고 번호</label> <input type="text"
												class="form-control" name="in_id" value="${up.in_id }"
												readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">품목 명</label> <input type="text"
												class="form-control" name="p_name"
												value="${up.product.p_name }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">품목 코드</label> <input type="text"
												class="form-control" name="p_code"
												value="${up.product.p_code }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">회사 명</label> <input type="text"
												class="form-control" name="cp_name"
												value="${up.company.cp_name }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">담당자</label> <input type="text"
												class="form-control" name="cp_manager"
												value="${up.company.cp_manager }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">fax</label> <input type="text"
												class="form-control" name="cp_fax"
												value="${up.company.cp_fax }" readonly>
										</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="basicInput">입고 수량</label> <input type="text"
											class="form-control" name="in_quantity" id="in_quantity"
											value="${up.in_quantity}">
									</div>
									<div class="form-group">
										<label for="basicInput">입고일</label> <input type="text"
											class="form-control" name="in_date" value="${up.in_date }"
											readonly>
									</div>
									<div class="form-group">
										<label for="basicInput">입고 수정일</label> <input type="date"
											class="form-control" name="update_date"
											value="${up.update_date }">
									</div>
									<div class="form-group">
										<label for="basicInput">입고 상태</label> <select name="in_status"
											id="in_status" class="form-control">
											<option value="입고 대기">입고 대기</option>
											<option value="입고 중">입고 중</option>
											<option value="입고 취소">입고 취소</option>
											<option value="입고 완료">입고 완료</option>
										</select> <span class="tooltip">입고 상태를 선택하세요.</span>
									</div>
									<div class="form-group">
										<label for="basicInput">비고</label> <input type="text"
											class="form-control" name="etc" value="${up.etc }">
									</div>
									</c:forEach>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit" class="btn btn-outline-primary">수정완료</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>


		</div>

		<footer>
			<%@include file="../include/footer.jsp"%>
		</footer>
	</div>
	</div>
	<%@include file="../include/plugin.jsp"%>
</body>

</html>