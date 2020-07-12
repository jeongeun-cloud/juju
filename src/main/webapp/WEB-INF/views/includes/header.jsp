<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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


        .util_wrap ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        /* background-color: #333; */
        display:flex;
        justify-content:flex-end;
        padding-right: 60px;
        }

        .util_wrap ul li {
        float: left;
        }

        .util_wrap li a, .subMemu {
        display: inline-block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        }

        .util_wrap li a:hover, .dropdown_sub:hover .subMemu {
        color: #ffdf6f;
        }

        .util_wrap li.dropdown_sub {
        display: inline-block;
        }

        .dropdown_sub .subMemu-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 130px;
        width: 140px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
        }

        .dropdown_sub .subMemu-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
        }

        .subMemu-content a:hover {background-color: #f1f1f1;}

        .dropdown_sub:hover .subMemu-content {
        display: block;
        }
    </style>
</head>
<body>
    <header id="head">
        <div class="head_wrap">
            <div class="head_util" >
                <div class="util_wrap" >
                    <ul>
                        <li><a href="#">로그인(마이페이지)</a></li>
                        <li><a href="#">회원가입</a></li>
                        <li class="dropdown_sub">
                          <a href="#" class="subMemu">고객센터</a>
                          <div class="subMemu-content">
                            <a href="/community/notice/list">공지사항</a>
                            <a href="/community/Board_FAQ/list">자주하는 질문</a>
                            <a href="/mypage/myQna/list">1:1 문의 게시판</a>
                            
                  
                          </div>
                        </li>
                      </ul>
                </div>
            </div>

            <div class="head_logo" >
                <div class="logo" ><img src="/resources/images/juju_logo.png" alt="JuJu_Market_Logo" style="height: 150px;"></div>
            </div>
        </div>    

    </header>
</body>
</html>