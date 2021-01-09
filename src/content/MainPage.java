package content;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainPage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String option=req.getParameter("op");
		
		
		if(option.equalsIgnoreCase("add"))
		{
			resp.sendRedirect("add.html");
		}
		else if(option.equalsIgnoreCase("update"))
		{
			resp.sendRedirect("Update.jsp");
		}
		else
		{
			resp.sendRedirect("delete.jsp");
		}
		
		
	}
}
