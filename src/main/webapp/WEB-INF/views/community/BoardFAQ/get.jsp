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
    .jaju_main .jaju_tit .page-header{
        font-size: 30px;
        margin-bottom:50px;
        text-align: center;

    }
    .from-group label{
        font-weight: 900;
        font-size: 17px;;
    }
    .jaju_form{
        margin: 50px 100px 0 150px;
        
    }
    .from-group{
        margin-bottom: 10px;
    }
    #mBtn,
    #rBtn,
    #lBtn{
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
    .jaju_regbtn{
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
                <h1 class="page-header"><c:out value="자묻질"/></h1>
            </div>
            
                <div class="jaju_panel">
                   <!-- to동환, 내용을 또 나타나게 한 이유는?? -->
                    <div class="panel-heading"><c:out value="${BoardFAQ.content}"/></div>
                    <!-- to동환, 내용을 또 나타나게 한 이유는?? -->
                        <div class="jaju_form">
                            <form id = "actionForm" method="post">

                                    <div class="from-group">
                                        <label>Title</label><input class="form-control" name='title'
                                            value='<c:out value="${BoardFAQ.title}"/>'
                                        readonly="readonly">
                                    </div>

                                    <div class="from-group">
                                        <label>내용</label>
                                        <textarea class="form-control" rows="10" name='content'
                                        readonly="readonly"><c:out value="${BoardFAQ.content}"/></textarea>
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
                                        <label>글번호</label><input class="form-control" name='postingNo' id="postingNo"
                                            value='<c:out value="${BoardFAQ.postingNo}"/>'readonly="readonly">
                                    </div>
                                    
                                        <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                                        <input type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                                        <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                                        <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>  
                                    
                                        <div class="jaju_regbtn">
                                        <c:if test="${sessionMember.memCode eq 'ADMIN' }">
                                        <button data-oper='modify' id="mBtn" class="btn btn-default">수정</button>
                                        <button data-oper='remove' id="rBtn" type="submit" class="btn btn-default">삭제</button>  
                                        </c:if>          
                                        <button data-oper='list' id="lBtn" class="btn btn-info">리스트</button>
                                        </div>
                            </form>
                
                            <form id='operForm' action="/commuinty/BoardFAQ/modify" method="get">
                                <input type="hidden"  id='postingNo' name='postingNo' value='<c:out value="${BoardFAQ.postingNo}"/>'>
                                <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                                <input type="hidden"  name ='amount' value='<c:out value="${cri.amount}"/>'>  
                                <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                                <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>
                            </form>            
                    
                    </div><!--  panel body end -->
                </div>
                <!-- jaju_panel -->
        </div>
        <!-- jaju_main -->
    </div>       
     <!--jaju_wrap  -->
</div>
<!-- jaju_content -->

                 
   
     <script type="text/javascript">
     $(document).ready(function(){
        
        
        
        
        var formObj = $("#actionForm");
       
       $('button').on("click", function(e){
          e.preventDefault();
          
          var operation = $(this).data("oper");
          
          console.log(operation);

           if(operation === 'remove'){
              
              formObj.attr("action","/community/BoardFAQ/remove");
           }
           formObj.submit();
       });
        
           
        var operForm = $("#operForm");
        

        
         $("button[data-oper='modify']").on("click", function(e){
        
           operForm.attr("action","/community/BoardFAQ/modify").submit();
           
        });
        
        $("button[data-oper='list']").on("click",function(e){
           
          operForm.find("#postingNo").remove();
          operForm.attr("action","/community/BoardFAQ/list");
          operForm.submit();
           
        });
     });
     
     </script>
</body>
</html>