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
							<h3>공급업체 등록</h3>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/home">메인화면</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a href="${contextPath }/company/companylist">업체목록</a></li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<section id="basic-horizontal-layouts">
				<div class="row match-height">
					<div class="col-12">
						<div class="card">
							<div class="card-content">
								<div class="card-body">
									<form class="form form-horizontal" action="companyinsert" method="post">
										<div class="form-body">
											<div class="row">
												<div class="col-md-1">
													<label>회사명</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<input type="text" class="form-control" placeholder="Company" id="cp_name" name="cp_name" required>
															<div class="form-control-icon">
																<svg class="bi" width="1em" height="1em" fill="currentColor">
             													    <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#filter-left" />
           													    </svg>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-1">
													<label>업종</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<select class="form-control" id="cp_ctg" name="cp_ctg" required>
																<option value="">선택</option>
																<option value="제조업">제조업</option>
																<option value="도소매업">도소매업</option>
																<option value="건설업">건설업</option>
																<option value="운송업">운송업</option>
																<option value="IT업">IT업</option>
																<option value="서비스업">서비스업</option>
																<option value="금융업">금융업</option>
																<option value="기타">기타</option>
															</select>
															<div class="form-control-icon">
																<svg class="bi" width="1em" height="1em" fill="currentColor">
												                    <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#clipboard-minus" />
												                </svg>
															</div>
														</div>
													</div>
												</div>


												<div class="col-md-1">
													<label>대표명</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<input type="text" class="form-control"
																placeholder="Representative" id="cp_manager"
																name="cp_manager" required>
															<div class="form-control-icon">
																<svg class="bi" width="1em" height="1em" fill="currentColor">
																	<use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#person" />
           													    </svg>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-1">
													<label>대표번호</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<input type="text" class="form-control" placeholder="Mobile" id="cp_pno" name="cp_pno" required>
															<div class="form-control-icon">
																<i class="bi bi-phone"></i>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-1">
													<label>이메일</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<input type="email" class="form-control" placeholder="Email" id="cp_mail" name="cp_mail" required>
															<div class="form-control-icon">
																<i class="bi bi-envelope"></i>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-1">
													<label>팩스번호</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="position-relative">
															<input type="text" class="form-control" placeholder="Fax" id="cp_fax" name="cp_fax">
															<div class="form-control-icon">
																<svg class="bi" width="1em" height="1em" fill="currentColor">
             													    <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#file-earmark" />
           														</svg>
															</div>
														</div>
													</div>
												</div>

												<div class="col-md-1">
													<label>주소</label>
												</div>
												<div class="col-md-11">
													<div class="form-group has-icon-left">
														<div class="d-flex align-items-center">
															<div class="position-relative flex-grow-1 me-2">
																<input type="text" class="form-control" placeholder="Address" id="cp_addr" name="cp_addr" required>
																<div class="form-control-icon">
																	<svg class="bi" width="1em" height="1em" fill="currentColor">
												                        <use xlink:href="${contextPath }/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#house" />
												                    </svg>
																</div>
															</div>
															<button type="button" class="btn btn-outline-secondary" onclick="execDaumPostcode()">주소 검색</button>
														</div>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="col-12 d-flex justify-content-end">
											<button type="submit" class="btn btn-outline-primary">업체등록</button>
											<button type="button" onclick="location.href='companylist'" class="btn btn-outline-primary">목록</button>
											<button type="reset" class="btn btn-outline-danger">초기화</button>
										</div>
									</form>
								</div>
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 도로명 주소 or 지번 주소 중 선택된 걸 사용
					var fullAddr = data.roadAddress || data.jibunAddress;
					document.getElementById('cp_addr').value = fullAddr;
				}
			}).open();
		}
	</script>

</body>

</html>