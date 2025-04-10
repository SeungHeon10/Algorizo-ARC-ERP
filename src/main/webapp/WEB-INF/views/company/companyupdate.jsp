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
				class="bi bi-justify fs-3"></i></a>
		</header>

		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>${company.cp_name}</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/home">메인화면</a></li>
								<li class="breadcrumb-item active" aria-current="page"><a
									href="${contextPath }/company/companylist">업체목록</a></li>
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
										<label for="basicInput ">등록번호</label> <input type="text" class="form-control" name="cp_id" value="${company.cp_id }" readonly>
									</div>
									<div class="form-group">
										<label for="basicInput">회사명</label> <input type="text" class="form-control" name="cp_name" value="${company.cp_name }" required>
									</div>
									<div class="form-group">
										<label for="basicInput">대표전화</label> <input type="text" class="form-control" name="cp_pno" value="${company.cp_pno }" required>
									</div>
									<div class="form-group">
										<label for="basicInput">등록일</label> <input type="text" class="form-control" name="cp_regdate" value="${company.cp_regdate }" readonly>
									</div>
								</div>
								<div class="col-md-6">
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

									<div class="form-group">
										<label for="basicInput">대표이사</label> <input type="text" class="form-control" name="cp_manager" value="${company.cp_manager }" required>
									</div>
									<div class="form-group">
										<label for="basicInput">팩스</label> <input type="text" class="form-control" name="cp_fax" value="${company.cp_fax }">
									</div>
									<div class="form-group">
										<label for="basicInput">수정일</label> <input type="text" class="form-control" name="cp_moddate" value="${company.cp_moddate }" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="basicInput">이메일</label> 
									<input type="text" class="form-control" name="cp_mail" value="${company.cp_mail }" required>
								</div>
								<div class="form-group">
									<label for="cp_addr">회사주소</label>
									<div class="input-group">
										<input type="text" class="form-control" id="cp_addr" name="cp_addr" value="${company.cp_addr }" required readonly>
										<button type="button" class="btn btn-outline-secondary" onclick="execDaumPostcode()">주소검색</button>
									</div>
								</div>

								<div class="col-12 d-flex justify-content-end">
									<button type="submit" class="btn btn-outline-warning">수정완료</button>
									<button type="button" onclick="location.href='companydelete?cp_id=${company.cp_id}'" class="btn btn-outline-danger">삭제</button>
									<button type="button" onclick="location.href='companylist'" class="btn btn-outline-primary">목록</button>
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
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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