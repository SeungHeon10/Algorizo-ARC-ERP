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
						<h3>계약 정보</h3>
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
			<form action="${contextPath}/contract/update" method="post">
			<section class="section">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">Basic Inputs</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>계약 코드</label> <input type="text" name="cr_code"
										class="form-control" value="${contract.cr_code}"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<label>등록 일자</label> <input type="text" name="cr_regdate"
										class="form-control" value="${contract.cr_regdate}"
										readonly="readonly" />
								</div>
								<div class="form-group">
									<label>계약명</label> <input type="text" name="cr_name"
										class="form-control" value="${contract.cr_name}" />
								</div>

								<div class="col-md-6 mb-4">
									<h6>진행 상태</h6>
									<fieldset class="form-group">
										<select class="form-select" id="cr_state" name="cr_state">
											<option>진행</option>
											<option>완료</option>
											<option>보류</option>
										</select>
									</fieldset>
								</div>
								<div class="form-group">
									<label>담당자</label> <input type="text" name=""
										class="form-control" value="" readonly="readonly" />
								</div>


							</div>

						</div>
						<div class="buttons">
							<button type="submit" class="btn btn-primary">저장</button>
							<a href="${contextPath }/contract/list" class="btn btn-primary">목록으로</a>
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