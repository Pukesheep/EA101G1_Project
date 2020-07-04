<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auct.model.*"%>

<%
  AuctVO auctVO = (AuctVO) request.getAttribute("auctVO");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BID競標專區</title>
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
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/Auct_index.css">
    <link rel="stylesheet" href="../css/insert_auct.css">

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
</head>

<body>

    <!-- 賣家商品管理頁面 -->
    <section class="banner pt-5 mb-3 text-center">
        <div>
            <h2>我的拍賣區 --- 商品管理</h2>
            <a href="Auct_index.jsp">
            	<button type="submit" class="back-btn mb-4">新增商品</button>
            </a>
            
            <a href="Auct_index.jsp">
            <button type="submit" class="back-btn mb-4">回競標專區</button>
            </a>
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
	
    <!-- 賣家商品管理頁面 end-->
    <section class="section-2 container mb-5">
        <form>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">賣家ID:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">商品類別:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">商品名稱:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">競標開始時間:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">市價:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">起拍價:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                    
                    <label for="inputEmail4">出價增額:</label>
                    <input type="email" class="form-control mb-2" id="inputEmail4">
                </div>

                <div class="form-group col-md-1"></div>

                <div class="form-group col-md-5">
                    <label for="inputAuct_desc">商品描述:</label>
                    <textarea class="inputAuct_desc form-control mb-2" id="inputAuct_desc" rows="4"
                        cols="10"></textarea>
                        
                    <label for="inputAuct_pic">商品圖片:</label>
                    <input type="password" class="inputAuct_pic form-control mb-2" id="inputAuct_pic">

                    <br>
                    <button type="submit" class=" add-btn btn btn-info">新增商品</button>
                    
                </div>
            </div>
        </form>
    </section>

    <section class="blank-3"></section>
</body>

</html>