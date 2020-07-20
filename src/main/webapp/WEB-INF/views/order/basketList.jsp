<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Basket List</title>

    <style>






        #containerOFAll {
            width:1300px;
            height:100%;
            margin: 0 auto;

            color: #303030;
            text-align:center;
        }



        h5 {
            color:grey;
        }




        .button {
        background-color: #ffc30b; 
        border: none;
        color: white;
        padding: 16px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        font-weight: bold;
        }

        .button:hover {
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
        }

        .button {
        background-color: #ffc30b;
        color: white;
		      
        }
        .button:focus { 
            outline: none; 
        }


        #orderBtns {

        width: 70%;
        margin: auto;
        padding:30px;


        }


       

        ul {
            list-style:none;
            font-weight: bold;
            color: lightgray;
        }

        /* li {
            float: left;
        } */

        #orderProcess {
            
            position: relative;
            width: 1300px;
            height: 100px;
            
        }

        #ordProcess {

            position:absolute;
            bottom:0px;
            right:0px;

        }


        #currentProcess {
            color: #303030;
        }

       

        /* .dltBtn {
            margin-left: 800px;
            margin-top:300px;
           
        } */

       


        #countBox{

            position:relative;

            border:3px solid;
            border-color:lightgray;
            
            width : 1000px;
            height : 200px;

            margin: auto;
            
        }


        .countBoxDiv {

            float:left;

            width: 140px;
            height: 200px;
        }


        #mathSymbol {
            font-size:40px;
            color:lightgray;
        }


        #basketTableContainer{
            width:1100px;
            margin:auto;
            padding: 30px;
        }


        #basketTable {
            
            width:1100px;
            margin: auto;
        }

        #tableTitle {
            background-color: #303030;
            color: white;
            height: 50px;
            margin: auto;
            
        }

        #tableHead {
            /* margin-bottom: 5px; */
        } 


        #tableBody {
            height: 120px;
            
            
        }

        #thumbnailImg {
            width: 200px;
            margin: 5px;
        }


        #dltBtn {
           
            width: 80px;
            height: 30px;
            margin-left:890px;
            background-color: #303030;
            color: white;
            border:none;
            border-radius:10%;
        }

        
        

        


    </style>


</head>
<body>


<jsp:include page="../includes/header.jsp" flush="false"/>
<jsp:include page="../includes/menuBar.jsp" flush="false"/>

    
    <div id="containerOFAll">

        
        <div id="orderProcess">
            <!-- 01 장바구니 > 02 주문서 작성/결제 > 03 주문완료 -->
            
            <div id="ordProcess">


                <ul>

                    <li style="float:left;"  id = "currentProcess">01 장바구니</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="color: lightgrey; float:left;">02 주문서 작성/결제</li> 
                    <li style="color: lightgrey; float:left;">  >  </li>
                    <li style="color: lightgrey; float:left;">03 주문완료</li>
    
                </ul>


            </div>
            
            
        
        </div>
    
        <!-- 라인 -->
        <hr style="border:solid 1px lightgray;">

        <div id="basketTableContainer" >
            <!-- 장바구니 내역 -->

            <table id="basketTable" style="margin:-30px" >
            <thead id="tableHead">
                <tr>
                    <th colspan="5" id="tableTitle" style="text-align: center">장바구니 내역</th>
                </tr>
            </thead>
            <tbody>


                <tr id="tableBody">
                    <td><input type="checkbox" id="chkBox"></td>
                    <td><img id="thumbnailImg" src="https://lh3.googleusercontent.com/proxy/epy1T2E3Y0UdWBtuHPd0q_1P1ecUqcn23z96jp2RPBzuYYWJwH3F-YY0Kqg8d6oZtH0DQODf46nlFyP_kIs-el_ldi5WuP6zwXjVAGSPBzJUEjiJzgnkQanHHrPLC8VTuh2f0PzAd5_APbQ-Km3cUHaLxdI-3jUgoCGSsg"></td>
                    <td>{삼계탕}<br>{4,300}원</td>
                    <td>{5}개</td>
                    <td>{21,500}원</td>
                </tr>


            </tbody>
                

            </table>


        
            <!-- 선택 삭제 버튼 -->
            <button id="dltBtn">선택 삭제</button>
        </div>

        
        <div id="countBox">
            <!-- 계산 부분 -->

            
            

            <div class="countBoxDiv">

                <br>
                <br>

                <h5>총 주문금액</h5>
                                
                <h3>{21,500}원</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>-</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5>할인금액</h5>
                                
                <h3>{1,000}원</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>+</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>

                <h5>배송비</h5>
                                
                <h3>{2,500}원</h3>
            </div>

            <div class="countBoxDiv" id="mathSymbol">
            <br>
                <h2>=</h2>
            </div>

            <div class="countBoxDiv">
                
                <br>
                <br>
                
                <h5>총 결제금액</h5>
                                
                <h3>{23,000}원</h3>
            </div>


        </div>

        <div id="orderBtns">

            <button class="button chooseNorder">선택 상품 주문</button>
            <button class="button allOrder">전체 상품 주문</button>

        </div>



    </div>


</body>
</html>