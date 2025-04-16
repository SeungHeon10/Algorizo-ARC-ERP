<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_name = (String)session.getAttribute("m_name");
	String m_id = (String)session.getAttribute("m_id");
	String team = (String)session.getAttribute("team");
%>

<div class="page-heading">
    <h3>환영합니다. <%= (m_name != null && !m_name.isEmpty()) ? m_name : "Guest" %>님!</h3>
</div>

<div class="page-content">
    <section class="row">
        <div class="col-12 col-lg-9">
            <div class="row">
                <div class="col-12 col-xl-15">
                    <div class="card">
                        <div class="card-header">
                            <h4><a href="${contextPath }/board/list">🔔공지사항🔔</a></h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="board" items="${boardList}">
                                            <tr>
                                                <td class="col-3">${board.b_title}</td>
                                                <td class="col-auto">${board.b_content}</td>
                                                <td>${board.b_regdate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <!-- 캘린더 -->
	        <div class="col-12" id="calendar">
	        
	        </div>
        </div>

        <!-- 오른쪽 사이드 -->
        <div class="col-12 col-lg-3">
            <!-- 1. 회원 정보 먼저 -->
            <div class="card">
                <div class="card-body py-4 px-5">
                    <div class="d-flex flex-column flex-sm-row align-items-center">
                        <div class="avatar avatar-xl mb-3 mb-sm-0">
                            <c:set var="photo" value="${empty member.m_photo ? 'default.png' : member.m_photo}" />
                            <img src="${pageContext.request.contextPath}/resources/img/members/${photo}" />
                        </div>
                        <div class="ms-sm-3 name text-center text-sm-start">
                            <div class="d-flex flex-column flex-sm-row align-items-center justify-content-center justify-content-sm-start">
                                <h5 class="font-bold mb-2 mb-sm-0 me-sm-3"><%= (m_name != null && !m_name.isEmpty()) ? m_name : "Guest" %></h5>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.m_id}">
                                        <a href="${contextPath}/logout" class="btn btn-sm btn-outline-danger">로그아웃</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${contextPath}/" class="btn btn-sm btn-outline-primary">로그인</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <h6 class="text-muted mt-2 mb-0"><%= (team != null && !team.isEmpty()) ? team : "" %></h6>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2. 차트 -->
            <div class="card mt-4">
                <div class="card-header">
                    <h4>월별 불량 사유 분포</h4>
                </div>
                <div class="card-body">
                    <select id="monthSelector" class="form-select mb-3">
                        <option value="2025-01">📅 2025년 1월</option>
                        <option value="2025-02">📅 2025년 2월</option>
                        <option value="2025-03">📅 2025년 3월</option>
                        <option value="2025-04">📅 2025년 4월</option>
                        <option value="2025-05">📅 2025년 5월</option>
                        <option value="2025-06">📅 2025년 6월</option>
                        <option value="2025-07">📅 2025년 7월</option>
                        <option value="2025-08">📅 2025년 8월</option>
                        <option value="2025-09">📅 2025년 9월</option>
                        <option value="2025-10">📅 2025년 10월</option>
                        <option value="2025-11">📅 2025년 11월</option>
                        <option value="2025-12">📅 2025년 12월</option>
                    </select>
                    <canvas id="defectReasonChart" height="150"></canvas>
                </div>
            </div>
        </div>
    </section>
</div>
