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
							<h3>출고 거래명세서 상세 조회</h3>
							<p class="text-subtitle text-muted">
								</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/outboundReceipt/listAllOutboundReceipt">Outboud Receipt List</a></li>
									<li class="breadcrumb-item active" aria-current="page">Outbound Receipt Detail</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

			<section class="section">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">거래명세서 상세</h4>
					</div>
					<div class="card-body">
					    <div style="display: flex; justify-content: space-between;">
					        <!-- 공급받는 자 (거래처) -->
					        <div style="width: 48%;">
					            <h5>공급받는 자 (거래처)</h5>
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
					                        <td>${orDTO.cp_name}</td>
					                        <td>${orDTO.cp_addr}</td>
					                        <td>${orDTO.cp_fax }</td>
					                        <td>${orDTO.cp_ctg}</td>
					                        <td>${orDTO.cp_manager}</td>
					                    </tr>
					                </tbody>
					            </table>
					        </div>
					
					        <!-- 공급자 (자사) -->
					        <div style="width: 48%;">
					            <h5>공급자 (자사)</h5>
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
					                        <td>${orDTO.arc_name}</td>
					                        <td>${orDTO.arc_addr}</td>
					                        <td>${orDTO.arc_fax }</td>
					                        <td>${orDTO.arc_ctg}</td>
					                        <td>${orDTO.arc_ceo}</td>
					                    </tr>
					                </tbody>
					            </table>
					        </div>
					    </div>
					
					    <!-- 상품 정보 -->
					    <h5>상품 정보</h5>
					    <table class="table">
					        <thead>
					            <tr>
					                <th>상품명</th>
					                <th>상품코드</th>
					                <th>가격</th>
					                <th>수량</th>
					                <th>총 금액</th>
					                <th>출고 일자</th>
					            </tr>
					        </thead>
					        <tbody>
					            <tr>
					                <td>${orDTO.p_name}</td>
					                <td>${orDTO.p_code}</td>
					                <td><fmt:formatNumber value="${orDTO.p_price }" pattern="#,###"/></td>
					                <td><fmt:formatNumber value="${orDTO.out_quantity }" pattern="#,###"/></td>
					                <td><fmt:formatNumber value="${orDTO.outre_totalprice}" pattern="#,###" /></td>
					                <td><fmt:formatDate value="${orDTO.outDateAsDate }" pattern="yyyy-MM-dd"/></td>
					            </tr>
					        </tbody>
					    </table>
					    <div class="col-sm-12 d-flex justify-content-end">
					    	<button id="downloadPdf" class="btn btn-outline-primary me-2">PDF 다운로드</button>
							<a href="${contextPath }/outboundReceipt/listAllOutboundReceipt" class="btn btn-outline-primary me-2">목록으로</a>
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
    titleDiv.innerHTML = '<h3 style="text-align: center; margin-bottom: 20px;">출고 거래명세서 상세</h3>';
    tempContainer.appendChild(titleDiv);
    
    // 3. 두 테이블을 감싸는 컨테이너 생성
    const tablesContainer = document.createElement('div');
    tablesContainer.style.display = 'flex';
    tablesContainer.style.justifyContent = 'space-between';
    tablesContainer.style.marginBottom = '20px';
    
    // 4. 공급받는 자 섹션 생성
    const receiverSection = document.createElement('div');
    receiverSection.style.width = '48%';
    receiverSection.innerHTML = '<h5>공급받는 자 (거래처)</h5>';
    
    // 5. 원본 공급받는 자 테이블 복제
    const receiverTable = document.querySelector('.card-body div[style*="display: flex"] div:first-child table').cloneNode(true);
    receiverSection.appendChild(receiverTable);
    
    // 6. 공급자 섹션 생성
    const supplierSection = document.createElement('div');
    supplierSection.style.width = '48%';
    supplierSection.innerHTML = '<h5>공급자 (자사)</h5>';
    
    // 7. 원본 공급자 테이블 복제
    const supplierTable = document.querySelector('.card-body div[style*="display: flex"] div:last-child table').cloneNode(true);
    supplierSection.appendChild(supplierTable);
    
    // 8. 컨테이너에 두 섹션 추가
    tablesContainer.appendChild(receiverSection);
    tablesContainer.appendChild(supplierSection);
    tempContainer.appendChild(tablesContainer);
    
    // 9. 상품 정보 섹션 추가
    const productTitle = document.createElement('h5');
    productTitle.textContent = '상품 정보';
    tempContainer.appendChild(productTitle);
    
    // 10. 상품 테이블 찾기 - 모든 h5 요소를 확인
    const h5Elements = document.querySelectorAll('h5');
    let productTable;
    
    for (let i = 0; i < h5Elements.length; i++) {
        if (h5Elements[i].textContent.includes('상품 정보')) {
            // h5 다음에 오는 테이블 요소가 상품 테이블
            let nextElement = h5Elements[i].nextElementSibling;
            while (nextElement && nextElement.tagName !== 'TABLE') {
                nextElement = nextElement.nextElementSibling;
            }
            
            if (nextElement && nextElement.tagName === 'TABLE') {
                productTable = nextElement.cloneNode(true);
                break;
            }
        }
    }
    
    // 상품 테이블을 찾지 못했다면 마지막 테이블 사용
    if (!productTable) {
        productTable = document.querySelector('.card-body .table:last-of-type').cloneNode(true);
    }
    
    tempContainer.appendChild(productTable);
    
    // 11. 임시 컨테이너를 문서에 추가
    document.body.appendChild(tempContainer);
    
    // 12. 약간의 지연 후 PDF 생성
    setTimeout(function() {
        html2canvas(tempContainer, {
            scale: 2,
            useCORS: true,
            logging: false
        }).then(function(canvas) {
            // 13. 캔버스에서 이미지 데이터 추출
            const imgData = canvas.toDataURL('image/jpeg', 1.0);
            
            // 14. PDF 생성
            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF('p', 'mm', 'a4');
            
            // 15. 이미지 크기 계산
            const imgWidth = 210; // A4 가로 (mm)
            const imgHeight = canvas.height * imgWidth / canvas.width;
            
            // 16. 이미지를 PDF에 추가
            pdf.addImage(imgData, 'JPEG', 0, 0, imgWidth, imgHeight);
            
            // 17. PDF 저장 - URL에서 inre_id 추출 또는 기본값 사용
            let receiptId = 'receipt';
            
            // URL에서 inre_id 파라미터 추출 시도
            const urlParams = new URLSearchParams(window.location.search);
            const outreIdParam = urlParams.get('outre_id');
            if (outreIdParam) {
                receiptId = outreIdParam;
            }
            
            pdf.save(`outbound_${receiptId}.pdf`);
            
            // 18. 임시 컨테이너 제거
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