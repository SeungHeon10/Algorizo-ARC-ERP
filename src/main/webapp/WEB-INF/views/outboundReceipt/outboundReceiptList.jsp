<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>출고 거래명세서 조회</h3>
							<p class="text-subtitle text-muted">
								</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/home">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Outbound Receipt List</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-header"></div>
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
							            <th class="text-center">거래명세서 번호</th>
        								<th class="text-center">출고 번호</th>
								        <th class="text-center">회사명</th>
								        <th class="text-center">제품명</th>
								        <th class="text-center">총 가격</th>
								        <th class="text-center">등록 날짜</th>
							            
							        </tr>
								</thead>
								<tbody>
									<c:forEach var="obr" items="${obrList }">
							        <tr>
							            <td><a href="${contextPath }/outboundReceipt/selectOneOutboundReceipt?outre_id=${obr.outre_id}">${obr.outre_id }</a></td>
							            <td>${obr.outbound_out_id }</td>
							            <td>${obr.cp_name }</td>
							            <td>${obr.p_name }</td>
							            <td><fmt:formatNumber value="${obr.outre_totalprice}" pattern="#,###" /></td>
							            <td>${obr.outre_regdate}</td>
							            
							            
							            
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
	</div>
	  <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
  
		<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	 <!-- 플러그인 -->
    <%@ include file="../include/plugin.jsp" %>
</body>

</html>