<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getList</title>
</head>
<body>

<c:forEach items="${list }" var="DTO">
<h1>num: ${DTO.num }</h1>
<h1>name : ${DTO.name }</h1>
<h1>contents : ${DTO.contents }</h1>
<h1>regDate : ${DTO.regDate }</h1>
<br>
<h1>한글 테스트</h1>
</c:forEach>


</body>
</html>