

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)  
                    throws ServletException, IOException {  
        response.setContentType("text/jsp");  
        PrintWriter out=response.getWriter();  
       
          
        String name=request.getParameter("name");  
        String password=request.getParameter("password");  
          
        if(password.equals("admin123")){  
        out.print("Welcome, "+name);  
        HttpSession session=request.getSession();  
        session.setAttribute("name",name); 
        request.getRequestDispatcher("adminview.jsp").include(request, response);  
        }
        
        else if(password.equals("user456")) {
        	 out.print("Welcome, "+name);  
             HttpSession session=request.getSession();  
             session.setAttribute("name",name);
             request.getRequestDispatcher("operator.jsp").include(request, response);  
        	
        }
        
        else{  
            out.print("Sorry, username or password error!");  
            request.getRequestDispatcher("index.html").include(request, response);  
        }  
        out.close();  
    }  

}
