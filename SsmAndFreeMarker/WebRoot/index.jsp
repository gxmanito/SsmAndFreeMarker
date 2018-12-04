<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:forward page="login" />

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
  <script type="text/javascript">
  //方法1
  var myMap = new Map();
  // 添加键
  myMap.set("a", "和键'a string'关联的值");
  myMap.set("b", "和键keyObj关联的值");
  myMap.set("c", "和键keyFunc关联的值");
  /* console.log(myMap);
  console.log(myMap.size);
  // 读取值
  console.log(myMap.get("a"));
  myMap.forEach(function(value, key) {
	  console.log(key + " = " + value);
	}, myMap);
  myMap.forEach(function (item, key, mapObj) {
	   console.log('@#@@@@@@@@@@@@@'+item);
	   console.log('@#@@@@@@@@@@@@@'+key);
	   console.log('@#@@@@@@@@@@@@@'+mapObj);
	});  */ 
  
  
  
  
  
  
  //方法2
  /* var map = {};
  map['a'] = "aaaaaaa";
  map['b'] = "bbbbbbb";
  console.log(map);
  console.log(map.a);
  console.log(map['a']); */
  
  </script>
</html>
