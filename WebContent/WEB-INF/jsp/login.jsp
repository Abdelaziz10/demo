<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
		
		<h1>Login Here</h1>
		<hr>
		<center>
					<label style="color: red;">${error_msg}</label>
					<form:form action="${pageContext.request.contextPath}/login" commandName="user" method="post">
						<table>
								<tr>
									<td><label>Enter Username : </label></td>
									<td><form:input type="text" path="username" name="username"/>
									<br>
										<form:errors path="username" style="color:red;"></form:errors>

									</td>
								</tr>
								<tr>
									<td><label>Enter Password : </label></td>
									<td><form:input path="password" type="password" name="password"/>
									<br>
										<form:errors path="password" style="color:red;"></form:errors>
									</td>
									
								</tr>
								<tr>
									<td>&nbsp</td>
									<td align="center"><input type="submit" value="Login"/></td>
								</tr>
						</table>
					</form:form>
		</center>
		
</body>
</html>