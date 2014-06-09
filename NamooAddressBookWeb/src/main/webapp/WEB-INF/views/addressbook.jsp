<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/template/template.js"></script>
<script type="text/javascript">

var nsjs = nsjs || {};
nsjs.ctx = "${ctx}";

$(document).ready(function(){
	
	$("#loadingIcon").hide();
	
	// ajax 전역 이벤트 처리

	
	// 주소목록 조회
/* 	$.ajax({
		url : ctx + "/list"
		,type : "get"
		,dataType : "json"
		,success : function(data){
			//alert(JSON.stringify(data));
			appendTr(data);
		}
	}); */
	$("#more").hide();
	
	getAddresses();

	var drawAddress = function(data) {
		nsjs.makeHtml(nsjs.ctx + "/resources/template/addressTr.html", data, function(html){
			$("#addressRow").append(html);
		});
	};
	
	$("#registerAreaBtn").click(function(){
		//
		$("#registerArea").load(nsjs.ctx + "/resources/template/registerForm.html", function(){
			//
			// 저장버튼 이벤트 추가
			$("#saveBtn").click(function(){
				//
				var address = {};
				address.name = $("input[name=name]").val();
				address.phone = $("input[name=phone]").val();
				address.address = $("input[name=address]").val();

				// address = {name : 'aaa', phone : 'bbb', address : 'gggg'}
				$.ajax({
					url : nsjs.ctx + "/save"
					,type : "post"
					,data : address
					,dataType : "json"
					,success : function(data) {
						drawAddress(data);
					}
					,complete : function() {
						clearForm();
					}
				});
			});
			
			// 
			$("#saveBtn2").click(function(){
				//
				var address = {};
				address.name = $("input[name=name]").val();
				address.phone = $("input[name=phone]").val();
				address.address = $("input[name=address]").val();

				// address = {name : 'aaa', phone : 'bbb', address : 'gggg'}
				$.ajax({
					url : nsjs.ctx + "/save2"
					,type : "post"
					,contentType : "application/json"
					,data : JSON.stringify(address)
					,dataType : "json"
					,success : function(data) {
						drawAddress(data);
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
	
	function getAddresses() {
		//
		var currentPage = $("#currentPage").val();
		var countPerPage = $("#countPerPage").val();
		
		var url = nsjs.ctx + "/list?currentPage=" + currentPage + "&countPerPage=" + countPerPage;
		$.get(url, function(data) {
			
			drawAddress(data.results);
			if (data.nextPage) {
				$("#currentPage").val(data.currentPage + 1);
				$("#more").show();
			} else {
				$("#more").hide();
			}
		});
	}
	
	// 더보기 이벤트 처리
	$("#more").click(function(){
		getAddresses();
	});
	
	// 공개 API
	window.getAddresses = getAddresses;
});


</script>
</head>
<body>

<h1>주소록</h1>

<div id="loadingIcon">
	<img src="${ctx}/resources/images/ajax-loader.gif" />
</div>

<input type="hidden" id="currentPage" value="1" />
<input type="hidden" id="countPerPage" value="5" />

<table border = "1">

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
<button id="more">더보기</button>
<hr />

<div id="registerArea">
	<button id="registerAreaBtn">등록하기</button>
</div>


</body>
</html>