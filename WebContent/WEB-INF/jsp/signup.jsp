<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Here</title>
<script type="text/javascript">

function dovalidations()
{
		var username = document.getElementById("username").value;
		if(parseInt(username.length) < 4)
		{
			alert('Username msut be at least 4 characters long');
			return false;
		}
		
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		
		if(parseInt(password.length) < 6)
		{
			alert('Password must be at least 6 characters long.');
			return false;
		}
		
		if(password != repassword)
		{
			alert('Password and re-password are not same.');
			return false;
		}
		
		return true;
		
}

</script>



</head>
<body>	
		<div>
		
			<label>${message}</label>	
			<form action="${pageContext.request.contextPath}/signup" method="post" enctype="multipart/form-data" onsubmit="return dovalidations()">
				
				<table>
						<tr>
							<td><label>Enter Username : </label></td>
							<td><input id="username" type="text" name="username"/></td>
						</tr>
						<tr>
							<td><label>Enter Password : </label></td>
							<td><input id="password" type="password" name="password"/></td>
						</tr>
						<tr>
							<td><label>Re-Enter Password : </label></td>
							<td><input id="repassword" type="password" name="repassword"/></td>
						</tr>

						<tr>
							<td><label>Choose Gender : </label></td>
							<td><input type="radio" name="gender" value="Male">Male</input><br>
							<input type="radio" name="gender" value="Female">Female</input></td>
						</tr>
						<tr>
							<td><label>Select Vehicle : </label></td>
							<td>Car: <input type="checkbox" name="vehicle" value="Car"/> Bike: <input type="checkbox" name="vehicle" value="Bike"/></td>
						</tr>
						<tr>
							<td><label>Select Country : </label></td>
							<td>
								<select name="country">
														<option value="india">INDIA</option>
														<option value="usa" selected="selected">USA</option>
														<option value="uk">UK</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><label>Select Image : </label></td>
							<td><input type="file" name="image"/></td>
						</tr>
						<tr>
							<td>&nbsp</td>
							<td><input type="submit" value="Sign Up"/></td>
						</tr>
				</table>			
			</form>
		</div>
</body>
</html>