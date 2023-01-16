<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type='text/javascript'>

	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart1);

	function drawChart(){
		var a = $.ajax({
			url: "googlePieChartPos.sfm",
			dataType: "json",
			async: !1
		}).responseText,
		t = new google.visualization.DataTable(a);
		console.log("a >>> : " + a);
		
		var chart = new google.visualization.PieChart(document.getElementById("column_chart_div1")).draw(t, {
			width: 500,
			height: 450,
			is3D: false,
			title: "포지션 신청 현황",
			titlePosition: "out"
		});
	}
	
	function drawChart1(){
		var b = $.ajax({
			url: "googlePieChartLv.sfm",
			dataType: "json",
			async: !1
		}).responseText,
		y = new google.visualization.DataTable(b);
		console.log("b >>> : " + b);
		
		var chart = new google.visualization.PieChart(document.getElementById("column_chart_div2")).draw(y, {
			width: 500,
			height: 450,
			is3D: false,
			title: "레벨 신청 현황",
			titlePosition: "out"
		});
	}

	
</script>

</head>
<body>
<table id="data-table">
	<thead>
    <tr>
        <th>컬럼1</th>
        <th>컬럼2</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><div id="column_chart_div1" style="width:900px; height:500px;"></div></td>
        <td><div id="column_chart_div2" style="width:900px; height:500px;"></div></td>
    </tr>
    </tbody>
</table>		
		
</body>
</html>