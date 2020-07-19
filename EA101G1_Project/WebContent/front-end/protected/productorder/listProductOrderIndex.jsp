<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productOrder.model.*"%>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memVO = (MemberVO) session.getAttribute("memberVO");
    PoService poSvc = new PoService();
    List<PoVO> list = poSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<jsp:useBean id="polSvc" scope="page" class="com.productOrderList.model.PolService" />
<jsp:useBean id="ordSvc" scope="page" class="com.ordstat.model.OrdstatService" />
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProService" />
<html>
<head>
<title>會員訂單管理</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
    <!-- SweetAlert2 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: auto;
	margin-right: auto;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  td>img{
  width:200px;
  }
  
  font{
		font-family:Microsoft JhengHei;
		}
  hr.class-1 { 
            border-top: 5px solid #8c8b8b; 
            width:2000;
        } 
</style>


</head>
<body bgcolor='white'>
<!-- navbar -->
    <%@ include file="../../../files/header.jsp" %>
    <!-- navbar end -->
    <section class="blank0"></section>
    
    <!-- 內容 -->
    <section class="blank1">
    
    <div class="container">
    
 <div class="row"><font style="color:#E0E0E0;font-size:40px"><%=memVO.getMem_name()%></font ><font style="font-size:40px;color:black">的最愛</font><hr class="class-1" /> </div>
    
<nav>
<div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab" aria-controls="nav-all" aria-selected="true">全部</a>
    <a class="nav-item nav-link" name="003" id="nav-waiting-tab" data-toggle="tab" href="#nav-waiting" role="tab" aria-controls="nav-waiting" aria-selected="false">待出貨</a>
    <a class="nav-item nav-link" name="006" id="nav-arrival-tab" data-toggle="tab" href="#nav-arrival" role="tab" aria-controls="nav-arrival" aria-selected="false">已到貨</a>
    <a class="nav-item nav-link" name="014" id="nav-finsh-tab" data-toggle="tab" href="#nav-finsh" role="tab" aria-controls="nav-finsh" aria-selected="false">已完成</a>
    <a class="nav-item nav-link" name="007" id="nav-cancel-tab-tab" data-toggle="tab" href="#nav-cancel-tab" role="tab" aria-controls="nav-cancel-tab" aria-selected="false">已取消</a>
  </div>
</nav>



<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab"><jsp:include page="listAllProductOrder.jsp" /> </div>
  <div class="tab-pane fade" id="nav-waiting" role="tabpanel" aria-labelledby="nav-waiting-tab"><jsp:include page="listWaitingProductOrder.jsp" /></div>
  <div class="tab-pane fade" id="nav-arrival" role="tabpanel" aria-labelledby="nav-arrival-tab"><jsp:include page="listArrivalProductOrder.jsp" /></div>
  <div class="tab-pane fade" id="nav-finsh" role="tabpanel" aria-labelledby="nav-finsh-tab"><jsp:include page="listFinshProductOrder.jsp" /></div>
  <div class="tab-pane fade" id="nav-cancel-tab" role="tabpanel" aria-labelledby="nav-cancel-tab-tab"><jsp:include page="listCancelProductOrder.jsp" /></div>
</div>

    <!-- body 結束標籤之前，載入Bootstrap 的 JS 及其相依性安裝(jQuery、Popper) -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <script>
    //重導後回到先前頁籤
    $("<%= request.getAttribute("show")%>").tab('show')
    
//     重新整理停留當前頁籤
    $(document).ready(function() {
    if (location.hash) {
        $("a[href='" + location.hash + "']").tab("show");
    }
    $(document.body).on("click", "a[data-toggle='tab']", function(event) {
        location.hash = this.getAttribute("href");
    });
	});
	$(window).on("popstate", function() {
    var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
    $("a[href='" + anchor + "']").tab("show");
	});
    
	//切換頁籤
    $('#nav-tab a').on('click', function (e) {
    	  e.preventDefault()
    	  $(this).tab('show')
    	  console.log('ordstat_id');
    	})
    </script>
   </div> 
</section>
</body>
</html>