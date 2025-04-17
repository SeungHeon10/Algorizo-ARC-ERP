<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String user = (String) session.getAttribute("m_name");
String plan_id = request.getParameter("plan_id");
%>
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
		<!--        메인 컨텐트 -->
		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>조달 계획 수정</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/plans/list">PlanList</a></li>
								<li class="breadcrumb-item active" aria-current="page">PlanUpdate</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="container" id="plan_detail">
					<div class="card">
						<div class="card-body">
							<form id="updatePlan">
								<div class="d-flex custom">
									<div class="form-group width">
										<label for="detailTitle" class="form-label">계획 제목</label> 
										<input type="text" class="form-control" id="detailTitle" required="required">
									</div>
									<div class="form-group width">
										<label for="detailCode" class="form-label">계획 코드</label> 
										<input type="text" class="form-control" id="detailCode"
											readonly="readonly">
									</div>
								</div>
								<div class="d-flex custom">
									<div class="form-group width">
										<input type="hidden" id="moduser" value="<%=user %>">
										<label for="detailWriter" class="form-label">계획 작성자</label> 
										<input type="text" class="form-control" id="detailWriter"
											readonly="readonly">
									</div>
									<div class="form-group width">
										<label for="detailRegdate" class="form-label">계획 작성일</label>
										<input type="text" class="form-control" id="detailRegdate"
											readonly="readonly">
									</div>
								</div>
								<hr>
								<div class="form-group">
									<label class="form-label">조달품목</label> 
								</div>
								<div class="form-group border">
									<div class="col-md-12">
										<table class="table table-bordered">
											<colgroup>
												<col style="width: 20%;">
												<col style="width: 10%;">
												<col style="width: 20%;">
												<col style="width: 20%;">
												<col style="width: 20%;">
												<col style="width: 10%;">
											</colgroup>
			                                <thead class="table-light">
			                                    <tr>
			                                        <th class="text-center">품목명</th>
			                                        <th class="text-center">수량</th>
			                                        <th class="text-center">단가</th>
			                                        <th class="text-center">납기일</th>
			                                        <th class="text-center">소계</th>
			                                        <th class="text-center">비고</th>
			                                    </tr>
			                                </thead>
			                                <tbody id="products">
			                                	
			                                </tbody>
			                            </table>
									</div>
								</div>
	                            <div class="register_product_button_div">
	                            	<button type="button" class="btn btn-secondary" onclick="registerRow()">+ 품목 추가</button>
	                            </div>
	                            <hr>
                 	            <div class="total_div">
								    <span>총</span>
								    <strong class="product_length" id="length">0개 품목</strong>
								    <span class="total_span">합계 금액</span>
								    <strong id="total">0 원</strong>
								</div>
								<div class="col text-end">
								    <button type="submit" class="btn btn-outline-warning">수정</button>
								    <button type="button" class="btn btn-outline-primary" onclick="location.href='detail?plan_id=${plan_id }'">취소</button>
							  	</div>
						  	</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	<footer>
		<%@ include file="../include/footer.jsp"%>
	</footer>
</div>
<!-- 플러그인 -->
<%@ include file="../include/plugin.jsp"%>
<script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

<script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
<script>
	let products = [];
	let priceMap = {};
//	조달 계획 상세보기
	async function fetchPlanDetail(plan_id) {
	    try{
	        const response = await fetch(`http://localhost:8080/erp/plans/detailData?plan_id=\${plan_id}` , {
	            method : "GET" , 
	            headers : {"Content-Type" : "application/json"}
	        });
	
	        if(!response.ok){
	            throw new Error("데이터 처리중 오류 발생");
	        }
	
	        const data = await response.json();
	        document.getElementById("detailTitle").value = data[0].plan_title;
	        document.getElementById("detailTitle").dataset.id = data[0].plan_id;
	        document.getElementById("detailCode").value = data[0].plan_code;
	        document.getElementById("detailWriter").value = data[0].plan_writer;
	        document.getElementById("detailRegdate").value = data[0].plan_regdate;
	
	        const tbody = document.getElementById("products");
	        data.forEach(plan_product => {
                const tr = document.createElement("tr");
                tr.innerHTML = `
                    <td>
                        <select class="form-select" name="product_p_id[]" required="required">
                            \${renderProductOptions(plan_product.p_id)}    
                        </select>
                    </td>
                    <td>
                    	<input type="text" class="form-control" id="display_quantity" value="\${plan_product.pp_quantity.toLocaleString('ko-KR') }" required="required">
                    	<input type="hidden" name="product_quantity[]" value="\${plan_product.pp_quantity }">
                    </td>
                    <td><input type="text" class="form-control" name="product_price[]" value="\${plan_product.p_price.toLocaleString('ko-KR') }" data-price="\${plan_product.p_price }" readonly="readonly"></td>
                    <td><input type="date" class="form-control" name="product_delivery_date[]" value="\${plan_product.pp_delivery_date.slice(0,10) }" required="required"></td>
                    <td><input type="text" class="form-control" name="product_total_price[]" value="\${plan_product.pp_total_price.toLocaleString('ko-KR') }" data-total="\${plan_product.pp_total_price }" readonly="readonly"></td>
                    <td><input type="button" class="btn btn-outline-danger" onclick="removeRow(this)" value="삭제"></td>
                `
    
                tbody.appendChild(tr);
            });
	        
	    } catch(error){
	        console.error("데이터 처리중 오류 발생" , error);
	    }
	}
// 	품목 리스트
	async function fetchProductList() {
        try{
            const response = await fetch("http://localhost:8080/erp/plans/product_list" , {
                method : "GET" , 
                headers : {"Content-Type" : "application/json"}
            });

            if(!response.ok){
                throw new Error("데이터 처리 오류");
            }
			
			products = await response.json();
            
			products.forEach(product => {
				priceMap[product.p_id] = product.p_price;
			});

    	} catch(error) {
    		console.error("오류 발생" , error);
    	}
    }
	
	document.getElementById("products").addEventListener("change" , handleRowUpdate);
	document.getElementById("products").addEventListener("input" , handleRowUpdate);
// 	테이블 데이터 변화 시
	function handleRowUpdate(event){
	    const target = event.target;
	    const row = target.closest("tr");
	
	    const select = row.querySelector('select[name="product_p_id[]"]');
	    const d_quantity = row.querySelector("#display_quantity");
	    const h_quantity = row.querySelector('input[name="product_quantity[]"]');
	    const price = row.querySelector('input[name="product_price[]"]');
	    const sub_total = row.querySelector('input[name="product_total_price[]"]');
	
	    if(target === select){
	        const selectId = select.value;
	        price.value = priceMap[selectId].toLocaleString('ko-KR');
	        price.dataset.price = priceMap[selectId];
	    }
	    
	    if(target === d_quantity){
		    const quantity_value = parseInt(d_quantity.value.replace(/[^\d]/g, '') || 1);
		    h_quantity.value = quantity_value;
		    d_quantity.value = quantity_value.toLocaleString('ko-KR');
	    }
	
	    sub_total.value = (parseInt(h_quantity.value || 1) * parseInt(price.dataset.price || 0)).toLocaleString('ko-KR');
	    sub_total.dataset.total = parseInt(h_quantity.value || 0) * parseInt(price.dataset.price || 0);
		
	    recalculateTotal();
	}
	
// 	품목 추가
    function registerRow(){
        const tbody = document.getElementById("products");
        const tr = document.createElement("tr");
        tr.innerHTML = `
            <td>
	        	<select class="form-select" name="product_p_id[]" required="required">
		            <option value="">품목을 선택하세요</option>
		            \${renderProductOptions("")}    
		        </select>
            </td>
            <td>
	        	<input type="text" class="form-control" id="display_quantity" required="required">
	        	<input type="hidden" name="product_quantity[]">
	        </td>
            <td><input type="text" class="form-control" name="product_price[]" value="${plan.p_price }" readonly="readonly"></td>
            <td><input type="date" class="form-control" name="product_delivery_date[]" value="${plan.pp_delivery_date }" required="required"></td>
            <td><input type="text" class="form-control" name="product_total_price[]" value="${plan.pp_total_price }" readonly="readonly"></td>
            <td><input type="button" class="btn btn-outline-danger" onclick="removeRow(this)" value="삭제"></td>
        `

        tbody.appendChild(tr);
    }
    
//  품목 삭제
    function removeRow(input){
        const tbody = document.getElementById("products");
        const row = input.closest("tr");
        if(tbody.children.length === 1){
            row.querySelector('select[name="product_p_id[]"]').value = "";
            row.querySelector("#display_quantity").value = "";
            row.querySelector('input[name="product_quantity[]"]').value = "";
            row.querySelector('input[name="product_price[]"]').value = "";
            row.querySelector('input[name="product_price[]"]').dataset.price = "";
            row.querySelector('input[name="product_delivery_date[]"]').value = "";
            row.querySelector('input[name="product_total_price[]"]').value = "";
            row.querySelector('input[name="product_total_price[]"]').dataset.total = "";
            
            recalculateTotal();
        } else {
            tbody.removeChild(row);
            recalculateTotal();
        }
    }
    
//  총합계 계산
    function recalculateTotal(){
	    const total = document.getElementById("total");
		const length = document.getElementById("length");
	    let total_price = 0;
	    let total_length = 0;
	    document.querySelectorAll('input[name="product_total_price[]"]').forEach(sub_total => {
	        total_price += parseInt(sub_total.dataset.total || 0);
	        if(total_price == 0){
	        	return;
	        }
	        
	        total_length += 1;
	    });
	    
	    total.innerHTML = total_price.toLocaleString('ko-KR') + " 원";
	    length.innerHTML = total_length.toLocaleString('ko-KR') + " 개 품목"
    }
//  select에 품목 리스트 넣기
    function renderProductOptions(select_id){
    	const defaultOption = `<option value="" >품목을 선택하세요</option>`;
        const productOption = products.map(p => {
            const selected = p.p_id === select_id ? "selected" : "";
            return `<option value="\${p.p_id}" \${selected}>\${p.p_name}</option>`;
        }).join("");
        
        return defaultOption + productOption;
    }
//  계획 수정
    async function updatePlan() {
        const plan_id = document.getElementById("detailTitle").dataset.id;
        const updateTitle = document.getElementById("detailTitle").value;
        const moduser = document.getElementById("moduser").value;
        
        const plan_products = [];

        document.querySelectorAll("#products tr").forEach(tr => {
        	plan_products.push({
                p_id : parseInt(tr.querySelector('select[name="product_p_id[]"]').value) ,
                pp_quantity : parseInt(tr.querySelector('input[name="product_quantity[]"]').value) ,
                p_price : parseInt(tr.querySelector('input[name="product_price[]"]').dataset.price) ,
                pp_delivery_date : tr.querySelector('input[name="product_delivery_date[]"]').value ,
                pp_total_price : parseInt(tr.querySelector('input[name="product_total_price[]"]').dataset.total)
            });
        });

        const planDTO = {
        	plan_id : plan_id ,
            plan_title : updateTitle ,
            plan_moduser : moduser ,
            products : plan_products
        }
        
        try{
            const response = await fetch("http://localhost:8080/erp/plans/update" , {
                method : "POST" ,
                headers : {"Content-Type" : "application/json"} ,
                body : JSON.stringify(planDTO)
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
//  페이지 로드 시 
    document.addEventListener("DOMContentLoaded" , async () => {
    	const plan_id = ${plan_id};
    	await fetchProductList();
    	await fetchPlanDetail(plan_id);
    	
        recalculateTotal();
    });
//  폼 서밋 시 
    document.getElementById("updatePlan").addEventListener("submit" , async function(event) {
    	event.preventDefault();
    	
    	await updatePlan();
    });
</script>
</body>
</html>