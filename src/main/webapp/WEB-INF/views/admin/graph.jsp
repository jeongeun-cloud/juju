<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
   
html {
  height: 100%;
  font-family: 'Lato', sans-serif;
}
body {
  height: 100%;
  margin: 0;
  background-repeat: no-repeat;
  background-attachment: fixed;
}
* {
  box-sizing: border-box;
}
#container {
  display: table;
  width: 1200px;
  background-color: white;
  margin: 60px auto;
  border-radius: 4px;
}



/* Content */
#content {
  width: calc(100% - 240px);
  height: 100%;
  padding: 25px;
  display: table-cell;
}
#titleBar {
  height: 36px;
  margin-bottom: 30px;
}
#profilePic {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: #999;
  float: right;
  margin-top: -8px;
  margin-left: 14px;
  overflow: hidden;
}
#profilePic img {
  width: 100%;
}
.controls {
  display: block;
  width: 70px;
  height: 20px;
  color: rgba(255, 255, 255, 0.4);
  font-size: 10px;
  font-weight: 300;
  text-transform: uppercase;
  text-align: center;
  line-height: 20px;
  float: right;
  border-radius: 20px;
}
.activeControl {
  background: rgba(255, 255, 255, 0.9);
  color: #202b33;
  font-weight: 600;
}
#salesData {
  margin-bottom: 60px;
}
#totalSales {
  height: 120px;
  position: relative;
  margin-top: 24px;
  margin-bottom: 50px;
}
#totalSales .col {
  float: left;
  width: 33.33%;
  height: 100%;
}
#totalSales .col .progressTitle {
  float: left;
  margin-left: 120px;
  font-weight: 400;
  
}
.progressBar {
  float: left;
  height: 120px;
  width: 120px;
  font-size: 40px;
  text-align: center;
  line-height: 120px;
}

/* Icons */
.notification {
  display: block;
  width: 20px;
  height: 20px;
  color: #202b33;
  font-weight: 600;
  line-height: 20px;
  text-align: center;
  border-radius: 50%;
  background: rgba(255, 255, 255, .6);
  position: absolute;
  top: 0; bottom: 0; right: 2%;
  margin: auto;
}
.colorIcon {
  display: block;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  position: absolute;
  top: 0; bottom: 0; right: 2%;
  margin: auto;
}
.plus {
  display: inline-block;
  width: 20px;
  height: 20px;
  color: #202b33;
  font-weight: 600;
  font-size: 16px;
  line-height: 8px;
  padding: 4px;
  margin-right: 6px;
  border: 2px solid rgba(255, 255, 255, .2);
  border-radius: 50%;
  color: rgba(255, 255, 255, .2);
}
.red {
  background: #ec1561;
}
.orange {
  background: #ff9939;
}
.green {
  background: #2bab51;
}


	/* Headers */
	
	
	.char_tit {
	  float: left;
	  font-size: 19px;
	  font-weight: 400;
	  letter-spacing: 1px;
	  margin: 0 0 30px 30px;
	  
	}
	 .channelSales h3 {
	  float: left;
	  color: black;
	  font-size: 32px;
	  font-weight: 300;
	  margin: 0;
	  margin-top: 8%;
	  margin-left: 20px;
	  margin-bottom: 6px;
	}
	.p{
		margin-top:50px;
		font-weight:700;
		font-size:40px;
		margin-left:200px;
	}
	.clearFix {
	  clear: both;
	}
  </style>
</head>
<body>
  <div id="container">
   
    <div id="content">
  
      <div class="mainChart">
      	<h2 class="char_tit">|이번주 주문,교환,환불[R:주문, Y:교환 , G:환불] </h2>
        <canvas id="salesData"></canvas>
        <h2 class="char_tit">|지난주 대비 가입 고객</h2>
  
        <div class="clearFix"></div>
  
        <div id="totalSales">
          <div class="col">
            <div id="creditSales" class="progressBar"></div>
            <span class="progressTitle">소셜 고객</span>
            <h3 class="p">1,859</h3>
            
          </div>
          <div class="col">
            <div id="channelSales" class="progressBar"></div>
            <span class="progressTitle">일반 고객</span>
            <h3 class="p">1,034</h3>
            
          </div>
          <div class="col">
            <div id="directSales" class="progressBar"></div>
            <span class="progressTitle">상인</span>
            <h3 class="p">650</h3>
            
          </div>
        </div>
  
        
      </div>
  
    </div>
  </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js"></script>
  <script src="https://cdn.rawgit.com/kimmobrunfeldt/progressbar.js/0.7.4/dist/progressbar.js"></script>
  <script>
    // https://dribbble.com/shots/1821178-Sales-Report?list=buckets&offset=0

// Line Chart
var salesData = {
  labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
  datasets: [
    {
      label: "일반고객",
      fillColor: "rgba(195, 40, 96, 0.1)",
      strokeColor: "rgba(195, 40, 96, 1)",
      pointColor: "rgba(195, 40, 96, 1)",
      pointStrokeColor: "#202b33",
      pointHighlightStroke: "rgba(225,225,225,0.9)",
      data: [3400, 3000, 2900, 1900, 2500, 3400, 2500]
    },
    {
      label: "소셜가입",
      fillColor: "rgba(255, 172, 100, 0.1)",
      strokeColor: "rgba(255, 172, 100, 1)",
      pointColor: "rgba(255, 172, 100, 1)",
      pointStrokeColor: "#202b33",
      pointHighlightStroke: "rgba(225,225,225,0.9)",
      data: [1900, 1700, 2100, 2690, 2200, 2500, 2500]
    },
    {
      label: "탈퇴",
      fillColor: "rgba(19, 71, 34, 0.3)",
      strokeColor: "rgba(88, 188, 116, 1)",
      pointColor: "rgba(88, 188, 116, 1)",
      pointStrokeColor: "#202b33",
      pointHighlightStroke: "rgba(225,225,225,0.9)",
      data: [100, 140, 110, 260, 200, 90, 140]
    }
  ]
};
var ctx = document.getElementById("salesData").getContext("2d");
window.myLineChart = new Chart(ctx).Line(salesData, {
  pointDotRadius : 6,
  pointDotStrokeWidth : 2,
  datasetStrokeWidth : 3,
  scaleShowVerticalLines: false,
  scaleGridLineWidth : 2,
  scaleShowGridLines : true,
  scaleGridLineColor : "rgba(225, 255, 255, 0.02)",
  scaleOverride: true,
  scaleSteps: 9,
  scaleStepWidth: 500,
  scaleStartValue: 0,

  responsive: true

});

//Credit Sales
var creditSales = new ProgressBar.Circle('#creditSales', {
  color: '#e81760',
  strokeWidth: 3,
  trailWidth: 3,
  duration: 1500,
  text: {
    value: '0%'
  },
  step: function(state, bar) {
    bar.setText((bar.value() * 100).toFixed(0) + "%");
  }
});
var channelSales = new ProgressBar.Circle('#channelSales', {
  color: '#e88e3c',
  strokeWidth: 3,
  trailWidth: 3,
  duration: 1500,
  text: {
    value: '0%'
  },
  step: function(state, bar) {
    bar.setText((bar.value() * 100).toFixed(0) + "%");
  }
});
var directSales = new ProgressBar.Circle('#directSales', {
  color: '#2bab51',
  strokeWidth: 3,
  trailWidth: 3,
  duration: 1500,
  text: {
    value: '0%'
  },
  step: function(state, bar) {
    bar.setText((bar.value() * 100).toFixed(0) + "%");
  }
});
creditSales.animate(0.8);
channelSales.animate(0.64);
directSales.animate(0.34);
  </script>
</body>
</html>