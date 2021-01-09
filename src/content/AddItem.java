package content;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddItem extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext con=getServletContext();
		Connection cn=null;
		PreparedStatement pst=null;
		try {
			Class.forName(con.getInitParameter("driver"));
			
			cn=DriverManager.getConnection(con.getInitParameter("url"),con.getInitParameter("user"),con.getInitParameter("pass"));
			pst=cn.prepareStatement("insert into stdpj.itemslist(items,description,category,price,availableqty) values (?,?,?,?,?)");
			pst.setString(1, req.getParameter("itna"));
			pst.setString(2, req.getParameter("des"));
			pst.setString(3, req.getParameter("cat"));
			pst.setDouble(4, Double.parseDouble(req.getParameter("price")));
			pst.setInt(5, Integer.parseInt(req.getParameter("avinum")));
			
			pst.executeUpdate();
			
			resp.sendRedirect("main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
