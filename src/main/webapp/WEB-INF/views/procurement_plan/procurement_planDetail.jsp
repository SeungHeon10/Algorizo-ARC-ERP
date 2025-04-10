<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						<h3>조달 계획 상세보기</h3>
						<p class="text-subtitle text-muted">Check detailed information of a procurement plan.</p>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${contextPath }/plans/list">PlanList</a></li>
								<li class="breadcrumb-item active" aria-current="page">PlanDeatil</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="container mt-4" id="plan_detail">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">조달 계획 상세보기</h4>
						</div>
						<div class="card-body">
							<div class="d-flex custom">
								<div class="form-group width">
									<label for="detailTitle" class="form-label">계획 제목</label> 
									<input type="text" class="form-control" id="detailTitle"
										readonly="readonly">
								</div>
								<div class="form-group width">
									<label for="detailCode" class="form-label">계획 코드</label> 
									<input type="text" class="form-control" id="detailCode"
										readonly="readonly">
								</div>
							</div>
							<div class="d-flex custom">
								<div class="form-group width">
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
											<col style="width: 22%;">
											<col style="width: 12%;">
											<col style="width: 22%;">
											<col style="width: 22%;">
											<col style="width: 22%;">
										</colgroup>
		                                <thead class="table-light">
		                                    <tr>
		                                        <th class="text-center">품목명</th>
		                                        <th class="text-center">수량</th>
		                                        <th class="text-center">단가</th>
		                                        <th class="text-center">납기일</th>
		                                        <th class="text-center">소계</th>
		                                    </tr>
		                                </thead>
		                                <tbody id="plan_products">
		                                	
		                                </tbody>
		                            </table>
								</div>
							</div>
							<div class="col text-end">
							    <button class="btn btn-outline-warning" onclick="location.href='update?plan_id=${plan_id}'">수정</button>
							    <button class="btn btn-outline-danger" onclick="isDelete()">삭제</button>
							    <button class="btn btn-outline-primary" onclick="location.href='list'">목록</button>
						  	</div>
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
	//삭제 confirm 
	function isDelete(){
	    if(confirm("정말 삭제하시겠습니까 ?")){
	        plan_delete();
	    }
	}
	//	계획 삭제
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
// 	조달 계획 상세보기
    async function fetchPlanDetail(plan_id) {
		console.log(plan_id);
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

            const tbody = document.getElementById("plan_products");
            data.forEach(plan_product => {
                const tr = document.createElement("tr");
                const delivery_date = plan_product.pp_delivery_date?.slice(0, 10);
                tr.innerHTML = `
                    <td class="p_name">\${plan_product.p_name}</td>
                    <td class="pp_quantity">\${plan_product.pp_quantity.toLocaleString('ko-KR')}</td>
                    <td class="p_price">\${plan_product.p_price.toLocaleString('ko-KR')}</td>
                    <td class="pp_delivery_date">\${delivery_date}</td>
                    <td class="pp_total_price">\${plan_product.pp_total_price.toLocaleString('ko-KR')}</td>
                `
                tbody.appendChild(tr);
            });
        } catch(error){
            console.error("데이터 처리중 오류 발생" , error);
        }
    }
    
    document.addEventListener("DOMContentLoaded" , async () => {
    	const plan_id = ${plan_id};
    	await fetchPlanDetail(plan_id);
    });
</script>
</body>
</html>