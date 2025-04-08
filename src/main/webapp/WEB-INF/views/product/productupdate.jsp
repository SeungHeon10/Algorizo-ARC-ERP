<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>

<%-- <%
String p_name = request.getParameter("p_name");
String p_code = request.getParameter("p_code");
%> --%>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header">
					<div class="d-flex justify-content-between">
						<div class="logo">
							<a href="/erp"><img
								src="${contextPath }/resources/static/dist/assets/images/logo/logo.png"
								alt="Logo" srcset=""></a>
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<%@include file="../include/left_column.jsp"%>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
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
							<h3>${product.p_name} 품목 수정</h3>
							<p class="text-subtitle text-muted"></p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Form
										Layout</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>



				<!-- Basic Horizontal form layout section start -->
				<section id="basic-vertical-layouts">
					<div class="row match-height">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title"></h4>
								</div>
								<div class="card-content">
									<div class="card-body">
										<form class="form form-vertical" action="productupdate" method="post">
											<div class="form-body">
												<div class="row">
													<div class="col-12">
														<div class="form-group d-flex justify-content-between">
															<!-- 품목 사진 -->
															<c:choose>
																<c:when test="${product.p_sctg == '바퀴'}">
																	<img
																		src="${contextPath}/resources/static/dist/assets/images/wheel.jpg"
																		alt="바퀴 이미지"
																		style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '창문'}">
																	<img
																		src="${contextPath}/resources/static/dist/assets/images/window.jpg"
																		alt="창문 이미지"
																		style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '뚜껑'}">
																	<img
																		src="${contextPath}/resources/static/dist/assets/images/lid.jpg"
																		alt="뚜껑 이미지"
																		style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:otherwise>
																	<img
																		src="${contextPath}/resources/static/dist/assets/images/default.jpg"
																		alt="기본 이미지"
																		style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:otherwise>
															</c:choose>

															<!-- 품목번호와 품목이름 -->
															<input type="hidden" name="p_id" value="${product.p_id }">
															<div class="d-flex flex-column"
																style="width: 65%; margin-left: 20px;">
																<div class="form-group">
																	<label for="first-name-vertical">대분류</label>
																	<input type="text" class="form-control" name="p_lctg" value="${product.p_lctg }"readonly>
																</div>
																<br>
																<div class="form-group">
																	<label for="first-name-vertical">중분류</label>
																	<input type="text" class="form-control" name="p_mctg" value="${product.p_mctg }"readonly>
																</div>
																<br>
																<div class="form-group">
																	<label for="first-name-vertical">소분류</label>
																	<input type="text" class="form-control" name="p_sctg" value="${product.p_sctg }"readonly>
																</div>
															</div>
														</div>

														<!-- 아래에 이메일, 모바일, 비밀번호 항목 배치 -->
														<div class="form-group">
															<label for="email-id-vertical">품목번호</label>
															<input type="text" class="form-control" name="p_code" value="${product.p_id }"readonly>
														</div>
														<div class="form-group">
															<label for="email-id-vertical">품목코드</label>
															<input type="text" class="form-control" name="p_code" value="${product.p_code }"readonly>
														</div>

														<div class="col-md-2">
															<label>품목명</label>
														</div>
														<div class="col-md-10 form-group">
															<input type="text" class="form-control" name="p_name" value="${product.p_name }"
																required>
														</div>

														<div class="form-group">
															<label for="email-id-vertical">제품소개</label>
															<input type="text" class="form-control" name="p_content" value="${product.p_content }"
																required>
														</div>

														<div class="form-group">
															<label for="email-id-vertical">판매단가</label>
															<input type="text" class="form-control" name="p_price" value="${product.p_price }"
																required>
														</div>

														<div class="form-group">
															<label for="email-id-vertical">입고일</label>
															<input type="text" class="form-control" name="p_regdate" value="${product.p_regdate }"readonly>
														</div>

														<div class="form-group">
															<label for="email-id-vertical">수정일</label>
															<input type="text" class="form-control" name="p_moddate" value="${product.p_moddate }"readonly>
														</div>
														
														<div class="form-group">
															<label for="email-id-vertical">수정자</label> 
															<input type="text" value="${member.m_name} (${dept.team})" class="form-control" readonly>
														</div>

														<div class="col-12 d-flex justify-content-end">
															<button type="submit"
																class="btn btn-primary me-1 mb-1">수정완료</button>
															<button type="button"
																onclick="location.href='productlist'"
																class="btn btn-primary me-1 mb-1">목록</button>
															<button type="button"
																 onclick="location.href='/erp/product/productdelete?p_id=${product.p_id}'"
																class="btn btn-danger me-1 mb-1">삭제</button>
														</div>
													</div>
												</div>
										</form>
									</div>
								</div>
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