<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String user = (String) session.getAttribute("m_name");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<%@include file="include/head.jsp"%>
</head>
<body>
	<%@include file="include/left_column.jsp"%>
	<div id="main">
		<header class="mb-3">
			<a href="#" class="burger-btn d-block d-xl-none"> <i
				class="bi bi-justify fs-3"></i>
			</a>
		</header>
		<!--        메인 컨텐트 -->
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>검수등록</h3>
						<p class="text-subtitle text-muted">For user to check they
							list</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
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
								<h4 class="card-title">검수 등록</h4>
							</div>
							<div class="card-body">
								<form action="register" method="post">
									<div class="d-flex custom">
										<div class="form-group width">
											<label for="in_id" class="form-label">입고 번호</label> 
											<select id="in_id" class="form-select" name="in_id" required>
											</select>
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
				                                <tbody id="product_list">

				                                </tbody>
				                            </table>
										</div>
									</div>
									<hr>
									<div class="inspection_info" id="inspection_info">
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
		                                            <input type="date" id="inspection_date" 
		                                            	class="form-control" name="i_date" required>
		                                        </div>
		                                    </div>
		                                    <div class="col-12">
		                                        <div class="form-group">
		                                            <label for="inspection_result" class="form-label">결과</label>
		                                            <select id="inspection_result" class="form-select" name="i_result" required>
														<option value="">-- 검수 결과 선택 --</option>
														<option value="정상">정상</option>
														<option value="불량">불량</option>
														<option value="부분불량">부분불량</option>
													</select>
		                                        </div>
		                                    </div>
		                                    <div class="col-12">
		                                        <div class="form-group">
		                                            <label for="inspection_quantity" class="form-label">검수수량</label>
		                                            <input type="number" id="inspection_quantity"
		                                                class="form-control" name="i_quantity" required>
		                                        </div>
		                                    </div>
		                                    <div class="col-12">
		                                        <div class="form-group">
		                                            <label for="inspection_defective_quantity" class="form-label">불량수량</label>
		                                            <input type="number" id="inspection_defective_quantity"
		                                                class="form-control" name="i_defective_quantity" value="0" readonly>
		                                        </div>
		                                    </div>
		                                    <div class="col-12">
		                                        <div class="form-group">
		                                            <label for="inspection_inspector" class="form-label">검사자</label>
		                                            <input type="text" id="inspection_inspector"
		                                                class="form-control" name="i_inspector" value="<%=user %>" readonly>
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
	                                </div>
									<div class="text-end">
										<button type="submit" class="btn btn-primary">검수 등록</button>
										<button class="btn btn-secondary" onclick="location.href='list'">취소</button>
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
		<%@ include file="include/footer.jsp"%>
	</footer>

	<!-- 플러그인 -->
	<%@ include file="include/plugin.jsp"%>
	<script>
// 		입고 목록 리스트
	    async function inboundList() {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/inspection/inboundList` , {
	                method : "GET" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리 오류");
	            }
	
	            const data = await response.json();
	
	            const in_id_select = document.getElementById("in_id");
	            in_id_select.innerHTML = `<option value="">-- 입고 번호 선택 --</option>`;
	
	            data.forEach(inbound => {
	                const option = document.createElement("option");
	                option.value = `\${inbound.in_id}`;
	                option.innerHTML = `\${inbound.in_id}`;
	
	                in_id_select.appendChild(option);
	            });
	        } catch(error) {
	            console.error("오류 발생" , error);
	        }
	    }
	
	    document.addEventListener("DOMContentLoaded" , () => {
	        inboundList();
	    });
//      입고목록 선택 시 
        document.getElementById("in_id").addEventListener("change" , async () => {
            const in_id = document.getElementById("in_id").value;
            if(!in_id){
            	document.getElementById("in_date").value = "";
            	const tbody = document.getElementById("product_list");
                tbody.innerHTML = "";
                document.getElementById("inspection_info").classList.add("inspection_info");
                return;
            }
            const response = await fetch(`/erp/inspection/inboundDetail?in_id=\${in_id}` , {
                method : "GET" , 
                headers : {"Content-Type" : "application/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }
    
            const data = await response.json();

            document.getElementById("in_date").value = `\${data[0].in_date}`;
            const tbody = document.getElementById("product_list");
            tbody.innerHTML = "";
			console.log(data);
            data.forEach(inbound => {
                const tr = document.createElement("tr");
                tr.innerHTML = `
                    <td>\${inbound.productDTO.p_code}</td>
                    <td>\${inbound.productDTO.p_lctg}</td>
                    <td>\${inbound.productDTO.p_mctg}</td>
                    <td>\${inbound.productDTO.p_sctg}</td>
                    <td>\${inbound.productDTO.p_name}</td>
                    <td class="in_quantity">\${inbound.in_quantity}</td>                
                `;
    
                tbody.appendChild(tr);
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
	        
            document.getElementById("inspection_info").classList.remove("inspection_info");
            await registerCode();
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
//      코드 생성
        async function registerCode(){
            const response = await fetch("/erp/inspection/code" , {
                method : "GET" ,
                headers : {"Content-Type" : "application/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }
            const data = await response.text();
            
            document.getElementById("inspection_code").value = data;
        }
	</script>
</body>
</html>