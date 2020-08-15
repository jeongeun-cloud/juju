<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
   <!--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script> -->
<!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> -->
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
	<link rel="stylesheet"  href="../resources/css/admin.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
    <title>product register list</title>
    <style>
	    .mainContent{
	    margin-top:50px;
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
        #excelDown{
            float:right;
            margin-right: 30px;
        }
        #pro_regiBtn{
            float:right;
            margin-right: 30px;
        }
        .rbtn #excelDown ,
        #pro_regiBtn,
        #regBtn{
            background-color: #8FA691; 
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
            font-weight: 900;
        }
        .rbtn #excelDown:hover,
        #pro_regiBtn:hover,
        #regBtn:hover
         {
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
        }
        .rbtn #excelDown,
        #pro_regiBtn,
        #regBtn
         {
        background-color: #8FA691;
        color: white;
        
        
        }
        .rbtn #excelDown:focus,
        #pro_regiBtn:focus,
        #regBtn:focus { 
            outline: none; 
        }
        .regi_la{
            font-size: 17px;                      
        }
        table {
    	  border-collapse: collapse;
        width: 90%;
        margin-left: 100px;
       }
        .regi_list-btn{
            margin-bottom: 80px;
        }
        
        <!--배치-->
        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #8FA691;
            color: white;            
            height: 40px;
            text-align:center;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        .check {
            height: 30px;
            left: 30%;
        }
        
        .text {
            width: 50%;
            height: 25px;
        }
        
        .serch {
            margin-left: 100px;
            margin-bottom: 10px;
        }
        
        .sb {
            height: 35px;
        }
        .select_state{
            margin-left:130px;
            margin-bottom:30px;
            
        }
        .page_num1 {
        display: inline-block;
        padding-left:70%;
        }
        
        .page_num1 a{
         color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
   
        }
        .pagination1 a:hover:not(.active) {
          background-color: #8FA691;
          border-radius: 50%;}
        
        .regi_table{
        margin-bottom: 20px;
        }
        .default_btn{
        background-color: #8FA691;
        border: solid #8FA691;
        border-radius:10px;
        color:white;
        margin-left: 10px;
        }
        .mainContent .title {
        margin-left: 100px;
        }
        .mainContent h3{
        font-weight:500;
        font-size:24px;
        margin-bottom:10px;
        }
        .mainContent p{
            color: #b9b9b9;
            margin-top:0;
            
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
      
      #closeBtn:hover {
        background-color: white; 
        color: #8FA691; 
        border: 2px solid #8FA691;
      
      }
      
      #closeBtn:focus {
          outline: none; 
      
      }
      /* 모달 디자인 끝 */
        
         </style>
</head>
<%@include file="./idCheck.jsp" %>
<body>
 <div class="container">
 <%@include file="./shopSideBar.jsp" %>


            <div class="mainArea">
            <!-- BEGIN NAV -->
                <nav class="navTop row">
                    <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                    <div class="account fr">
                        <div class="name has-submenu"><c:out value="${sessionMember.idNo}"/><span class="fa fa-angle-down"></span></div>
                        <ul class="accountLinks submenu">
                            <li><a href="/">View website</a></li>
                            <li><a href="/member/logout">Log out<span class="fa fa-sign-out fr"></span></a></li>
                        </ul>
                    </div>
                </nav>
                <!-- END NAV -->
            <div class="mainContent">
                <div class="title">
                 <h3>상품 리스트</h3>
                <p><i class="fa fa-lightbulb-o"></i>총 등록 상품 : <c:out value="${pageMaker.total }" /></p>
                </div>
                <div class="regi_list-btn" >
                    <div class="rbtn" >
                        <form name="excelForm" id="excelForm" method="POST" action="/shop/excelDown">
                            <span class="glyphicon glyphicon-floppy-save" aria-hidden="true"></span>
                            <input type="submit" id="excelDown" value="엑셀 다운"/>
                        </form>
                    </div>    
                    <div class="rbtn" >
                        <button id="pro_regiBtn" type="button" >상품 등록</button> 
                    </div>  
                    
                </div>

                <div class="search_bar">
                    <form id="searchForm" action="/shop/list" method="get">
                        <div class="serch">
                            <label class="regi_la">상품명</label>
                            <select name='type' style="height:32px">
                                <option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }" /> >--</option>
                                <option value="N" <c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
                                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>상품설명</option>
                                <option value="NC" <c:out value="${pageMaker.cri.type eq 'NC'? 'selected':'' }" />>상품명 or 상품설명</option>
                            </select>
                            
                            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
                            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                            <button class="default_btn">검색</button>
                        </div>
                    </form>
                </div>
                <!-- regi_list-btn -->
                <div class="regi_table">
                        <table tit aria-setsize="500px">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="chkAll" id="chkAll"></th>
                                    <th>번호</th>
                                    <th>상품명</th>
                                    <th>판매 가격</th>
                                    <th>정상 가격</th>
                                    <th>진열상태</th>
                                    <th>판매상태</th>
                                    <th>등록일</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            
                            <c:forEach items="${list }" var="item">
                                <tr>
                                    <td><input type="checkbox" name="chk" value='<c:out value="${item.itemCode }" />'></td>
                                    <td><c:out value="${item.itemCode }" /></td>
                                    <td>
                                        <a class='move' href='<c:out value="${item.itemCode }" />'>
                                            <c:out value="${item.itemName }" />
                                        </a>
                                    </td>
                                    <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price}" />원</td>
                                    <td style="text-align:right;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.normPrice}" />원</td>
                                    <td><c:out value="${item.dispStat }" /></td>
                                    <td><c:out value="${item.saleStat }" /></td>
                                    <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${item.regDate }" /></td>
                                    <td>
                                        <button class="default_btn"
                                        onclick="location.href='/shop/modify?itemCode=<c:out value="${item.itemCode }"/>&pageNum=<c:out value="${pageMaker.cri.pageNum}"/>&amount=<c:out value="${pageMaker.cri.amount}"/>&keyword=<c:out value="${pageMaker.cri.keyword}"/>&type=<c:out value="${pageMaker.cri.type}"/>'">
                                                  수정
                                        </button> 
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
					</div>
                        <div class='page_num1'>
                            <ul class="pagination1">
                                <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button previous">
                                        <a href="${pageMaker.startPage -1}">&laquo;</a>
                                    </li>
                                </c:if>
        
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class='paginate_button ${pageMaker.cri.pageNum == num ? " active" : "" } '>
                                        <a href="${num}">${num}</a>
                                    </li>
                                </c:forEach>
        
                                <c:if test="${pageMaker.next}">
                                    <li class="paginate_button next">
                                        <a href="${pageMaker.endPage +1 }">&raquo;</a>
                                    </li>
                                </c:if>
                            </ul> 
                        </div>
                        <!-- end pagination -->
                        
                    <form id='actionForm' action="/shop/list" method='get'>
                    <input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
                    <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' >
                    <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>' >
                </form> 
		
                  <!-- 모달 추가 -->
<!--                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                            </div>
                            <div class="modal-body">처리가 완료되었습니다.</div>
                            <div class="modal-footer">
                                <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>  -->
                <!-- 모달 끝 -->

                </div>  
                    <div class="select_state">
                        <button type="button" id="regBtn" value="remove" onclick="statAction(this.value);">삭제</button>
                        <button type="button" id="regBtn" value="dis" onclick="statAction(this.value)">진열</button>
                        <button type="button" id="regBtn" value="sale" onclick="statAction(this.value)">판매</button>
                        <button type="button" id="regBtn" value="sold" onclick="statAction(this.value)">품절</button>   
                    </div>    
            </div>
            
        </div>
       

    <script src="../resources/js/admin.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
    	  
    	  /*알람서비스 */
    	  /* var ref = this.open('http://jujumarket-23.web.app/');
          this.addEventListener('message', function (e) {
              if (e.data.permission === "granted") { ref.close(); }
              console.log(e.data.token);
          });  */
          /*알람서비스 */
          
         // 모달 관련 js
         var result = '<c:out value="${result}"/>';
         
         checkModal(result);
         console.log(result);
         
         history.replaceState({}, null, null);
         
         function checkModal(result) {
            if(result === '' || history.state) {
               return;
            }
            
            if(result.length > 0) {
               if(result != 'success') {
                  $(".modal-body").html("상품 " + result + " 번이 등록되었습니다.");
               }
            }
            
            $("#myModal").modal("show");
         } 
         
         
         // 전체 선택
         $("#chkAll").click(function(){
              //클릭되었으면
              if($("#chkAll").prop("checked")){
                  //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                  $("input[name=chk]").prop("checked",true);
                  //클릭이 안되있으면
              }else{
                  //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                  $("input[name=chk]").prop("checked",false);
              }
          });
         
         // register로 이동
         $("#pro_regiBtn").on("click", function(){
            self.location="/shop/register";
         });
          
      });
      
      // 체크박스 일괄 처리
      function statAction(val) {
         
         var checkRow = "";
         $("input[name='chk']:checked").each (function (){
            checkRow = checkRow + $(this).val()+"," ;
         });
           checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
       
           if(checkRow == ''){
             alert("변경 혹은 삭제할 대상을 선택하세요.");
             return false;
           }
           //console.log("### checkRow => " + checkRow);
           
           var page = $("#pageNum").val();
           var amount = $("#amount").val();
           
         // 진열상태 변경 
           if(val == "dis") {
              location.href="/shop/disModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
         // 판매상태 변경 
           }else if(val == "sale") {
              location.href="/shop/saleModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
         // 품절로 변경 
           }else if(val == "sold") {
              location.href="/shop/soldModify?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
         // 삭제
           }else if(val == "remove") {
              location.href="/shop/remove?itemCode="+checkRow+"&pageNum="+page+"&amount"+amount;
           }
      }
      
      // 페이지 이동 
      var actionForm = $("#actionForm");
      $(".paginate_button a").on("click", function(e) {
         e.preventDefault();
         
         actionForm.find("input[name='pageNum']").val($(this).attr("href"));
         actionForm.submit();
      });
      
      // get
       $(".move").on("click", function(e) {
         e.preventDefault();
         
         actionForm.append("<input type='hidden' name='itemCode' value='" + $(this).attr("href") + "'>");
         actionForm.attr("action", "/shop/get");
         actionForm.submit();
      });
      
      // search
      var searchForm = $("#searchForm");
         $("#searchForm button").on("click", function(e) {
           if(!searchForm.find("option:selected").val()) {
              alert("검색 종류를 선택하세요");
               return false;
            }
         
            if(!searchForm.find("input[name='keyword']").val()) {
               alert("키워드를 입력하세요");
               return false;
            }
         
            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            
            searchForm.submit();
         });
   </script>
</body>
</html>