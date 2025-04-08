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
						<h3>${company.cp_name} 수정</h3>
						<p class="text-subtitle text-muted">공급업체 수정 화면입니다</p>
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
						<h4 class="card-title"></h4>
					</div>

					<div class="card-body">
						<form class="form form-vertical" action="companyupdate" method="post">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="basicInput ">등록번호</label>
										<input type="text" class="form-control" name="cp_id" value="${company.cp_id }"readonly>
									</div>
									<div class="form-group">
										<label for="basicInput">회사명</label>
										<input type="text" class="form-control" name="cp_name" value="${company.cp_name }"readonly>
									</div>
									<div class="form-group">
										<label for="basicInput">대표전화</label>
										<input type="text" class="form-control" name="cp_pno" value="${company.cp_pno }">
									</div>
									<div class="form-group">
										<label for="basicInput">등록일</label>
										<input type="text" class="form-control" name="cp_regdate" value="${company.cp_regdate }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="basicInput">업종</label>
										<input type="text" class="form-control" name="cp_ctg" value="${company.cp_ctg }">
									</div>
									<div class="form-group">
										<label for="basicInput">대표이사</label>
										<input type="text" class="form-control" name="cp_manager" value="${company.cp_manager }">
									</div>
									<div class="form-group">
										<label for="basicInput">팩스</label>
										<input type="text" class="form-control" name="cp_fax" value="${company.cp_fax }">
									</div>
									<div class="form-group">
										<label for="basicInput">수정일</label>
										<input type="text" class="form-control" name="cp_moddate" value="${company.cp_moddate }" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="basicInput">이메일</label>
									<input type="text" class="form-control" name="cp_mail" value="${company.cp_mail }">
								</div>
								<div class="form-group">
									<label for="basicInput">회사주소</label>
										<input type="text" class="form-control" name="cp_addr" value="${company.cp_addr }">
								</div>
								<div class="col-12 d-flex justify-content-end">
									<button type="submit" class="btn btn-primary me-1 mb-1">수정완료</button>
									<button type="button"
									onclick="location.href='companydelete?cp_id=${company.cp_id}'"
									class="btn btn-danger me-1 mb-1">삭제</button>
									<button type="button" onclick="location.href='companylist'"
										class="btn btn-danger me-1 mb-1">목록</button>
								</div>
							</div>
					</div>
					</form>
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