<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>



</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"><c:out value="자묻질"/></h1>
		</div>
	</div>
	<!--  col-lg-12 end -->


	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><c:out value="${Board_FAQ.content}"/></div>
				<div class="panel-body">
                   <form id = "actionForm" role="form" method="post">


					<div class="from-group">
						<label>Title</label><input class="form-control" name='title'
							value='<c:out value="${Board_FAQ.title}"/>'
						readonly="readonly">
					</div>

					<div class="from-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='content'
						readonly="readonly"><c:out value="${Board_FAQ.content}"/></textarea>
					</div>


					<div class="from-group">
						<label>게시글타입</label><input class="form-control" name='boardType'
							value='<c:out value="${Board_FAQ.boardType}"/>'readonly="readonly">
					</div>
					
					<div class="from-group">
						<label>작성자</label><input class="form-control" name='idNo'
							value='<c:out value="${Board_FAQ.idNo}"/>'readonly="readonly">
					</div>
					
					<div class="from-group">
						<label>글번호</label><input class="form-control" name='postingNo' id="postingNo"
							value='<c:out value="${Board_FAQ.postingNo}"/>'readonly="readonly">
					</div>
					
					<button data-oper='modify' class="btn btn-default">수정</button>
					<button data-oper='remove' type="submit" class="btn btn-default">삭제</button>
					
                    <button data-oper='list' class="btn btn-info">리스트</button>
          </form>
               
               <form id='operForm' action="/commuinty/Board_FAQ/modify" method="get">
                <input type="hidden" id= 'postingNo' name='postingNo' value='<c:out value="${Board_FAQ.postingNo}"/>'>
                   <input type="hidden"  name ='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                   <input  type="hidden" name ='amount' value='<c:out value="${cri.amount}"/>'>  
                   <input type ="hidden" name= 'type' value='<c:out value="${cri.type}"/>'>
                   <input type ="hidden" name= 'keyword' value='<c:out value="${cri.keyword}"/>'>
                   
					</form>
				
				
				
				
				
				</div><!--  panel body end -->
			</div>
		</div>

	</div>
	<!-- row end -->

		
		<div class = 'row'><!-- 댓글 div  -->
		
				<div class ="col-lg-12">
				   <!-- /.panel -->
				   <div class="panel panel-default">
				<!--    <div class="panel-heading">
				   <i class="fa fa-comments fa-fw"></i>Reply
				   </div> -->
				   <!-- Modal -->
				   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				   aria-lablledby="myModalLabel" aria-hidden="true">
				   <div class="modal-dialog">
				   <div class="modal-content">
				   <div class ="modal-header">
				   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				   <h4 class ="modal-title" id="myModalLabel">Reply Modal</h4>
	              </div>
	              <!-- modal-header end -->
				  <div class="modal-body">
				  <div class="form-group">
				  <label>postingNo</label>
				  <input class="form-control" name='postingNo' value=''>
				  </div>
				  
				  <div class="form-group">
				  <label>idNo</label>
				  <input class="form-control" name='idNo' value='idNo'>
				  </div>
				  
				   <div class="form-group">
				  <label>replyContent</label>
				  <input class="form-control" name='replyContent' value=''>
				  </div>
				  
				  <div class="form-group">
				   <label>Reply Date</label>
				   <input class="form-control" name='regDate' value=''>
				  </div>
				  
				  </div><!-- modal-body -->
				  
				  <div class="modal-footer">
						  <button id ='modalModBtn' type ="button" class="btn btn-warning">수정</button>
				          <button id = 'modalRemoveBtn' type ="button" class ="btn btn-danger">삭제</button>  
				          <button id = 'modalCloseBtn' type ="button" class="btn btn-default">닫기</button>
				          <button id = 'modalClassBtn' type = 'button' class='btn btn-default'>닫기</button>
				     
				  
				  </div><!--  footer -->
			     	  
				   </div><!-- modal-cntent end -->
				   
				   </div><!-- dialog -->
				  
				   </div><!-- modal end -->
				   
				   
				   
				   
				   <div class="panel-heading">
				   <i class="fa fa-comments fa-fw"></i>Reply
				   <button id ='addReplyBtn' class='btn btn-primary btn-xs pull-right'>글쓰기</button>
				   </div> 
				   
				   <!-- /,panel-heading -->
				   <div class="panel-body">
				   
				   <ul class="chat">
				   <!--  start reply -->
				   <li class="left clearfix" data-replyNo='89'>
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
				   </div>
				   <!--  /.panel .chat-panel -->
				   </div>
				</div>
		</div><!-- 댓글 div 마지막 -->

   <script type="text/javascript" src="/resources/js/reply.js"></script>  <!--댓글 스크립트. 경로인듯  -->
   
   <script type="text/javascript">
   
   <!--댓글 출력처리-->
   $(document).ready(function(){
	   
	   var replyNoValue = $("#postingNo").val();
	   var replyUL = $(".chat");
	  
	   showList(1);
	   
	   function showList(page){

		   replyService.getList({postingNo:replyNoValue,page: page || 1}, function(list){
			   
			  var str="";
			  
			  if(list == null || list.length == 0){
				
				  replyUL.html("");
			  
			       return;
			  }

			  for(var i = 0, len =list.length || 0; i <len; i++){
				  str += "<li class='left clearfix' data-replyNo ='"+list[i].replyNo+"'>";
				  str += "<div><div class='header'><strong class='primary-font'>"+list[i].idNo+"</strong>";
				  
				  str += "<small class ='pull-right text-muted'>"+replyService.displayTime(list[i].regDate)+"</small></div>";
				  
				  str += "<p>"+list[i].replyContent+"</p></div></li>";
			
			  }
			  replyUL.html(str);

			  
					   });//end function
			        }//end showList
			        
			

       
		  var modal = $(".modal");
		  var postNo = $("#postingNo").val();
		  var modalInputPostingNo = modal.find("input[name='postingNo']").val(postNo);
		  console.log(modalInputPostingNo);
		  var modalInputidNo = modal.find("input[name='idNo']");
		  var modalInputReplyContent = modal.find("input[name='ReplyContent']");
		  var modalInputregDate = modal.find("input[name='regDate']");
		        
		    
		  var modalModBtn = $("#modalModBtn");
		  var modalRemoveBtn = $("#RemoveBtn");
		  var modalRegisterBtn = $("#RegisterBtn");
		  
		  $("#addReplyBtn").on("click",function(e){
			 
			  
			  modal.find("input").val("");
			  modalInputregDate.closest("div").hide();
			  modal.find("button[id !='modalCloseBtn']").hide();
			  
			  modalRegisterBtn.show();
			  
			  $(".modal").modal("show");
	         	  
		         });	  
		  		
		  
      modalRegisterBtn.on("click",function(e){
              
              
              var reply = {
                    replyContent: modalInputReplyContent.val(),
                    idNo:modalInputidNo.val(),
                    postingNo:replyNoValue
                    
              };
              
              replyService.add(reply, function(result){
                
                 
                 alert(result);
                 
                 modal.find("input").val("");
                 modal.modal("hide");
                 
              });
              
           });
                 
		  
            });
   
   
   



   </script>
   
   <script type="text/javascript">//댓글 스크립트2.

   
	   console.log("=========");
	   console.log("JS TEST");
	  
	   console.log(replyService);
	   
	   var replyNoValue = '3';
	   
	  // <!--댓글 입력-->
	   replyService.add(
			   {idNo:"JS Test", replyContent:"tester", postingNo:replyNoValue},
			   
			   function(result){
				   alert("RESUTL : " + result);
			 
		   }); 
		
		//<!-- 댓글 출력-->
 	   replyService.getList({postingNo:3, page:1}, function(list){
		   
			
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
		 
	
		    replyNo  : "59",
		    postingNo : "333",
			replyContent : "수정된 리플d",
		

		
	   },function(result){
				
				alert("수정 완료 ........")
			
		});
	   
	   replyService.get("50", function(data){
		  
		   console.log("데이타타타탙타ㅏ타타 " + data);
	   });
	   	  
		   
  
   </script>
   
     <script type="text/javascript">
     $(document).ready(function(){
    	 
    	 
    	 
    	 
    	 var formObj = $("#actionForm");
 		
 		$('button').on("click", function(e){
 			e.preventDefault();
 			
 			var operation = $(this).data("oper");
 			
 			console.log(operation);

	 		 if(operation === 'remove'){
	 			 
	 			 formObj.attr("action","/community/notice/remove");
	 		 }
 			 formObj.submit();
 		});
    	 
 			 
    	 var operForm = $("#operForm");
    	 

    	 
     	 $("button[data-oper='modify']").on("click", function(e){
        
    		 operForm.attr("action","/community/notice/modify").submit();
    		 
    	 });
    	 
    	 $("button[data-oper='list']").on("click",function(e){
        	
    		operForm.find("#postingNo").remove();
    		operForm.attr("action","/community/notice/list");
    		operForm.submit();
    		 
    	 });
     });
     
     </script>
</body>
</html>