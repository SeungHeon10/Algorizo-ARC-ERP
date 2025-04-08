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
			<section class="section">
				<div class="card" style="width:600px;">
					<div class="card-header">
						<h4 class="card-title">Basic Inputs</h4>
					</div>
					<div class="card-body" style="width: 1000px;">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
							<label>계약 코드</label> <input type="text" name="cr_code"
								class="form-control" value="${contract.cr_code}" readonly="readonly" />
						</div>
								<div class="form-group">
							<label>등록 일자</label> <input type="text" name="cr_regdate"
								class="form-control" value="${contract.cr_regdate}" readonly="readonly" />
						</div>
								<div class="form-group">
							<label>계약명</label> <input type="text" name="cr_name"
								class="form-control" value="${contract.cr_name }" readonly="readonly" />
						</div>
								<div class="form-group">
							<label>거래처명</label> <input type="text" name=""
								class="form-control" value="" readonly="readonly" />
						</div>
								<div class="form-group">
							<label>진행 상태</label> <input type="text" name="cr_state"
								class="form-control" value="${contract.cr_state}" readonly="readonly" />
						</div>
								<div class="form-group">
							<label>담당자</label> <input type="text" name=""
								class="form-control" value="" readonly="readonly" />
						</div>
								

							</div>

						</div>
						<div class="col-sm-12" style="margin-top: 50px; margin-left: 250px;">
							<a href="${contextPath}/contract/update?cr_code=${contract.cr_code}" class="btn btn-outline-danger me-1 mb-1">수정</a>
							<a href="${contextPath}/contract/delete?cr_code=${contract.cr_code}"  class="btn btn-outline-danger me-1 mb-1"  
							onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
							<a href="${contextPath }/contract/list" class="btn btn-outline-primary me-1 mb-1" >목록으로</a>
						</div>
					</div>
				</div>
			</section>
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