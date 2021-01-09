<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
}

#info div {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	border-radius: 8px;
	display: inline-block;
	margin-left: 20px;
	position: relative;
}

.side {
	display: inline-block;
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
		<div id="info" width="100%">
			<div>Total Categories</div>
			<div>Total items</div>
			<div>Top selling category</div>
			<div>Top selling items</div>
		</div>
		<div>
			<div class="side">Items table</div>
			<div class="side">
				<a href="type?op=add"><button>Add</button></a>
			</div>
			<div class="side">
				<a href="type?op=update"><button>Update</button></a>
			</div>
			<div class="side">
				<a href="type?op=delete"><button>Remove</button></a>
			</div>
		</div>
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
					out.println("<tr> <td>" + rs.getString(2) + " </td> " + "<td>" + rs.getString(3) + " </td>" + "<td>"
					+ rs.getString(4) + " </td>" + "<td>" + rs.getString(5) + " </td>" + "<td>" + rs.getString(6) + " </td>"
					+ "<td><a href='orderDetail.jsp?id="+rs.getInt(1)+"'> <button>PlaceOrder</button></a></td>" + "</tr>");
				}
				%>

			</table>
		</div>
		<div >
			<div class="side">Order table</div>
			
			<div>
			<table width="70%" style="margin-top:50px;">
				<tr>
					<th>Item</th>
					<th>Email</th>
					<th>Address</th>
					<th>Quantity</th>
					<th>Total amount</th>
					<th>status</th>
					<th>Update status</th>
				</tr>
				<%
				pst = cn.prepareStatement("select * from stdpj.order");

				rs = pst.executeQuery();
					while (rs.next()) {
					out.println("<tr> <td>" + rs.getString(1) + " </td> " + "<td>" + rs.getString(2) + " </td>" + "<td>"
					+ rs.getString(3) + " </td>" + "<td>" + rs.getString(4) + " </td>" + "<td>" + rs.getString(5) + " </td>"
							+ "<td>" + rs.getString(6) + " </td>"
									+ "<td>" + rs.getString(7) + " </td>"
					+ "</tr>");
				}
				%>

			</table>
			</div>
		</div>
	</div>
</body>
</html>