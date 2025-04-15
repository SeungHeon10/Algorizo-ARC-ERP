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
					<h3>공지사항 등록</h3><br>
				</div>
				<div class="col-12 col-md-6 order-md-2 order-first">
					<nav aria-label="breadcrumb"
						class="breadcrumb-header float-start float-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="${contextPath }/home">메인화면</a></li>
							<li class="breadcrumb-item active" aria-current="page"><a href="${contextPath }/board/list">공지사항 목록</a></li>
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
								<form class="form form-horizontal" action="${contextPath }/board/register" method="post">
									<div class="form-body">
										<div class="row">
											<div class="col-md-4">
												<label>제목</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" name="b_title" required>
											</div>

											<div class="col-md-4">
												<label>내용</label>
											</div>
											<div class="col-md-8 form-group">
												<textarea class="form-control" name="b_content" rows="3"></textarea>
											</div>
											<div class="col-md-4">
												<label>담당자</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" value="${m_name }" readonly> 
												<input type="hidden" name="b_writer" value="${m_name }">
											</div>
											<div class="col-md-4">
												<label>담당부서</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" value="${team}" readonly> 
												<input type="hidden" name="b_team" value="${team }">
											</div>
											
											<div class="col-sm-12 d-flex justify-content-end">
												<button type="submit" class="btn btn-outline-primary me-1 mb-1">등록</button>
												<a href="${contextPath }/board/list" class="btn btn-outline-primary  me-1 mb-1">목록으로</a>
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


<%@include file="../include/plugin.jsp"%>


</body>
</html>
