<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String user = (String)session.getAttribute("m_name"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<%@include file="include/head.jsp" %>
</head>
<body>
    <%@include file="include/left_column.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
<!--        메인 컨텐트 -->
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>검수 수정</h3>
                            <p class="text-subtitle text-muted">For user to check they list</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/home">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">DataTable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="basic-horizontal-layouts">
				<div class="row match-height">
					<div class="container">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">검수 수정</h4>
							</div>
							<div class="card-body">
								<form action="update" method="post">
									<div class="d-flex custom">
										<div class="form-group width">
											<input type="hidden" name="i_id" value="${detail.i_id }">
											<label for="in_id" class="form-label">입고 번호</label> 
											<select id="in_id" class="form-select" name="in_id">
												<option value="${detail.inboundDTO.in_id }">${detail.inboundDTO.in_id }</option>
											</select>
										</div>
										<div class="form-group width">
											<label for="in_date" class="form-label">입고일자</label> 
											<input type="text" id="in_date" class="form-control" value="${detail.inboundDTO.in_date }" readonly>
										</div>
									</div>
									<div class="form-group">
										<label>품목명</label> 
									</div>
									<div class="form-group border">
										<div class="col-md-12">
											<table class="table table-striped">
				                                <thead>
				                                    <tr>
				                                        <th class="text-center">품목코드</th>
				                                        <th class="text-center">대분류</th>
				                                        <th class="text-center">중분류</th>
				                                        <th class="text-center">소분류</th>
				                                        <th class="text-center">품목명</th>
				                                        <th class="text-center">입고수량</th>
				                                    </tr>
				                                </thead>
				                                <tbody>
													<tr>
														<td>${detail.productDTO.p_code }</td>
														<td>${detail.productDTO.p_lctg }</td>
														<td>${detail.productDTO.p_mctg }</td>
														<td>${detail.productDTO.p_sctg }</td>
														<td>${detail.productDTO.p_name }</td>
														<td class="in_quantity">${detail.inboundDTO.in_quantity }</td>
													</tr>
				                                </tbody>
				                            </table>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_code" class="form-label">검수코드</label>
	                                            <input type="text" id="inspection_code" 
	                                            	class="form-control" name="i_code" value="${detail.i_code }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_date" class="form-label">검수일자</label>
	                                            <input type="text" id="inspection_date" 
	                                            	class="form-control" name="i_date" value="${detail.i_date }" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_result" class="form-label">결과</label>
	                                            <select id="inspection_result" class="form-select" name="i_result">
													<option value="">-- 검수 결과 선택 --</option>
													<option value="정상" ${detail.i_result eq '정상' ? 'selected' : ''}>정상</option>
													<option value="불량" ${detail.i_result eq '불량' ? 'selected' : ''}>불량</option>
													<option value="부분불량" ${detail.i_result eq '부분불량' ? 'selected' : ''}>부분불량</option>
												</select>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_quantity" class="form-label">검수수량</label>
	                                            <input type="number" id="inspection_quantity"
	                                                class="form-control" name="i_quantity" value="${detail.i_quantity }">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_defective_quantity" class="form-label">불량수량</label>
	                                            <input type="number" id="inspection_defective_quantity"
	                                                class="form-control" name="i_defective_quantity" value="${detail.i_defective_quantity }">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_inspector" class="form-label">검사자</label>
	                                            <input type="text" id="inspection_inspector"
	                                                class="form-control" value="${detail.i_inspector }" readonly >
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_etc" class="form-label">비고</label>
	                                            <input type="text" id="inspection_etc"
	                                                class="form-control" name="i_etc" value="${detail.i_etc }">
	                                        </div>
	                                    </div>
	                                </div>
									<div class="text-end">
										<button type="submit" class="btn btn-primary">수정</button>
										<button class="btn btn-secondary" onclick="location.href='detail?i_id=${detail.i_id}'">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
         </div>
	</div>
    <footer>
        <%@ include file="include/footer.jsp" %>
    </footer>

    <!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
    <script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

    <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
    <script>
//      페이지 로드 시 이벤트 발생
        document.addEventListener("DOMContentLoaded" , () => {
            document.getElementById("inspection_result").dispatchEvent(new Event("change"));
        });
// 	    결과 선택 시 
        const inspection_result = document.getElementById("inspection_result"); // 결과 셀렉트 박스
        const in_quantity = document.querySelector(".in_quantity").innerHTML; // 입고수량
        const inspection_quantity = document.getElementById("inspection_quantity"); // 검수수량
        const inspection_defective_quantity = document.getElementById("inspection_defective_quantity"); // 불량수량
        inspection_result.addEventListener("change" , () => {
            if(inspection_result.value === "정상"){
            	inspection_quantity.readOnly = true;
                inspection_quantity.value = in_quantity;
            	inspection_defective_quantity.readOnly = true;
                inspection_defective_quantity.value = 0;
            } else if(inspection_result.value === "불량"){
            	inspection_quantity.readOnly = true;
            	inspection_quantity.value = 0;
            	inspection_defective_quantity.readOnly = true;
                inspection_defective_quantity.value = in_quantity;
            } else {
            	inspection_quantity.readOnly = false;
            	inspection_defective_quantity.readOnly = true;
            }
        });
//      입고 수량 선택 시
        document.getElementById("inspection_quantity").addEventListener("input" , () => {
            const in_quantity = document.querySelector(".in_quantity").innerHTML;
            const inspection_quantity = document.getElementById("inspection_quantity");
            const inspection_defective_quantity = document.getElementById("inspection_defective_quantity");
            if (parseInt(inspection_quantity.value || 0) > parseInt(in_quantity || 0)){
	                alert("입고수량 값을 초과할 수 없습니다.");
	                inspection_quantity.value = in_quantity;
           	}
            inspection_defective_quantity.value = parseInt(in_quantity || 0) - parseInt(inspection_quantity.value || 0);
        });
    </script>
</body>
</html>