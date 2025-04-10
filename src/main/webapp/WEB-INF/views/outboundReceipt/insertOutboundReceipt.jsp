<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="../include/head.jsp" %>
    <title>출고 거래명세서 등록</title>
</head>

<body>
    <%@include file="../include/left_column.jsp" %>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i> </a>
        </header>

        <div class="page-heading">
            <div class="page-title">
                <div class="row">
                    <div class="col-md-6">
                        <h3>입고 거래명세서 등록</h3>
                    </div>
                    <div class="col-md-12 d-flex justify-content-end">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${contextPath}/outboundReceipt/listAllOutboundReceipt">Outbound List</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Register</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">출고 거래명세서 정보 입력</h4>
                    </div>
                    <form action="${contextPath}/outboundReceipt/insertOutboundReceipt" method="post">
                        <input type="hidden" name="out_id" value="${outboundReceipt.outbound_out_id}">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="fw-bold">출고 번호</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.outbound_out_id}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">품목 명</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.p_name}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">품목 코드</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.p_code}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">출고 수량</label>
                                        <input type="number" class="form-control" value="${outboundReceipt.out_quantity}" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="fw-bold">회사명</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.cp_name}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">대표</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.cp_manager}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">FAX</label>
                                        <input type="text" class="form-control" value="${outboundReceipt.cp_fax}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label class="fw-bold">입고 총 가격</label>
                                        <input type="text" class="form-control" name="inre_totalprice" value="${outboundReceipt.outre_totalprice}" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-outline-primary me-2">등록</button>
                                    <a href="${contextPath}/outboundReceipt/listAllOutboundReceipt" class="btn btn-outline-secondary">취소</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <footer>
            <%@ include file="../include/footer.jsp" %>
        </footer>
    </div>
    <%@ include file="../include/plugin.jsp" %>
</body>

</html>
