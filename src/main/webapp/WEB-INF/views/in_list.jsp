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
                            <h3>검수목록</h3>
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
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            Simple Datatable 
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th class="text-center">검수번호</th>
                                        <th class="text-center">검수코드</th>
                                        <th class="text-center">입고번호</th>
                                        <th class="text-center">검수일자</th>
                                        <th class="text-center">검수자</th>
                                        <th class="text-center">검수상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                               		<c:forEach var="inpection" items="${list }">
                                		<tr>
                                			<td>${inpection.i_id }</td>
                                			<td><a href="detail?i_id=${inpection.i_id }">${inpection.i_code }</a></td>
                                			<td>${inpection.in_id }</td>
                                			<td>${inpection.i_date }</td>
                                			<td>${inpection.i_inspector }</td>
                                			<td>${inpection.i_result }</td>
                                		</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
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
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>
    <script>
//     	계획 조회
	    async function list(pageNum = "1") {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/plans/listData?pageNum=\${pageNum}` , {
	                method : "GET" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리중 오류 발생");
	            }
	
	            const data = await response.json();
	            
	            const content_list = document.getElementById("content_list");
	            content_list.innerHTML = "";
	            
	            data.forEach(plan => {
	                const tr_content = document.createElement("tr");
	                tr_content.innerHTML = `
	                    <td class="list_td">\${plan.plan_id}</td>
	                    <td class="list_td"><a href="#" class="plan_title" data-id="\${plan.plan_id}"> \${plan.plan_title} </a></td>
	                    <td class="list_td">\${plan.plan_writer}</td>
	                    <td class="list_td">\${plan.plan_regdate}</td>
	                `
	                content_list.appendChild(tr_content);
	            });
	            
		        
		        document.querySelectorAll(".plan_title").forEach(plan => {
		            plan.addEventListener("click" , async function(event) {
		                event.preventDefault();
		                
		                const plan_id = this.getAttribute("data-id");
		                
		                const modal_div = document.getElementById("plan_detail");
		                const modal = new bootstrap.Modal(modal_div);
		                modal.show();
		                
		                await fetchPlanDetail(plan_id);
		                
		                await fetchProductList(setState);
		                
		                modal_div.addEventListener("hidden.bs.modal" , () => {
		                	setState({
		                		mode : "view"
		                	});
		                });
		            }); 
		        });
	    		
	        } catch(error) {
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }
// 		계획 조회 탭 진입 시 리스트 보여주기
	    document.addEventListener("DOMContentLoaded" , () => {
	        list();
	        
	    });
	    
// 	    계획 등록 모달창
        document.getElementById("registerButton").addEventListener("click" , async () => {
        	resetRegisterState();
        	
            const plan_register = document.getElementById("plan_register");
            const modal = new bootstrap.Modal(plan_register);
            modal.show();
            
            await fetchProductList(setRegisterState);
        });
	    
        let planState = {
                mode : "view"  , // or "update" or "register"
                plan: {
                    plan_id : "" ,
                    plan_title : "" ,
                    plan_writer : "" ,
                    plan_regdate : ""
                } ,
                products: [] ,
                totalPrice : 0 ,
                productList : []
            }

            let registerState = {
                plan : {
                    plan_title : "" ,
                    plan_writer : "<%= user %>" ,
                    plan_regdate : new Date().toISOString().slice(0, 16)
                } ,
                products: [] ,
                totalPrice : 0 ,
                productList : []
            }
            
            let backupState = null;
            
            function setState(partialState){
                Object.assign(planState, partialState);
                renderPlanModal();
            }

            function setRegisterState(partialState){
                Object.assign(registerState , partialState);
                renderRegisterModal();
            }

            function updateMode() {
            	backupState = JSON.parse(JSON.stringify(planState)); // 깊은 복사
            	planState.mode = "update";
            	renderPlanModal();
           	}
            
            function cancelUpdate() {
           	    if (backupState) {
           	        planState = JSON.parse(JSON.stringify(backupState));
           	   		planState.mode = "view";
           	   		renderPlanModal();
           	    }
           	}

            function resetRegisterState(){
                setRegisterState({
                    plan : {
                    plan_title : "" ,
                    plan_writer : "<%= user %>" ,
                    plan_regdate : new Date().toISOString().slice(0, 16)
                    } ,
                    products: [
                    	{
                            p_id : "" ,
                            p_name : "" ,
                            pp_quantity : "" ,
                            p_price : "" ,
                            pp_delivery_date : "" ,
                            pp_total_price : ""
                        }
                    ] ,
                    totalPrice : 0 ,
                    productList : []
                });
            }

            async function fetchPlanDetail(plan_id) {
                try{
                    const response = await fetch(`http://localhost:8080/erp/plans/detail?plan_id=\${plan_id}` , {
                        method : "GET" , 
                        headers : {"Content-Type" : "application/json"}
                    });

                    if(!response.ok){
                        throw new Error("데이터 처리중 오류 발생");
                    }

                    const data = await response.json();
                    let total = 0;
                    const products = [];
                    data.forEach(product => {
                        total += product.pp_total_price;
                        products.push({
                            p_id : product.p_id ,
                            p_name : product.p_name ,
                            pp_quantity : product.pp_quantity ,
                            p_price : product.p_price ,
                            pp_delivery_date : product.pp_delivery_date ,
                            pp_total_price : product.pp_total_price
                        });
                    });

                    setState({
                    	mode : "view" ,
                        plan : {
                            plan_id : data[0].plan_id , 
                            plan_title : data[0].plan_title ,
                            plan_writer : data[0].plan_writer ,
                            plan_regdate : data[0].plan_regdate
                        } ,
                        products : products ,
                        totalPrice : total
                    })
                } catch(error){
                    console.error("데이터 처리중 오류 발생" , error);
                }
            }

            async function fetchProductList(setter) {
                try{
    	            const response = await fetch("http://localhost:8080/erp/plans/product_list" , {
    	                method : "GET" , 
    	                headers : {"Content-Type" : "application/json"}
    	            });
    	
    	            if(!response.ok){
    	                throw new Error("데이터 처리 오류");
    	            }
    				
    				const data = await response.json();
                    setter({
                        productList : data
                    });

            	} catch(error) {
            		console.error("오류 발생" , error);
            	}
            }

            function renderProductOptions(select_id , stateKey){
            	const defaultOption = `<option value="" >품목을 선택하세요</option>`;
                const productOption = stateKey.productList.map(p => {
                    const selected = p.p_id === select_id ? "selected" : "";
                    return `<option value="\${p.p_id}" \${selected}>\${p.p_name}</option>`;
                }).join("");
                
                return defaultOption + productOption;
            }

            function onProductChange(index , newId , stateKey , setter){
                const selectProduct = stateKey.productList.find(p => p.p_id === parseInt(newId));
                if(selectProduct){
                	stateKey.products[index].p_id = selectProduct.p_id;
                	stateKey.products[index].p_name = selectProduct.p_name;
                	stateKey.products[index].p_price = selectProduct.p_price;
                } else {
                	stateKey.products[index].p_id = "";
                	stateKey.products[index].p_name = "";
                	stateKey.products[index].p_price = "";
                }
                recalculateTotal(stateKey , setter);
            }

            function onQuantityChange(index , newQuantityValue ,stateKey , setter){
            	stateKey.products[index].pp_quantity = parseInt(newQuantityValue);
                recalculateTotal(stateKey , setter);
            }

            function onDeliveryDateChange(index , newDateValue , stateKey){
            	stateKey.products[index].pp_delivery_date = newDateValue;
            }

            function recalculateTotal(stateKey , setter){
                let total = 0;

                stateKey.products.forEach(p => {
                    p.pp_total_price = p.pp_quantity * p.p_price;
                    total += p.pp_total_price;
                });

                setter({
                    products : [...stateKey.products] ,
                    totalPrice : total
                });
            }

            function removeRow(index , stateKey , setter){
                if(stateKey.products.length === 1){
                	stateKey.products[index].p_id = "";
                	stateKey.products[index].pp_quantity = "";
                	stateKey.products[index].p_price = "";
                	stateKey.products[index].pp_delivery_date = "";
                	stateKey.products[index].pp_total_price = "";
                    
                    recalculateTotal(stateKey , setter);
                } else {
                	stateKey.products.splice(index , 1);

                    recalculateTotal(stateKey , setter);
                }
            }
            
            function registerRow(stateKey , setter){
                if(stateKey.products.length === stateKey.productList.length){
                    alert("상품 갯수보다 행을 더 추가할 수 없습니다.");
                    return;
                }
                const newProduct = {
                    p_id : "" ,
                    p_name : "" ,
                    pp_quantity : "" ,
                    p_price : "" ,
                    pp_delivery_date : "" ,
                    pp_total_price : ""
                }

                setter({
                	products : [...stateKey.products , newProduct]
               	});
            }

            function renderPlanModal(){
                const { mode, plan, products, totalPrice, productList } = planState;
                document.getElementById("detailTitle").value = plan.plan_title;
                document.getElementById("detailTitle").setAttribute("data-id" , plan.plan_id);
                document.getElementById("detailWriter").value = plan.plan_writer;
                document.getElementById("detailRegdate").value = plan.plan_regdate;

                if(mode === "view") {
                	document.getElementById("detailTitle").readOnly = true;
                } else {
                	document.getElementById("detailTitle").readOnly = false;
                }
                const colgroup = document.querySelector("#colgroup");
                if(mode === "view") {
                	colgroup.innerHTML = `
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                    `;
                } else {
                	colgroup.innerHTML = `
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                    `;
                }
                const thead = document.getElementById("detail_thead");
                const tbody = document.querySelector(".item_table_body");
                tbody.innerHTML = "";
                const headers = ["품목명", "수량", "단가", "납기일", "소계"];
                if (mode === "update") headers.push("삭제");
                thead.innerHTML = `<tr>\${headers.map(h => `<th>\${h}</th>`).join('')}</tr>`;
                
                products.forEach((product , i) => {
                    const tr_plan = document.createElement("tr");

                    if(mode === "view"){
                        tr_plan.innerHTML = `
                                <td class="p_name" data-id="\${product.p_id}">\${product.p_name}</td>
                                <td class="pp_quantity">\${product.pp_quantity}</td>
                                <td class="p_price">\${product.p_price.toLocaleString('ko-KR')}</td>
                                <td class="pp_delivery_date">\${product.pp_delivery_date}</td>
                                <td class="pp_total_price">\${product.pp_total_price.toLocaleString('ko-KR')}</td>
                            `   
                    } else {
                        tr_plan.innerHTML = `<td>
                            <select class="form-select" id="form-select" name="product_p_id[]" onchange="onProductChange(\${i} , this.value , planState , setState)" required="required">
                            	\${renderProductOptions(product.p_id , planState)}
                            </select>
                            </td>
                            <td><input type="number" class="form-control" name="product_quantity[]" value="\${product.pp_quantity}" oninput="onQuantityChange(\${i} , this.value , planState , setState)" required="required"></td>
                            <td><input type="text" class="form-control" name="product_price[]" value="\${product.p_price.toLocaleString('ko-KR')}" data-value="\${product.p_price}" readonly="readonly"></td>
                            <td><input type="datetime-local" class="form-control" name="product_delivery_date[]" value="\${product.pp_delivery_date}" onchange="onDeliveryDateChange(\${i} , this.value , planState)" required="required"></td>
                            <td><input type="text" class="form-control" name="product_total_price[]" value="\${product.pp_total_price.toLocaleString('ko-KR')}" data-value="\${product.pp_total_price}" readonly="readonly"></td>
                            <td><input type="button" class="btn btn-danger btn-sm" value="삭제" onclick="removeRow(\${i} , planState , setState)"></td>
                                `   
                    } 
                    
                    tbody.appendChild(tr_plan);
                });
                
                if(planState.mode !== "view") {
                	document.querySelector(".register_product_button_div").innerHTML = `<button type="button" class="btn btn-secondary" onclick="registerRow(planState , setState)">+ 품목 추가</button>`;
                	document.querySelector(".result_buttons").innerHTML = `
                		<button type="submit" class="btn btn-secondary custom" onclick="updatePlan()">저장</button>
        				<button type="button" class="btn btn-secondary custom" onclick="cancelUpdate()">취소</button>
                	`;
                	document.querySelector(".result_buttons").style.marginTop = "35px";
                	document.getElementById("modal-footer").style.display = "none";
                } else {
                	document.querySelector(".register_product_button_div").innerHTML = "";
                	document.getElementById("modal-footer").style.display = "flex";
                	document.querySelector(".result_buttons").innerHTML = "";
                	document.querySelector(".result_buttons").style.marginTop = "0px";
                }
                
                document.getElementById("total_strong").innerHTML = totalPrice.toLocaleString('ko-KR');
            }

            function renderRegisterModal(){
                const { plan, products, totalPrice, productList } = registerState;
                document.getElementById("registerWriter").value = `\${plan.plan_writer}`;
                document.getElementById("registerRegdate").value = `\${plan.plan_regdate}`;
                
                const tbody = document.querySelector("#item_table_body");
                tbody.innerHTML = "";
                
                products.forEach((product , i) => {
	                const tr_plan = document.createElement("tr");
                   	tr_plan.innerHTML = `<td>
                           <select class="form-select" name="product_p_id[]" onchange="onProductChange(\${i} , this.value , registerState , setRegisterState)" required="required">
                           	\${renderProductOptions(product.p_id , registerState)}
                           </select>
                           </td>
                           <td><input type="number" class="form-control" name="product_quantity[]" value="\${product.pp_quantity}" oninput="onQuantityChange(\${i} , this.value , registerState , setRegisterState)" required="required"></td>
                           <td><input type="text" class="form-control" name="product_price[]" value="\${product.p_price.toLocaleString('ko-KR')}" data-value="\${product.p_price}" readonly="readonly"></td>
                           <td><input type="datetime-local" class="form-control" name="product_delivery_date[]" value="\${product.pp_delivery_date}" onchange="onDeliveryDateChange(\${i} , this.value , registerState)" required="required"></td>
                           <td><input type="text" class="form-control" name="product_total_price[]" value="\${product.pp_total_price.toLocaleString('ko-KR')}" data-value="\${product.pp_total_price}" readonly="readonly"></td>
                           <td><input type="button" class="btn btn-danger btn-sm" value="삭제" onclick="removeRow(\${i} , registerState , setRegisterState)"></td>
                           `   
	                tbody.appendChild(tr_plan);
                });
                
                document.getElementById("register_total_strong").innerHTML = totalPrice.toLocaleString('ko-KR');
            }
            
//          계획 등록
            document.getElementById("plan_register_form").addEventListener("submit" , async function(event) {
                event.preventDefault();
                const title = document.getElementById("registerTitle").value;
                const writer = document.getElementById("registerWriter").value;

                const tbody = document.querySelectorAll("#item_table_body tr");
                const products = [];
                
                tbody.forEach(row => {
                	products.push({
                        p_id: parseInt(row.querySelector('select[name="product_p_id[]"]').value) ,
                        pp_quantity: parseInt(row.querySelector('input[name="product_quantity[]"]').value) ,
                        pp_delivery_date: row.querySelector('input[name="product_delivery_date[]"]').value ,
                        pp_total_price: parseInt(row.querySelector('input[name="product_total_price[]"]').dataset.value)
                    });
                });
                
                const planData = {
               		plan_title : title ,
               		plan_writer : writer ,
                	products : products
                }
                try{
    	            const response = await fetch("http://localhost:8080/erp/plans/register" , {
    	                method : "POST" ,
    	                headers : {"Content-Type" : "application/json"} ,
    	                body : JSON.stringify(planData)
    	            });
    	
    	            if(!response.ok){
    	                throw new Error("데이터 처리 오류");
    	            }
    				
    	            location.href="list";
                } catch(error) {
                	console.error("오류 발생", error);
                }
            });
            
//          삭제 confirm 
            function isDelete(){
                if(confirm("정말 삭제하시겠습니까 ?")){
                    plan_delete();
                }
            }
//         	계획 삭제
    		async function plan_delete() {
                const plan_id = document.getElementById("detailTitle").dataset.id;
                try{
    	            const response = await fetch(`http://localhost:8080/erp/plans/delete?plan_id=\${plan_id}` , {
    	                method : "POST" ,
    	                headers : {"Content-Type" : "application/json"}
    	            });
    	
    	            if(!response.ok){
    	                throw new Error("데이터 처리 오류");
    	            }
    	
    	            location.href = "list";
                } catch(error) {
                	console.error("오류 발생" , error);
                }
    		}
//          계획 수정
            async function updatePlan() {
                const plan_id = document.getElementById("detailTitle").dataset.id;
                const updateTitle = document.getElementById("detailTitle").value;

                const products = [];

                document.querySelectorAll(".item_table_body tr").forEach(tr => {
                    products.push({
                        p_id : parseInt(tr.querySelector('select[name="product_p_id[]"]').value) ,
                        pp_quantity : parseInt(tr.querySelector('input[name="product_quantity[]"]').value) ,
                        p_price : parseInt(tr.querySelector('input[name="product_price[]"]').dataset.value) ,
                        pp_delivery_date : tr.querySelector('input[name="product_delivery_date[]"]').value ,
                        pp_total_price : parseInt(tr.querySelector('input[name="product_total_price[]"]').dataset.value)
                    });
                });

                const planDTO = {
                	plan_id : plan_id ,
                    plan_title : updateTitle ,
                    products : products
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
	</script>
</body>
</html>