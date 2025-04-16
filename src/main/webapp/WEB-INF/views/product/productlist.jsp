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
  gap: 6px;
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
  display: inline-block; /* 이 부분 추가 */
  margin-left: 5px; /* 이 부분 추가 */
  vertical-align: middle; /* 이 부분 추가 */
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
@media (max-width: 768px) {
  .category-table {
    min-width: 600px;
  }
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
						<h3 style="padding-left: 20px;">판매 제품 목록</h3>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb"
								class="breadcrumb-header float-start float-lg-end">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${contextPath }/home">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Product List</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<section class="section">
					<div class="card">
						<div class="card-header">
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
									            <label class="radio-container">
									              <input type="radio" name="lctg" value="" checked>
									              <span class="radio-label">전체</span>
									            </label>
									          </div>
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="lctg" value="자동차">
									              <span class="radio-label">자동차</span>
									            </label>
									          </div>
									        </td>
									        <td class="category-column">
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="mctg" value="" checked>
									              <span class="radio-label">전체</span>
									            </label>
									          </div>
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="mctg" value="내장부품">
									              <span class="radio-label">내장부품</span>
									            </label>
									          </div>
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="mctg" value="외장부품">
									              <span class="radio-label">외장부품</span>
									            </label>
									          </div>
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="mctg" value="유닛&모듈">
									              <span class="radio-label">유닛&모듈</span>
									            </label>
									          </div>
									        </td>
									        <td class="category-column" id="small-categories">
									          <div class="category-item">
									            <label class="radio-container">
									              <input type="radio" name="sctg" value="" checked>
									              <span class="radio-label">전체</span>
									            </label>
									          </div>
									          <!-- 여기에 동적으로 소분류 옵션이 생성됩니다 -->
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
							<!-- 원본 테이블 -->
							<table class="table table-striped d-none" id="originalTable">
								<thead>
									<tr>
										<th class="text-center">품목번호</th>
										<th class="text-center">품목코드</th>
										<th class="text-center">품목명</th>
										<th class="text-center">대분류</th>
										<th class="text-center">중분류</th>
										<th class="text-center">소분류</th>
										<th class="text-center">입고일</th>
										<th class="text-center">공급업체</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${productlist}">
										<tr>
											<td>${product.p_id}</td>
											<td><a
												href="${contextPath}/product/productdetail?p_code=${product.p_code}" class="text-primary">${product.p_code}</a></td>
											<td>${product.p_name}</td>
											<td>${product.p_lctg}</td>
											<td>${product.p_mctg}</td>
											<td>${product.p_sctg}</td>
											<td>${product.p_regdate}</td>
											<td>${product.cp_name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<!-- 필터링된 테이블 (DataTable로 사용됨) -->
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th class="text-center">품목번호</th>
										<th class="text-center">품목코드</th>
										<th class="text-center">품목명</th>
										<th class="text-center">대분류</th>
										<th class="text-center">중분류</th>
										<th class="text-center">소분류</th>
										<th class="text-center">입고일</th>
										<th class="text-center">공급업체</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${productlist}">
										<tr>
											<td>${product.p_id}</td>
											<td><a
												href="${contextPath}/product/productdetail?p_code=${product.p_code}"
												class="text-primary">${product.p_code}</a></td>
											<td>${product.p_name}</td>
											<td>${product.p_lctg}</td>
											<td>${product.p_mctg}</td>
											<td>${product.p_sctg}</td>
											<td>${product.p_regdate}</td>
											<td>${product.cp_name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-sm-12 d-flex justify-content-end">
								<button type="button" onclick="location.href='productinsert'" class="btn btn-outline-primary me-1 mb-1">품목등록</button>
							</div>
						</div>
					</div>
				</section>

				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
				// 전역 변수
				let dataTable;
				
				$(document).ready(function() {
				    // 초기 변수 설정
				    let currentLctg = $("input[name='lctg']:checked").val() || "";
				    let currentMctg = $("input[name='mctg']:checked").val() || "";
				    let currentSctg = $("input[name='sctg']:checked").val() || "";
				    
				    // 원본 테이블 숨기기
				    $("#originalTable").hide();
				    
				    // DataTable 초기화
				    initDataTable();
				    
				    // 소분류 옵션 데이터
				    let smallCategoryOptions = {
				        // 향후 데이터가 필요한 경우 여기에 추가
				    };
				    
				    // 페이지 로드 시 중분류가 선택되어 있으면 소분류 옵션 업데이트
				    if (currentMctg && currentMctg !== "") {
				        updateSmallCategoryOptions(currentMctg);
				    }
				    
				    // 대분류 선택 처리
				    $("input[name='lctg']").change(function() {
				        currentLctg = $(this).val();
				        
				        // 전체를 선택한 경우 중분류와 소분류도 초기화
				        if (currentLctg === "") {
				            currentMctg = "";
				            currentSctg = "";
				            
				            // 중분류와 소분류를 '전체'로 선택
				            $("input[name='mctg'][value='']").prop("checked", true);
				            
				            // 소분류 초기화 (전체만 표시)
				            $("#small-categories").html(`
				                <div class="category-item">
				                    <label class="radio-container">
				                        <input type="radio" name="sctg" value="" checked>
				                        <span class="radio-label">전체</span>
				                    </label>
				                </div>
				            `);
				        }
				        
				        updateFilterPath();
				        applyFilters();
				    });

				    // 중분류 선택 처리
				    $("input[name='mctg']").change(function() {
				        currentMctg = $(this).val();
				        console.log("선택된 중분류:", currentMctg);
				        
				        // 중분류 선택에 따라 소분류 옵션 업데이트
				        updateSmallCategoryOptions(currentMctg);
				        
				        // 소분류 선택 초기화
				        currentSctg = "";
				        $("input[name='sctg'][value='']").prop("checked", true);
				        
				        updateFilterPath();
				        applyFilters();
				    });

				    // 소분류 옵션 업데이트 함수
				    function updateSmallCategoryOptions(mctgValue) {
				        // 전체를 선택한 경우 소분류도 초기화
				        if (mctgValue === "") {
				            currentSctg = "";
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
				            if (smallCategoryOptions[mctgValue]) {
				                smallCategoryOptions[mctgValue].forEach(function(item) {
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
				    }

				    // 소분류 선택 처리 - 동적으로 생성된 요소에 대한 이벤트 위임
				    $(document).on("change", "input[name='sctg']", function() {
				        currentSctg = $(this).val();
				        console.log("선택된 소분류:", currentSctg);
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

				        // 필터 경로 업데이트
				        updateFilterPath();
				        
				        // 필터링 초기화 (모든 데이터 표시)
				        resetFilters();
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

				        // 활성 필터 표시 (필요시 HTML에 추가)
				        if (!$("#active-filters").length) {
				            // 필터 표시 영역이 없으면 생성
				            $(".filter-container").append(`
				                <div id="active-filters" class="active-filters">
				                    <span class="filter-label">현재 필터:</span>
				                    <span id="currentFilter" class="filter-path">${filterText}</span>
				                </div>
				            `);
				        } else {
				            // 있으면 업데이트
				            $("#currentFilter").text(filterText);
				        }
				    }

				    // DataTable 초기화 함수
				    function initDataTable() {
				        let table1 = document.querySelector('#table1');
				        dataTable = new simpleDatatables.DataTable(table1, {
				            perPage: 10,
				            perPageSelect: false,
				            searchable: true,
				            fixedHeight: false
				        });
				    }
				    
				    // 필터 적용 함수 (테이블 재구성)
				    function applyFilters() {
				        try {
				            // 기존 데이터테이블 제거
				            if (dataTable) {
				                dataTable.destroy();
				            }
				            
				            // table1의 tbody 비우기
				            $("#table1 tbody").empty();
				            
				            // 원본 테이블에서 필터에 맞는 행만 새 테이블로 복사
				            $("#originalTable tbody tr").each(function() {
				                let rowLctg = $(this).find("td:eq(3)").text().trim();
				                let rowMctg = $(this).find("td:eq(4)").text().trim();
				                let rowSctg = $(this).find("td:eq(5)").text().trim();
				                let showRow = true;

				                // 필터 조건 확인
				                if (currentLctg && rowLctg !== currentLctg) {
				                    showRow = false;
				                }
				                if (showRow && currentMctg && rowMctg !== currentMctg) {
				                    showRow = false;
				                }
				                if (showRow && currentSctg && rowSctg !== currentSctg) {
				                    showRow = false;
				                }

				                // 조건에 맞는 행만 복사
				                if (showRow) {
				                    let newRow = $(this).clone();
				                    $("#table1 tbody").append(newRow);
				                }
				            });
				            
				            // 새로운 DataTable 초기화
				            initDataTable();
				            
				        } catch (e) {
				            console.error("필터링 오류:", e);
				        }
				    }
				    
				    // 필터 초기화 함수
				    function resetFilters() {
				        try {
				            // 기존 데이터테이블 제거
				            if (dataTable) {
				                dataTable.destroy();
				            }
				            
				            // table1의 tbody 비우기
				            $("#table1 tbody").empty();
				            
				            // 원본 테이블의 모든 행을 복사
				            $("#originalTable tbody tr").each(function() {
				                let newRow = $(this).clone();
				                $("#table1 tbody").append(newRow);
				            });
				            
				            // 새로운 DataTable 초기화
				            initDataTable();
				            
				        } catch (e) {
				            console.error("필터 초기화 오류:", e);
				        }
				    }

				    // 페이지 로드 시 필터 경로 업데이트
				    updateFilterPath();
				});
				</script>
			</div>

			<footer>
				<%@include file="../include/footer.jsp"%>
			</footer>
		</div>
	</div>
	<script src="${contextPath}/resources/static/dist/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<%@include file="../include/plugin.jsp"%>
</body>

</html>