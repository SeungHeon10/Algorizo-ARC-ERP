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
                     <h3>계약서 수정</h3>
                     <p class="text-subtitle text-muted">
                        </p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb"
                        class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="${contextPath}/contract/list">계약 조회</a></li>
                           <li class="breadcrumb-item active" aria-current="page">계약 수정</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
	<form action="${contextPath}/contract/update" method="post">
         <section class="section">
            <div class="card">
               <div class="card-header">
                  <h4 class="card-title" >계약 상세</h4>
               </div>
               <div class="card-body">
                   <div style="display: flex; justify-content: space-between;">
                       <!-- 공급받는 자 (자사) -->
                       <div style="width: 48%;">
                           <h5>공급받는 자 (자사)</h5>
                           <table class="table">
                               <thead>
                                   <tr>
                                       <th>회사명</th>
                                       <th>주소</th>
                                       <th>FAX</th>
                                       <th>업태</th>
                                       <th>대표자</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <tr>
                                       <td>Algorizo</td>
                                       <td>수원시 팔달구</td>
                                       <td>031-213-6912</td>
                                       <td>유통, 판매업</td>
                                       <td>빡쌍쭌</td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
               
                       <!-- 공급자 (거래처) -->
                       <div style="width: 48%;">
                           <h5>공급자 (거래처)</h5>
                           <table class="table">
                               <thead>
                                   <tr>
                                       <th>회사명</th>
                                       <th>주소</th>
                                       <th>FAX</th>
                                       <th>업태</th>
                                       <th>담당자</th>
                                   </tr>
                               </thead>
                               <tbody>
                                   <tr>
                                      <td>${contract.cp_name}</td>
										<td>${contract.cp_addr}</td>
										<td>${contract.cp_fax}</td>
										<td>${contract.cp_ctg}</td>
										<td>${contract.cp_manager}</td>
                                   </tr>
                               </tbody>
                           </table>
                       </div>
                   </div>
               
                   <!-- 상품 정보 -->
                   <h5>계약 정보</h5>
                   <table class="table">
                       <thead>
                           <tr>
                             <th>계약명</th>
                               <th>계약코드</th>
                               <th>가격</th>
                               <th>총 금액</th>
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td><div class="form-group">
									<input type="text" name="cr_name"
										class="form-control" value="${contract.cr_name}" />
								</div></td>
                               <td>
                               <div class="form-group">
            						<input type="text" name="cr_code" class="form-control" value="${contract.cr_code}" readonly />
            						</div>
        						</td>
                             
                               <td><fmt:formatNumber value="${contract.cr_price != null ? contract.cr_price : 0}" pattern="#,###"/></td>
                               <td><fmt:formatNumber value="${contract.cr_price != null ? contract.cr_price : 0}" pattern="#,###" /></td>
                           </tr>
                       </tbody>
                   </table>
                   <div class="col-md-12 mb-6">
									<h6>진행 상태</h6>
									<fieldset class="form-group">
										<select class="form-select" id="cr_state" name="cr_state" style="width: 150px;">
											<option>진행</option>
											<option>완료</option>
											<option>보류</option>
										</select>
									</fieldset>
								</div>
                   <div class="col-sm-12 d-flex justify-content-end">
                     <button type="submit" class="btn btn-outline-primary me-1 mb-1">저장</button>
                     <a href="${contextPath}/contract/list" class="btn btn-outline-primary me-1 mb-1">목록으로</a>
                  </div>
               </div>
            </div>
            
         </section>
      </div>
   </div>

   <footer>
      <%@ include file="../include/footer.jsp" %>
   </footer>

<%@ include file="../include/plugin.jsp" %>
</body>
</html>