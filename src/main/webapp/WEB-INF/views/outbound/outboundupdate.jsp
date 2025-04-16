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
						<h3>출고 수정</h3>
						<script>
							const errorMessage = "<c:out value='${errorMessage}'/>";
							if (errorMessage) {
								alert(errorMessage);
							}
						</script>
						<p class="text-subtitle text-muted">출고 수정 화면입니다</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<c:forEach var="up" items="${up }">
									<li class="breadcrumb-item"><a
										href="${contextPath }/outbound/outbounddetail?out_id=${up.out_id}">Outbound
											Detail</a></li>
								</c:forEach>
								<li class="breadcrumb-item active" aria-current="page">Update</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-body">
						<form class="form form-vertical" action="${pageContext.request.contextPath}/outbound/outboundupdate"
							method="post">
							<div class="row">
								<div class="col-md-6">
									<c:forEach var="up" items="${up }">
										<div class="form-group">
											<label for="basicInput ">출고 번호</label> <input type="text"
												class="form-control" name="out_id" value="${up.out_id }"
												readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">품목 명</label> <input type="text"
												class="form-control" name="p_name"
												value="${up.product.p_name }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">품목 코드</label> <input type="text"
												class="form-control" name="p_code"
												value="${up.product.p_code }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">회사 명</label> <input type="text"
												class="form-control" name="cp_name"
												value="${up.company.cp_name }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">담당자</label> <input type="text"
												class="form-control" name="cp_manager"
												value="${up.company.cp_manager }" readonly>
										</div>
										<div class="form-group">
											<label for="basicInput ">fax</label> <input type="text"
												class="form-control" name="cp_fax"
												value="${up.company.cp_fax }" readonly>
										</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="basicInput">출고 수량</label> <input type="text"
											class="form-control" name="out_quantity"
											value="${up.out_quantity }">
									</div>
									<div class="form-group">
										<label for="basicInput">출고일</label> <input type="text"
											class="form-control" name="out_date" value="${up.out_date }"
											readonly>
									</div>
									<div class="form-group">
										<label for="basicInput">출고 수정일</label> <input type="date"
											class="form-control" name="update_date"
											value="${up.update_date }">
									</div>
									<div class="form-group">
											<label for="basicInput">출고 상태</label> 
											<input type="text" class="form-control" name="out_status"
											value="${up.out_status }" disabled>
										</div>
									<div class="form-group">
										<label for="basicInput">비고</label> <input type="text"
											class="form-control" name="etc" value="${up.etc }">
									</div>
									<div class="form-group">
										<label for="basicInput "></label> <input type="hidden"
											class="form-control" name="product_p_id" value="${up.product.p_id }"
											readonly>
									</div>
									</c:forEach>
									<div class="col-12 d-flex justify-content-end">
										<button type="submit"
											class="btn btn-outline-primary me-1 mb-1">수정완료</button>
										<button type="button" class="btn btn-outline-danger me-1 mb-1"
											onclick="location.href='${contextPath}/outbound/outboundlist'">취소</button>
										<!--"취소" 버튼의 동작이 detail 페이지로 이동하는 이유는 버튼이 submit 타입으로 설정되어 있으면,
											 해당 버튼이 속한 <form> 태그의 action 속성 값으로 폼 데이터를 전송하려고 합니다.
											  결과적으로 취소 버튼이 눌렸을 때도 <form>의 action="outboundupdate"가 실행되고,
											   컨트롤러의 해당 엔드포인트로 요청이 전송됩니다. 이것이 싫으면 type을 button으로 바꾸면 된다.  -->
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