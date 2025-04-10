<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="../include/head.jsp" %>
</head>

<title>Error 500</title>
<body>
    <div id="error">


        <div class="error-page container">
            <div class="col-md-8 col-12 offset-md-2">
                <img class="img-error" src="${contextPath }/resources/static/dist/assets/images/samples/error-500.png" alt="Not Found">
                <div class="text-center">
                    <h1 class="error-title">존재하지 않는 입고 거래명세서입니다.</h1>
                    <p class="fs-5 text-gray-600">거래명세서 번호를 확인해주세요.</p>
                    <a href="<c:url value='/inboundReceipt/listAllInboundReceipt' />" class="btn btn-lg btn-outline-primary mt-3">목록으로</a>
                </div>
            </div>
        </div>


    </div>
</body>

</html>