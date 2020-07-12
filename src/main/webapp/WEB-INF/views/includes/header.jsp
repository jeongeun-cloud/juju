<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
       <style>
          #head{
            min-width: 1000px;
            border:1px;
            height:200px;
        }
        li{
            /* 앞에 점 없앰 */
            list-style: none;
            color: black;
        }   
        .util_ul{
             /* 오른쪽으로 정렬 */
            display:flex;
            justify-content:flex-end;
            padding-right: 10px;
          
            
        }
        a{
            color: black;
        }
        .head_logo{
            /* 가운데 정렬 */
            display:flex;
            justify-content: center;
            padding-bottom: 20px;
            
    
        }
        .head_util{
            font-size: 15px;
            margin-top: 15px;
            
        }

    </style>
</head>
<body>
    <header id="head">
        <div class="head_wrap">
            <div class="head_util" >
                <div class="util_wrap" >
                    <ul class="util_ul">
                        <li><a href="#">로그인(마이페이지)/</a> </li>
                        <li><a href="#">회원가입 /</a></li>
                        <li><a href="#">고객센터</a></li>                        
                    </ul>
                </div>
            </div>

            <div class="head_logo" >
                <div class="logo" ><img src="/resources/images/juju_logo.png" alt="JuJu_Market_Logo" style="height: 150px;"></div>
            </div>
        </div>    

    </header>
   

           
              

