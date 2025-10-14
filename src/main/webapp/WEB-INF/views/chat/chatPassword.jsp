<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@include file="../include/head.jsp"%>
</head>
<body>
<%@include file="../include/left_column.jsp"%>
<div id="main">
    <header class="mb-3">
        <a href="#" class="burger-btn d-block d-xl-none">
            <i class="bi bi-justify fs-3"></i>
        </a>
    </header>

    <div class="page-heading">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-1 order-last">
                    <h3>'${param.room_id}' 채팅방 입장</h3>
                    <p class="text-subtitle text-muted">비밀번호를 입력해주세요.</p>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                            <li class="breadcrumb-item"><a href="${contextPath }/chat/rooms">Chat Rooms</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Enter Password</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Password Required</h4>
                </div>
                <div class="card-body">
                    <%-- 컨트롤러에서 비밀번호 오류 시 전달하는 에러 메시지 표시 --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <%-- 비밀번호 입력 폼 --%>
                    <form action="${contextPath}/chat/enter" method="post">
                        <input type="hidden" name="room_id" value="${param.room_id}">
                        <div class="input-group mb-3">
                            <input type="password" name="room_password" class="form-control" placeholder="비밀번호를 입력하세요." required>
                            <button type="submit" class="btn btn-primary">입장</button>
                        </div>
                    </form>
                </div>
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