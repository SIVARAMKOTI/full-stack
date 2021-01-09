<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}



</style>
</head>
<body>
	<%
		Connection cn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	Class.forName(application.getInitParameter("driver"));
	cn = DriverManager.getConnection(application.getInitParameter("url"), application.getInitParameter("user"),
			application.getInitParameter("pass"));

	pst = cn.prepareStatement("select * from stdpj.itemslist");

	rs = pst.executeQuery();
	%>

	<div>
		<div>
			<table width="80%">
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Category</th>
					<th>Price</th>
					<th>Available Quantity</th>
					<th>PlaceOrder</th>
				</tr>
				<%
					while (rs.next()) {
					out.println("<tr><form action='upd' method='post'><input type='hidden' name='id' value='"+rs.getInt(1)
					+"'> <td><input type='text' name='item' value='" + rs.getString(2) + "'></td> " +
					"<td> <input type='text' name='des' value='" + rs.getString(3)+"'> </td>" 
					+ "<td> <input type='text' name='cat' value='"+ rs.getString(4) +"'> </td>" 
					+ "<td> <input type='number' name='price' value='"+ rs.getDouble(5) +"'> </td>" 
					+ "<td> <input type='number' name='avai' value='" + rs.getInt(6) + "'> </td>"
					+ "<td><input type='submit' value='update'></td>" + "</form></tr>");
				}
				%>

			</table>
		</div>
	</div>
</body>
</html>