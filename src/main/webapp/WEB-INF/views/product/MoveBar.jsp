<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        

    a:link{text-decoration: none; color: black;}
    a:visited{text-decoration: none; color: black;}
    a:active{text-decoration: none; color: black;}

    /* Style the tab */
    .moveTab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    width: 100%;
    /* margin-left: 15%; */
    }

    /* Style the buttons inside the tab */
    .moveTab button {
    width: 20%;
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .moveTab button:hover {
    background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .moveTab button.active {
    background-color: #white;
    }



    </style>
</head>
<body>
    
<div class="moveTab">
    <button><a href="#prdInfo">상품 상세 정보</a></button>
    <button><a href="#prdReview">고객 후기</a></button>
    <button><a href="#prdQnA">상품 문의</a></button>
    <button><a href="#delieveryInfo">배송안내</a></button>
    <button><a href="#refundInfo">교환 및 반품</a></button>
  </div>
  
</body>
</html>