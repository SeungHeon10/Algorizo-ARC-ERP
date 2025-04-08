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
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header">
					<div class="d-flex justify-content-between">
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
							<h3>공급업체관리테이블</h3>
							<p class="text-subtitle text-muted">알고리조</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/erp">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Table</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!--  Inverse table start -->
				<section class="section">
					<div class="row" id="table-inverse">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">공급업체 목록</h4>
								</div>
								<div class="card-content">
									<!-- table with light -->
									<div class="table-responsive">
										<table class="table table-light mb-0" id="table1">
											<thead>
												<tr>
													<th class="text-center">회사명</th>
													<th class="text-center">업종</th>
													<th class="text-center">대표이사</th>
													<th class="text-center">대표전화</th>
													<th class="text-center">팩스번호</th>
													<th class="text-center">이메일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="company" items="${companylist}">
													<tr>
														<td><a
															href="${contextPath }/company/companydetail?cp_id=${company.cp_id}"
															class="text-primary">${company.cp_name }</a></td>
														<td>${company.cp_ctg}</td>
														<td>${company.cp_manager}</td>
														<td>${company.cp_pno }</td>
														<td>${company.cp_fax}</td>
														<td>${company.cp_mail}</td>
													</tr>
												</c:forEach>
												<!-- <tr>
                                                    <td class="text-bold-500">Michael Right</td>
                                                    <td>$15/hr</td>
                                                    <td class="text-bold-500">UI/UX</td>
                                                    <td>Remote</td>
                                                    <td>Austin,Taxes</td>
                                                    <td><a href="#"><i
                                                                class="badge-circle badge-circle-white text-secondary font-medium-1"
                                                                data-feather="mail"></i></a></td>
                                                </tr>
                                                 -->
											</tbody>
										</table>
<div class="col-sm-12 d-flex justify-content-end">
    <button type="button" id="opencompanyModal" class="btn btn-primary me-1 mb-1">업체등록</button>
</div>

<!-- 품목등록 모달 -->
<div class="modal fade" id="companyInsertModal" tabindex="-1" role="dialog" aria-labelledby="companyInsertModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="companyInsertModalTitle">업체등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="companyInsertForm" class="form form-horizontal" action="/erp/company/companyinsert" method="post">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-1">
                                <label>회사명</label>
                            </div>
                            <div class="col-md-11">
                                <div class="form-group has-icon-left">
                                    <div class="position-relative">
                                        <input type="text" class="form-control" placeholder="Company" id="cp_name" name="cp_name">
                                        <div class="form-control-icon">
                                            <svg class="bi" width="1em" height="1em" fill="currentColor">
                                                <use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#filter-left" />
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
                                        <input type="text" class="form-control" placeholder="Category" id="cp_ctg" name="cp_ctg">
                                        <div class="form-control-icon">
                                            <svg class="bi" width="1em" height="1em" fill="currentColor">
                                                <use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#clipboard-minus" />
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
                                        <input type="text" class="form-control" placeholder="Representative" id="cp_manager" name="cp_manager">
                                        <div class="form-control-icon">
                                            <svg class="bi" width="1em" height="1em" fill="currentColor">
                                                <use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#person" />
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
                                        <input type="text" class="form-control" placeholder="Mobile" id="cp_pno" name="cp_pno">
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
                                        <input type="email" class="form-control" placeholder="Email" id="cp_mail" name="cp_mail">
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
                                                <use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#file-earmark" />
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
                                    <div class="position-relative">
                                        <input type="text" class="form-control" placeholder="Address" id="cp_addr" name="cp_addr">
                                        <div class="form-control-icon">
                                            <svg class="bi" width="1em" height="1em" fill="currentColor">
                                                <use xlink:href="${contextPath}/resources/static/dist/assets/vendors/bootstrap-icons/bootstrap-icons.svg#house" />
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i> <span class="d-none d-sm-block">취소</span>
                </button>
                <button type="button" class="btn btn-light-secondary" id="resetForm">
                    <i class="bx bx-check d-block d-sm-none"></i> <span class="d-none d-sm-block">초기화</span>
                </button>
                <button type="button" class="btn btn-primary ml-1" id="submitcompany">
                    <i class="bx bx-check d-block d-sm-none"></i> <span class="d-none d-sm-block">업체등록</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 품목등록 모달 열기
        $("#opencompanyModal").click(function() {
            // 현재 날짜 설정 (작성일)
            let today = new Date();
            let formattedDate = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
            $("input[name='cp_regdate']").val(formattedDate);

            // 모달 열기
            $("#companyInsertModal").modal('show');
        });

        // 폼 초기화 버튼
        $("#resetForm").click(function() {
            $("#companyInsertForm")[0].reset();
            // 소분류 초기화 (필요하면 추가)
        });

        // 폼 제출
        $("#submitcompany").click(function() {
            // 폼 유효성 검사
            if ($("#companyInsertForm")[0].checkValidity()) {
                $("#companyInsertForm").submit();
            } else {
                // HTML5 기본 유효성 검사 메시지 트리거
                $("#companyInsertForm")[0].reportValidity();
            }
        });
    });
</script>


		<footer>
			<%@include file="../include/footer.jsp"%>
		</footer>
	</div>
	</div>
	<script
		src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

	<script
		src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

	<script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
</body>

</html>