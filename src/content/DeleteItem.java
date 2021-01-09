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

public class DeleteItem extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		
		ServletContext con=getServletContext();
		Connection cn=null;
		PreparedStatement pst=null;
		try {
			Class.forName(con.getInitParameter("driver"));
			
			cn=DriverManager.getConnection(con.getInitParameter("url"),con.getInitParameter("user"),con.getInitParameter("pass"));
			pst=cn.prepareStatement("delete from stdpj.itemslist where slnum=?");
			
			pst.setInt(1, Integer.parseInt(id));
			
			pst.executeUpdate();
			
			resp.sendRedirect("main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}
}
