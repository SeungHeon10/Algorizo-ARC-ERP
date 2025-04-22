<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String user = (String)session.getAttribute("m_name"); 
	String oi_id = request.getParameter("oi_id");
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
                            <h3>출고 검수 수정</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/outInspection/list">OutInspectionList</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">OutInspectionUpdate</li>
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
								<form action="#" id="inspectionUpdate" method="post">
									<div class="d-flex custom">
										<div class="form-group width">
											<input type="hidden" id="oi_id" name="oi_id" value="${oi_id }">
											<label for="out_id" class="form-label">출고 번호</label> 
											<input type="text" id="out_id" name="in_id" class="form-control" readonly>
										</div>
										<div class="form-group width">
											<label for="out_date" class="form-label">출고일자</label> 
											<input type="text" id="out_date" class="form-control" readonly>
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
				                                        <th class="text-center">출고수량</th>
				                                    </tr>
				                                </thead>
				                                <tbody id="content_list">

				                                </tbody>
				                            </table>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="d-flex custom">
											<div class="form-group width">
	                                            <label for="outInspection_code" class="form-label">검수코드</label>
	                                            <input type="text" id="outInspection_code" 
	                                            	class="form-control" name="i_code" readonly>
		                                    </div>
		                                    <div class="form-group width">
	                                            <label for="outInspection_date" class="form-label">검수일자</label>
	                                            <input type="text" id="outInspection_date" 
	                                            	class="form-control" name="i_date" readonly>
		                                    </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="outInspection_result" class="form-label">결과</label>
	                                            <input type="text" id="outInspection_result" 
			                                            	class="form-control" name="i_result" readonly>
	                                        </div>
	                                    </div>
	                                    <div class="d-flex custom">
	                                        <div class="form-group width">
	                                            <label for="outInspection_quantity" class="form-label">정상수량</label>
	                                            <input type="text" id="outInspection_quantity"
	                                                class="form-control" name="i_quantity" readonly>
	                                        </div>
	                                        <div class="form-group width35">
	                                            <label for="outInspection_defective_quantity" class="form-label">불량수량</label>
	                                            <input type="text" id="outInspection_defective_quantity"
	                                                class="form-control" name="i_defective_quantity" required>
	                                        </div>
	                                        <div class="form-group width9">
	                                            <label for="outInspection_defect_rate" class="form-label">불량률(%)</label>
	                                            <input type="text" id="outInspection_defect_rate"
	                                                class="form-control" name="i_defect_rate" readonly>
	                                        </div>
	                                    </div>
	                                    <div id="defect_reason_div" class="col-12 hide">
	                                        <div class="form-group">
	                                            <label for="outInspection_defect_reason" class="form-label">불량 사유</label>
	                                            <select id="outInspection_defect_reason" class="form-control">
                                                </select>
	                                        </div>
	                                    </div>
	                                    <div id="custom_reason_div">
	                                        <div class="form-group">
	                                            <input type="text" id="outInspection_custom_reason" class="form-control" placeholder="기타 사유를 입력해주세요 ...">
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <input type="hidden" id="moduser" value="<%=user %>">
	                                            <label for="outInspection_inspector" class="form-label">검사자</label>
	                                            <input type="text" id="outInspection_inspector"
	                                                class="form-control" readonly >
	                                        </div>
	                                    </div>
	                                    <div class="col-12">
	                                        <div class="form-group">
	                                            <label for="outInspection_etc" class="form-label">비고</label>
	                                            <input type="text" id="outInspection_etc"
	                                                class="form-control" name="i_etc" >
	                                        </div>
	                                    </div>
	                                </div>
									<div class="text-end">
										<button type="submit" class="btn btn-outline-warning">수정</button>
										<button type="button" class="btn btn-outline-primary" onclick="location.href='detail?oi_id=${oi_id}'">취소</button>
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
	    async function fetchInspectionDetail(oi_id) {
	        try{
	            const response = await fetch(`/erp/outInspection/detailData?oi_id=\${oi_id}` , {
	                method : "GET" , 
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리중 오류 발생");
	            }
	
	            const data = await response.json();
	            
	            const timestamp = `\${data.outboundDTO.out_date}`;
	            const date = new Date(Number(timestamp));
	            const yyyy = date.getFullYear();
	            const mm = String(date.getMonth() + 1).padStart(2, '0');
	            const dd = String(date.getDate()).padStart(2, '0');
	            const formattedDate = `\${yyyy}-\${mm}-\${dd}`;
	            
	            document.getElementById("out_id").value = data.outboundDTO.out_id;
	            document.getElementById("out_date").value = formattedDate;
	            document.getElementById("outInspection_code").value = data.oi_code;
	            document.getElementById("outInspection_date").value = data.oi_date;
	            document.getElementById("outInspection_result").value = data.oi_result;
	            document.getElementById("outInspection_quantity").value = data.oi_quantity;
	            document.getElementById("outInspection_defective_quantity").value = data.oi_defective_quantity;
	            document.getElementById("outInspection_defect_rate").value = data.oi_defect_rate;
	            document.getElementById("outInspection_inspector").value = data.oi_inspector;
	            document.getElementById("outInspection_etc").value = data.oi_etc;
	
	            const tbody = document.getElementById("content_list");
	            tbody.innerHTML = "";
	            const tr = document.createElement("tr");
	            tr.innerHTML = `
	            	<td>\${data.productDTO.p_code }</td>
					<td>\${data.productDTO.p_lctg }</td>
					<td>\${data.productDTO.p_mctg }</td>
					<td>\${data.productDTO.p_sctg }</td>
					<td>\${data.productDTO.p_name }</td>
					<td class="out_quantity">\${data.outboundDTO.out_quantity }</td>
	            `
	            tbody.appendChild(tr);
	            
	            if(data.defect_reason_code !== null){
	            	document.getElementById("defect_reason_div").classList.remove("hide");
	            	document.getElementById("outInspection_defect_reason").value = data.defect_reason_code;
	            }
	            
	            if(data.oi_custom_reason !== null){
	            	document.getElementById("custom_reason_div").style.display = "block";
	            	document.getElementById("outInspection_custom_reason").value = data.oi_custom_reason;
	            }
	            
	        } catch(error){
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }
	    
// 	    불량 사유 리스트 
        async function defectReasonList() {
            const response = await fetch("/erp/outInspection/defectReason" , {
                method : "GET" , 
                headers : {"Content-Type" : "applcation/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }

            const data = await response.json();

            const select = document.getElementById("outInspection_defect_reason");

            select.innerHTML = '<option value="">사유 선택</option>';

            data.forEach(reason => {
                const option = document.createElement("option");
                option.value = reason.reason_code;
                option.innerHTML = reason.reason_name;

                select.appendChild(option);
            });
        }

//      불량 수량 입력 시
        document.getElementById("outInspection_defective_quantity").addEventListener("input" , () => {
            // 유효성 0 이하 x / 불량수량 입고수량 초과 x / 정상수량 자동계산 / 결과 자동 생성
            const out_quantity = document.querySelector(".out_quantity");
            const out_quantity_val = parseInt(out_quantity.innerHTML || 0);
            const inspection_quantity = document.getElementById("outInspection_quantity");
            const inspection_quantity_val = parseInt(document.getElementById("outInspection_quantity").value.replace(/[^\d]/g, '') || 0);
            const inspection_defective_quantity = document.getElementById("outInspection_defective_quantity");
            const inspection_defective_quantity_val = parseInt(document.getElementById("outInspection_defective_quantity").value.replace(/[^\d]/g, '') || 0);
            const inspection_result = document.getElementById("outInspection_result");
            const inspection_defect_rate = document.getElementById("outInspection_defect_rate");
            const defect_reason_div = document.getElementById("defect_reason_div");
            const customReasonInput = document.getElementById("outInspection_custom_reason");

            if(inspection_defective_quantity_val > out_quantity_val) {
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

            inspection_quantity.value = out_quantity_val - inspection_defective_quantity_val;
            inspection_defective_quantity.value = inspection_defective_quantity_val;
            
            inspection_defect_rate.value = (inspection_defective_quantity_val / out_quantity_val) * 100;
            
            if(parseInt(inspection_quantity.value || 0) + inspection_defective_quantity_val === out_quantity_val){
	            if(inspection_defect_rate.value > 10){
	                inspection_result.value = "불합격";
	            } else if(inspection_defect_rate.value == 0){
	                inspection_result.value = "합격";
	            } else {
	                inspection_result.value = "부분합격";
	            }
            }
            
            
            const select = document.getElementById("outInspection_defect_reason");
            
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
        
//      불량 사유 기타 선택 시 
        document.getElementById("outInspection_defect_reason").addEventListener("change", function() {
        	  const selected = this.value;
        	  const wrapper = document.getElementById("custom_reason_div");
        	  const customReasonInput = document.getElementById("outInspection_custom_reason");

        	  if (selected === "D999") {  // 기타 선택 시
        	    wrapper.style.display = "block";
        	    customReasonInput.setAttribute("required", "required");
        	  } else {
        	    wrapper.style.display = "none";
        	    customReasonInput.value = "";
        	    customReasonInput.removeAttribute("required");
        	  }
        });
        
    //  검수 수정
        async function updateInspection() {
    		const oi_id = parseInt(document.getElementById("oi_id").value);
            const out_id = parseInt(document.getElementById("out_id").value);
            const oi_result = document.getElementById("outInspection_result").value;
            const oi_quantity = parseInt(document.getElementById("outInspection_quantity").value);
            const oi_defective_quantity = parseInt(document.getElementById("outInspection_defective_quantity").value);
            const oi_defect_rate = document.getElementById("outInspection_defect_rate").value;
            const oi_moduser = document.getElementById("moduser").value;
            const oi_etc = document.getElementById("outInspection_etc").value;
            
            const outInspectionDTO = {
            	oi_id : oi_id ,
            	out_id : out_id ,
            	oi_result : oi_result ,
            	oi_quantity : oi_quantity ,
            	oi_defective_quantity : oi_defective_quantity ,
            	oi_defect_rate : oi_defect_rate ,
            	oi_moduser : oi_moduser ,
            	oi_etc : oi_etc
            }
            
            const defect_reason = document.getElementById("outInspection_defect_reason").value;
            const custom_reason = document.getElementById("outInspection_custom_reason").value;
            
            if(oi_defective_quantity > 0){
            	outInspectionDTO.defect_reason_code = defect_reason;
            }
            
            if(defect_reason === "D999"){
            	outInspectionDTO.oi_custom_reason = custom_reason;
            }
            
            try{
                const response = await fetch("/erp/outInspection/update" , {
                    method : "POST" ,
                    headers : {"Content-Type" : "application/json"} ,
                    body : JSON.stringify(outInspectionDTO)
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
        	const oi_id = ${oi_id};
        	await defectReasonList();
        	await fetchInspectionDetail(oi_id);
            document.getElementById("outInspection_result").dispatchEvent(new Event("change"));
       	});
//      폼 서밋 시 
        document.getElementById("inspectionUpdate").addEventListener("submit" , async function(event) {
        	event.preventDefault();
        	
        	await updateInspection();
        });
	</script>
</body>
</html>