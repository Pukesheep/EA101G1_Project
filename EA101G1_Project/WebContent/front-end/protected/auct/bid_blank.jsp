<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="">
	<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
</head>
<body onload="connect();" onunload="disconnect();">
	<h3>Max : </h3><p id="score">100</p>
	<input type="text" name="userName" id="userName">
	<input type="submit" id="button"  value="加價" onclick="sendMessage();"/> 
	<textarea id="messagesArea"></textarea>
</body>
<script type="text/javascript">
	var plus=200;		//先寫死的加價
	var pro="FF16";
	var MyPoint = "/TogetherWS/james";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var score=document.getElementById("score");
	var webSocket;
	
	function connect(){
		webSocket=new WebSocket(endPointURL);
		webSocket.onopen=function(event){
			
		}
		webSocket.onmessage=function(event){
			var messagesArea=document.getElementById("messagesArea");
// 			console.log(event.data);
			var jsonObj = JSON.parse(event.data);
// 			console.log(jsonObj.userName);
// 			console.log(jsonObj.score);
			var message = jsonObj.userName + ": " + jsonObj.score + "\r\n";
			score.innerHTML=jsonObj.score;
			$('#score').text(jsonObj.score);
			messagesArea.value = messagesArea.value + message;
			messagesArea.scrollTop = messagesArea.scrollHeight;
		};
		
	}
	
	var inputUserName = document.getElementById("userName");
	

	function sendMessage(){
		
		var userName = inputUserName.value.trim();
		var nowscore = parseInt($('#score').text());
		score=parseInt(nowscore)+plus;
		console.log(score);
		$('#score').text(nowscore + plus);
		var now = new Date();
		var jsonObj={
			"userName" : userName,
			"score" : score,
			"product": pro
		};
		
		webSocket.send(JSON.stringify(jsonObj));//傳出出價人+刷新最高價

	}
	function disconnect() {
		webSocket.close();
	}

</script>
</html>