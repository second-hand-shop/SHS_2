<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>coupon</h1>

						
						<c:forEach items="${list}" var="dto" varStatus="status">
						
					
						<span>아이디 : ${dto.id} </span>
						<span>할인 금액 : ${dto.disPrice}</span>
						<input type="button" value="사용">
						
						
						</c:forEach>

</body>
</html>