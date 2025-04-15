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
                            <h3>출고 검수 상세보기</h3>
                            <p class="text-subtitle text-muted">Check detailed inspection results.</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${contextPath }/inspection/list">InspectionList</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">InspectionDetail</li>
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
								<h4 class="card-title">출고 검수 상세보기</h4>
							</div>
							<div class="card-body">
								<div class="d-flex custom">
									<div class="form-group width">
										<label for="out_id" class="form-label">출고 번호</label> 
										<input type="text" id="out_id" class="form-control" readonly>
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
									<div class="d-flex custom">
										<div class="form-group width">
                                            <label for="outInspection_moduser" class="form-label">최종 수정자</label>
                                            <input type="text" id="outInspection_moduser" 
                                            	class="form-control" readonly>
	                                    </div>
	                                    <div class="form-group width">
                                            <label for="outInspection_moddate" class="form-label">최종 수정일</label>
                                            <input type="text" id="outInspection_moddate" 
                                            	class="form-control" readonly>
	                                    </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="outInspection_result" class="form-label">결과</label>
                                            <input type="text" id="outInspection_result" class="form-control" name="i_result" 
                                            		readonly>
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
                                                class="form-control" name="i_defective_quantity" readonly>
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
                                            <input id="outInspection_defect_reason" class="form-control" readonly>
                                        </div>
                                    </div>
                                    <div id="custom_reason_div">
                                        <div class="form-group">
                                            <input type="text" id="outInspection_custom_reason" class="form-control" placeholder="기타 사유를 입력해주세요 ..." readonly>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="outInspection_inspector" class="form-label">검사자</label>
                                            <input type="text" id="outInspection_inspector"
                                                class="form-control" name="i_inspector" readonly >
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="outInspection_etc" class="form-label">비고</label>
                                            <input type="text" id="outInspection_etc"
                                                class="form-control" name="i_etc" readonly>
                                        </div>
                                    </div>
                                </div>
								<div class="text-end">
									<button class="btn btn-outline-warning" onclick="location.href='update?oi_id=${oi_id}'">수정</button>
									<button class="btn btn-outline-danger" onclick="isDelete()">삭제</button>
									<button class="btn btn-outline-primary" onclick="location.href='list'">목록</button>
								</div>
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
	//삭제 confirm 
	function isDelete(){
	    if(confirm("정말 삭제하시겠습니까 ?")){
	        inspection_delete();
	    }
	}
	//	검수 삭제
	async function inspection_delete() {
	    const oi_id = ${oi_id};
	    try{
	        const response = await fetch(`http://localhost:8080/erp/outInspection/delete?oi_id=\${oi_id}` , {
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
// 	검수 상세보기
    async function fetchInspectionDetail(oi_id) {
        try{
            const response = await fetch(`http://localhost:8080/erp/outInspection/detailData?oi_id=\${oi_id}` , {
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
            document.getElementById("outInspection_moduser").value = data.oi_moduser;
            document.getElementById("outInspection_moddate").value = data.oi_moddate;
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
				<td>\${data.outboundDTO.out_quantity }</td>
            `
            tbody.appendChild(tr);
            
            if(data.defect_reason_code !== null){
            	document.getElementById("defect_reason_div").classList.remove("hide");
            	document.getElementById("outInspection_defect_reason").value = data.defectReasonDTO.reason_name;
            }
            
            if(data.oi_custom_reason !== null){
            	document.getElementById("custom_reason_div").style.display = "block";
            	document.getElementById("outInspection_custom_reason").value = data.oi_custom_reason;
            }
            
        } catch(error){
            console.error("데이터 처리중 오류 발생" , error);
        }
    }
    
    document.addEventListener("DOMContentLoaded" , async () => {
    	const oi_id = ${oi_id};
    	await fetchInspectionDetail(oi_id);
    });
    </script>
</body>
</html>