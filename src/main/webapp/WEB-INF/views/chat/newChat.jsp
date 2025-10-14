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
                    <h3>새로운 채팅</h3>
                    <p class="text-subtitle text-muted">새로운 채팅방을 만들거나 참여할 수 있습니다.</p>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                            <li class="breadcrumb-item"><a href="${contextPath }/chat/rooms">Chat Rooms</a></li>
                            <li class="breadcrumb-item active" aria-current="page">New Chat</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Create or Join a Chat Room</h4>
                </div>
                <div class="card-body">
                    <form action="${contextPath}/chat/room" method="get">
                        <div class="input-group mb-3">
                            <input type="text" name="room_id" class="form-control" placeholder="채팅방 이름을 입력하세요." required>
                            <input type="password" name="room_password" class="form-control" placeholder="비밀번호를 입력하세요." required>
                            <button type="submit" class="btn btn-primary">채팅방 입장</button>
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