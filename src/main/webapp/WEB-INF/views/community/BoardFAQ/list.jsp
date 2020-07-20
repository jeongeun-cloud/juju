<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp" %>
<%@include file="../../includes/menuBar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang ="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<meta name="viewport " content ="width =device-width, initial-scale =1.0 "> 
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>공지사항 </title>
 
<style>
    table {
    border-collapse: collapse;
    width:90%;
    }
     li{
        list-style: none;
       
    }
    body{
        color: #303030;
    }
    a{
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
        border:solid  #ffc30b ;
        
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
    .jaju_search{
        text-align: center;
        margin: 10px 0 30px 0;
    }

    .searchBtn,
    #regBtn{
        background-color: #ffc30b; 
        border: none;
        color: white;
        padding: 8px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 15px;
        margin: px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        font-weight: bold;
    }
    .searchBtn:hover,
    #regBtn:hover {
    background-color: white; 
    color: #ffc30b; 
    border: 2px solid #ffc30b;
    }
    .searchBtn,
    #regBtn
     {
    background-color: #ffc30b;
    color: white;
    
    
    }
    .searchBtn:focus ,
    #regBtn:focus{ 
        outline: none; 
    }
    table {
    border-collapse: collapse;
    width: 90%;
    margin-left: 50px;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {
        background-color: black;
        height: 30px;
        color: white;
        text-align: left;
    }
    
    tr:hover {
        background-color: #f5f5f5;
    }
    #regBtn{
        margin-right: 50px;
    }
    .page_num {
    
    text-align: center;
    }
    
    .page_num a{
     color: black;
      float: left;
      padding: 8px 16px;
      text-decoration: none;

    }

     .pagination1 a:hover:not(.active) {
       background-color: #f6dd90;
       border-radius: 50%;}
       
    .jaju_regBtn{
        position: relative;
       }
               /* 모달디자인 시작  */
      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }
      
      .modal-header {
        padding: 2px 16px;
        background-color: white;
        color: white;
      }
      
      .modal-body {padding: 2px 16px;}
      
      .modal-footer {
        padding: 2px 16px;
        background-color: white;
        color: white;
      }
      
      
      #closeBtn {
        background-color: #ffc30b; 
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
      }
      
      #closeBtn:hover {
        background-color: white; 
        color: #ffc30b; 
        border: 2px solid #ffc30b;
      
      }
      
      #closeBtn:focus {
          outline: none; 
      
      }
      /* 모달 디자인 끝 */
       
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
                        <li> <a href='/community/notice/list'><i class="fa fa-check" ></i>공지사항</a></li>
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
            <div class="jaju_main_wrap">
                <!-- 검색창 시작 -->
                <div class="jaju_search">
                       <form id='searchForm' action="/community/BoardFAQ/list" method='get'>
                        <select name='type'>
                        <option value=""
                        <c:out value="${pageMaker.cri.type ==null?'selected':''}"/>>--</option>
                        <option value="T"
                        <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                        <option value="C"
                        <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                        <option value="I"
                        <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
                        <option value="TC"
                        <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
                        <option value="TI"
                        <c:out value="${pageMaker.cri.type eq 'TI'?'selected':''}"/>>제목 or 아이디</option>
                        <option value="TCI"
                        <c:out value="${pageMaker.cri.type eq 'TIC'?'selected':''}"/>>제목 or 내용 or 아이디</option>
                        
                        </select>
                        
                        <input  type='text' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
                        <input type="hidden"  name ='pageNum' value='${pageMaker.cri.pageNum}'>
                        <input type="hidden"  name ='amount' value='${pageMaker.cri.amount}'>
                         <button class ='searchBtn'>검색</button>
                        
                        </form>
                </div>
                <!-- 검색창 끝 -->
                <div class="jaju_table">
                    
                    <table tit aria-setsize="500px">
                        
                        <thead>                     
                       
                            <tr>
                                <th>번호</th>
                                <th>글 제목</th>
                                <th>글 내용</th>

                                <th>글 타입</th>
                                <th>아이디</th>
                                <th>등록일</th>

                            </tr>
                        </thead>

                            <c:forEach items="${faq}" var="faq">
                                <tr>
                                
                                    <td><c:out value="${faq.postingNo }" /></td>
                                    
                                    <td><a class ='move' href='<c:out value="${faq.postingNo}"/>'>
                                    <c:out value="${faq.title }" /></a></td>
                                
                                    <td><c:out value="${faq.content }" /></td>
                                    <td><c:out value="${faq.boardType }" /></td>
                                    <td><c:out value="${faq.idNo }" /></td>
                                    <td><fmt:formatDate pattern="yyyy/MM/dd"
                                            value="${faq.regDate }" /></td>

                                </tr>
                            </c:forEach>
                        </table>
                </div>
                <!-- jaju_table -->
                            <!-- modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            </div>

                            <div class="modal-body">처리가 완료되었습니다.</div>

                            <div class="modal-footer">
                            <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>                      
                            </div>
                    
                        </div><!--  modal-content -->
                    </div><!--  modal dialog -->
                </div><!-- modal 마지막 -->

                <!-- Paging -->
                <div class='page_num'>
                <ul class="pagination1">
                
                <c:if test="${pageMaker.prev}">
                <li class="paginate_button pervious">
                <a href="${pageMaker.startPage -1}">Pervious</a>
                </li>
                </c:if>
                
                <c:forEach var="num" begin="${pageMaker.startPage}"
                end="${pageMaker.endPage}">
                <li class='paginate_button ${pageMaker.cri.pageNum == num? "active":""}'>
                <a href="${num}">${num}</a></li>
                </c:forEach>
                
                <c:if test="${pageMaker.next}">
                <li class="paginate_button next">
                <a href="${pageMaker.endPage +1}">Next</a>
                </li>
                </c:if>
                
                </ul>
                </div><!-- endPaging -->

                    <!-- paging form -->
                <form id='actionForm' action="/community/BoardFAQ/list" method='get'>
                    <input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
                    <input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
                    <input type="hidden"  name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
                </form><!-- paging form end-->

                <div class="jaju_regBtn">
                <button id='regBtn' type="button"  class="btn btn-xs pull-right">글쓰기</button>
                </div>
                
            </div>
            <!-- jaju_main_wrap -->
        </div>

    </div>
</div>
      
      <script type="text/javascript">
      var actionForm = $("#actionForm");
         $(document).ready(function() {
      

            var result = '<c:out value="${result}"/>';

            checkModal(result);
        
            history.replaceState({},null,null)
            
            
            function checkModal(result){
            
               
               if (result ==='' || history.state){
                  return;
               }
               
               if(parseInt(result)> 0 ){
          
                  $(".modal-body").html("게시글" + parseInt(result)+ "번이 등록되었습니다.");
               
            }
               
            $("#myModal").modal("show");
            
            
            }
            
            $("#regBtn").on("click",function(){
               
               self.location ="/community/BoardFAQ/register"
            });

            
         });
         
         $(".paginate_button a").on("click", function(e){
             
        
            e.preventDefault();
            
            console.log('click');
         
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
         });
         
         $(".move").on("click",function(e){
              

            e.preventDefault();
            actionForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/community/BoardFAQ/get");
            actionForm.submit();
            
         });
         
         var searchForm =$("#searchForm");
         
         $("#searchForm button").on("click" , function(e){
               
            if(!searchForm.find("option:selected").val()){
               alert("검색종류를 선택하세요");
               return false;
               
            }
            if(!searchForm.find("input[name='keyword']").val()){
               alert("검색어 입력하세요");
               return false;
               
            }
            
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            
            searchForm.submit();
            
            
             });
         
         
      </script>
   
   </div><!-- main-->
   

   
   
</body>

</html>