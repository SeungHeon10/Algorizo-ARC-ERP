<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="include/head.jsp" %>
</head>

<body>
    <%@include file="include/left_column.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <%@ include file="include/main_body.jsp" %>

            <footer>
                <%@ include file="include/footer.jsp" %>
            </footer>
        </div>
    </div>
    <!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
</body>

</html>