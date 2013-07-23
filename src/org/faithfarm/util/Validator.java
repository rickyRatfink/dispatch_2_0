package org.faithfarm.util;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {

	   public String validateRequired(String key, String value)
	   {
	     if ((value == null) || (value.length() == 0) || (value.trim().length() == 0)) {
	       return key + " is required.";
	     }
	     return "";
	   }
	 
	   public String validateEmail(String email, ArrayList messages)
	   {
	     if (("NA".equals(email)) || ("na".equals(email))) {
	      return "";
	     }
	     if ((email == null) || (email.length() == 0) || (email.trim().length() == 0)) {
	       return "email address is required.";
	     }
	     Pattern p = Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	     Matcher m = p.matcher(email);
	     boolean b = m.matches();
	      
	     if (!b) {
	      return "email address entered is not valid.";
	     }
	     return "";
	     }
	   
	   public String cleanData(String value) {
		   if (value == null||value.equals("null")) {
		      return "";
		   }
		   return value;
	   }
}
