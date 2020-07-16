<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>
<%@ page import="com.member.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO"); //AuctServlet.java (Controller) 存入req的auctVO物件 (包括幫忙取出的auctVO, 也包括輸入資料錯誤時的auctVO物件)
	
  MemberVO memVO = (MemberVO)session.getAttribute("memberVO");
  pageContext.setAttribute("memVO",memVO);
%>

<jsp:useBean id="MemberSvc" scope="page" class="com.member.model.MemberService" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>填寫收件資訊</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="images/ICON(yellow).ico">
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/Auct_index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/insert_auct.css">

    <link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />    
    <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
    
</head>
<body>
<!-- 買家付款--頁面banner -->
    <section class="banner pt-3 mb-3 text-center">
        <div class="row">
            <div class="LOGO col-md-2 pl-5 mt-2">
                <div>
<!--                     <a class="navbar-brand" href="../index.html"> -->
                        <span class="logo"><i class="fas fa-bomb"></i></span>
                        <span class="logo2">S.F.G</span>
                        <span class="logo3">{{{</span>
<!--                     </a> -->
                </div>
            </div>

            <div class="col-md-8 mt-3">
                <h2>填寫收件資訊</h2>
                
            </div>
        </div>
    </section>

    <section class="blank0"></section>
  
    <%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<!-- 買家付款--頁面 -->

	<section class="section-2 container mb-5">
        <form METHOD="post" ACTION="auct.do" name="form1" enctype = "multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-5">
                	<label for="">拍賣編號  : ${auctVO.auct_id}</label> <br>
                    
                    <label for="maxPrice">商品名稱 : ${auctVO.auct_name}</label> <br>
                     
                     <div>商品圖片 :   <br><br>
					<img src="<%=request.getContextPath()%>/front-end/auct/pic.do?auct_id=${auctVO.auct_id}" width="200px">
					</div> <br>
					
					 <label for="auct_name">贏家 :   ${MemberSvc.getOneMember(auctVO.buy_id).mem_name}</label> <br>
                    
                    <label for="maxPrice">得標金額 : NT <span style="font-size:20px;font-weight:bolder; color: #b52e31;">${auctVO.maxPrice}</span> 元</label> <br>
                
                </div>

                <div class="form-group col-md-1"></div>

                <div class="form-group col-md-6">
                	<h2 >收件資訊</h2> <br><br>
                	
                	<label for="rcpt_name">收件人 : </label>
                    <input type="text" class="form-control mb-2" name="rcpt_name" id="rcpt_name" value=" ${MemberSvc.getOneMember(auctVO.buy_id).mem_name}"  required>
                    
                    <label for="rcpt_cel">聯絡電話 : </label>
                    <input type="text" class="form-control mb-2" name="rcpt_cel" id="rcpt_cel"  value=" ${MemberSvc.getOneMember(auctVO.buy_id).mem_phone}"  required>
                    
                    <label for="rcpt_add">收件地址 : </label>
                    <input type="text" class="form-control mb-2" name="rcpt_add" id="rcpt_add"  value=" ${MemberSvc.getOneMember(auctVO.buy_id).mem_addr}"  required>
                	
                	<br>
                    <input type="hidden" name="action" value="update_rcpt">
					<input type="hidden" name="auct_id" value="<%=auctVO.getAuct_id()%>">
                    <button type="submit" class="add-btn btn btn-success">確認</button>
                
                </div>
					
 			</div>	<!--row -->
		</form>	
		
	</section>
</body>

</html>