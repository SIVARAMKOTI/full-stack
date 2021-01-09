package content;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateItem extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String item=req.getParameter("item");
		String des=req.getParameter("des");
		String category=req.getParameter("cat");
		String price=req.getParameter("price");
		String avai=req.getParameter("avai");
		
		ServletContext con=getServletContext();
		Connection cn=null;
		PreparedStatement pst=null;
		try {
			Class.forName(con.getInitParameter("driver"));
			
			cn=DriverManager.getConnection(con.getInitParameter("url"),con.getInitParameter("user"),con.getInitParameter("pass"));
			pst=cn.prepareStatement("update stdpj.itemslist set items=?,description=?,category=?,price=?,availableqty=? where slnum=?");
			pst.setString(1, item);
			pst.setString(2, des);
			pst.setString(3, category);
			pst.setDouble(4, Double.parseDouble(price));
			pst.setInt(5, Integer.parseInt(avai));
			pst.setInt(6, Integer.parseInt(id));
			
			pst.executeUpdate();
			
			resp.sendRedirect("main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
