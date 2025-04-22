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
		<!--        메인 컨텐트 -->
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>입고 검수 등록</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/inspection/list">InspectionList</a></li>
								<li class="breadcrumb-item active" aria-current="page">InspectionRegister</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="basic-horizontal-layouts">
				<div class="row match-height">
					<div class="container">
						<div class="card">
							<div class="card-body">
								<form action="register" id="inspectionRegister" method="post">
									<div class="d-flex custom">
										<div class="form-group width">
											<label for="in_id" class="form-label">입고 번호</label>
											<div class="listView">
												<input type="text" id="in_id" name="in_id" class="form-control" readonly>
												<button type="button" class="btn btn-primary w100" id="in_list">🔍 조회</button>
											</div> 
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
		                                    <div class="d-flex custom m0">
			                                    <div class="form-group width">
			                                        <div class="form-group">
			                                            <label for="inspection_date" class="form-label">검수일자</label>
			                                            <input type="date" id="inspection_date" 
			                                            	class="form-control" name="i_date" readonly>
			                                        </div>
			                                    </div>
			                                    <div class="form-group width">
			                                        <div class="form-group">
			                                            <label for="inspection_result" class="form-label">결과</label>
			                                            <input type="text" id="inspection_result" 
			                                            	class="form-control" name="i_result" readonly>
			                                        </div>
			                                    </div>
		                                    </div>
		                                    <div class="d-flex custom">
		                                        <div class="form-group width">
		                                            <label for="inspection_quantity" class="form-label">정상수량</label>
		                                            <input type="text" id="inspection_quantity"
		                                                class="form-control" name="i_quantity" value="0" readonly>
		                                        </div>
		                                        <div class="form-group width35">
		                                            <label for="inspection_defective_quantity" class="form-label">불량수량</label>
		                                            <input type="text" id="inspection_defective_quantity"
		                                                class="form-control" name="i_defective_quantity" required>
		                                        </div>
		                                        <div class="form-group width9">
		                                            <label for="inspection_defect_rate" class="form-label">불량률(%)</label>
		                                            <input type="text" id="inspection_defect_rate"
		                                                class="form-control" name="i_defect_rate" readonly>
		                                        </div>
		                                    </div>
		                                    <div id="defect_reason_div" class="col-12 hide">
		                                        <div class="form-group">
		                                            <label for="inspection_defect_reason" class="form-label">불량 사유</label>
		                                            <select id="inspection_defect_reason" class="form-control">
	                                                </select>
		                                        </div>
		                                    </div>
		                                    <div id="custom_reason_div">
		                                        <div class="form-group">
		                                            <input type="text" id="inspection_custom_reason" class="form-control" placeholder="기타 사유를 입력해주세요 ...">
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
										<button type="submit" class="btn btn-outline-primary">검수 등록</button>
										<button class="btn btn-outline-primary" onclick="location.href='list'">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<div class="modal fade" id="inspectionModal" tabindex="-1" aria-labelledby="inspectionModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered mw550">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inspectionModalLabel">검수 대상 입고 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      			</div>
	      		<div class="modal-body">
		        	<table class="table table-bordered table-hover text-center align-middle">
		            	<thead>
							<tr>
								<th>입고번호</th>
					            <th>입고일자</th>
					            <th>품목명</th>
					            <th>입고수량</th>
					            <th>선택</th>
				            </tr>
	          			</thead>
	          			<tbody id="receiptList">
		          		</tbody>
		        	</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
   			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>

	<!-- 플러그인 -->
	<%@ include file="../include/plugin.jsp"%>
	<script>
// 		입고 목록 리스트
	    async function inboundList() {
	        try{
	            const response = await fetch(`/erp/inspection/inboundList` , {
	                method : "GET" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리 오류");
	            }
	
	            const data = await response.json();
	
	            const tbody = document.getElementById("receiptList");
	            tbody.innerHTML = "";
	
	            data.forEach(inbound => {
	                const tr = document.createElement("tr");
	                tr.style.fontSize = "14px";
	                const timestamp = `\${inbound.in_date}`;
	                const formattedDate = formatDate(new Date(Number(timestamp)));
	                tr.innerHTML = `
	                	<td><div class="text-ellipsis">\${inbound.in_id}</div></td>
	                	<td><div class="text-ellipsis">\${formattedDate}</div></td>
	                	<td><div class="text-ellipsis">\${inbound.product.p_name}</div></td>
	                	<td><div class="text-ellipsis">\${inbound.in_quantity}</div></td>
	                	<td><button type="button" class="btn btn-light" data-id="\${inbound.in_id}">선택</button</td>
	                `
	
	                tbody.appendChild(tr);
	            });
	            
	            document.querySelectorAll(".btn-light").forEach(inbound => {
	                inbound.addEventListener("click" , () => {
	                    document.getElementById("in_id").value = inbound.dataset.id;
	                    const modalEl = document.getElementById('inspectionModal');
	                    const modalInstance = bootstrap.Modal.getInstance(modalEl);
	                    modalInstance.hide();
	                    document.getElementById("in_id").dispatchEvent(new Event("change"))
	                });
	            });
	        } catch(error) {
	            console.error("오류 발생" , error);
	        }
	    }
	    
// 	    불량 사유 리스트 
        async function defectReasonList() {
            const response = await fetch("/erp/inspection/defectReason" , {
                method : "GET" , 
                headers : {"Content-Type" : "applcation/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }

            const data = await response.json();

            const select = document.getElementById("inspection_defect_reason");

            select.innerHTML = '<option value="">사유 선택</option>';

            data.forEach(reason => {
                const option = document.createElement("option");
                option.value = reason.reason_code;
                option.innerHTML = reason.reason_name;

                select.appendChild(option);
            });
        }
	
//      입고목록 선택 시 
        document.getElementById("in_id").addEventListener("change" , async () => {
            const in_id = document.getElementById("in_id").value;
            
            const response = await fetch(`/erp/inspection/inboundDetail?in_id=\${in_id}` , {
                method : "GET" , 
                headers : {"Content-Type" : "application/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }
    
            const data = await response.json();
            
            const timestamp = `\${data[0].in_date}`;
            const formattedDate = formatDate(new Date(Number(timestamp)));

            document.getElementById("in_date").value = `\${formattedDate}`;
            const tbody = document.getElementById("product_list");
            tbody.innerHTML = "";
            data.forEach(inbound => {
                const tr = document.createElement("tr");
                
                tr.innerHTML = `
                    <td>\${inbound.product.p_code}</td>
                    <td>\${inbound.product.p_lctg}</td>
                    <td>\${inbound.product.p_mctg}</td>
                    <td>\${inbound.product.p_sctg}</td>
                    <td>\${inbound.product.p_name}</td>
                    <td class="in_quantity">\${inbound.in_quantity}</td>                
                `;
    
                tbody.appendChild(tr);
            });
            
            document.getElementById("inspection_info").classList.remove("inspection_info");
            await registerCode();
            
            const today = formatDate(new Date());
            document.getElementById("inspection_date").value = today;
        });
            
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
            const inspection_defect_rate = document.getElementById("inspection_defect_rate");
            const defect_reason_div = document.getElementById("defect_reason_div");
            const customReasonInput = document.getElementById("inspection_custom_reason");

            if(inspection_defective_quantity_val > in_quantity_val) {
                alert("불량 수량이 입고 수량을 초과할 수 없습니다.");
                inspection_defective_quantity.value = "";
                inspection_quantity.value = "";
                inspection_result.value = "";
                inspection_defect_rate.value = "";
                defect_reason_div.classList.add("hide");
                customReasonInput.removeAttribute("required");
            	document.getElementById("custom_reason_div").style.display = "none";
            	customReasonInput.value = "";
        	    customReasonInput.removeAttribute("required");
                return;
            }

            inspection_quantity.value = in_quantity_val - inspection_defective_quantity_val;
            inspection_defective_quantity.value = inspection_defective_quantity_val;
            
            inspection_defect_rate.value = (inspection_defective_quantity_val / in_quantity_val) * 100;
            
            if(parseInt(inspection_quantity.value || 0) + inspection_defective_quantity_val === in_quantity_val){
	            if(inspection_defect_rate.value > 10){
	                inspection_result.value = "불합격";
	            } else if(inspection_defect_rate.value == 0){
	                inspection_result.value = "합격";
	            } else {
	                inspection_result.value = "부분합격";
	            }
            }
            
            
            const select = document.getElementById("inspection_defect_reason");
            
            if(inspection_defective_quantity_val !== 0){
            	defect_reason_div.classList.remove("hide");
            	select.value = "";
            	select.setAttribute("required", "required");
            	document.getElementById("custom_reason_div").style.display = "none";
            	customReasonInput.value = "";
        	    customReasonInput.removeAttribute("required");
            } else {
            	defect_reason_div.classList.add("hide");
            	customReasonInput.removeAttribute("required");
            	document.getElementById("custom_reason_div").style.display = "none";
            	customReasonInput.value = "";
        	    customReasonInput.removeAttribute("required");
            }
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
        
//      조회 버튼 누를 시 
        document.getElementById("in_list").addEventListener("click" , async function(event) {
            event.preventDefault();

            const modal_div = document.getElementById("inspectionModal")
            const modal = new bootstrap.Modal(modal_div);
            modal.show();

            await inboundList();
        });
        
    	
//     	날짜 포맷 생성
        function formatDate(date) {
			console.log(date);
			const yyyy = date.getFullYear();
			const mm = String(date.getMonth() + 1).padStart(2, '0');
			const dd = String(date.getDate()).padStart(2, '0');
			return `\${yyyy}-\${mm}-\${dd}`;
        }
        
//      불량 사유 기타 선택 시 
        document.getElementById("inspection_defect_reason").addEventListener("change", function() {
        	  const selected = this.value;
        	  const wrapper = document.getElementById("custom_reason_div");
        	  const customReasonInput = document.getElementById("inspection_custom_reason");

        	  if (selected === "D999") {  // 기타 선택 시
        	    wrapper.style.display = "block";
        	    customReasonInput.setAttribute("required", "required");
        	  } else {
        	    wrapper.style.display = "none";
        	    customReasonInput.value = "";
        	    customReasonInput.removeAttribute("required");
        	  }
        });
    
//     	페이지 로드 시 
        document.addEventListener("DOMContentLoaded" , async () => {
            await defectReasonList();
        });
        
//      검수 등록
        document.getElementById("inspectionRegister").addEventListener("submit" , async function(event) {
            event.preventDefault();
            
            const in_id = parseInt(document.getElementById("in_id").value);
            const i_code = document.getElementById("inspection_code").value;
            const i_date = document.getElementById("inspection_date").value;
            const i_result = document.getElementById("inspection_result").value;
            const i_quantity = parseInt(document.getElementById("inspection_quantity").value);
            const i_defective_quantity = parseInt(document.getElementById("inspection_defective_quantity").value);
            const i_defect_rate = document.getElementById("inspection_defect_rate").value;
            const i_inspector = document.getElementById("inspection_inspector").value;
            const i_etc = document.getElementById("inspection_etc").value;

            const inspectionData = {
            	in_id : in_id ,
            	i_code : i_code ,
            	i_date : i_date ,
            	i_result : i_result ,
            	i_quantity : i_quantity ,
            	i_defective_quantity : i_defective_quantity ,
            	i_defect_rate : i_defect_rate ,
            	i_inspector : i_inspector ,
            	i_etc : i_etc
            }
            
            const defect_reason = document.getElementById("inspection_defect_reason").value;
            const custom_reason = document.getElementById("inspection_custom_reason").value;
            
            if(i_defective_quantity > 0){
            	inspectionData.defect_reason_code = defect_reason;
            }
            
            if(defect_reason === "D999"){
            	inspectionData.i_custom_reason = custom_reason;
            }
            
            try{
                const response = await fetch("/erp/inspection/register" , {
                    method : "POST" ,
                    headers : {"Content-Type" : "application/json"} ,
                    body : JSON.stringify(inspectionData)
                });

                if(!response.ok){
                    throw new Error("데이터 처리 오류");
                }
    			
                location.href="list";
            } catch(error) {
            	console.error("오류 발생", error);
            }
        });
	</script>
</body>
</html>