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
<title>Insert title here</title>

</head>
<body>
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header"><c:out value="공지사항"/></h1>
      </div>
   </div>
   <!--  col-lg-12 end -->


   <div class="row">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading"><c:out value="${BoardQNA.content}"/></div>
            <div class="panel-body">

                   <form id = "actionForm" role="form" method="post">

               <div class="from-group">
                  <label>Title</label><input class="form-control" name='title'
                     value='<c:out value="${BoardQNA.title}"/>'
                  readonly="readonly">
               </div>

            <div class="from-group">
                  <label>내용</label>
                  <textarea class="form-control" rows="10" name='content'
                  readonly="readonly"><c:out value="${BoardQNA.content}"/></textarea>
            </div>


            <div class="from-group">
                  <label>게시글타입</label><input class="form-control" name='boardType'
                     value='<c:out value="${BoardQNA.boardType}"/>'readonly="readonly">
            </div>
               
            <div class="from-group">
                  <label>작성자</label><input class="form-control" name='idNo'
                     value='<c:out value="${BoardQNA.idNo}"/>'readonly="readonly">
            </div>
               
            <div  class="from-group">
                  <label>글번호</label><input class="form-control" name='postingNo'
                     value='<c:out value="${BoardQNA.postingNo}"/>'readonly="readonly">
             </div>
             
                    <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                       <input type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                       <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                       <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>  
               
               <button data-oper='modify' class="btn btn-default">수정</button>
               <button data-oper='remove' type="submit" class="btn btn-default">삭제</button>
                    <button data-oper='list' type="submit" class="btn btn-info">리스트</button>
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
               <label>replyContent</label>
               <textarea class ="form-control replyContent" id="replyContentBtn"  rows='5'  name='replyContent' placeholder ='댓글은 1~600자에 맞게 입력해주세요'></textarea></div>
               
               <div class="form-grop">
               <label>id</label>
               <input class ="form-control" id ="idNoBtn"  name='idNo' value='idNo' readonly="readonly"></div>
                 
    
               
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
              str += "<div><div class='header'><strong class='primary-font'>"+list[i].idNo+"</strong>";
              
              str += "<div><small class ='pull-right text-muted'>"+replyService.displayTime(list[i].regDate)+"</div></small>";
              
             
              str += "<div><textarea class='text' id='text' rows='5'readonly='readonly' >"+list[i].replyContent+"</textArea></div>";
             
              str += "<button id='RemoveBtn' class ='btn btn-dangers'>"+'삭제'+"</button>"
              str += "<button id='ModifyBtn' class ='btn btn-dangers'>"+'수정'+"</button></div>"
              str += "<div id='divBtnDelete' class ='btn btn-dange' style='display: none'>"          
              str += "<button id='Mbtn' class ='btn btn-danger' >"+'수정완료'+"</button>"
              str += "<button id='Cbtn' class ='btn btn-danger' >"+'수정취소'+"</button></div>"
             
            
              
           }
           replyUL.html(str);

           
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
        $("#list").on("click","button[id='ModifyBtn']",function(e){
          
          
           
           var target = e.target
              var replyLi = $(target).closest("li");
              var replyNo = replyLi.data("replyno");
           var text = replyLi.data("text");
       
           
           var str = $(target).parent().find(".text").val(text);
      
            
           
           
             $(".btn-dangers").show();
             $(".btn-dange").hide();
             $(".text").attr('readonly','readonly');
              
             
            $(target).parent().find("button")
           
            
            $(target).parent().find("button").hide();
           
            
            
            $(target).parent().find("#text").removeAttr("readonly");
           
           //$(target).siblings("button").hide();
            
               
           $(target).parent().parent().find("#divBtnDelete").show();
            
         
        
        
        
       });
    
      
          $("#list").on("click","button[id='Mbtn']",function(e){
               
                
           
             
            var target = e.target
              var replyLi = $(target).closest("li");
              var replyNo = replyLi.data("replyno");
             var postingNo = replyLi.data("postingNo");
            
            
             
             var replyContent =  $(target).parent().parent().find("#text").val();
         
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
          
          $("#list").on("click","button[id='Cbtn']",function(e){

        
            showList(1);
       
           
          });
         
         
      //수정 완료
      
              
       
                      
        });//onload end

   


   </script>
   
   <script type="text/javascript">//댓글 스크립트2.

   
     /*  console.log("=========");
      console.log("JS TEST");
     
      console.log(replyService);
      
      var replyNoValue = '38';
      
     // <!--댓글 입력-->
      replyService.add(
            {idNo:"", replyContent:"", postingNo:"38"},
            
            function(result){
               alert("RESUTL : " + result);
          
         }); 
      
      //<!-- 댓글 출력-->
       replyService.getList({postingNo:38, page:1}, function(list){
         
         
         console.log(list[0]);
      
        for(var i =0, len = list.length||0; i<len; i++){
           
           console.log(list[i]);
        }   
     
      }); 
      
      
      //remove 안에 숫자는 replyNO
       replyService.remove(34 , function(count){
        
         console.log(count);
         
         if(count === "success"){
            alert("REMOVED");
         }
      }, function(err){
       alert('ERROR....')   
         
      }); 
      
      //댓글수정  preplyNo로 찾고 replyContent 수정. 추가수정하려면 xml 쿼리문 고쳐야함
      replyService.update({
       
   
          replyNo  : "205",
          postingNo : "25",
         replyContent : "수정된 리플입니다!!",
      

      
      },function(result){
            
            alert("수정 완료 ........")
         
      });
      
      replyService.get("25", function(data){
        
         console.log("데이타타타탙타ㅏ타타 " + data);
      });
            */
         
  
   </script>


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
</body>
</html>