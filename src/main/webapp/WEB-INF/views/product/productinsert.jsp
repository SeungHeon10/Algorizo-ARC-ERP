<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
</head>
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
					<h3>품목등록</h3><br>
				</div>
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextPath }/home">메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="${contextPath }/product/productlist">품목목록</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<!-- Basic Horizontal form layout section start -->
		<section id="basic-horizontal-layouts">
			<div class="row match-height">
				<div class="col-md-12 col-12">
					<div class="card">
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal" action="/erp/product/productinsert" method="post">
									<div class="form-body">
										<div class="row">
											<div class="col-md-4">
												<label>대분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="category" class="form-control" name="p_lctg" required>
													<option value="" disabled selected>선택</option>
													<option value="자동차">자동차 부품</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>중분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="subcategory" class="form-control" name="p_mctg" required>
													<option value="" disabled selected>선택</option>
													<option value="내장부품">내장부품</option>
													<option value="외장부품">외장부품</option>
													<option value="유닛&모듈">유닛&모듈</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>소분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="item" class="form-control" name="p_sctg" required>
													<option value="" disabled selected>선택</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>발주코드</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="hidden" name="p_code" value="${nextProductCode}"> 
												<input type="text" class="form-control" id="p_code" readonly="readonly" value="${nextProductCode}">
											</div>
											<div class="col-md-4">
												<label>품목명</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" name="p_name" required>
											</div>

											<div class="col-md-4">
												<label>제품소개</label>
											</div>
											<div class="col-md-8 form-group">
												<textarea class="form-control" name="p_content" rows="3"></textarea>
											</div>

											<div class="col-md-4">
												<label>판매단가</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="number" class="form-control" name="p_price" required>
											</div>

											<div class="col-md-4">
												<label>담당자</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" value="${member.m_name} (${dept.team})" readonly> 
												<input type="hidden" name="member_m_id" value="${member.m_id}">
												<input type="hidden" name="dept_d_id" value="${not empty dept.d_id ? dept.d_id : 0}">
											</div>

											<div class="col-md-4">
												<label>공급업체</label>
											</div>
											<div class="col-md-8 form-group">
											<section class="basic-choices">
												<div class="form-group">
													<select class="choices form-select" name="company_cp_id" required>
														<option value="" disabled selected>선택</option>
														<c:forEach var="company" items="${companylist}">
															<option value="${company.cp_id}">${company.cp_name}</option>
														</c:forEach>
													</select>
												</div>
											</section>
											</div>
											
											<div class="col-sm-12 d-flex justify-content-end">
												<button type="submit" class="btn btn-outline-primary">등록</button>
												<button type="reset" class="btn btn-outline-danger">초기화</button>
												<button type="submit" onclick="location.href='productlist'" class="btn btn-outline-primary">목록</button>
											</div>

										</div>
									</div>
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- // Basic multiple Column Form section end -->
	</div>

	<footer>
		<%@include file="../include/footer.jsp"%>
	</footer>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	document
			.getElementById("subcategory")
			.addEventListener(
					"change",
					function() {
						let subcategory = this.value;
						let itemSelect = document.getElementById("item");

						// 기존 옵션 초기화
						itemSelect.innerHTML = '<option value="" disabled selected>선택</option>';

						// 중분류에 따른 소분류 옵션 추가
						let options = {
							"내장부품" : [ "오디오/앰프", "시트", "계기판", "공조기", "핸들",
									"기타부품" ],
							"외장부품" : [ "테일램프", "헤드라이트", "사이드미러", "기타부품" ],
							"유닛&모듈" : [ "ABS", "ECU", "TCU", "에어백", "카메라",
									"기타부품" ]
						};

						if (options[subcategory]) {
							options[subcategory].forEach(function(item) {
								let option = document.createElement("option");
								option.value = item;
								option.textContent = item;
								itemSelect.appendChild(option);
							});
						}
					});
</script>

<%@include file="../include/plugin.jsp"%>


</body>
</html>
