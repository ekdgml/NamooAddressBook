<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

var ctx = "${ctx}";

$(document).ready(function(){
	//
	$("#loadingIcon").hide();
	
	//ajax 전역 이벤트 처리(버튼이벤트를 하면 다시 ajax가 호출되므로 loadingIcon이 뜬다!)
	$(document).ajaxStart(function(){
		$("#loadingIcon").fadeIn(1000);
	}).ajaxStop(function(){
		$("#loadingIcon").fadeOut(2000);
	});
	
	
	//주소목록 조회
/*	$.ajax({
		url : ctx + "/list"
		,type : "get"
		,dataType : "json"
		,success : function (data) {
			//alert(JSON.stringify(data));
			appendTr(data);
		}
	}); */
	
	$.get(ctx + "/list", function(data){
		appendTr(data);
	});
	
function appendTr(addresses) {
	//
	var html = '';
	for (var i = 0, length = addresses.length; i < length; i++) {
		//
		var address = addresses[i];
		html += '<tr><td>'+address.name+'</td><td>'+address.phone+'</td><td>'+address.address+'</td></tr>';
	}
	$("#addressRow").append(html);
}

$("#registerAreaBtn").click(function(){
	//
	$("#registerArea").load(ctx + "/resources/template/registerForm.html", function(){
	
		//저장버튼 이벤트 추가
		$("#saveBtn").click(function(){
			//
			var address = {};
			address.name = $("input[name=name]").val();
			address.phone = $("input[name=phone]").val();
			address.address = $("input[name=address]").val();
			
			// address = {name : 'aaa', phone : 'bbb', address : 'ccc'}
			$.ajax({
				url : ctx + "/save"
				,type : "post"
				,data : address
				,dataType : "json"
				,success : function(data) {
					appendTr([data]); //배열이 아니므로 appendTr에서 addresses.length를 이용하기 위해 배열로!
				}
				,complete : function() {
					clearForm();
				}
			});
		});
			
		//saveBtn2
		$("#saveBtn2").click(function(){
			//
			var address = {};
			address.name = $("input[name=name]").val();
			address.phone = $("input[name=phone]").val();
			address.address = $("input[name=address]").val();
			
			// address = {name : 'aaa', phone : 'bbb', address : 'ccc'}
				$.ajax({
					url : ctx + "/save2"
					,type : "post"
					,contentType : "application/json"
					,data : JSON.stringify(address)
					,dataType : "json"
					,success : function(data) {
						appendTr([data]); //배열이 아니므로 appendTr에서 addresses.length를 이용하기 위해 배열로!
					}
				,complete : function() {
						clearForm();
					}
				});
			});
		
			function clearForm() {
				//
				$("input[type=text]").val("");
			}
		});
	});
});

</script>

</head>
<body>

<h1>주소록</h1>

<div id="loadingIcon">
	<img src="${ctx}/resources/images/ajax-loader.gif" />
</div>

<table border="1">
	<thead>
		<tr>
			<td>이름</td>
			<td>전화번호</td>
			<td>주소</td>
		</tr>
	</thead>
	<tbody id="addressRow">
	</tbody>
</table>
<hr/>

<div id="registerArea">
	<button id="registerAreaBtn">등록하기</button>
</div>

</body>
</html>