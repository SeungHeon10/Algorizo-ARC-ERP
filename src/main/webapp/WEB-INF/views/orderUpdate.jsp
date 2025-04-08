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
			<form action="${contextPath}/order/update" method="post">
			<section class="section">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">Basic Inputs</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>발주 코드</label> <input type="text" name="o_code"
										class="form-control" value="${order.o_code}"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<label>등록 일자</label> <input type="text" name="o_regdate"
										class="form-control" value="${order.o_regdate}"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<label>발주 수량</label> <input type="number" name="o_qty"
										class="form-control" value="${order.o_qty}" />
								</div>

								<div class="col-md-6 mb-4">
									<h6>진행 상태</h6>
									<fieldset class="form-group">
										<select class="form-select" id="o_state" name="o_state">
											<option>진행</option>
											<option>완료</option>
											<option>보류</option>
										</select>
									</fieldset>
								</div>
								<div class="form-group">
									<label>담당자</label> <input type="text" name="${order.member.m_name }"
										class="form-control" value="${order.member.m_name }" readonly="readonly" />
								</div>


							</div>

						</div>
						<div class="buttons">
							<button type="submit" class="btn btn-primary">저장</button>
							<a href="${contextPath }/order/list" class="btn btn-primary">목록으로</a>
						</div>
					</div>
				</div>
			</section>
			</form>
		</div>


		<footer>
			<%@ include file="include/footer.jsp"%>
		</footer>
	</div>
	</div>
	<!-- 플러그인 -->
	<%@ include file="include/plugin.jsp"%>
</body>

</html>