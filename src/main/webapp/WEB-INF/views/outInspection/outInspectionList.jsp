<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String user = (String)session.getAttribute("m_name"); %>
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
                            <h3>출고 검수 조회</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">OutInspectionList</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th class="text-center">검수번호</th>
                                        <th class="text-center">검수코드</th>
                                        <th class="text-center">입고번호</th>
                                        <th class="text-center">검수일자</th>
                                        <th class="text-center">검수자</th>
                                        <th class="text-center">검수결과</th>
                                    </tr>
                                </thead>
                                <tbody id="content_list">

                                </tbody>
                            </table>
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
	// 	검수 조회
	    async function list() {
	        try{
	            const response = await fetch(`http://localhost:8080/erp/outInspection/listData` , {
	                method : "GET" ,
	                headers : {"Content-Type" : "application/json"}
	            });
	
	            if(!response.ok){
	                throw new Error("데이터 처리중 오류 발생");
	            }
	
	            const data = await response.json();
	            
	            const content_list = document.getElementById("content_list");
	            content_list.innerHTML = "";
	            
	            data.forEach(outInpection => {
	                const tr_content = document.createElement("tr");
	                tr_content.innerHTML = `
	                	<td>\${outInpection.oi_id }</td>
            			<td><a href="detail?oi_id=\${outInpection.oi_id }">\${outInpection.oi_code }</a></td>
            			<td>\${outInpection.out_id }</td>
            			<td>\${outInpection.oi_date }</td>
            			<td>\${outInpection.oi_inspector }</td>
            			<td><span>\${outInpection.oi_result }</span></td>
	                `;
	                
	                const span = tr_content.querySelector("span");
	                span.classList.add("badge");
	                
	                if(outInpection.oi_result === "합격"){
	                	span.classList.add("bg-success");
	                } else if(outInpection.oi_result === "불합격") {
	                	span.classList.add("bg-danger");
	                } else {
	                	span.classList.add("bg-warning");
	                }
	                
	                content_list.appendChild(tr_content);
	            });
	            
		        let table1 = document.querySelector('#table1');
		        let dataTable = new simpleDatatables.DataTable(table1);
	    		
	        } catch(error) {
	            console.error("데이터 처리중 오류 발생" , error);
	        }
	    }
	    
	//	검수 조회 탭 진입 시 리스트 보여주기
	    document.addEventListener("DOMContentLoaded" , () => {
	        list();
	    });
    </script>
</body>
</html>