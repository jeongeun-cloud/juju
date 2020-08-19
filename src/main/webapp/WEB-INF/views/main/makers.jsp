<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JUJUMARKET</title>
    <style>
@import url(https://fonts.googleapis.com/css?family=Crafty+Girls);

h1 {
  font-family: 'Crafty Girls';
  text-align: center;
}  

#walker {
  position: absolute;
  width: 200px;
  margin-top: 350px;
  cursor: pointer;
}
.cont{
   
    position: relative;
    width: 100%;

}
.a{
    float: left;
    margin-top: 30px;
    width:250px;
    height: 300px;
    margin-left: 20px;
    margin-right: 10px;
    box-shadow: 0 5px 15px 0px rgba(0, 0, 0, 0.6);
    transform: translatey(0px);
	 animation: float 3s ease-in-out infinite;
     
}

@keyframes float {
	 0% {
		 box-shadow: 0 5px 15px 0px rgba(0, 0, 0, 0.6);
		 transform: translatey(-10px);
	}
	 50% {
		 box-shadow: 0 25px 15px 0px rgba(0, 0, 0, 0.2);
		 transform: translatey(-20px);
	}
	 100% {
		 box-shadow: 0 5px 15px 0px rgba(0, 0, 0, 0.6);
		 transform: translatey(-10px);
	}
}
.a img {
    
        width:100%;
        height:100%;        
        top:0;
        bottom:0;
        left:0;
        right:0;

}

img.flip {
  -webkit-transform: scaleX(-1);
  transform: scaleX(-1);
}
.aa{
    width: 1400px;
    height: 330px;
    
    margin: 0 auto;
}

    </style>
</head>
<body>

   

    <h1>We made! Thank You</h1> 
    
        <img id="walker" src="http://media.giphy.com/media/XGnWMiVXL87Xa/giphy.gif">
    <div class="cont">
        <div class="aa">
            <div class="a">
             
            <img src="/resources/images/leekw.png">
            </div>
        
       
            <div class="a">
                <img src="/resources/images/leedw.png">   
            </div>   
     
            <div class="a">
                <img src="/resources/images/Woncr2.png">
            </div>
       
            <div class="a">
                <img src="/resources/images/chose.png">
            
            </div>
       
            <div class="a">
                <img src="/resources/images/juje.png"> 
            
            </div>

        </div>    
    </div>
    
    <script>
        // Get the walker image:
var walker = document.getElementById('walker');
var walkingLeft = true;
var dist = 1;
var leftBorder = 1300;
var rightBorder = 100;
var position = rightBorder;

function check(){
  position += walkingLeft ? dist : -dist;
  walker.style.right = position +'px';
  if (position > leftBorder || position < rightBorder){
    walkingLeft = !walkingLeft;
    walker.classList.toggle('flip')
  }
}

setInterval(check, 10)

    </script>
</body>
</html>