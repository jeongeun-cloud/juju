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



<style>
/* css 영역 */




/* 사이드 메뉴 */
.side{
          
     width: 200px;
     height: 500px;
     background-color: white;
     float: left;
     margin-right: 90px;
     border:solid;
            
}

 .regi_side_tit{
      padding-top: 12px;
      padding-bottom:12px ;
      text-align: center;
      width: 100%;
      background-color: #ffc30b;
      font-size: 20px;
      font-weight: 900;
            
}
/* 사이드 메뉴 끝 */









        
.regi_main{
   float:  right;
   width: 1000px;
   height: 1000px;
   background-color: white;
} 

.regi_main .regi_tit{
   font-size: 30px;
   margin-bottom:50px;

}




.regi_content{
   width: 1300px;
   height: 1000px;
   margin:0 auto;
   border: solid;
}
        
.regi_wrap{
                 
   position: relative;
   display: inline-block;
   padding-top: 30px;
   background-color: cornsilk;
}
        







/* 등록, 리셋 버튼 시작 */
#modifyBtn,
#deleteBtn,
#listBtn {
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


#modifyBtn:hover,
#deleteBtn:hover,
#listBtn:hover {
  background-color: white; 
  color: #ffc30b; 
  border: 2px solid #ffc30b;
}

#modifyBtn:focus,
#deleteBtn:focus,
#listBtn:focus { 
    outline: none; 
}


/* 등록, 리셋 버튼 끝 */











</style>


</head>
<body>





<div class="regi_content">
 <div class="regi_wrap">



<%-- 
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header"><c:out value="공지사항"/></h1>
      </div>
   </div>
   <!--  col-lg-12 end -->
 --%>





<!-- side 시작 -->
   <div class="side">
      <div class="1nb_list">
         <div class="regi_side_tit">고객센터</div>
           <div class="regi_side_menu">
               <ul class="regi_menu">
                    <p><b>쇼핑 이용 정보</b></p>
                    <li> <a href='#'>-주문내역</a></li>
                    <li><a href='#'>-장바구니</a></li>
                    <br>
                    <p><b>게시판 이용 내역</b></p>
                    <li> <a href='#'>-1:1문의</a></li>
                    <li><a href='#'>-나의 상품평</a></li>
                    <li><a href='#'>-나의 상품 문의</a></li>
                    <br>
                    <p><b>개인정보 수정</b></p>
                    <li> <a href='#'>-개인정보 수정</a></li>
                    <li><a href='#'>-비밀번호 변경</a></li>
                    <li><a href='#'>-회원 탈퇴</a></li>

                </ul>
           </div>
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->








<!-- regi_main 시작 -->      
<div class="regi_main">
   
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>[1:1문의 등록하기]</b></p>
   </div>
   <!-- regi_tit 끝 -->









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