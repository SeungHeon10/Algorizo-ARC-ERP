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
    <%@ include file="include/left_column.jsp" %>
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
                            <h3><strong>${member.m_name }님 상세 정보</strong></h3>
                            <p class="text-subtitle text-muted"></p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/members">Members</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

               

                <!-- Striped rows start -->
                <section class="section">
                    <div class="row" id="table-striped">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                            <strong></strong>
                        </div>
                        <div class="card-body">
                    
                        
                        
                            <table class="table table-striped" id="table1">
								<tr>
									<th>사원번호</th>
									<td>${member.m_id }</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${member.m_name }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${member.m_addr }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${member.m_email }</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${member.m_pno }</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>${member.birth }</td>
								</tr>
								<tr>
									<th>부서</th>
									<td>${member.dto.team }</td>
								</tr>
								<tr>
									<th>입사일</th>
									<td>${member.regdate }</td>
								</tr>
								
								
                            </table>
                           <c:if test="${sessionScope.d_id == 10}">
                           	 	<div class="mt-3">
                                	<a href="${contextPath }/members/updateMember?m_id=${member.m_id}" class="btn btn-warning">수정</a>
                                	<a href="${contextPath }/members/deleteMember?m_id=${member.m_id}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                            	</div>
                        	</c:if>
                            </div>
                        </div>
                    </div>
                  </div>
                </section>
                <!-- Striped rows end -->

                
            </div>

            <footer>
                <%@include file="include/footer.jsp" %>
            </footer>
        </div>
    </div>
    <%@ include file="include/plugin.jsp" %>
<!-- jQuery 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

</script>
    
</body>

</html>