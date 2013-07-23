package org.faithfarm.dispatch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.faithfarm.service.data.DispatchDao;

  
public class SecureLogin extends HttpServlet {
     
	private DispatchDao dao = new DispatchDao();
     
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			   throws ServletException, IOException
			   { 
			      String next="";
			      
		 		  HttpSession session = req.getSession(true);		     
			      
			      String action=req.getParameter("action");
			      
			      if ("login".equals(action)) 
			    	  this.secureLogin(req, resp, session);			      
			      else if ("logout".equals(action))
			    	  req.getRequestDispatcher("/logout.jsp").forward(req, resp);
			    	  
	 } 
	 
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException
			 {
			     doGet(req, resp);
			 }
	 
	 private void secureLogin(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws ServletException, IOException{
	      String username=req.getParameter("username");
	      String password=req.getParameter("password");
	      String next="";
	      
	      boolean success=dao.secureLogin(username, password, session);
	      
	      if (success)
	    	  next="ticket"; //"newticket.jsp";
	      else
	    	  next="login_error.jsp";
	      req.getRequestDispatcher("/"+next).forward(req, resp);
	    }
}
