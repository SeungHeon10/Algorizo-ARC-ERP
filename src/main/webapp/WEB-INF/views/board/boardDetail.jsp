<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<%@include file="../include/head.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

</head>

<body>
   <%@include file="../include/left_column.jsp"%>

   <div id="main">
      <header class="mb-3">
         <a href="#" class="burger-btn d-block d-xl-none"> <i class="bi bi-justify fs-3"></i>
         </a>
      </header>

       <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>공지사항 상세</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">공지사항 상세</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">${board.b_title}</h4>
                            <p class="text-muted">${board.b_regdate}</p>
                            <p class="text-muted">${board.b_writer}</p>
                        </div>
                        <div class="card-body">
                            ${board.b_content}
                    <div class="d-flex justify-content-end">
                    <a href="${contextPath}/board/update?b_id=${board.b_id}" class="btn btn-outline-warning me-1 mb-1">수정</a>
            <a href="${contextPath}/board/delete?b_id=${board.b_id}"  class="btn btn-outline-danger me-1 mb-1"  
							onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
            <a href="${contextPath }/board/list" class="btn btn-outline-primary  me-1 mb-1">목록으로</a>
                        </div>
                    </div>
        </div>
                </section>
            </div>

   <footer>
      <%@ include file="../include/footer.jsp" %>
   </footer>



<%@ include file="../include/plugin.jsp" %>
</body>
</html>