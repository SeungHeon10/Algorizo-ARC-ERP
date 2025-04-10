<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String user = (String)session.getAttribute("m_name"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

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
                            <h3>조달 계획 조회</h3>
                            <p class="text-subtitle text-muted">View and manage procurement plans.</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/home">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">PlanList</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            Procurement Plan List
                        </div>
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                            	<colgroup>
							        <col style="width: 10%;">  <!-- 번호 -->
							        <col style="width: 15%;">  <!-- 제목 -->
							        <col style="width: 35%;">  <!-- 제목 -->
							        <col style="width: 15%;">  <!-- 작성자 -->
							        <col style="width: 25%;">  <!-- 등록일 -->
							    </colgroup>
                                <thead>
                                    <tr>
                                        <th class="text-center">계획번호</th>
                                        <th class="text-center">계획코드</th>
                                        <th class="text-center">제목</th>
                                        <th class="text-center">작성자</th>
                                        <th class="text-center">등록일</th>
                                    </tr>
                                </thead>
                                <tbody id="content_list">
                                	
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
	    <footer>
	        <%@ include file="../include/footer.jsp" %>
	    </footer>
	</div>
    <!-- 플러그인 -->
    <%@ include file="../include/plugin.jsp" %>
    <script src="${contextPath }/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

    <script src="${contextPath }/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
    <script src="${contextPath }/resources/static/dist/assets/js/main.js"></script>
    <script>
//     	계획 조회
	    async function list() {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/plans/listData` , {
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
	                    <td class="list_td"><a href="detail?plan_id=\${plan.plan_id}" class="plan_title" data-id="\${plan.plan_id}">\${plan.plan_code}</a></td>
	                    <td class="list_td">\${plan.plan_title} </td>
	                    <td class="list_td">\${plan.plan_writer}</td>
	                    <td class="list_td">\${plan.plan_regdate}</td>
	                `
	                content_list.appendChild(tr_content);
	            });
	            
		        let table1 = document.querySelector('#table1');
		        let dataTable = new simpleDatatables.DataTable(table1);
	    		
	        } catch(error) {
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }
	    
// 		계획 조회 탭 진입 시 리스트 보여주기
	    document.addEventListener("DOMContentLoaded" , () => {
	        list();
	        
	    });
	</script>
</body>
</html>