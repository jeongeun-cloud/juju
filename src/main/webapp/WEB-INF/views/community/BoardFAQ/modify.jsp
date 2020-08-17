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
    body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}


table {
		border-collapse: collapse;
		width: 90%;
		margin-left: 20px;
        margin-top: 30px;
	}

/* 배치 */
th, td {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
}

th {
   background-color: #8FA691; 
   color: white;
    height: 40px;
   text-align: left;
}

tr:hover {
   background-color: #f5f5f5;
}


/* 사이드 메뉴 */
.side{
	     width: 300px;	     
	     float: left;
	      margin-right: 20px;
	     margin-top:25px;
	}
	
.regi_main{
	   float:  right;
	   width: 950px;	   
	   background-color: white;
}

.regi_content{
	   width: 1300px;
	   margin:0 auto;
      
	}

.regi_wrap{
   position: relative;
   display: inline-block;
   padding-top: 30px;
}

.regi_main .title {
	margin-left: 20px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}
	

/* 글쓰기, 검색 버튼 시작 */
.btn {
  height: 43.75px;
  background-color: #8FA691; 
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
   float:right;

  }

.btn:hover {
  height: 43.75px;
  background-color: #F0F2F0 ; 
  color: #8FA691; 
  padding: 0px 20px;
  border: 2px solid #8FA691;
 
}

.btn:focus{ 
    outline: none; 
}



/* 글쓰기, 검색 버튼 끝 */
/* 페이지 버튼 디자인 시작 */



/* 페이지 버튼 디자인 끝 */
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


.regi_main .title {
	margin:40px 0px 40px 20px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}

    .mainContent{
     height: 700px;
    }

  

        
</style>
</head>
<body>
<div class="regi_content">
   <div class="regi_wrap">
     <div class="1nb_list">
       <!-- side 시작 -->
	    <div class="side">
			<%@include file="../../includes/community_sidebar.jsp" %>
       </div>	
<!-- side 끝-->        
    </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->
       
<!-- regi_main 시작 -->      
<div class="regi_main">
        <div class="mainContent">
      		<div class="title">
            <h3>자주묻는질문</h3>
            <p>자주하는 수정하기</p>
             
  	 </div>

                <div class="jaju_regi_form">
                  

                    <form id ='modifyForm' role="form" action="/community/BoardFAQ/modify" method="post">
                        <!-- 조회페이지에서 수정/삭제 페이지로 이동 -->
                        <input type='hidden'   name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                        <input type='hidden'  name='amount' value='<c:out value="${cri.amount}"/>'>
                        <input type='hidden'  name='type' value='<c:out value="${cri.type}"/>'>
                        <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
    
                        <div class="from-group">
                            <label>제목</label><input id='title' class="form-control" name='title'
                                value='<c:out value="${BoardFAQ.title}"/>'>
                        </div>
    
                        <div class="from-group">
                            <label>내용</label>
                            <textarea class="form-control" id='content' rows="10" name='content'
                         ><c:out value="${BoardFAQ.content}"/></textarea>
                        </div>
    
    
                        <div style='display:none' class="from-group">
                            <label>게시글타입</label><input class="form-control" name='boardType'
                                value='<c:out value="${BoardFAQ.boardType}"/>'readonly="readonly">
                        </div>
                        
                        <div style='display:none' class="from-group">
                            <label>작성자</label><input class="form-control" name='idNo'
                                value='<c:out value="${BoardFAQ.idNo}"/>'readonly="readonly">
                        </div>
                        
                        <div  style='display:none' class="from-group">
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

   <%@include file="../../includes/footer.jsp" %>   


</body>
</html>
