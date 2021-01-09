package content;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderItem  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String em=req.getParameter("em");
		String add=req.getParameter("add");
		String qty=req.getParameter("qty");
		
		ServletContext con=getServletContext();
		Connection cn=null;
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			Class.forName(con.getInitParameter("driver"));
			
			cn=DriverManager.getConnection(con.getInitParameter("url"),con.getInitParameter("user"),con.getInitParameter("pass"));
			
			pst=cn.prepareStatement("select * from stdpj.itemslist where slnum=?");
			pst.setInt(1, Integer.parseInt(id));
			rs=pst.executeQuery();
			
			if(rs.next())
			{
					
			
				pst=cn.prepareStatement("insert into stdpj.order values (?,?,?,?,?,?,?)");
				pst.setString(1, rs.getString(2));
				pst.setString(2, em );
				pst.setString(3, add);
				pst.setInt(4, Integer.parseInt(qty));
				pst.setDouble(5, rs.getDouble("price")*Integer.parseInt(qty));
				pst.setString(6,"OrderPlaced");
				pst.setString(7, "N/A");
				
				pst.executeUpdate();
			}
			resp.sendRedirect("main.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
