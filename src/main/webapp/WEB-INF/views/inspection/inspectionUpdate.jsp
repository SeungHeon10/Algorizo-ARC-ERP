<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String user = (String)session.getAttribute("m_name"); 
	String i_id = request.getParameter("i_id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<%@include file="../include/head.jsp" %>
</head>
<body>
    <%@include file="../include/left_column.jsp" %>
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
                            <p class="text-subtitle text-muted">Update inspection result or quantities.</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/inspection/detail?i_id=${detail.i_id }">InspectionDetail</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">InspectionUpdate</li>
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
								<form action="#" id="inspectionUpdate" method="post">
									<div class="d-flex custom">
										<div class="form-group width">
											<input type="hidden" id="i_id" name="i_id" value="${i_id }">
											<label for="in_id" class="form-label">입고 번호</label> 
											<input type="text" id="in_id" name="in_id" class="form-control" readonly>
										</div>
										<div class="form-group width">
											<label for="in_date" class="form-label">입고일자</label> 
											<input type="text" id="in_date" class="form-control" readonly>
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
				                                <tbody id="content_list">

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
	                                            	class="form-control" name="i_code" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_date" class="form-label">검수일자</label>
	                                            <input type="text" id="inspection_date" 
	                                            	class="form-control" name="i_date" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_result" class="form-label">결과</label>
	                                            <input type="text" id="inspection_result" 
			                                            	class="form-control" name="i_result" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_quantity" class="form-label">정상수량</label>
	                                            <input type="text" id="inspection_quantity"
	                                                class="form-control" name="i_quantity" readonly="readonly">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_defective_quantity" class="form-label">불량수량</label>
	                                            <input type="text" id="inspection_defective_quantity"
	                                                class="form-control" name="i_defective_quantity" required="required">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <input type="hidden" id="moduser" value="<%=user %>">
	                                            <label for="inspection_inspector" class="form-label">검사자</label>
	                                            <input type="text" id="inspection_inspector"
	                                                class="form-control" readonly >
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="inspection_etc" class="form-label">비고</label>
	                                            <input type="text" id="inspection_etc"
	                                                class="form-control" name="i_etc" >
	                                        </div>
	                                    </div>
	                                </div>
									<div class="text-end">
										<button type="submit" class="btn btn-outline-warning">수정</button>
										<button type="button" class="btn btn-outline-primary" onclick="location.href='detail?i_id=${i_id}'">취소</button>
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
	    <%@ include file="../include/footer.jsp" %>
	</footer>

	<!-- 플러그인 -->
	<%@ include file="../include/plugin.jsp" %>
	<script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>
	
	<script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
	<script>
// 	검수 상세보기
	    async function fetchInspectionDetail(i_id) {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/inspection/detailData?i_id=\${i_id}` , {
	                method : "GET" , 
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리중 오류 발생");
	            }
	
	            const data = await response.json();
	            
	            const timestamp = `\${data.inboundDTO.in_date}`;
	            const date = new Date(Number(timestamp));
	            const yyyy = date.getFullYear();
	            const mm = String(date.getMonth() + 1).padStart(2, '0');
	            const dd = String(date.getDate()).padStart(2, '0');
	            const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
	            
	            document.getElementById("in_id").value = data.inboundDTO.in_id;
	            document.getElementById("in_date").value = formattedDate;
	            document.getElementById("inspection_code").value = data.i_code;
	            document.getElementById("inspection_date").value = data.i_date;
	            document.getElementById("inspection_result").value = data.i_result;
	            document.getElementById("inspection_quantity").value = data.i_quantity;
	            document.getElementById("inspection_defective_quantity").value = data.i_defective_quantity;
	            document.getElementById("inspection_inspector").value = data.i_inspector;
	            document.getElementById("inspection_etc").value = data.i_etc;
	
	            const tbody = document.getElementById("content_list");
	            tbody.innerHTML = "";
	            const tr = document.createElement("tr");
	            tr.innerHTML = `
	            	<td>\${data.productDTO.p_code }</td>
					<td>\${data.productDTO.p_lctg }</td>
					<td>\${data.productDTO.p_mctg }</td>
					<td>\${data.productDTO.p_sctg }</td>
					<td>\${data.productDTO.p_name }</td>
					<td class="in_quantity">\${data.inboundDTO.in_quantity }</td>
	            `
	            tbody.appendChild(tr);
	            
	        } catch(error){
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }

//      불량 수량 입력 시
        document.getElementById("inspection_defective_quantity").addEventListener("input" , () => {
            // 유효성 0 이하 x / 불량수량 입고수량 초과 x / 정상수량 자동계산 / 결과 자동 생성
            const in_quantity = document.querySelector(".in_quantity");
            const in_quantity_val = parseInt(in_quantity.innerHTML || 0);
            const inspection_quantity = document.getElementById("inspection_quantity");
            const inspection_quantity_val = parseInt(document.getElementById("inspection_quantity").value.replace(/[^\d]/g, '') || 0);
            const inspection_defective_quantity = document.getElementById("inspection_defective_quantity");
            const inspection_defective_quantity_val = parseInt(document.getElementById("inspection_defective_quantity").value.replace(/[^\d]/g, '') || 0);
            const inspection_result = document.getElementById("inspection_result");

            if(inspection_defective_quantity_val > in_quantity_val) {
                alert("불량 수량이 입고 수량을 초과할 수 없습니다.");
                inspection_defective_quantity.value = "";
                inspection_quantity.value = "";
                inspection_result.value = "";
                return;
            }

            inspection_quantity.value = in_quantity_val - inspection_defective_quantity_val;
            inspection_defective_quantity.value = inspection_defective_quantity_val;
            
            if(parseInt(inspection_quantity.value || 0) + inspection_defective_quantity_val === in_quantity_val){
	            if(parseInt(inspection_quantity.value || 0) === 0){
	                inspection_result.value = "불합격";
	            } else if(inspection_defective_quantity_val === 0){
	                inspection_result.value = "합격";
	            } else {
	                inspection_result.value = "부분합격";
	            }
            }
        });
        
    //  검수 수정
        async function updateInspection() {
    		const i_id = parseInt(document.getElementById("i_id").value);
            const in_id = parseInt(document.getElementById("in_id").value);
            const i_result = document.getElementById("inspection_result").value;
            const i_quantity = parseInt(document.getElementById("inspection_quantity").value);
            const i_defective_quantity = parseInt(document.getElementById("inspection_defective_quantity").value);
            const i_moduser = document.getElementById("moduser").value;
            const i_etc = document.getElementById("inspection_etc").value;
            
            const inspectionDTO = {
            	i_id : i_id ,
            	in_id : in_id ,
            	i_result : i_result ,
            	i_quantity : i_quantity ,
            	i_defective_quantity : i_defective_quantity ,
            	i_moduser : i_moduser ,
            	i_etc : i_etc
            }
            
            try{
                const response = await fetch("http://localhost:8080/erp/inspection/update" , {
                    method : "POST" ,
                    headers : {"Content-Type" : "application/json"} ,
                    body : JSON.stringify(inspectionDTO)
                });

                if(!response.ok){
                    throw new Error("데이터 처리 오류");
                }

                alert("수정되었습니다.");

                location.href = "list";
            } catch(error) {
                console.error("오류 발생" , error);
            }
        }
        
//      페이지 로드 시 이벤트 발생
        document.addEventListener("DOMContentLoaded" , async () => {
        	const i_id = ${i_id};
        	await fetchInspectionDetail(i_id);
            document.getElementById("inspection_result").dispatchEvent(new Event("change"));
            document.getElementById("inspection_defective_quantity").dispatchEvent(new Event("input"));
       	});
//      폼 서밋 시 
        document.getElementById("inspectionUpdate").addEventListener("submit" , async function(event) {
        	event.preventDefault();
        	
        	await updateInspection();
        });
	</script>
</body>
</html>