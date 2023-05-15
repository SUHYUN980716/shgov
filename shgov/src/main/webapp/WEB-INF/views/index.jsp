<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript" src="/resources/static/slick/slick.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/static/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/resources/static/slick/slick-theme.css"/>
<script type="text/javascript">
    $(document).ready(function(){
      $('.yourclass').slick({
    	  autoplay : true,
    	  autoplaySpeed : 2000
      });
    });
</script>
<style>
  .img {
    max-width: 100%;
    height: auto;
    margin: 0px auto;
  }
  .slider {
    width: 1280px;
    margin: 0px auto;
  }
  .slick-prev:before, .slick-next:before {
    color: #444444;
  }
  .one{
  	height: 140px;
  	white-space: no-wrap;
	overflow: hidden;
	text-overflow: ellipsis;
  }
  .two{
 	padding: 30px;
 	height: 300px; 
  }
  .three{
  	padding: 30px;
 	height: 300px;
 	width: 300px;
 	margin: 0 auto; 
  }
  .text{
  	font-size: 30px;
  	font-weight:700;
  	text-align:center;
  }
</style>
</head>
<body>
<div id="app">
<div class="card" style="margin-bottom:50px">
  <div class="card-header" style="background-color: #e3f2fd;">
  <h1 class="display-4" align=center>최신 정책</h1>
  </div>
  <div class="card-body">
    <div class="yourclass">
	  <div class="img d-flex" v-for="item in boards">
		  <img :src="'/images?boardNum='+item.boardNum" class="two" @error="policy">
		  <div>
			  <p style="font-size:30px;font-weight:bold;text-align:center">{{item.boardTitle}}</p>
			  <p class="one">{{item.boardContent}}</p>
		  </div>
	  </div>
	</div>
  </div>
</div>



	<!-- Nav tabs -->
	<div class="card text-center" style="background-color: #e3f2fd;">
		<div class="card-header">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home" type="button" role="tab"
						aria-controls="home" aria-selected="true">정책현황</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile" type="button" role="tab"
						aria-controls="profile" aria-selected="false">정책자료실</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="messages-tab" data-bs-toggle="tab"
						data-bs-target="#messages" type="button" role="tab"
						aria-controls="messages" aria-selected="false">공지사항</button>
				</li>
			</ul>
		</div>
	</div>


	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<div class="yourclass">
			  <div class="img">
		  		  <p class="text">다문화 가구 증가율</p>
				  <div id="chartdiv" style="height: 500px;"> 
    			  </div>
			  </div>
			  <div class="img">
		  		  <p class="text">고령 인구 비율</p>
				  <div id="chartdiv2" style="height: 500px;"> 
    			  </div>
			  </div>
			</div>
		</div>
		<div class="tab-pane" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">
			<div class="card-group">
			<template v-for="item in boards">
				<div class="card">
					<img :src="'/images?boardNum='+item.boardNum" class="two" @error="policy">
					<div class="card-body">
						<h5 class="card-title">{{item.boardTitle}}</h5>
						<p class="card-text one">{{item.boardContent}}</p>
						<p class="card-text">
							<small class="text-muted">{{item.boardCreatedAt}}</small>
						</p>
					</div>
				</div>
			</template>
			</div>
		</div>
		<div class="tab-pane" id="messages" role="tabpanel"
			aria-labelledby="messages-tab">
			<div class="card-group">
				<template v-for="item in notices">
				<div class="card">
					<img :src="'/images?boardNum='+item.boardNum" class="three" @error="image">
					<div class="card-body">
						<h5 class="card-title">{{item.boardTitle}}</h5>
						<p class="card-text one">{{item.boardContent}}</p>
						<p class="card-text">
							<small class="text-muted">{{item.boardCreatedAt}}</small>
						</p>
					</div>
				</div>
			</template>
			</div>
		</div>
	</div>
</div>



<script>
var vue=new Vue({
	el:"#app",
	data:{
		boards:${list},
		notices:${item}
	},
	methods:{
		image:function(e){
			e.target.src = '/images?boardNum=BNUM0000001541';
		},
		policy:function(e){
			e.target.src = '/images?boardNum=BNUM0000001542';
		}
	}
})
</script>
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
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv2", am4charts.PieChart);

// Add data
chart.data = [{
  "country": "서울",
  "litres": 17.60
}, {
  "country": "경북",
  "litres": 23.80
}, {
  "country": "인천",
  "litres": 15.60
}, {
  "country": "광주",
  "litres": 15.60
}, {
  "country": "전남",
  "litres": 25.20
}, {
  "country": "대구",
  "litres": 18.40
}, {
  "country": "부산",
  "litres": 21.50
}, {
  "country": "제주",
  "litres": 17.10
}, {
  "country": "강원",
  "litres": 22.80
}];

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "litres";
pieSeries.dataFields.category = "country";
pieSeries.innerRadius = am4core.percent(50);
pieSeries.ticks.template.disabled = true;
pieSeries.labels.template.disabled = true;

var rgm = new am4core.RadialGradientModifier();
rgm.brightnesses.push(-0.8, -0.8, -0.5, 0, - 0.5);
pieSeries.slices.template.fillModifier = rgm;
pieSeries.slices.template.strokeModifier = rgm;
pieSeries.slices.template.strokeOpacity = 0.4;
pieSeries.slices.template.strokeWidth = 0;

chart.legend = new am4charts.Legend();
chart.legend.position = "right";

}); // end am4core.ready()
</script>
</body>
</html>