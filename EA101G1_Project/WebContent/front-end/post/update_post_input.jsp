<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.post.model.*" %>

<%
	PostVO postVO = (PostVO) request.getAttribute("postVO");
	// PostServlet.java (Controller) 存入 req 的 postVO 物件 (包括幫忙取出的 postVO, 也包括輸入資料錯誤時的 postVO 物件)
%>
<jsp:useBean id="ptypeSvc" scope="page" class="com.ptype.model.PtypeService" />

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<title>文章資料修改 - update_post_input.jsp</title>

<script src="<%=request.getContextPath()%>/files/ckeditor/ckeditor.js"></script>

<style>
	table#table-1 {
		width: 100%;
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	table#table-1 h4 {
		color: red;
		display: block;
		matgin-bottom: 1px;
	}
	h4 {
		color: blue;
		display: inline;
	}
	table {
		width: 100%;
		background-color: white;
		margin-top: 1px;
		margin-bottom: 1px;
		text-align: center;
	}
	table, th, td {
		border: 0px solid #CCCCFF;
	}
	th, td {
		padding: 1px;
	}
	body {
		background-color: white;
	}
	#back {
		width: 100px;
		height: 32px;
	}
	font {
		color: red;
	}
	li {
		color: red;
	}
	#tomcat {
		width: 100px;
		height: 100px;
	}
	#display {
		width: 200px;
		height: 200px;
	}
	textarea {
		width: 500px;
	}
	td {
		text-align: left;
	}
</style>

</head>
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>文章資料修改 - update_post_input.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/front-end/post/select_page.jsp"><img alt="" src="<%=request.getContextPath()%>/images/back1.gif">回首頁</a></h4>
		</td>
	</tr>
</table>

<h3>資料修改</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font>請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form action="<%=request.getContextPath()%>/post/post.do" method="post" enctype="multipart/form-data">

	<table>
		<tr>
			<td>文章編號：<font><b>*</b></font></td>
			<td><%=postVO.getPost_id()%></td>
		</tr>
		<tr>
			<td>會員編號：<font><b>*</b></font></td>
			<td><%=postVO.getMem_id()%></td>
		</tr>
		<tr>
			<td>文章類型編號：</td>
			<td>
				<select name="ptype_id">
					<c:forEach var="ptypeVO" items="${ptypeSvc.all}">
						<option value="${ptypeVO.ptype_id}" ${postVO.ptype_id eq ptypeVO.ptype_id ? "selected" : "" }>${ptypeVO.type}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>文章狀態：</td>
			<td>
				<select name="p_status">
					<option value="0" ${postVO.p_status eq 0 ? "selected" : "" }>隱藏</option>
					<option value="1" ${postVO.p_status ne 0 ? "selected" : "" }>顯示</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>文章標題：</td>
			<td>
				<input type="text" name="p_title" size="45" value="<%=(postVO == null) ? "請輸入文章標題" : postVO.getP_title()%>">
			</td>
		</tr>
		<tr>
			<td>文章內容：</td>
			<td>
				<textarea name="text" id="editor1"><%= (postVO == null) ? "請輸入文章內容" : postVO.getText()%></textarea>
			</td>
			<script>
				CKEDITOR.replace('editor1', {
					width: '50%',
					language: 'zh'
				})
			</script>
		</tr>
		<tr>
			<td>附加圖片：</td>
			<td>
				<label for="upload">
					<img alt="" src="<%=request.getContextPath()%>/post/ShowPostPic.do?post_id=<%=postVO.getPost_id()%>" id="display">
				</label>
				<input type="file" name="image" id="upload">
			</td>
		</tr>
		<tr>
			<td>最後修改時間：</td>
			<td>
				<input type="text" name="last_edit" size="45" id="f_date1">
			</td>
		</tr>
		<tr>
			<td>發文時間：</td>
			<td>
				<input type="text" name="post_time" size="45" id="f_date2">
			</td>
		</tr>
		
	</table>
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="post_id" value="<%=postVO.getPost_id()%>">
	<input type="hidden" name="mem_id" value="<%=postVO.getMem_id()%>">
	<input type="submit" value="送出修改">
</form>


</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=postVO.getLast_edit()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        $('#f_date2').datetimepicker({
            theme: '',              //theme: 'dark',
  	       timepicker:true,       //timepicker:true,
  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
  	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
  		   value: '<%=postVO.getPost_time()%>', // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
        function init() {
        var display = document.getElementById("display");
        var upload = document.getElementById("upload");

        upload.addEventListener("change", function(e){
            var files = upload.files;
            if (files && files[0]) {
                for (i = 0; i < files.length; i ++) {
                    if (files[i].type.indexOf("image") < 0) {
                        alert("上傳的格式不符");
                        upload.value = null;
                    } else {
                        var file = files[i];
                        var reader = new FileReader();

                        reader.onload = function(e) {
                            var result = e.target.result;

                            display.setAttribute("src", result);

                        }
                        reader.readAsDataURL(file);
                    }
                }
            }
        });
    }
    window.onload = init;
        
</script>
</html>