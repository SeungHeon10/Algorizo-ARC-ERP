<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    
    <%@include file="../include/head.jsp" %>
    <title>입고 거래명세서 등록</title>
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
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>입고 거래명세서 등록</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${contextPath}/dashboard">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">입고 거래명세서 등록</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">입고 거래명세서 정보 입력</h4>
                    </div>
                    <form action="${contextPath }/inboundReceipt/insertInboundReceipt" method="post">
                    <input type="hidden" name="in_id" value="${inboundReceipt.inbound_in_id}">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                    <div class="form-group">
                                        <label>입고 번호</label>
                                        <input type="text" class="form-control" name="inbound_in_id" value="${inboundReceipt.inbound_in_id}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>품목 명</label>
                                        <input type="text" class="form-control" value="${inboundReceipt.p_name}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>품목 코드</label>
                                        <input type="text" class="form-control" value="${inboundReceipt.p_code}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>입고 수량</label>
                                        <input type="number" class="form-control" name="in_quantity" value="${inboundReceipt.in_quantity}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>회사명</label>
                                        <input type="text" class="form-control" value="${inboundReceipt.cp_name}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>대표</label>
                                        <input type="text" class="form-control" value="${inboundReceipt.cp_manager}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>FAX</label>
                                        <input type="text" class="form-control" value="${inboundReceipt.cp_fax}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>입고 총 가격</label>
                                        <input type="text" class="form-control" name="inre_totalprice" value="${inboundReceipt.inre_totalprice}" readonly>
                                    </div>
                                </div>

                                <div class="col-sm-12 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-outline-primary me-1 mb-1">등록</button>
                                    <a href="${contextPath }/inboundReceipt/listAllInboundReceipt" class="btn btn-outline-secondary me-1 mb-1">취소</a>
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
