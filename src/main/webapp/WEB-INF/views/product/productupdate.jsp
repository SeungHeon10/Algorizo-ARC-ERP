<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>

<body>
	<div id="app">
		<%@include file="../include/left_column.jsp"%>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i></a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>${product.p_name}</h3>
							<p class="text-subtitle text-muted"></p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/product/productlist">Product List</a></li>
									<li class="breadcrumb-item active" aria-current="page">Product Update</li>
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
								<div class="card-content">
									<div class="card-body">
										<form class="form form-vertical" action="${contextPath}/product/productupdate" method="post">
											<div class="form-body">
												<div class="row">
													<div class="col-12">
														<div class="form-group d-flex justify-content-between"><br>
															<!-- 품목 사진 -->
															<c:choose>
																<c:when test="${product.p_sctg == '오디오/앰프'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/오디오앰프.jpg" alt="오디오/앰프 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '시트'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/시트.jpg" alt="시트 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '계기판'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/계기판.jpg" alt="계기판 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '공조기'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/공조기.jpg" alt="공조기 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '핸들'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/핸들.jpg" alt="핸들 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '기타부품'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/기타부품.jpg" alt="기타부품 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '테일램프'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/테일램프.jpg" alt="테일램프 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '헤드라이트'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/헤드라이트.jpg" alt="헤드라이트 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '사이드미러'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/사이드미러.jpg" alt="사이드미러 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == 'ABS'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/ABS.jpg" 	alt="ABS 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == 'ECU'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/ECU.jpg" alt="ECU 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == 'TCU'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/TCU.jpg" alt="TCU 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '카메라'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/카메라.jpg" alt="카메라 이미지" 	style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:when test="${product.p_sctg == '에어백'}">
																	<img src="${contextPath}/resources/static/dist/assets/images/에어백.jpg" alt="에어백 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:when>
																<c:otherwise>
																	<img src="${contextPath}/resources/static/dist/assets/images/이미지준비중.jpg" alt="기본 이미지" style="width: 150%; max-width: 300px; display: block; margin: 0 auto;">
																</c:otherwise>
															</c:choose>


															<input type="hidden" name="p_id" value="${product.p_id }">
															<!-- 품목번호와 품목이름 -->
															<div class="d-flex flex-column"
																style="width: 65%; margin-left: 20px;">
																<div class="form-group">
																	<label for="first-name-vertical">대분류</label> 
																	<input type="text" class="form-control" name="p_lctg" value="${product.p_lctg }" readonly>
																</div>
																<br>
																<div class="form-group">
																	<label for="first-name-vertical">중분류</label> 
																	<input type="text" class="form-control" name="p_mctg" value="${product.p_mctg }" readonly>
																</div>
																<br>
																<div class="form-group">
																	<label for="first-name-vertical">소분류</label> 
																	<input type="text" class="form-control" name="p_sctg" value="${product.p_sctg }" readonly>
																</div>
															</div>
														</div>

														<!-- 아래에 이메일, 모바일, 비밀번호 항목 배치 -->
														<div class="row">
															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">품목번호</label> 
																	<input type="text" class="form-control" name="p_id" value="${product.p_id }" readonly>
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">품목코드</label> 
																	<input type="text" class="form-control" name="p_code" value="${product.p_code }" readonly>
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">품목명</label> 
																	<input type="text" class="form-control" name="p_name" value="${product.p_name }" required>
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">제품소개</label> 
																	<input type="text" class="form-control" name="p_content" value="${product.p_content }" required>
																</div>
															</div>


															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">판매단가</label> 
																	<input type="number" name="p_price" class="form-control" value="${product.p_price }" min="0" required />
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="col-md-4">
																	<label>공급업체</label>
																</div>
																<section class="basic-choices">
																	<div class="form-group">
																		<select class="choices form-select"
																			name="company_cp_id" required>
																			<option value="" disabled>선택</option>
																			<c:forEach var="company" items="${companylist}">
																				<option value="${company.cp_id}"
																					<c:if test="${company.cp_id == product.company_cp_id}">selected</c:if>>
																					${company.cp_name}</option>
																			</c:forEach>
																		</select>
																	</div>
																</section>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">입고일</label> 
																	<input type="text" class="form-control" name="p_regdate" value="${product.p_regdate }" readonly>
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">수정일</label> 
																	<input type="text" class="form-control" name="p_moddate" value="${product.p_moddate != null && !product.p_moddate.isEmpty() ? product.p_moddate : 'N/A'}" readonly>
																</div>
															</div>
															
															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">작성자</label>
																	<p class="form-control" readonly>${product.member_m_name}
																		(${product.dept_team})</p>
																</div>
															</div>

															<div class="col-md-6 col-12">
																<div class="form-group">
																	<label for="email-id-vertical">수정자</label> 
																	<input type="text" value="${member.m_name} (${product.dept_team})" class="form-control" readonly> 
																	<input type="hidden" name="modifier_m_id" value="${member.m_id}"> <input type="hidden" name="modifier_m_name" value="${member.m_name}">
																</div>
															</div>

														</div>

														<div class="col-12 d-flex justify-content-end">
															<button type="submit" class="btn btn-outline-warning me-1 mb-1">수정완료</button>
															<button type="button" onclick="location.href='productlist'" class="btn btn-outline-primary me-1 mb-1">목록</button>
															<button type="button" onclick="location.href='/erp/product/productdelete?p_id=${product.p_id}'" class="btn btn-outline-danger me-1 mb-1">삭제</button>
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