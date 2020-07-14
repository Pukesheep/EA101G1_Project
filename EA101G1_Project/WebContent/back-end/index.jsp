<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%
	AdmVO admVO = (AdmVO) request.getAttribute("admVO");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title></title>
<%@ include file="/back-end/css/BackHeaderCssLink"%>

<style>
div.dashContent {
	
}

div.status_row {
	/* 	margin-top: 50px; */	
}

div.chart_row {
	margin-top: 30px;
}
</style>

</head>

<body>
	<!-- header -->

	<%@ include file="/back-end/css/header.jsp"%>
	<!-- header -->

	<div class="content d-md-flex">

		<!-- aside -->
		<%@ include file="/back-end/css/aside.jsp"%>
		<!-- aside -->

		<main>
			<div class="container-fluid ">

				<div class="card mt-4">
					<div class="card-header">平台狀態</div>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3">
								<div class="card h-100">
									<div class="card-body d-flex align-items-center">
										<div
											class="fas fa-money-bill-alt fa-3x text-secondary mr-2 d-none d-sm-block"></div>
										<div class="text-center w-100">
											<div class="h5">本日營收</div>
											<div class="h3">454,883</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="card h-100">
									<div class="card-body d-flex align-items-center">
										<div
											class="fas fa-users fa-3x text-secondary mr-2 d-none d-sm-block"></div>
										<div class="text-center w-100">
											<div class="h5">在線會員數</div>
											<div class="h3">1456</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="card h-100">
									<div class="card-body d-flex align-items-center">
										<div
											class="fas fa-print fa-3x text-secondary mr-2 d-none d-sm-block"></div>
										<div class="text-center w-100">
											<div class="h5">訂單數</div>
											<div class="h3">164</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="card h-100">
									<div class="card-body d-flex align-items-center">
										<div
											class="fas fa-truck fa-3x text-secondary mr-2 d-none d-sm-block"></div>
										<div class="text-center w-100">
											<div class="h5">待出貨數</div>
											<div class="h3">34</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
				<div class="row chart_row">
					<div class="col-lg-6">
						<div class="card">
							<div class="card-header">時段金流</div>
							<div class="card-body">
								<canvas id="canvasLine"></canvas>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mt-3 mt-lg-0">
						<div class="card">
							<div class="card-header">日營收</div>
							<div class="card-body">
								<canvas id="barChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>

	<script>
		// y 軸的顯示
		var yAxis = [];
		// 資料集合，之後只要更新這個就好了。
		var ptDatas = [];
		var bidDatas = [];
		var immedDatas = [];
		var ctx = document.getElementById('canvasLine').getContext('2d');
		var lineChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : yAxis,
				datasets : [ {
					type : 'line',
					label : '商城',
					data : ptDatas,
					borderColor : "rgba(0,148,255,1)",
					fill : false
				}, {
					type : 'line',
					label : '競標區',
					data : bidDatas,
					borderColor : "rgba(255,125,64,1)",
					fill : false
				}, {
					type : 'line',
					label : '直購區',
					data : immedDatas,
					borderColor : "rgba(227,23,13,1)",
					fill : false
				} ]
			}
		});

		//時間格式
		var timeFormat = 'HH:mm:ss';

		function appendData() {
			//超過10 個，就把最早進來的刪掉
			if (yAxis.length > 8) {
				yAxis.shift();
				ptDatas.shift();
				bidDatas.shift();
				immedDatas.shift();
			}

			//推入y 軸新的資料 
			yAxis.push(new moment().format(timeFormat));

			//推入一筆亂數進資料
			ptDatas.push(Math.floor(Math.random() * 100000) + 1);
			bidDatas.push(Math.floor(Math.random() * 100000) + 1);
			immedDatas.push(Math.floor(Math.random() * 100000) + 1);

			//更新線圖
			lineChart.update();
		}

		//每秒做一次
		setInterval(appendData, 1000);
	</script>

	<script>
		var canvas = document.getElementById("barChart");
		var ctx = canvas.getContext("2d");

		// Global Options:
		Chart.defaults.global.defaultFontColor = "#2097e1";
		Chart.defaults.global.defaultFontSize = 11;

		// Data with datasets options
		var data = {
			labels : [ "Fri\n07/17", "Sat\n07/18", "Sun\n07/19", "Mon\n07/20",
					"Tue\n07/21", "Wed\n07/22", "Thu\n07/23" ],
			datasets : [
					{
						label : "商城",
						fill : true,
						backgroundColor : [ "#0094ff", "#0094FF", "#0094FF",
								"#0094FF", "#0094FF", "#0094FF", "#0094FF" ],
						data : [ 86, 124, 123, 90, 77, 115, 135 ]
					},
					{
						label : "競標區",
						fill : true,
						backgroundColor : [ "#ff7d3f", "#ff7d3f", "#ff7d3f",
							"#ff7d3f", "#ff7d3f", "#ff7d3f", "#ff7d3f" ],
						data : [ 23, 16, 20, 29, 16, 8, 7 ]
					},
					{
						label : "直購區",
						fill : true,
						backgroundColor : [ "#e3160c", "#e3160c", "#e3160c",
							"#e3160c", "#e3160c", "#e3160c", "#e3160c" ],
						data : [ 29, 35, 16, 28, 36, 28, 17 ]
					} ]
		};

		// Notice how nested the beginAtZero is
		var options = {
			title : {
				display : true,
				text : "每日營收",
				position : "bottom"
			},
			scales : {
				xAxes : [ {
					gridLines : {
						display : true,
						drawBorder : true,
						drawOnChartArea : false
					}
				} ],
				yAxes : [ {
					ticks : {
						beginAtZero : true
					}
				} ]
			}
		};

		// added custom plugin to wrap label to new line when \n escape sequence appear
		var labelWrap = [ {
			beforeInit : function(chart) {
				chart.data.labels.forEach(function(e, i, a) {
					if (/\n/.test(e)) {
						a[i] = e.split(/\n/);
					}
				});
			}
		} ];

		// Chart declaration:
		var myBarChart = new Chart(ctx, {
			type : "bar",
			data : data,
			options : options,
			plugins : labelWrap
		});
	</script>

</body>

</html>