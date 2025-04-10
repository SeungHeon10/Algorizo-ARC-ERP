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
                     <h3>계약서 조회</h3>
                     <p class="text-subtitle text-muted">
                        </p>
                  </div>
                  <div class="col-12 col-md-6 order-md-2 order-first">
                     <nav aria-label="breadcrumb"
                        class="breadcrumb-header float-start float-lg-end">
                        <ol class="breadcrumb">
                           <li class="breadcrumb-item"><a href="${contextPath }/contract/list">계약 조회</a></li>
                           <li class="breadcrumb-item active" aria-current="page">계약 상세</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
	
         <section class="section">
            <div class="card">
               <div class="card-header">
                  <h4 class="card-title mb-5">계약 상세</h4>
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
                                       <td>${contract.cp_fax }</td>
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
                               <td>${contract.cr_name}</td>
                               <td>${contract.cr_code}</td>
                               <td><fmt:formatNumber value="${contract.cr_price != null ? contract.cr_price : 0}" pattern="#,###"/></td>
                               <td><fmt:formatNumber value="${contract.cr_price != null ? contract.cr_price : 0}" pattern="#,###" /></td>
                           </tr>
                       </tbody>
                   </table>
                   <h5>계약 내용</h5>
                   <table class="table">
                       <thead>
                           <tr>
                               <th>계약 내용</th>
                               
                           </tr>
                       </thead>
                       <tbody>
                           <tr>
                               <td>${contract.cr_content}</td>
                           </tr>
                       </tbody>
                   </table>
                   <div class="col-sm-12 d-flex justify-content-end">
                   <a href="${contextPath}/contract/update?cr_code=${contract.cr_code}" class="btn btn-outline-warning me-1 mb-1">수정</a>
							<a href="${contextPath}/contract/delete?cr_code=${contract.cr_code}"  class="btn btn-outline-danger me-1 mb-1"  
							onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                     <a href="${contextPath }/contract/list" class="btn btn-outline-primary  me-1 mb-1">목록으로</a>
                      <button id="downloadPdf" class="btn btn-outline-primary  me-1 mb-1">PDF 다운로드</button>
                  </div>
               </div>
            </div>
            
         </section>
      </div>
   </div>

   <footer>
      <%@ include file="../include/footer.jsp" %>
   </footer>
<script>
document.getElementById("downloadPdf").addEventListener("click", function() {
    // 1. 새로운 임시 컨테이너 생성
    const tempContainer = document.createElement('div');
    tempContainer.className = 'temp-pdf-container';
    tempContainer.style.position = 'absolute';
    tempContainer.style.width = '800px';
    tempContainer.style.left = '-9999px';
    tempContainer.style.padding = '20px';
    tempContainer.style.backgroundColor = 'white';
    
    // 2. 제목 섹션 추가
    const titleDiv = document.createElement('div');
    titleDiv.innerHTML = '<h3 style="text-align: center; margin-bottom: 20px;">계약서 상세</h3>';
    tempContainer.appendChild(titleDiv);
    
    // 3. 공급받는 자, 공급자 섹션 (flex 컨테이너)
    const tablesContainer = document.createElement('div');
    tablesContainer.style.display = 'flex';
    tablesContainer.style.justifyContent = 'space-between';
    tablesContainer.style.marginBottom = '20px';
    
    const receiverSection = document.createElement('div');
    receiverSection.style.width = '48%';
    receiverSection.innerHTML = '<h5>공급받는 자 (자사)</h5>';
    const receiverTable = document.querySelector('.card-body div[style*="display: flex"] div:first-child table');
    if (receiverTable) {
        receiverSection.appendChild(receiverTable.cloneNode(true));
    }
    
    const supplierSection = document.createElement('div');
    supplierSection.style.width = '48%';
    supplierSection.innerHTML = '<h5>공급자 (거래처)</h5>';
    const supplierTable = document.querySelector('.card-body div[style*="display: flex"] div:last-child table');
    if (supplierTable) {
        supplierSection.appendChild(supplierTable.cloneNode(true));
    }
    
    tablesContainer.appendChild(receiverSection);
    tablesContainer.appendChild(supplierSection);
    tempContainer.appendChild(tablesContainer);
    
    // 4. 계약 정보 섹션 추가
    const contractInfoTitle = document.createElement('h5');
    contractInfoTitle.textContent = '계약 정보';
    tempContainer.appendChild(contractInfoTitle);
    // .card-body의 직접 자식 테이블만 선택: 공급받는/공급자 테이블은 내부에 있으므로 무시됨
    const directTables = document.querySelectorAll('.card-body > table');
    if (directTables.length > 0) {
        // 첫 번째 직접 자식 테이블가 "계약 정보" 테이블라고 가정
        tempContainer.appendChild(directTables[0].cloneNode(true));
    } else {
        console.error("계약 정보 테이블을 찾지 못했습니다.");
    }
    
    // 5. 계약 내용 섹션 추가 (계약 정보 바로 아래)
    const contractContentTitle = document.createElement('h5');
    contractContentTitle.textContent = '계약 내용';
    tempContainer.appendChild(contractContentTitle);
    if (directTables.length > 1) {
        // 두 번째 직접 자식 테이블이 "계약 내용" 테이블라고 가정
        tempContainer.appendChild(directTables[1].cloneNode(true));
    } else {
        console.error("계약 내용 테이블을 찾지 못했습니다.");
    }
    
    // 6. 임시 컨테이너를 문서에 추가
    document.body.appendChild(tempContainer);
    
    // 7. 약간의 지연 후 PDF 생성
    setTimeout(function() {
        html2canvas(tempContainer, {
            scale: 2,
            useCORS: true,
            logging: false
        }).then(function(canvas) {
            const imgData = canvas.toDataURL('image/jpeg', 1.0);
            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF('p', 'mm', 'a4');
            const imgWidth = 210; // A4 가로 (mm)
            const imgHeight = canvas.height * imgWidth / canvas.width;
            
            pdf.addImage(imgData, 'JPEG', 0, 0, imgWidth, imgHeight);
            pdf.save('contract_detail.pdf');
            
            document.body.removeChild(tempContainer);
        }).catch(function(error) {
            console.error('PDF 생성 오류:', error);
            document.body.removeChild(tempContainer);
        });
    }, 100);
});
</script>


<%@ include file="../include/plugin.jsp" %>
</body>
</html>