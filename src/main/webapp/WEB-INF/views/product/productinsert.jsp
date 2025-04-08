<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select - Mazer Admin Dashboard</title>

<!-- Include Choices CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/static/dist/assets/vendors/choices.js/choices.min.css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${contextPath}/resources/static/dist/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="${contextPath}/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="${contextPath}/resources/static/dist/assets/css/app.css">
<link rel="shortcut icon"
	href="${contextPath}/resources/static/dist/assets/images/favicon.svg"
	type="image/x-icon">
</head>

<body>
	<div id="app">
		<div id="main">

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Select</h3>
							<p class="text-subtitle text-muted">Customize the native
								&laquo;select&raquo; with custom CSS that changes the element’s
								initial appearance..</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Select</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- Basic choices start -->
				<section class="basic-choices">
					<div class="form-group">
						<select class="choices form-select">
							<option value="square">Square</option>
							<option value="rectangle">Rectangle</option>
							<option value="rombo">Rombo</option>
							<option value="romboid">Romboid</option>
							<option value="trapeze">Trapeze</option>
							<option value="traible">Triangle</option>
							<option value="polygon">Polygon</option>
						</select>
					</div>
				</section>
				<!-- Basic choices end -->

				<!-- Multiple choices start -->
				<section class="multiple-choices">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Multiple choices</h4>
								</div>
								<div class="card-content">
									<div class="card-body">
										<div class="row">
											<div class="col-md-6 mb-4">
												<h6>Basic Multiple choices</h6>
												<p>
													Use
													<code>.choices</code>
													class for basic choices control. Use
													<code>multiple="multiple"</code>
													attribute for multiple select box.
												</p>
												<div class="form-group">
													<select class="choices form-select" multiple="multiple">
														<option value="square">Square</option>
														<option value="rectangle" selected>Rectangle</option>
														<option value="rombo">Rombo</option>
														<option value="romboid">Romboid</option>
														<option value="trapeze">Trapeze</option>
														<option value="traible" selected>Triangle</option>
														<option value="polygon">Polygon</option>
													</select>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<h6>Multiple Select with Label</h6>
												<p>
													Use
													<code>optgroup</code>
													attribute for multiple select box with Label control.
												</p>
												<div class="form-group">
													<select class="choices form-select" multiple="multiple">
														<optgroup label="Figures">
															<option value="romboid">Romboid</option>
															<option value="trapeze" selected>Trapeze</option>
															<option value="triangle">Triangle</option>
															<option value="polygon">Polygon</option>
														</optgroup>
														<optgroup label="Colors">
															<option value="red">Red</option>
															<option value="green">Green</option>
															<option value="blue" selected>Blue</option>
															<option value="purple">Purple</option>
														</optgroup>
													</select>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<h6>Multiple Select with Remove Button</h6>
												<p>
													Use
													<code>.multiple-remove</code>
													attribute for multiple select box with remove button.
												</p>
												<div class="form-group">
													<select class="choices form-select multiple-remove"
														multiple="multiple">
														<optgroup label="Figures">
															<option value="romboid">Romboid</option>
															<option value="trapeze" selected>Trapeze</option>
															<option value="triangle">Triangle</option>
															<option value="polygon">Polygon</option>
														</optgroup>
														<optgroup label="Colors">
															<option value="red">Red</option>
															<option value="green">Green</option>
															<option value="blue" selected>Blue</option>
															<option value="purple">Purple</option>
														</optgroup>
													</select>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<h6>choices with Light Background Options</h6>
												<p>
													Use
													<code>.select-light-{colorName}</code>
													class for light background to selected Options.
												</p>
												<div class="form-group">
													<select class="choices form-select select-light-danger"
														multiple="multiple">
														<option value="square">Square</option>
														<option value="rectangle" selected>Rectangle</option>
														<option value="rombo">Rombo</option>
														<option value="romboid">Romboid</option>
														<option value="trapeze">Trapeze</option>
														<option value="traible" selected>Triangle</option>
														<option value="polygon">Polygon</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Multiple choices end -->
			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2021 &copy; Mazer</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class="text-danger"><i
								class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A.
								Saugi</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="${contextPath}/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${contextPath}/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

	<!-- Include Choices JavaScript -->
	<script
		src="${contextPath}/resources/static/dist/assets/vendors/choices.js/choices.min.js"></script>

	<script src="${contextPath}/resources/static/dist/assets/js/main.js"></script>
</body>

</html>
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
					<h3>품목등록</h3>
					<p class="text-subtitle text-muted">Multiple form layout you
						can use</p>
				</div>
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">자재관리</a></li>
							<li class="breadcrumb-item active" aria-current="page">품목등록</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>

		<!-- Basic Horizontal form layout section start -->
		<section id="basic-horizontal-layouts">
			<div class="row match-height">
				<div class="col-md-12 col-12">
					<!-- 화면 전체를 차지하도록 수정 -->
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">자재관리 | 품목등록</h4>
						</div>
						<div class="card-content">
							<div class="card-body">
								<form class="form form-horizontal"
									action="/erp/product/productinsert" method="post">
									<div class="form-body">
										<div class="row">
											<div class="col-md-2">
												<label>대분류</label>
											</div>
											<div class="col-md-10 form-group">
												<select id="category" class="form-control" name="p_lctg"
													required>
													<option value="" disabled selected>선택</option>
													<option value="자동차">자동차 부품</option>
												</select>
											</div>

											<div class="col-md-2">
												<label>중분류</label>
											</div>
											<div class="col-md-10 form-group">
												<select id="subcategory" class="form-control" name="p_mctg"
													required>
													<option value="" disabled selected>선택</option>
													<option value="내장부품">내장부품</option>
													<option value="외장부품">외장부품</option>
													<option value="유닛&모듈">유닛&모듈</option>
												</select>
											</div>

											<div class="col-md-2">
												<label>소분류</label>
											</div>
											<div class="col-md-10 form-group">
												<select id="item" class="form-control" name="p_sctg"
													required>
													<option value="" disabled selected>선택</option>
												</select>
											</div>

											<div class="col-md-2">
												<label>발주코드</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="hidden" name="p_code"
													value="${nextProductCode}"> <input type="text"
													class="form-control" id="p_code" readonly="readonly"
													value="${nextProductCode}">
											</div>

											<div class="col-md-2">
												<label>품목명</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="text" class="form-control" name="p_name"
													required>
											</div>

											<div class="col-md-2">
												<label>제품소개</label>
											</div>
											<div class="col-md-10 form-group">
												<textarea class="form-control" name="p_content" rows="3"></textarea>
											</div>

											<div class="col-md-2">
												<label>판매단가</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="number" class="form-control" name="p_price"
													required>
											</div>


											<div class="col-md-2">
												<label>작성일</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="text" class="form-control" name="p_regdate"
													readonly>
											</div>

											<div class="col-md-2">
												<label>수정일</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="text" class="form-control" name="p_moddate"
													readonly>
											</div>

											<div class="col-md-2">
												<label>담당자</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="text" class="form-control"
													value="${member.m_name}" readonly> <input
													type="hidden" name="member_m_id" value="${member.m_id}">
											</div>

											<div class="col-md-2">
												<label>담당부서</label>
											</div>
											<div class="col-md-10 form-group">
												<input type="text" class="form-control" value="${dept.team}"
													readonly> <input type="hidden" name="dept_d_id"
													value="${dept.d_id}">
											</div>

											<div class="col-sm-12 d-flex justify-content-end">
												<button type="submit" class="btn btn-primary me-1 mb-1">품목등록</button>
												<button type="button"
													onclick="location.href='product/productlist'"
													class="btn btn-primary me-1 mb-1">목록</button>
												<button type="reset"
													class="btn btn-light-secondary me-1 mb-1">초기화</button>
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
