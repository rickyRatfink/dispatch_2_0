package org.faithfarm.dispatch;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.faithfarm.domain.Address;
import org.faithfarm.domain.Donor;
import org.faithfarm.service.data.DispatchDao;
import org.faithfarm.util.Validator;


public class DispatchServlet extends HttpServlet {

	private DispatchDao dao = new DispatchDao();
	private static Donor donor = new Donor();
	private static Address address = new Address();
	 ArrayList messages = new ArrayList();
		
	 public ArrayList getMessages() {
		return messages;
	}


	public void setMessages(ArrayList messages) {
		this.messages = messages;
	}


	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			   throws ServletException, IOException
			   {
			      HttpSession session = req.getSession(true);
			      String action = req.getParameter("action");
			      boolean pass1 = false;
			      
			      this.setFields(req);
			      
			      if ("Save Ticket".equals(action)) {
			    	  pass1 = validateTicket(req);			    	  
			      }
			      
			      if (!pass1)
			    	  req.getRequestDispatcher("/newticket.jsp").forward(req, resp);
			      else
			    	  req.getRequestDispatcher("/index.jsp").forward(req, resp);
	 }
	 
	 
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException
			 {
			     doGet(req, resp);
			 }

	 public boolean validateTicket(HttpServletRequest req) {
		 boolean success=true;
		 Validator valid8r = new Validator();
		 
		 String fieldErr="";
		 String field2Err="";
		 String field3Err="";
		 String field4Err="";
		 String field5Err="";
		 String field6Err="";
		 String field7Err="";
		 String field8Err="";
		 String field9Err="";
		 String field10Err="";
		 String field11Err="";
		 String field12Err="";
		 String field13Err="";
		 String field14Err="";
		 
		 this.setFields(req); 
		 
		 fieldErr = valid8r.validateRequired("Lastname", this.getDonor().getLastname());
		 req.setAttribute("field1Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Firstname", this.getDonor().getFirstname());
		 req.setAttribute("field2Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Address Line1", this.getAddress().getLine1());
		 req.setAttribute("field3Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("City", this.getAddress().getCity());
		 req.setAttribute("field4Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("State", this.getAddress().getState());
		 req.setAttribute("field5Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Zipcode", this.getAddress().getZipcode());
		 req.setAttribute("field6Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Major Intersection", this.getAddress().getMajorIntersection());
		 req.setAttribute("field7Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Street Suffix", this.getAddress().getStreetSuffix());
		 req.setAttribute("field8Err", fieldErr);
		 if (fieldErr.length()>0) success=false;

		 fieldErr = valid8r.validateRequired("Structure Type", this.getAddress().getStructureType());
		 req.setAttribute("field9Err", fieldErr);
		 if (fieldErr.length()>0) success=false;
		 
		 //fieldErr = valid8r.validateRequired("Call Requirement", this.getAddress().getStructureType());
		 //req.setAttribute("field10Err", fieldErr);
		 //if (fieldErr.length()>0) success=false;
		 
		 return success;
	 }

	 private void setFields (HttpServletRequest req) {
		 Validator valid8r = new Validator();
		 
		 this.getDonor().setLastname(valid8r.cleanData(req.getParameter("lastname")));
		 this.getDonor().setFirstname(valid8r.cleanData(req.getParameter("firstname")));
		 this.getDonor().setSuffix(valid8r.cleanData(req.getParameter("suffix")));
		  
		 String phone1 = valid8r.cleanData(req.getParameter("phone1"));
		 String phone2 = valid8r.cleanData(req.getParameter("phone2"));
		 String phone3 = valid8r.cleanData(req.getParameter("phone3"));
		 String phone = "(" + phone1 + ")" + phone2 + "-" + phone3;
		
		 this.getDonor().setContactPhone(phone);
		 this.getDonor().setEmailAddress(valid8r.cleanData(req.getParameter("email")));
		 this.getAddress().setLine1(valid8r.cleanData(req.getParameter("line1")));
		 this.getAddress().setLine2(valid8r.cleanData(req.getParameter("line2")));
		 this.getAddress().setCity(valid8r.cleanData(req.getParameter("city")));
		 this.getAddress().setState(valid8r.cleanData(req.getParameter("state")));
		 this.getAddress().setZipcode(valid8r.cleanData(req.getParameter("zipcode")));
		 
		 this.getAddress().setMajorIntersection(valid8r.cleanData(req.getParameter("majorIntersection")));
		 this.getAddress().setSubdivision(valid8r.cleanData(req.getParameter("subdivision")));
		 this.getAddress().setStreetSuffix(valid8r.cleanData(req.getParameter("streetSuffix")));
		 this.getAddress().setStructureType(valid8r.cleanData(req.getParameter("structureType")));
		 this.getAddress().setBuilding(valid8r.cleanData(req.getParameter("building")));
		 this.getAddress().setUnit(valid8r.cleanData(req.getParameter("unit")));
		 this.getAddress().setFloor(valid8r.cleanData(req.getParameter("floor")));
		 this.getAddress().setElevatorFlag(valid8r.cleanData(req.getParameter("elevatorFlag")));
		 this.getAddress().setGateFlag(valid8r.cleanData(req.getParameter("gateFlag")));
		 this.getAddress().setGateInstructions(valid8r.cleanData(req.getParameter("gateInstructions")));
		 //this.getTicket().setCallRequirement(valid8r.cleanData(req.getParameter("callRequirement")));
		 
		 

	 }
	public static Donor getDonor() {
		return donor;
	}


	public static void setDonor(Donor donor) {
		DispatchServlet.donor = donor;
	}


	public static Address getAddress() {
		return address;
	}


	public static void setAddress(Address address) {
		DispatchServlet.address = address;
	}
	
	 
	 
}
