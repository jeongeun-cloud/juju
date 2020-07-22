<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>

<style>
       li{
           list-style: none;
           
       }
       
       body{
           color: #303030;
       }
       
       .jaju_menu a{
           text-decoration: none;
           color: #303030;
           font-size: 17px;
       }
       
       .jaju_content{
           width: 1300px;
           height: 1000px;
           margin:0 auto;
           
       }
       .jaju_wrap{                
          position: relative;
          display: inline-block;
          padding-top: 30px;
         
       }
       
       .side{
         
           width: 200px;
           height: 200px;
           background-color: white;
           float: left;
           margin-right: 90px;
           border:solid #ffc30b;
          
           
       }
       .jaju_main{
           float:  right;
           width: 1000px;
           height: 1000px;
           background-color: white;
       } 
       .jaju_side_tit{
           padding-top: 12px;
           padding-bottom:12px ;
           text-align: center;
           width: 100%;
           background-color: #ffc30b;
           font-size: 20px;
           font-weight: 900;
           

       }
       .jaju_main .jaju_tit{
           font-size: 30px;
           margin-bottom:50px;
           text-align: center;

       }
       .jaju_regi_form{
           margin: 50px 100px 0 150px;
         
       }
       .form-group{
           margin-bottom:10px ;
       }
       .form-group label{
           font-weight: 900;
           font-size: 17px;;
       }
       #ms_Btn,
       #mr_Btn,
       #ml_Btn{
           background-color: #ffc30b; /* Green */
           border: none;
           color: white;
           padding: 10px 20px;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           font-size: 16px;
           font-weight: bold;
           margin: 4px 2px;
         
       }
       .jaju_modibtn{
        float: right;
       }
    </style>
</head>
<body>
    <div class="jaju_content">
        <div class="jaju_wrap">
            <div class="side">
                <div class="1nb_list">
                    <div class="jaju_side_tit">
                        고객센터
                    </div>
                    <div class="jaju_side_menu">
                        <ul class="jaju_menu" style="margin-top:20px">
                            <li><a href='/community/notice/list'><i class="fa fa-check" ></i>공지사항</a></li>
                            <li><a href='/community/BoardFAQ/list'><i class="fa fa-check" ></i>자주 묻는 질문</a></li>
                        </ul>
                    </div>
                </div>
                <!-- 1nb_list -->
            </div>
            <!-- side -->

            <div class="jaju_main">
                <div class="jaju_tit">
                    <p><b>[자주 묻는 질문]</b></p>                 
                </div>

                <div class="jaju_regi_form">
                    <p style="font-size: 20px;" ><b>+수정하기</b></p>

                    <form id ='modifyForm' role="form" action="/community/BoardFAQ/modify" method="post">
                        <!-- 조회페이지에서 수정/삭제 페이지로 이동 -->
                        <input type='hidden'   name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                        <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'>
                        <input type='hidden'  name='type' value='<c:out value="${cri.type}"/>'>
                        <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
    
                        <div class="from-group">
                            <label>Title</label><input id='title' class="form-control" name='title'
                                value='<c:out value="${BoardFAQ.title}"/>'>
                        </div>
    
                        <div class="from-group">
                            <label>내용</label>
                            <textarea class="form-control" id='content' rows="10" name='content'
                         ><c:out value="${BoardFAQ.content}"/></textarea>
                        </div>
    
    
                        <div class="from-group">
                            <label>게시글타입</label><input class="form-control" name='boardType'
                                value='<c:out value="${BoardFAQ.boardType}"/>'readonly="readonly">
                        </div>
                        
                        <div class="from-group">
                            <label>작성자</label><input class="form-control" name='idNo'
                                value='<c:out value="${BoardFAQ.idNo}"/>'readonly="readonly">
                        </div>
                        
                        <div class="from-group">
                            <label>글번호</label><input class="form-control" name='postingNo'
                                value='<c:out value="${BoardFAQ.postingNo}"/>'readonly="readonly">
                        </div>
    
                            <div class="jaju_modibtn">
                                <button type="submit" id="ms_Btn" class="btn btn-default">수정완료</button>
                                <button type="submit" id="mr_Btn" class="btn btn-danger">삭제</button>
                                <button type="submit" id="ml_Btn" class="btn btn-info">리스트</button>
                            </div>
                    </form>
                </div>
                <!-- jaju_regi_form -->
            </div>
            <!--jaju_main-->
        </div>
    </div>
   
   <script type="text/javascript">
   $(document).ready(function(){
      
      var formObj = $("form");
      
      $('button').on("click", function(e){
         
         e.preventDefault();
         
         var operation = $(this).data("oper");
         
         console.log(operation);
         
   

       if(operation === 'remove'){
          
          formObj.attr("action","/community/BoardFAQ/remove");
          
       }else if(operation ==='list'){
       
      
            formObj.attr("action", "/community/BoardFAQ/list").attr("method","get");
            var pageNumTag = $("input[name='pageNum']").clone();
            var amountTag = $("input[name='amount']").clone();
            var keywordTag = $("input[name='keyword']").clone();
            var typeTag = $("input[name='type']").clone();
             
            formObj.empty();
            formObj.append(pageNumTag);
            formObj.append(amountTag);         
            formObj.append(keywordTag);
            formObj.append(typeTag);         

       }else{
          
          
          var modifyForm = $("#modifyForm");
            
            if(!modifyForm.find("#title").val()||modifyForm.find("#title").val().trim()==""||modifyForm.find("#title").val().length>30){
               alert("양식에 맞게 제목입력 입력해주세요(1~30자)");
               return false;
          
       }
            if(!modifyForm.find("#content").val()||modifyForm.find("#content").val().trim()==""||modifyForm.find("#content").val().length>600){
                    alert("양식에 맞게 내용을 입력해주세요(1~600자)");
                    return false;
               
            }
       }
       
        formObj.submit();
            
            
   });
   });
   
   </script>

</body>
</html>
