<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<div>
		<form action="pur" method="post">
		<input type="hidden" name="id" value="<%=id%>">
			<div>
				<div>Email:</div>
				<div>
					<input type="email" name="em">
				</div>
			</div>
			<div>
				<div>Address:</div>
				<div>
					<textarea rows="5" cols="20" name="add"></textarea>
				</div>
			</div>
			<div>
			<div>How many Quantity:</div>
			<div> <input type="number" name="qty"> </div>
			</div>
			<div>
			<input type="submit" value="place the order">
			</div>
		</form>
	</div>
</body>
</html>