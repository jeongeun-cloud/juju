<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
   
  <style>
        li{
            /* 앞에 점 없앰 */
            list-style: none;
            color: black;
        }   
     
        .whole_menu .dropdown a,
        .whole_menu .dropdown-menu  a {
        /*전체 카테고리 안에 중분류 글씨 */
       color:black;
        font-weight: 500;
        }
        .whole_menu .whole_menu-content.withdesc a:after {
        /* 전체 메뉴 안에 디테일한 설명들  */
        color: #CFCFCF;
        content: attr(data-description);
        display: block;
        font-size: 11px;
        line-height: 0;
        margin: 10px 0 15px;
        text-transform: uppercase;
        font-weight: 700;
        
    
    }
  
    .whole_menu .nav
    .whole_menu .collapse,
    .whole_menu .dropup,
    .whole_menu .dropdown {
    /*  전체카테고리 화면 꽉채우기 하기  */
        position: static;
    
    }
    .whole_menu .dropdown-menu {
       left: auto;
    }
    .whole_menu .whole_menu-content {
        /* 전체카테고리 dropdown한 내용 */

        padding: 25px 25px;
        background:#fafafa ;
    }

    .whole_menu .dropdown.whole_menu_category .dropdown-menu {
    /* 전체보기 full screen */
        left: 0;
        right: 0;
    }
    .whole_menu .title  {
        /* 대분류 */
        font-size:16px;
        margin-top:15px;
        text-transform:uppercase;
        border-bottom:1px solid black;
        padding-bottom:5px;
    }
    .whole_menu .title a{
        font-weight: 600;
        color: #637365;
    }
    .whole_menu ul {
        /* 중분류 */
        list-style:none;
        padding-left:0px;
        text-decoration: none;
        
    }

    #defaultmenu {
      
        min-width: 1080px;
        
    }
    #defaultmenu > ul{

    display: table;
    float: left;
    margin-left: 25%;
    /* width: 1300px; */
    }
    .dropdown_each_menu{
        display: table-cell;
        position: absolute;
        height: 60px;
        padding: 0 70px 0 70px;
        
  
    }

    .whole_menu{
        position:sticky;
        top:0;
        z-index: 99;
        width: 100%;
        min-width: 1080px;
        height: 60px;
        border-top: 0;
        border-bottom: 1px solid #CFCFCF;
        text-align: center;
        margin-bottom:0;
      
      
    }
    .navbar-default .navbar-nav>li>a{
        color:#2A2A2A;
        font-weight:600;
        font-size: 20px;
        padding-top:18px;
        padding-bottom: 20px;
        
       
    }
    .navbar-default .navbar-nav>li>a:hover{
        color:#8fa691;
        
    }
    .navbar-default .navbar-brand{
        color: black;
        font-weight: bold;
       
    }
	.menu_b{
  	width:870px; 
	margin: 0 auto;
	}
    .navbar-default .navbar-nav > .open > a,
    .navbar-default .navbar-nav > .open > a:hover ,
    .navbar-default .navbar-nav > .open > a:focus{
        background-color: white;
        color:#8fa691 ;
    }
   a:hover{
       text-decoration: none;
   }

	#menuToggleImg {
	
		margin : 0 12px 6px;
		width: 20px;
	
	}
	
	.nav navbar-nav {
	
		
	}
	
	.dropdown-toggle {
	
	color: red;
	}


    
    </style>

</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--   <script src="js/bootstrap.min.js"></script> -->
   
    <nav class="navbar navbar-default whole_menu" role="navigation" style="background-color: white;">
      

        <div id="defaultmenu">
	         <div class=menu_b >
	            <ul class="nav navbar-nav" style="width: 1300px; margin-left: -190px;"> 
	        
	                <!-- 전체 카테고리  -->
	                <li class="dropdown whole_menu_category"  style="padding-left: 70px; padding-right: 70px;"><a href="#" data-toggle="dropdown" class="dropdown-toggle"><img id="menuToggleImg" src="/resources/images/menuToggle.png"/>전체 카테고리</a>
	                    <ul class="dropdown-menu fullwidth">
	                        <!-- 대분류 /중분류-->
	                        <li class="whole_menu-content withdesc">
	                            <div class="row_m" style="display: flex;">
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Sea"><span class="i"><img src="/resources/images/ff_i.png">수산물</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="고등어 /갈치 /삼치 /꽁치 /명태" href="/product/list?classCode=SeaS01">생선류</a></li>
	                                        <li><a data-description="꽃게 /돌게 " href="/product/list?classCode=SeaS02">갑각류</a></li>
	                                        <li><a data-description="김 /파래 /다시마 /미역 /톳 " href="/product/list?classCode=SeaS03">해조류</a></li>
	                                        <li><a data-description="마른오징어 /진미채 /쥐포 /멸치 " href="/product/list?classCode=SeaS04">건어물</a></li>
	                                        <li><a data-description="모듬조개 /가리비 /바지락 /키조개 " href="/product/list?classCode=SeaS05">조개류</a></li>
	                                        <li><a href="#">수산가공품</a></li>
	                                    </ul>
	                                </div>
	                                
	    
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Meat"><span class="i"><img src="/resources/images/mm_i.png">축산/정육</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="사태 /호주산스테이크 /양지수육 /등심" href="/product/list?classCode=MeatM01">소고기</a></li>
	                                        <li><a data-description="돼지갈비 /삼겹살 /이베리코 /수육보쌈 " href="/product/list?classCode=MeatM02">돼지고기</a></li>
	                                        <li><a data-description="생닭가슴살 /냉동닭 /순살"" href="/product/list?classCode=MeatM03">닭고기</a></li>
	                                        <li><a data-description="오리 /염소" href="/product/list?classCode=MeatM04">기타정육</a></li>
	                                        <li><a data-description="육포 /바베큐폭립 /불고기 /곱창" href="/product/list?classCode=MeatM05">가공육</a></li>
	                                    </ul>
	                                </div>
	    
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Veggie"><span class="i"><img src="/resources/images/vv_i.png">채소</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="냉이 /달래 /미나리 /봄동" href="/product/list?classCode=VeggieV01">각종나물</a></li>
	                                        <li><a data-description="무 /당근 /콜라비 /생강" href="/product/list?classCode=VeggieV02">뿌리채소</a></li>
	                                        <li><a data-description="토마토 /파프리카 /고추 /호박 /오이" href="/product/list?classCode=VeggieV03">열매채소</a></li>
	                                        <li><a data-description="상추 /케일 /청경채 /치커리" href="/product/list?classCode=VeggieV04">잎채소</a></li>
	                                    </ul>
	                                </div>
	    
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Fruit"><span class="i"><img src="/resources/images/rr_i.png">과일</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="사과 /참외 /수박" href="/product/list?classCode=FruitF01">국내산과일</a></li>
	                                        <li><a data-description="망고 /패션후르츠 /체리 " href="/product/list?classCode=FruitF02">수입산과일</a></li>
	                                        <li><a data-description="블루베리 /딸기 /망고 /바나나" href="/product/list?classCode=FruitF03">냉동과일</a></li>
	                                        <li><a data-description="바나나 /망고" href="/product/list?classCode=FruitF04">건과일</a></li>
	                                    </ul>
	                                </div>
	    
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Retort"><span class="i"><img src="/resources/images/pp_i.png">간편식</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="오징어젓 /명란 /어리굴젓" href="/product/list?classCode=RetortR01">젓갈류</a></li>
	                                        <li><a data-description="된장 /쌈장 /고추장 /만능양념" href="/product/list?classCode=RetortR02">양념류</a></li>
	                                        <li><a data-description="어묵조림 /장조림 /멸치볶음" href="/product/list?classCode=RetortR03">반찬류</a></li>
	                                        <li><a data-description="과일칩 /요거트 /시리얼" href="/product/list?classCode=RetortR04">간식류</a></li>
	                                        <li><a data-description="칡 /홍삼 /한약재" href="/product/list?classCode=RetortR05">건강식품</a></li>
	                                        <li><a data-description="즉석밥 /냉동식품 " href="/product/list?classCode=RetortR06">혼밥족 반찬</a></li>
	                                        <li><a data-description="아몬드 /호두 /땅콩 /캐슈넛" href="/product/list?classCode=RetortR07">견과류</a></li>
	                                    </ul>
	                                </div>
	    
	                                <div class="col-sm-3">
	                                    <h3 class="title"><a href="/product/list?classCode=Grain"><span class="i"><img src="/resources/images/gg_i.png">곡류</span></a></h3>
	                                    <ul>
	                                        <li><a data-description="보리 /흑미 /현미" href="/product/list?classCode=GrainG01">쌀</a></li>
	                                        <li><a data-description="" href="/product/list?classCode=GrainG02">잡곡류</a></li>
	                                        <li><a data-description="" href="/product/list?classCode=GrainG03">건식</a></li>
	                                    </ul>
	                                </div>  
	                         
	                           
	                            </div>
	                             <!--end row  -->
	                        </li>
	                    </ul>
	                </li>
	                <!-- end dropdown whole_menu 전체 카테고리-->

					<li style="font-size: 20px; line-height: 60px; color: #CFCFCF;">|</li>
	    
	                <!-- 나머지 각 meunu bar -->
	              
	                <li class="dropdown_each_menu" ><a href="/seasonal" data-toggle="dropdown" class="dropdown-toggle">딱 요게 제철</a>
	                </li>
					<li style="font-size: 20px; line-height: 60px; color: #CFCFCF;">|</li>
	                <li class="dropdown_each_menu"><a href="/bob" data-toggle="dropdown" class="dropdown-toggle">베스트 오브 베스트</a>
	                </li>
					<li style="font-size: 20px; line-height: 60px; color: #CFCFCF;">|</li>
	                <li class="dropdown_each_menu"><a href="/event" data-toggle="dropdown" class="dropdown-toggle">이벤트 </a>    
	                </li>
	                
	                <!-- end 나머지 각 menu bar -->
	            </ul><!-- end nav navbar-nav -->
          	
            </div>
            <!--menu_b  -->
        </div>
     </nav>


           
           
              

<script>
        $(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');       
        }
    );
});


</script>
