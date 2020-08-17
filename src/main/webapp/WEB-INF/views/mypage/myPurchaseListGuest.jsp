<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../includes/header.jsp" %>
<%@include file="./../includes/menuBar.jsp" %>    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>비회원 주문조회</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
.regi_menu a{[]
   text-decoration: none;
   color: #303030;
   font-size: 17px;
}
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
	   height: 1800px;
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

/* 페이지 버튼 디자인 시작 */
.pageBtns {
	text-align: center;
	margin-right: 8%;
}

.page_num a{
     color: #637365;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    
   
}


.page_num {
        display: inline-block;
        padding-left:50%;
        float: left;
        width: 950px
        }
        
        
    
.paginations a:hover:not(.active) {
          background-color:#F0F2F0;
          border-radius: 50%;
          }
          
.paging{
    
 background-color: white;
 color: #f6dd90;
}

.pagination1 a:hover:not(.active) {
    background-color: #F0F2F0;
    border-radius: 50%;
}

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


.col-lg-12 {
	text-align: center;
    margin: 10px 0 30px 0;
}
        
.regi_main{
   width: 950px;
   margin-bottom: 5%;
  height:1500px;
   background-color: white;
   margin: 0 auto;
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


table img {
	height: 100px;
}

.imgTd {
	width: 215px;
}

#footer{
	bottom:0;
}
</style>
</head>
<body>

<div class="regi_content">
 <div class="regi_wrap">
     <div class="1nb_list">
     

  
           
     </div>
     <!-- 1nb_list -->
  </div>
<!-- side 끝-->


<!-- regi_main 시작 -->      
<div class="regi_main">
      
      



      <div class="p2">
   <!-- regi_tit 시작 -->
    <div class="regi_tit">
       <p><b>비회원 주문조회 </b></p>
   </div>
   <!-- regi_tit 끝 -->

         
         <table tit aria-setsize="500px">
            <!-- postingNo
            title
            replyBool
                 regdata -->
                 <!-- 페이징처리 -->
            <tbody id="myPerchaseTable">                 
            <c:forEach items="${myPerchaseList}" var="myPerchase">
               <tr>
                 <td colspan="5">
                 <label>주문일시:&nbsp;</label><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
                        value="${myPerchase.orderDate }" />	
				&emsp;
                 <label>주문번호:&nbsp;</label><c:out value="${myPerchase.orderCode}" /></td> 
               </tr>
               <tr>                         
               	 <td class="imgTd" rowspan="3" onclick='goToItemPage("<c:out value="${myPerchase.itemCode}"/>")'><img src="/resources/upload/<c:out value="${myPerchase.idNo}"/>/<c:out value="${myPerchase.itemImg1}"/>" ></td>
                 <td><label>카테고리:&nbsp;</label><c:out value="${myPerchase.fullPath}" /></td>  
                 <td rowspan="3"><label>수량</label><br><br><br><c:out value="${myPerchase.itemNum}" /></td>
                 <td rowspan="3"><label>가격</label><br><br><br><fmt:formatNumber value="${myPerchase.totalPrice }" pattern="#,###"/>원</td>
                 <td rowspan="3"><label>주문상태</label><br><br><br><c:out value="${myPerchase.orderStat}" /></td>
               </tr>  
               <tr>
                 <td><label>상품명:&nbsp;</label><c:out value="${myPerchase.itemName}" /></td>    
               </tr>
               <tr>
                 <td><label>상점명:&nbsp;</label><c:out value="${myPerchase.shopName}" /></td>
               </tr>       
                 

          
            </c:forEach>
            </tbody>

         </table>
    
               <!-- 페이징 시작-->  
               
               <!--   
          <div class='page_num'>
                            <ul class="pagination1">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button1 pervious">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button1 ${pageMaker.cri.pageNum == num ? " active" : "" } '>
            						   <a class="paging" href="/mypage/myPerchase/page/${num}">${num}</a></li>
                                
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                     <li class="paginate_button1 next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>
                        
                        -->  
              <!-- 페이징 끝-->  
         
      </div>
      <!-- p2-->
</div>
<!-- regi_main 끝 -->     

</div>
<div id="footer">
	<%@include file="../includes/footer.jsp" %>   
</div>

<script type="text/javascript">

$(document).ready(function(){
	
	var pageTags = $(".paging");
	var myPerchaseTable = $("#myPerchaseTable");
	
	pageTags.on().click(function(e){
		e.preventDefault();
		var pageNum = e.target.innerText;
		console.log(pageNum);
		getListByPage(pageNum)
		.then(function(response){
			console.log(response);
			drawMyPerchaseList(response);
		})
		.catch(function(error){
			console.log(error);
		});
		
	});
	
	
	/* 	ajax 방식으로 페이징 처리 */
	function getListByPage(pageNum) {
		return $.ajax({
			type: "GET",
			url: "/mypage/myPerchase/page/"+pageNum,
			contentType : "application/json; charset=UTF-8"
		});
	};
	
	/* 하드코딩으로 해결..테이블이 상대적으로 복잡 */
	function drawMyPerchaseList(myPerchaseList){
		myPerchaseTable.html("");
		var str = "";
		for(var i = 0; i<myPerchaseList.length; i++){
			var myPerchase = myPerchaseList[i];
			var orderDate = myPerchase.orderDate;
			var date = new Date(orderDate);
			str += '<tr><td colspan="5"><label>주문일시:&nbsp;</label>'+formatDate(date)+'&emsp;&nbsp;&nbsp;';
			str += '<label>주문번호:&nbsp;</label>'+myPerchase.orderCode+'</td></tr>';
			str += '<tr><td class="imgTd" rowspan="3"><img src="/resources/upload/'+myPerchase.idNo+'/'+myPerchase.itemImg1+'"></td>';
			str += '<td><label>카테고리:&nbsp;</label>'+myPerchase.fullPath+'</td>';
			str += '<td rowspan="3"><label>수량</label><br><br><br>'+myPerchase.itemNum+'</td>';
			str += '<td rowspan="3"><label>가격</label><br><br><br>'+addCommas(myPerchase.totalPrice)+'원'+'</td>';
			str += '<td rowspan="3"><label>주문상태</label><br><br><br>'+myPerchase.orderStat+'</td></tr>';
			str += '<tr><td><label>상품명:&nbsp;</label>'+myPerchase.itemName+'</td></tr>';
			str += '<tr><td><label>상점명:&nbsp;</label>'+myPerchase.shopName+'</td></tr>';
		}
		myPerchaseTable.html(str);
	}
	
	
	function formatDate(date) { 
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(), hour = '' + d.getHours(), minute = '' + d.getMinutes(), second = '' + d.getSeconds(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		if (hour.length < 2) hour = '0' + hour; 
		if (minute.length < 2) minute = '0' + minute; 
		if (second.length < 2) second = '0' + second; 
		return [year, month, day].join('/') + " " + [hour, minute, second].join(':'); }
	
    function addCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    
	
});


    function goToItemPage(itemCode) {
    	location.href = "/product/item?itemCode=" + itemCode;
    }
    
</script>

   
</body>


</html>
