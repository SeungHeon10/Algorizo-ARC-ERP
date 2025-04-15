<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@include file="include/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/main.min.js"></script>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const reasonCtx = document.getElementById('defectReasonChart').getContext('2d');

  // 초기 차트 생성 (빈값 or 샘플값)
  const reasonChart = new Chart(reasonCtx, {
    type: 'doughnut',
    data: {
      labels: [],
      datasets: [{
        data: [],
        backgroundColor: ['#dc3545', '#fd7e14', '#198754', '#0dcaf0']
      }]
    },
    options: {
      plugins: {
        legend: {
          position: 'bottom'
        }
      }
    }
  });
  function loadDefectChart(month) {
  // 데이터 받아서 동적 업데이트
  fetch(`inspection/reasonData?month=\${month}`)
    .then(res => res.json())
    .then(data => {
        const labels = Object.keys(data);
        const rawValues = Object.values(data).map(obj => obj.value);
        const total = rawValues.reduce((a, b) => a + b, 0);

        // 퍼센트 계산
        const percentValues = rawValues.map(v => parseFloat(((v / total) * 100).toFixed(1)));

        // 데이터 없을 경우 대비
        const hasData = labels.length > 0 && total > 0;

        reasonChart.data.labels = hasData ? labels : ['데이터 없음'];
        reasonChart.data.datasets[0].data = hasData ? percentValues : [1];
        reasonChart.data.datasets[0].backgroundColor = hasData
          ? ['#dc3545', '#fd7e14', '#198754', '#0dcaf0', '#6f42c1']
          : ['#dee2e6'];

        // 툴팁 수정: 퍼센트 + 수량 동시 표시
        reasonChart.options.plugins.tooltip = {
          callbacks: {
            label: function (context) {
              if (!hasData) return '데이터 없음';
              const label = context.label || '';
              const index = context.dataIndex;
              const percent = context.raw;
              const quantity = rawValues[index];
              return `\${label}: \${quantity}건 (\${percent}%)`;
            }
          }
        };
        reasonChart.options.plugins.legend.display = hasData;

        reasonChart.update();
    });
  }
//   월 셀렉트 시 
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
	        headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'dayGridMonth,listMonth'
	        },
	        events: [] // ❗ 데이터 없이 비워둠
	      });
	      calendar.render();
	});
</script>
</html>