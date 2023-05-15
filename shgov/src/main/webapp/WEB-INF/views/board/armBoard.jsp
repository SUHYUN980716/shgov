<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현황</title>
</head>
<body>
<div class="card text-center">
	  <div class="card-header">
	  	<p>데이터 시각화</p>
	  </div>
	  <div class="card-body">
	  	<p>다문화 가구</p>
	    <div id="chartdiv" style="height: 500px;"> 
    	</div>
	  </div>
	  <div class="card-footer text-muted">
	    <p>shgov</p>
	  </div>
	</div>
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);

chart.data = [{
 "country": "2015",
 "visits": 299241
}, {
 "country": "2016",
 "visits": 316067
}, {
 "country": "2017",
 "visits": 318917
}, {
 "country": "2018",
 "visits": 334856
}, {
 "country": "2019",
 "visits": 353803
}, {
 "country": "2020",
 "visits": 367775
}, {
 "country": "2021",
 "visits": 385219
}];

chart.padding(40, 40, 40, 40);

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 60;
categoryAxis.renderer.inversed = true;
categoryAxis.renderer.grid.template.disabled = true;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.extraMax = 0.1;
//valueAxis.rangeChangeEasing = am4core.ease.linear;
//valueAxis.rangeChangeDuration = 1500;

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.tooltipText = "{valueY.value}"
series.columns.template.strokeOpacity = 0;
series.columns.template.column.cornerRadiusTopRight = 10;
series.columns.template.column.cornerRadiusTopLeft = 10;
//series.interpolationDuration = 1500;
//series.interpolationEasing = am4core.ease.linear;
var labelBullet = series.bullets.push(new am4charts.LabelBullet());
labelBullet.label.verticalCenter = "bottom";
labelBullet.label.dy = -10;
labelBullet.label.text = "{values.valueY.workingValue.formatNumber('#.')}";

chart.zoomOutButton.disabled = true;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function (fill, target) {
 return chart.colors.getIndex(target.dataItem.index);
});

setInterval(function () {
 am4core.array.each(chart.data, function (item) {
   item.visits += Math.round(Math.random() * 200 - 100);
   item.visits = Math.abs(item.visits);
 })
 chart.invalidateRawData();
}, 2000)

categoryAxis.sortBySeries = series;

}); // end am4core.ready()
</script>

</body>
</html>