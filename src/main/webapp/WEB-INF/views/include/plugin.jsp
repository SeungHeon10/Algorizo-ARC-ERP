<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

    <script src="${contextPath }/resources/static/dist/assets/vendors/apexcharts/apexcharts.js"></script>
    <c:if test="${fn:contains(pageContext.request.requestURI, '/home')}">
    	<script src="${contextPath }/resources/static/dist/assets/js/pages/dashboard.js"></script>
    	
	</c:if>

    <script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
    
    