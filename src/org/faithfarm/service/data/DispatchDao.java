package org.faithfarm.service.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.faithfarm.domain.SystemUser;



public class DispatchDao {  

	
	public boolean secureLogin(String username, String password, HttpSession session) {
		
		    try {
		    	
		    Class.forName("com.mysql.jdbc.Driver");
			
		    Connection Conn = 
			    DriverManager.getConnection("jdbc:mysql://localhost:3306/ffarm_dev","root","admin");
		        
			// Do something with the Connection
			Statement Stmt = Conn.createStatement();
			ResultSet RS = Stmt.executeQuery("SELECT * from SYSTEM_USER");
			
				SystemUser user = new SystemUser();
				
				while (RS.next()) {
					String uid=RS.getString(2);
					String pwd=RS.getString(3);
					
				    user.setUserId(Integer.valueOf(RS.getString(1)));
				    user.setUsername(RS.getString(2));
				    user.setPassword(RS.getString(3));
				    user.setCreationDate(RS.getString(4));
				    user.setLastUpdatedDate(RS.getString(5));
				    user.setUserRole(RS.getString(6));	
				    
				    if (username.trim().length()==0||username.equals("username")) {
			    		session.setAttribute("ERROR_"+session.getId(), "You must enter a username.");
			    		return false;
			    	}
				    if (password.trim().length()==0||password.equals("password")) {
			    		session.setAttribute("ERROR_"+session.getId(), "You must enter a password.");
			    		return false;
			    	}
				    
				    if (username.equals(uid)) {
				    
				    	if (password.equals(pwd)) {				    		
				    		session.setAttribute("USER_"+session.getId(), user);
				    		return true;
				    	} else {
				    		session.setAttribute("ERROR_"+session.getId(), "The password entered is incorrect.");
				    		return false;
				    	}
				    		
				    }
				}
				// Clean up after ourselves
				RS.close();
				Stmt.close();
				Conn.close();				
		    }
		    catch (SQLException E) {
				System.out.println("SQLException: " + E.getMessage());
				System.out.println("SQLState:     " + E.getSQLState());
				System.out.println("VendorError:  " + E.getErrorCode());
		    }
		    catch (ClassNotFoundException e) {
				System.out.println("Where is your MySQL JDBC Driver?");
				e.printStackTrace();				
			}
	
    session.setAttribute("ERROR_"+session.getId(), "The username or password entered is not valid.");
    
	return false;	    
	}

}
