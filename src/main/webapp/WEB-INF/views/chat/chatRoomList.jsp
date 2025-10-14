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
                    <h3>채팅방 목록</h3>
                    <p class="text-subtitle text-muted">참여 가능한 채팅방 목록입니당.</p>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Chat Rooms</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Chat Room List</h4>
                </div>
                <div class="card-body">
                    <table class="table table-striped" id="table1">
                        <thead>
                        <tr>
                            <th class="text-center">채팅방 이름</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="chatRoom" items="${chatRooms}">
                            <tr>
                                <td><a href="${contextPath}/chat/enter?room_id=${chatRoom.room_id}">${chatRoom.room_id}</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <%@ include file="../include/footer.jsp" %>
    </footer>
</div>
<script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
<%@ include file="../include/plugin.jsp" %>
</body>
</html>