<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

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

            <%@ include file="include/main_body.jsp" %>

            <footer>
                <%@ include file="include/footer.jsp" %>
            </footer>
        </div>
    </div>
    <!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
</body>

<script>
	const reasonCtx = document.getElementById('defectReasonChart').getContext('2d');

	//초기 차트 생성
	const reasonChart = new Chart(reasonCtx, {
		type: 'doughnut',
		data: {
			labels: [],
			datasets: [{
				data: [],
				backgroundColor: ['#dc3545', '#fd7e14', '#198754', '#0dcaf0', '#6f42c1']
			}]
		},
		options: {
			plugins: {
				legend: {
					position: 'bottom'
		   		},
				datalabels: {
					formatter: (value, ctx) => {
						const total = ctx.chart.data.datasets[0].data.reduce((a, b) => a + b, 0);
						const percent = total > 0 ? ((value / total) * 100).toFixed(1) : 0;
						return `\${percent}%`;
					},
					color: '#fff',
					font: {
						weight: 'bold',
						size: 14
		     		},
					display: function(context) {
						return context.chart.data.labels[0] !== '데이터 없음';
					}
				},
				tooltip: {
					callbacks: {
						label: function (context) {
							const label = context.label || '';
							const value = context.raw;
							const index = context.dataIndex;
							const total = context.dataset.data.reduce((a, b) => a + b, 0);
							const percent = total > 0 ? ((value / total) * 100).toFixed(1) : 0;
							return `\${label}: \${value}건 (\${percent}%)`;
		       			}
					}
				}
			}
		},
		plugins: [ChartDataLabels]
	});

	//월별 데이터 로딩 함수
	function loadDefectChart(month) {
		fetch(`inspection/reasonData?month=\${month}`)
			.then(res => res.json())
			.then(data => {
				const labels = Object.keys(data);
				const rawValues = Object.values(data).map(obj => obj.value);
				const total = rawValues.reduce((a, b) => a + b, 0);
				const hasData = labels.length > 0 && total > 0;

				reasonChart.data.labels = hasData ? labels : ['데이터 없음'];
				reasonChart.data.datasets[0].data = hasData ? rawValues : [1]; // 퍼센트 계산은 datalabels에서 처리
				reasonChart.data.datasets[0].backgroundColor = hasData
					? ['#dc3545', '#fd7e14', '#198754', '#0dcaf0', '#6f42c1']
					: ['#dee2e6'];

				reasonChart.options.plugins.legend.display = hasData;
				reasonChart.update();
			});
	}

	// 월 셀렉트 시 
	document.getElementById('monthSelector').addEventListener('change', function () {
		const selectedMonth = this.value;
		loadDefectChart(selectedMonth);
	});

	// 페이지 로드 시
	document.addEventListener('DOMContentLoaded', () => {
		const selectEl = document.getElementById('monthSelector');

			const now = new Date();
			const year = now.getFullYear();
			const month = String(now.getMonth() + 1).padStart(2, '0'); 
			const currentMonthValue = `\${year}-\${month}`;
			
			   selectEl.value = currentMonthValue;
			
			loadDefectChart(selectEl.value);
			
			const calendarEl = document.getElementById('calendar');
			const calendar = new FullCalendar.Calendar(calendarEl, {
		        initialView: 'dayGridMonth',   // 월간 달력 보기
		        locale: 'ko',                  // 한국어 적용
		        height: 'auto',
		        eventDisplay: 'block',
		        headerToolbar: {
		          left: 'prev,next today',
		          center: 'title',
		          right: 'dayGridMonth,listMonth'
		        },
		        dayMaxEventRows: 5,
		        moreLinkClick: 'popover',
		        eventDidMount: function(info) {
		        	  const rendered = info.event.extendedProps.renderedTitle;

		        	  // 월간 뷰
		        	  const titleEl = info.el.querySelector('.fc-event-title');
		        	  if (titleEl && rendered) {
		        	    titleEl.innerHTML = rendered;
		        	  }

		        	  // 리스트 뷰
		        	  const listTitleEl = info.el.querySelector('.fc-list-event-title');
		        	  if (listTitleEl && rendered) {
		        	    listTitleEl.innerHTML = rendered;
		        	  }
	        	},
	        	events: function(fetchInfo, successCallback, failureCallback) {
	        	    const start = fetchInfo.startStr.slice(0, 10); // 예: 2025-04-01
	        	    const end = fetchInfo.endStr.slice(0, 10);     // 예: 2025-04-30
					
	        	    fetch(`calendar/date?start=\${start}&end=\${end}`)
	        	      .then(res => res.json())
	        	      .then(data => successCallback(data))
	        	      .catch(error => failureCallback(error));
        	  	},
        	    eventClick: function(info) {
        	        const type = info.event.extendedProps.type;
        	        const id = info.event.extendedProps.relatedId;

        	        if (!type || !id) {
        	          alert('잘못된 일정 정보입니다.');
        	          return;
        	        }

        	        let url = '#';

        	        switch (type) {
        	          case '납기':
        	            url = `plans/detail?plan_id=\${id}`;
        	            break;
        	          case '발주':
        	            url = `order/detail?o_code=\${id}`;
        	            break;
        	          case '계약':
        	            url = `contract/detail?cr_code=\${id}`;
        	            break;
        	          case '입고검수':
        	            url = `inspection/detail?i_id=\${id}`;
        	            break;
        	          case '출고검수':
        	            url = `outInspection/detail?oi_id=\${id}`;
        	            break;
        	          case '입고':
        	            url = `inbound/inbounddetail?in_id=\${id}`;
        	            break;
        	          case '출고':
        	            url = `outbound/outbounddetail?out_id=\${id}`;
        	            break;
        	          default:
        	            alert(`'\${type}' 일정은 아직 연결 경로가 설정되지 않았습니다.`);
        	            return;
        	        }
        	        
        	        location.href = url;
	      		},
		  });
	      calendar.render();
	});
</script>
</html>