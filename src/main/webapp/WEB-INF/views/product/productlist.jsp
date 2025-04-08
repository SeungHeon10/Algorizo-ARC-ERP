<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="../include/head.jsp"%>
<style>
.filter-section {
	background: #fff;
	border-radius: 8px;
	padding: 16px;
	margin-bottom: 20px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
	border: 1px solid #eaeaea;
}

.filter-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.category-table-container {
	overflow-x: auto;
}

.category-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
}

.category-table th {
	background-color: #f8f9fa;
	color: #495057;
	font-weight: 600;
	padding: 12px 15px;
	text-align: left;
	border-bottom: 2px solid #ddd;
}

.category-column {
	vertical-align: top;
	padding: 10px 15px;
	border-right: 1px solid #eee;
}

.category-column:last-child {
	border-right: none;
}

.category-item {
	margin-bottom: 10px;
}

.radio-container {
	display: flex;
	align-items: center;
	cursor: pointer;
	font-size: 14px;
	color: #333;
	margin: 0;
	padding: 5px 0;
}

.radio-container input[type="radio"] {
	margin-right: 8px;
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: 0;
	width: 18px;
	height: 18px;
	border: 2px solid #ddd;
	border-radius: 50%;
	position: relative;
	transition: all 0.2s ease;
}

.radio-container input[type="radio"]:checked {
	border-color: #435ebe;
}

.radio-container input[type="radio"]:after {
	content: '';
	display: block;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0);
	background: #435ebe;
	transition: all 0.2s ease;
}

.radio-container input[type="radio"]:checked:after {
	transform: translate(-50%, -50%) scale(1);
}

.radio-label {
	font-weight: normal;
}

.active-filters {
	display: flex;
	align-items: center;
	padding: 12px 15px;
	background-color: #f8f9fa;
	border-radius: 6px;
	gap: 10px;
}

.filter-label {
	font-size: 14px;
	font-weight: 600;
	color: #495057;
}

.filter-path {
	font-size: 14px;
	color: #435ebe;
	font-weight: 500;
}

#clearFilters {
	margin-left: auto;
	padding: 4px 8px;
	font-size: 12px;
	color: #6c757d;
	border-color: #dee2e6;
}

#clearFilters:hover {
	background-color: #f8f9fa;
	color: #343a40;
}

/* 반응형 조정 */
@media ( max-width : 768px) {
	.category-table {
		min-width: 600px;
	}
}

/* 모달 스타일 추가 */
.modal-header {
	background-color: #435ebe;
	color: white;
}

.modal-title {
	font-weight: 600;
}

.modal-dialog {
	max-width: 800px;
}
</style>
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<%@include file="../include/left_column.jsp"%>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>품목관리</h3>
							<p class="text-subtitle text-muted">알고리조 컴퍼니 품목관리 화면</p>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/erp">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">DataTable</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section">
					<div class="card">
						<div class="card-header">
							<h4>품목 목록</h4>
							<!-- 필터 섹션 추가 -->
							<div class="filter-section">
								<div class="filter-container">
									<div class="category-table-container">
										<table class="category-table">
											<thead>
												<tr>
													<th>대분류</th>
													<th>중분류</th>
													<th>소분류</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="category-column">
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="lctg" value="" checked> <span
																class="radio-label">전체</span>
															</label>
														</div>
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="lctg" value="자동차"> <span
																class="radio-label">자동차</span>
															</label>
														</div>
													</td>
													<td class="category-column">
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="mctg" value="" checked> <span
																class="radio-label">전체</span>
															</label>
														</div>
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="mctg" value="내장부품"> <span
																class="radio-label">내장부품</span>
															</label>
														</div>
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="mctg" value="외장부품"> <span
																class="radio-label">외장부품</span>
															</label>
														</div>
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="mctg" value="유닛&모듈"> <span
																class="radio-label">유닛&모듈</span>
															</label>
														</div>
													</td>
													<td class="category-column" id="small-categories">
														<div class="category-item">
															<label class="radio-container"> <input
																type="radio" name="sctg" value="" checked> <span
																class="radio-label">전체</span>
															</label>
														</div> <!-- 여기에 동적으로 소분류 옵션이 생성됩니다 -->
													</td>
												</tr>
											</tbody>
										</table>
									</div>

									<!-- 현재 적용된 필터 표시 -->
									<div class="ms-auto d-flex align-items-center">
										<button id="clearFilters"
											class="btn btn-sm btn-outline-secondary ms-2">전체 초기화</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">품목번호</th>
										<th class="text-center">품목코드</th>
										<th class="text-center">대분류</th>
										<th class="text-center">중분류</th>
										<th class="text-center">소분류</th>
										<th class="text-center">품목명</th>
										<th class="text-center">입고일</th>
										<th class="text-center">공급업체</th>
										<!-- <th class="text-center">상태</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${productlist}">
										<tr>
											<td>${product.p_id}</td>
											<td><a href="${contextPath}/product/productdetail?p_code=${product.p_code}" class="text-primary">${product.p_code}</a></td>
											<td>${product.p_lctg}</td>
											<td>${product.p_mctg}</td>
											<td>${product.p_sctg}</td>
											<td>${product.p_name}</td>
											<td>${product.p_regdate}</td>
											<td>${product.cp_name}</td>
											<!-- <td><span class="badge bg-success">Active</span></td> -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-sm-12 d-flex justify-content-end">
								<button type="button" id="openProductModal"
									class="btn btn-primary me-1 mb-1">품목등록</button>
							</div>
						</div>
					</div>
				</section>

				<!-- 품목등록 모달 -->
				<div class="modal fade" id="productInsertModal" tabindex="-1"
					role="dialog" aria-labelledby="productInsertModalTitle"
					aria-hidden="true">
					<div
						class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
						role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="productInsertModalTitle">품목등록</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form id="productInsertForm" class="form form-horizontal"
									action="/erp/product/productinsert" method="post">
									<div class="form-body">
										<div class="row">
											<div class="col-md-4">
												<label>대분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="category" class="form-control" name="p_lctg"
													required>
													<option value="" disabled selected>선택</option>
													<option value="자동차">자동차 부품</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>중분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="subcategory" class="form-control" name="p_mctg"
													required>
													<option value="" disabled selected>선택</option>
													<option value="내장부품">내장부품</option>
													<option value="외장부품">외장부품</option>
													<option value="유닛&모듈">유닛&모듈</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>소분류</label>
											</div>
											<div class="col-md-8 form-group">
												<select id="item" class="form-control" name="p_sctg"
													required>
													<option value="" disabled selected>선택</option>
												</select>
											</div>

											<div class="col-md-4">
												<label>발주코드</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="hidden" name="p_code"
													value="${nextProductCode}"> <input type="text"
													class="form-control" id="p_code" readonly="readonly"
													value="${nextProductCode}">
											</div>
											<div class="col-md-4">
												<label>품목명</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" name="p_name"
													required>
											</div>

											<div class="col-md-4">
												<label>제품소개</label>
											</div>
											<div class="col-md-8 form-group">
												<textarea class="form-control" name="p_content" rows="3"></textarea>
											</div>

											<div class="col-md-4">
												<label>판매단가</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="number" class="form-control" name="p_price"
													required>
											</div>

											<div class="col-md-4">
												<label>작성일</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" name="p_regdate"
													readonly>
											</div>

											<div class="col-md-4">
												<label>수정일</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" name="p_moddate"
													readonly>
											</div>

											<div class="col-md-4">
												<label>담당자</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control"
													value="${member.m_name}" readonly> <input
													type="hidden" name="member_m_id" value="${member.m_id}">
											</div>

											<div class="col-md-4">
												<label>담당부서</label>
											</div>
											<div class="col-md-8 form-group">
												<input type="text" class="form-control" value="${dept.team}"
													readonly> <input type="hidden" name="dept_d_id"
													value="${not empty dept.d_id ? dept.d_id : 0}">
											</div>

											<!-- test -->
											<div class="col-md-4">
												<label>공급업체</label>
											</div>
											<section class="basic-choices">
												<div class="form-group">
													<select class="choices form-select" name="company_cp_id"
														required>
														<option value="" disabled selected>선택</option>
														<c:forEach var="company" items="${companylist}">
															<option value="${company.cp_id}">${company.cp_name}</option>
														</c:forEach>
													</select>
												</div>
											</section>



										</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light-secondary"
									data-bs-dismiss="modal">
									<i class="bx bx-x d-block d-sm-none"></i> <span
										class="d-none d-sm-block">취소</span>
								</button>
								<button type="button" class="btn btn-light-secondary"
									id="resetForm">
									<i class="bx bx-check d-block d-sm-none"></i> <span
										class="d-none d-sm-block">초기화</span>
								</button>
								<button type="button" class="btn btn-primary ml-1"
									id="submitProduct">
									<i class="bx bx-check d-block d-sm-none"></i> <span
										class="d-none d-sm-block">품목등록</span>
								</button>
							</div>
						</div>
					</div>
				</div>

				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
				$(document).ready(function() {
				    // 초기 변수 설정
				    let currentLctg = "";
				    let currentMctg = "";
				    let currentSctg = "";
				    
				    // 소분류 옵션 데이터
				    let smallCategoryOptions = {
				        "내장부품": ["오디오/앰프", "시트", "계기판", "공조기", "핸들", "기타부품"],
				        "외장부품": ["테일램프(후미등)", "헤드라이트", "사이드미러", "기타부품"],
				        "유닛&모듈": ["ABS", "ECU", "TCU", "에어백", "카메라", "기타부품"]
				    };
				    
				    // 대분류 선택 처리
				    $("input[name='lctg']").change(function() {
				        currentLctg = $(this).val();
				        // 전체를 선택한 경우 빈 문자열로 설정
				        if (currentLctg === "") {
				            currentLctg = "";
				        }
				        updateFilterPath();
				        applyFilters();
				    });

				    // 중분류 선택 처리
				    $("input[name='mctg']").change(function() {
				        currentMctg = $(this).val();
				        // 전체를 선택한 경우 빈 문자열로 설정
				        if (currentMctg === "") {
				            currentMctg = "";
				            // 소분류 초기화 (전체만 표시)
				            $("#small-categories").html(`
				                <div class="category-item">
				                    <label class="radio-container">
				                        <input type="radio" name="sctg" value="" checked>
				                        <span class="radio-label">전체</span>
				                    </label>
				                </div>
				            `);
				        } else {
				            // 선택된 중분류에 해당하는 소분류 옵션 생성
				            let smallCategoriesHtml = `
				                <div class="category-item">
				                    <label class="radio-container">
				                        <input type="radio" name="sctg" value="" checked>
				                        <span class="radio-label">전체</span>
				                    </label>
				                </div>
				            `;
				            
				            // 해당 중분류의 소분류 옵션들 추가
				            if (smallCategoryOptions[currentMctg]) {
				                smallCategoryOptions[currentMctg].forEach(function(item) {
				                    smallCategoriesHtml += `
				                        <div class="category-item">
				                            <label class="radio-container">
				                                <input type="radio" name="sctg" value="${item}">
				                                <span class="radio-label">${item}</span>
				                            </label>
				                        </div>
				                    `;
				                });
				            }
				            
				            // 소분류 영역 업데이트
				            $("#small-categories").html(smallCategoriesHtml);
				        }
				        
				        // 소분류 선택 초기화
				        currentSctg = "";
				        updateFilterPath();
				        applyFilters();
				    });

				    // 소분류 선택 처리 - 동적으로 생성된 요소에 대한 이벤트 위임
				    $(document).on("change", "input[name='sctg']", function() {
				        currentSctg = $(this).val();
				        // 전체를 선택한 경우 빈 문자열로 설정
				        if (currentSctg === "") {
				            currentSctg = "";
				        }
				        updateFilterPath();
				        applyFilters();
				    });

				    // 필터 초기화
				    $("#clearFilters").click(function() {
				        // 모든 필터 변수 초기화
				        currentLctg = "";
				        currentMctg = "";
				        currentSctg = "";

				        // 모든 '전체' 라디오 버튼 선택
				        $("input[name='lctg'][value='']").prop("checked", true);
				        $("input[name='mctg'][value='']").prop("checked", true);
				        
				        // 소분류 옵션 초기화
				        $("#small-categories").html(`
				            <div class="category-item">
				                <label class="radio-container">
				                    <input type="radio" name="sctg" value="" checked>
				                    <span class="radio-label">전체</span>
				                </label>
				            </div>
				        `);

				        // 필터 경로 및 테이블 업데이트
				        updateFilterPath();
				        applyFilters();
				    });

				    // 필터 경로 업데이트
				    function updateFilterPath() {
				        let filterText = "전체 품목";
				        let path = [];

				        if (currentLctg) {
				            path.push(currentLctg);
				        }

				        if (currentMctg) {
				            path.push(currentMctg);
				        }

				        if (currentSctg) {
				            path.push(currentSctg);
				        }

				        if (path.length > 0) {
				            filterText = path.join(" > ");
				        }

				        $("#currentFilter").text(filterText);
				    }

				    // 테이블에 필터 적용
				    function applyFilters() {
				        $("#table1 tbody tr").each(function() {
				            let rowLctg = $(this).find("td:nth-child(3)").text().trim();
				            let rowMctg = $(this).find("td:nth-child(4)").text().trim();
				            let rowSctg = $(this).find("td:nth-child(5)").text().trim();
				            let showRow = true;

				            // 대분류 필터가 설정되어 있고, 행의 대분류가 일치하지 않으면 숨김
				            if (currentLctg && rowLctg !== currentLctg) {
				                showRow = false;
				            }

				            // 중분류 필터가 설정되어 있고, 행의 중분류가 일치하지 않으면 숨김
				            if (showRow && currentMctg && rowMctg !== currentMctg) {
				                showRow = false;
				            }

				            // 소분류 필터가 설정되어 있고, 행의 소분류가 일치하지 않으면 숨김
				            if (showRow && currentSctg && rowSctg !== currentSctg) {
				                showRow = false;
				            }

				            $(this).toggle(showRow);
				        });

				        // 데이터테이블 재초기화
				        if (typeof dataTable !== 'undefined') {
				            dataTable.update();
				        }
				    }

				    // 페이지 로드 시 필터 초기화
				    updateFilterPath();
				    applyFilters();

				    // 품목등록 모달 열기
				    $("#openProductModal").click(function() {
				        // 현재 날짜 설정 (작성일)
				        let today = new Date();
				        let formattedDate = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
				        $("input[name='p_regdate']").val(formattedDate);

				        // 모달 열기
				        $("#productInsertModal").modal('show');
				    });

				 // 중분류 변경 시 소분류 옵션 업데이트 (모달 내에서)
				    $("#subcategory").change(function() {
				        console.log("중분류 변경됨:", $(this).val()); // 디버깅용 로그
				        let subcategory = $(this).val();
				        let itemSelect = $("#item");
				        
				        // 기존의 모든 옵션을 명시적으로 제거 
				        itemSelect.empty();
				        
				        // 초기 옵션 추가
				        itemSelect.append('<option value="" disabled selected>선택</option>');
				        
				        // 중분류에 따른 소분류 옵션 추가
				        let options = {
				            "내장부품" : ["오디오/앰프", "시트", "계기판", "공조기", "핸들", "기타부품"],
				            "외장부품" : ["테일램프(후미등)", "헤드라이트", "사이드미러", "기타부품"],
				            "유닛&모듈" : ["ABS", "ECU", "TCU", "에어백", "카메라", "기타부품"]
				        };
				        
				        console.log("소분류 옵션 설정:", options[subcategory]); // 디버깅용 로그
				        
				        if (options[subcategory]) {
				            options[subcategory].forEach(function(item) {
				                // 요소를 직접 생성하고 속성 설정
				                let option = document.createElement('option');
				                option.value = item;
				                option.textContent = item;
				                option.style.color = "#333"; // 색상 직접 지정
				                itemSelect.append(option);
				            });
				            
				            console.log("소분류 옵션 수:", $("#item option").length); // 디버깅용 로그
				        }
				        
				        // 소분류 선택 가능하도록 설정
				        itemSelect.prop('disabled', false);
				    });

				    // 소분류 변경 이벤트 추가
				    $("#item").change(function() {
				        console.log("소분류 선택됨:", $(this).val()); // 선택된 값 확인
				    });

				    // 폼 제출 전 모든 필드의 값을 콘솔에 출력 (디버깅용)
				    $("#submitProduct").click(function() {
				        console.log("대분류:", $("#category").val());
				        console.log("중분류:", $("#subcategory").val());
				        console.log("소분류:", $("#item").val());
				        
				        // 폼 유효성 검사
				        if ($("#productInsertForm")[0].checkValidity()) {
				            $("#productInsertForm").submit();
				        } else {
				            // HTML5 기본 유효성 검사 메시지 트리거
				            $("#productInsertForm")[0].reportValidity();
				        }
				    });

				    // 폼 초기화 버튼
				    $("#resetForm").click(function() {
				        $("#productInsertForm")[0].reset();
				        // 소분류 초기화
				        $("#item").html('<option value="" disabled selected>선택</option>');
				    });

				    // 폼 제출
				    $("#submitProduct").click(function() {
				        // 폼 유효성 검사
				        if ($("#productInsertForm")[0].checkValidity()) {
				            $("#productInsertForm").submit();
				        } else {
				            // HTML5 기본 유효성 검사 메시지 트리거
				            $("#productInsertForm")[0].reportValidity();
				        }
				    });
				});
				</script>
			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2021 &copy; Mazer</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class="text-danger"><i
								class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A.
								Saugi</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="${contextPath}/resources/static/dist/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${contextPath}/resources/static/dist/assets/js/bootstrap.bundle.min.js"></script>

	<script
		src="${contextPath}/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	<!-- Include Choices JavaScript -->
	<script
		src="${contextPath}/resources/static/dist/assets/vendors/choices.js/choices.min.js"></script>

	<script src="${contextPath}/resources/static/dist/assets/js/main.js"></script>
</body>

</html>