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
					out.println("<tr>"+
					"<td>" + rs.getString(2) + "</td> " +
					"<td>" + rs.getString(3)+" </td>" 
					+ "<td>"+ rs.getString(4) +"</td>" 
					+ "<td>"+ rs.getDouble(5) +" </td>" 
					+ "<td>" + rs.getInt(6) + " </td>"
					+ "<td><a href='del?id="+rs.getInt(1)+"'><button>Delete Item</button></a></td>" + "</tr>");
				}
				%>

			</table>
		</div>
	</div>
</body>
</html>