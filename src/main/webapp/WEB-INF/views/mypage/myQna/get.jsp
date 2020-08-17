<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
/* css 영역 */

body {
   font-family: Arial, Helvetica, sans-serif;
   color: #303030;
}

li {
   list-style: none;
}


/* 사이드 메뉴 */

.side{
	     width: 300px;	     
	     float: left;
	     margin-right: 20px;
	     margin-top:25px;
	}

	
.regi_content{
	   width: 1300px;
	   margin:0 auto;
      
	}

.regi_wrap{
   position: relative;
   display: inline-block;
   margin-right: 0px;
   padding-top: 30px;
}


	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}
	
	      
.regi_main{
   float:  right;
   width: 950px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;
   text-align: center;

}

        
.regi_wrap{
                 
   position: relative;
   display: inline-block;
   padding-top: 30px;
}
        
	
	
/* 사이드끝 */	
	
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
	

/* 사이드 메뉴 끝 */

  

/* 등록, 리셋 버튼 시작 */
#addReplyBtn,
#modifyBtn,
#deleteBtn,
#listBtn {
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
}


#addReplyBtn:hover,
#modifyBtn:hover,
#deleteBtn:hover,
#listBtn:hover {
  background-color: white; 
  color: #8FA691; 
  border: 2px solid #8FA691;
}


#addReplyBtn:focus,
#modifyBtn:focus,
#deleteBtn:focus,
#listBtn:focus { 
    outline: none; 
}

.Bbtn{

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
  width:10%;
  
  

}

.Bbtn:hover {
  background-color: white; 
  color: #8FA691; 
  border: 2px solid #8FA691;
 
}

/* 등록, 리셋 버튼 끝 */

.regi_main .title {
	margin:40px 0px 40px 0px;
	}
	.regi_main h3{
	font-weight:500;
	}
	.regi_main p{
		color: #b9b9b9;
	}

.regi_main{

    height:1000px;
}

#replytitle{
       margin-left: 20px;

}

</style>


</head>
<body>


<div class="regi_content">
 <div class="regi_wrap">
     <div class="1nb_list">
     
<!-- side 시작 -->
	<div class="side">
<%@include file="../../includes/mypage_sidebar.jsp" %>
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
	            <h3>1:1 문의</h3>
	            <p>문의내용</p>
	   		</div>
   </div>
   <!-- regi_tit 끝 -->



   <div class="row">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-body" id='body'>

                   <form id = "actionForm" role="form" method="post">

               <div class="from-group">
                  <label>제목</label><input class="form-control" name='title'
                     value='<c:out value="${BoardQNA.title}"/>'
                  readonly="readonly">
               </div>

            <div class="from-group">
                  <label>내용</label>
                  <textarea  style='resize:none' class="form-control" rows="10" name='content'
                  readonly="readonly"><c:out value="${BoardQNA.content}"/></textarea>
            </div>
     
               
            <div class="from-group">
                  <input type="hidden" class="form-control" name='idNo'
                     value='<c:out value="${BoardQNA.idNo}"/>'readonly="readonly">
            </div>
               
            <div  class="from-group">
                <!--   <label>글번호</label> --><input type ='hidden' class="form-control" name='postingNo'
                     value='<c:out value="${BoardQNA.postingNo}"/>'readonly="readonly">
             </div>
             
                    <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                       <input type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                       <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                       <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>  
               
               <button data-oper='modify' class="btn btn-default" id="modifyBtn">수정</button>
               <button data-oper='remove' type="submit" class="btn btn-default" id="deleteBtn">삭제</button>
                    <button data-oper='list' type="submit" class="btn btn-info" id="listBtn">리스트</button>
              </form>
                    
                    
                    <form id='operForm' action="/mypage/myQna/modify" method="get">
                       <input type="hidden" id='postingNo' name='postingNo' value='<c:out value="${BoardQNA.postingNo}"/>'>
                       <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                       <input  type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                       <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                       <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>           
               </form><!-- operForm end -->
               
            </div>
         </div>
      </div>
   </div>
   <!-- row end -->
   
     <!-- reply-main -->
     
              <div class = "reply-main">
               <h4 class="reply-title" id="replytitle">댓글쓰기</h4>
         
            
              <div id = "regiBtn">
               <div class="form-grop">
         
               <textarea style='resize:none' class ="form-control replyContent" id="replyContentBtn"  rows='5'  name='replyContent' placeholder ='댓글은 1~600자에 맞게 입력해주세요'></textarea></div>
               
               <div class="form-grop">
              
               <input class ="form-control" id ="idNoBtn"  type='hidden'  name='idNo' value='${sessionMember.idNo}' readonly="readonly"></div>
                 
    
               
         <!--       <div class="form-grop">
               <label>replyDate</label>
               <input class ="form-control" name='regDate' value=''></div> -->
               
              
                <div class="panel-heading">
               <i class="fa fa-comments fa-fw"></i>Reply
               <button id ='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 입력하기</button>
               </div> <!-- /,panel-heading -->
               </div><!-- regiBtn -->
   
             </div>  <!-- reply-main end -->
   
         
               <div id ="list">   
               <div class="panel-body">  <!-- 댓글 목록 리스트 -->          
               <ul class="chat">
               <!--  start reply -->
               <li class="left clearfix" data-replyNo='38'>
                    <div>
                    <div class="header">
                    <strong class="primary-font">user00</strong>
                    <small class="pull-rigth text-muted">2018-01-01 13:13</small>
                   </div>
                   <p>Good jop!</p>
               </div>
                   </li>
                   <!--  end reply -->
               </ul>
               <!--  end ul -->
               </div><!-- 댓글 div 마지막 -->
               <!--  /.panel .chat-panel -->
                 </div><!-- RemoveBtn end -->

      
      
    
      
</div>
<!-- regi_main 끝 -->         
   
   
      
      
  
</div>
<!-- regi_content 끝 -->
</div>      
<!-- regi_wrap 끝 -->
      
         
      
      
      
      
      
      
      

   <script type="text/javascript" src="/resources/js/reply.js"></script>  <!--댓글 스크립트. 경로인듯  -->
   
   <script type="text/javascript">
   
   <!--댓글 출력처리-->
   $(document).ready(function(){
      
      

      var replyNoValue = $("#postingNo").val();
      var replyUL = $(".chat");
     
      showList(1);//<댓글 호출 매서드
      
      function showList(page){

         replyService.getList({postingNo:replyNoValue,page: page || 1}, function(list){
            
           var str="";
           
           if(list == null || list.length == 0){
            
              replyUL.html("");
           
                return;
           }
           
           for(var i = 0, len =list.length || 0; i <len; i++){
              str += "<li class='left clearfix' data-replyNo ='"+list[i].replyNo+"' data-text='"+list[i].replyContent+"'>";
              str += "<div><div class=''><strong class='primary-font email'>"+list[i].emailAccount+"</strong>";
              
             
              str += "<div><div class='header'><input type='hidden' class='primary-font checkidNo' value='"+list[i].idNo+"'/>";
               
              str += "<div><small class ='pull-right text-muted'>"+replyService.displayTime(list[i].regDate)+"</div></small>";    
              str += "<div><pre class='text' id='text' rows='5'readonly='readonly' >"+list[i].replyContent+"</pre></div>";
             
              str += "<button id='RemoveBtn' class ='btn btn-dangers Bbtn'>"+'삭제'+"</button>"
              str += "<button id='ModifyBtnBtn' class ='btn btn-dangers Bbtn'>"+'수정'+"</button></div>"
              str += "<div id='divBtnDelete' class ='btn btn-dange' style='display: none'>"  
            
       
           }
            
           
           replyUL.html(str);

                  var idNoBtn = $("#idNoBtn")[0].value;
                  var checkidNo = "";
                  for(var i = 0; i <=$(".checkidNo")[i].length; i++){
                	  
                	
						 checkidNo = $(".checkidNo")[i].value;
                 
                        
                  
                     if(idNoBtn!=checkidNo){
                   	  
                    	 $(".header")[i].children[3].style.display = "none";
                    	 $(".header")[i].children[4].style.display = "none";
                   	  		
                   	  } 
  				  }
                     
                  });//end function
                  
                  
                  
                 }//end showList
                 
              
    
        //댓글 입력처리

          
        var regiBtn = $("#regiBtn")
          
          
        regiBtn.find('button').on("click",function(e){
           if($("#replyContentBtn").val() == ''||$("#replyContentBtn").val().trim()==""||$("#replyContentBtn").val().length>600){
              
                    alert("댓글양식에 맞게 입력해주세요(1~600자)");
                    return false;
               
            }
           
           
           replyService.add(
                  {idNo:$("#idNoBtn").val(), replyContent:$("#replyContentBtn").val(), postingNo:$("#postingNo").val()},
                  
                  
                 
                  function(result){
                     
         
                     var replyContent = $(".replyContent").val();
                     var dd = "";
                         console.log(replyContent);
                       

                     alert("댓글이 등록되었습니다. : " + result);
                      $("#replyContentBtn").val("");
                     
                     showList(1);
               }); 
            
          
           
           });
      //댓글 입력 end
   
      
     
      //삭제 처리
      
      
          $("#list").on("click","button[id='RemoveBtn']",function(e){
        	 
           
         
               var target = e.target
               //var replyLi = $(target).parent().parent().parent();
               var replyLi = $(target).closest("li");
               var replyNo = replyLi.data("replyno");
               
               var ids = replyLi.data("id");
               
               console.log(replyLi);
                 alert(ids);         
            
            
            
            replyService.remove(replyNo , function(count){
                 
                  console.log(count);
                  
                  if(count === "success"){
                     showList(1);
                     alert("REMOVED");
                     
                     
                  }
               }, function(err){
                alert('ERROR....')   
                  
               });
            
      
                  
         });      
      //댓글 삭제end
      
      
         //수정 start
        $("#list").on("click","button[id='ModifyBtnBtn']",function(e){
        	

           var target = e.target
           var replyLi = $(target).closest("li");
           var replyNo = replyLi.data("replyno");
           
         
           // var text = replyLi.data("text");
            var str = $(target).parent().parent().find("#text")[0].textContent;
            $(".text").css("display","block");
           
         
                
          //   $("#text").css("display","block");
             $(target).parent().find("#text").css("display","none");
           
             $(".btn-dangers").show();
             $(".btn-dange").hide();
       	    
              
             
            $(target).parent().find("button")
           
            
            $(target).parent().find("button").hide();
           
            
            
            $(target).parent().find("#text").removeAttr("readonly");
            $(target).parent().parent().find("#divBtnDelete").show();
            
            
     /*        str += "<button id='Mbtn' class ='btn btn-danger' >"+'수정완료'+"</button>"
            str += "<button id='Cbtn' class ='btn btn-danger' >"+'수정취소'+"</button></div>"
             */
            
            ///수정버튼눌럿을겨우 텍스트만들기
            var replyDiv = document.createElement("div");
            replyDiv.setAttribute("class", "replyDiv");

            var textArea = document.createElement("textarea");
            textArea.setAttribute("id", "replyTextarea");
            textArea.setAttribute("style", "width:100%; height:100px; resize:none;"); 
          
            
            var Mbtn = document.createElement("input");
            Mbtn.setAttribute("id", "Mbtn");
            Mbtn.setAttribute("class", "btn btn-danger Bbtn");
            Mbtn.setAttribute("value", "완료");
           
            
            var Cbtn = document.createElement("input");
            Cbtn.setAttribute("id", "Cbtn");
            Cbtn.setAttribute("class", "btn btn-danger Bbtn");
            Cbtn.setAttribute("value", "취소");
            
            $(textArea).html(str);     
         
            replyDiv.appendChild(textArea);
            replyDiv.appendChild(Mbtn);
            replyDiv.appendChild(Cbtn);
        
        
            $(target).parent().parent().after(replyDiv);
       });
    
    
          $("#list").on("click","input[id='Mbtn']",function(e){
               
             
            var target = e.target
              var replyLi = $(target).closest("li");
              var replyNo = replyLi.data("replyno");
             var postingNo = replyLi.data("postingNo");
            
            
             
             var replyContent =  $(target).parent().parent().find("#replyTextarea").val();
         
              if(replyContent==''||replyContent.trim()==''||replyContent.length>600){
                 
                 alert("댓글은 1~600자에 맞게 입력해주세요")
                 return false;
              }
        
            replyService.update({
                  
              
              replyNo  : replyNo,    
              postingNo : postingNo,
             replyContent : replyContent

             
          },function(result){
                
                alert("수정 완료 ........")
                showList(1);
                
                
                
                
                
             
          });
                
          });
          
          $("#list").on("click","input[id='Cbtn']",function(e){

        
            showList(1);
       
           
          });
         
         
      //수정 완료
      
              
       
                      
        });//onload end

   


</script>
<!-- 댓글스크립트 -->

<script type="text/javascript">
     
     
     $(document).ready(function(){
        var formObj = $("#actionForm");
       
       formObj.find('button').on("click", function(e){
          e.preventDefault();
          
          var operation = $(this).data("oper");
          
          console.log(operation);

           if(operation === 'remove'){
              
              formObj.attr("action","/mypage/myQna/remove");
           }
           formObj.submit();
       });
        
           
        var operForm = $("#operForm");
        
         $("button[data-oper='modify']").on("click", function(e){
        	 
			  operForm.attr("action","/mypage/myQna/modify").submit();
           
          });
        
      	  $("button[data-oper='list']").on("click",function(e){
           
          operForm.find("#postingNo").remove();
          operForm.attr("action","/mypage/myQna/list");
          operForm.submit();
           
          });
     });
     
     </script>
     
     
   <%@include file="../../includes/footer.jsp" %>        
     
</body>
</html>