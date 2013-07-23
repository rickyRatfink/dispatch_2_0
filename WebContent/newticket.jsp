<%@ page import="org.faithfarm.dispatch.DispatchServlet" %>

<jsp:include page="header.jsp" flush="true"/>

<% 
	String required = "<img src='images/required.png'/>"; 
    String f1Err = (String)request.getAttribute("field1Err");
	String f2Err = (String)request.getAttribute("field2Err");
	String f3Err = (String)request.getAttribute("field3Err");
	String f4Err = (String)request.getAttribute("field4Err");
	String f5Err = (String)request.getAttribute("field5Err");
	String f6Err = (String)request.getAttribute("field6Err");
	String f7Err = (String)request.getAttribute("field7Err");
	String f8Err = (String)request.getAttribute("field8Err");
	String f9Err = (String)request.getAttribute("field9Err");
	String f10Err = (String)request.getAttribute("field10Err");
	String f11Err = (String)request.getAttribute("field11Err");
	String f12Err = (String)request.getAttribute("field12Err");
	String f13Err = (String)request.getAttribute("field13Err");
	String f14Err = (String)request.getAttribute("field14Err");
	if (f1Err==null) f1Err="";	
	if (f2Err==null) f2Err="";	
	if (f3Err==null) f3Err="";	
	if (f4Err==null) f4Err="";	
	if (f5Err==null) f5Err="";	
	if (f6Err==null) f6Err="";	
	if (f7Err==null) f7Err="";	
	if (f8Err==null) f8Err="";	
	if (f9Err==null) f9Err="";	
	if (f10Err==null) f10Err="";	
	if (f11Err==null) f11Err="";	
	if (f12Err==null) f12Err="";	
	if (f13Err==null) f13Err="";
	if (f14Err==null) f14Err="";		
%>
<form method="POST" action="<%=request.getContextPath()%>/ticket"> 
			<tr>
				<td width="100%" align="center" valign="center" border="0" bgcolor="#FFFFFF">
                        <h1>Donor Information</h1>
                		<table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Last Name<%=required%></td> 
                                <td class="fieldHeading" >First Name<%=required%></td>
                                <td class="fieldHeading">Suffix</td>
                                <td width="50%">&nbsp;</td>
                            </tr>
                                                       
                            <tr>
                            	<td><input type="text" size="30" maxlength="40" name="lastname" value="<%=DispatchServlet.getDonor().getLastname() %>" <% if (f1Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> /></td>
                                <td><input type="text" size="20" maxlength="40"  <% if (f2Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> /></td>
                                <td>
                                	<select name="suffix" class="ddl">
                                        <option value=""></option>
                                    	<option value="">jr.</option>
                                        <option value="">ss.</option>
                                        <option value="">I</option>
                                        <option value="">II</option>
                                        <option value="">III</option>
                                    </select>
                                </td>
                                <td></td>
                            </tr>    
                            
                             <tr>
                            	<td class="fieldError"><%=f1Err%></td>
                                <td class="fieldError"><%=f2Err%></td>
                                <td></td>
                                <td</td>
                            </tr>
                                                   
                        </table>  
                        
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Address Line 1<%=required%></td>
                            </tr>
                           
                            <tr>
                            	<td><input type="text" size="80" maxlength="100" value="<%=DispatchServlet.getAddress().getLine1() %>" <% if (f3Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> /></td>
                            </tr>   
                            <tr>
                            	<td class="fieldError"><%=f3Err%></td>
                            </tr>                         
                        </table>
                        
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Address Line 2</td>
                            </tr>
                           
                            <tr>
                            	<td><input type="text" size="80" value="<%=DispatchServlet.getAddress().getLine2() %>" maxlength="100" class="textbox" /></td>
                            </tr>                            
                        </table>
                        
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >City<%=required%></td>
                                <td class="fieldHeading" >State<%=required%></td>
                                <td class="fieldHeading">Zipcode<%=required%></td>
                                <td width="50%"></td>
                            </tr>
                           
                            <tr>
                            	<td><input type="text" size="25" maxlength="25" name="city" value="<%=DispatchServlet.getAddress().getCity() %>" <% if (f4Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> /></td>
                                <td>
                                	<select name="suffix" name="state" <% if (f5Err.length()>0){%> class="ddlErr"<% } else { %> class="ddl"<%}%>>
                                        <option value=""></option>
                                    	<option value="">North Carolina</option>
                                        <option value="">ss.</option>
                                        <option value="">I</option>
                                        <option value="">II</option>
                                        <option value="">III</option>
                                    </select>
                                </td>
                                <td><input type="text" size="10" name="zipcode" maxlength="10" <%=DispatchServlet.getAddress().getZipcode() %> <% if (f6Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> /></td>
                                <td width="50%"></td>
                            </tr>     
                            
                             <tr>
                            	<td class="fieldError"><%=f5Err%></td>
                                <td class="fieldError"><%=f6Err%></td>
                                <td></td>
                            </tr>                       
                        </table>  
                        
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Contact Phone<%=required%></td>
                                <td class="fieldHeading" >Email Address<%=required%></td>
                                <td width="40%"></td>
                            </tr>
                           
                            <tr>
                            	<td>
                                	(<input type="text" size="3" maxlength="3" class="textbox" />)
                                	<input type="text" size="3" maxlength="3" class="textbox" />-
                                	<input type="text" size="4" maxlength="4" class="textbox" />
                                </td>
                                <td><input type="text" size="50" name="email" maxlength="50" value="<%=DispatchServlet.getDonor().getEmailAddress() %>" class="textbox" /></td>
                                <td></td>
                            </tr>                            
                        </table>  
                        
                        <table>
                        <tr>
            				<td height="20" bgcolor="#FFFFFF"></td>
            			</tr>
                        </table>
                        <hr class='dotted' />
                        <h1>Location Information</h1>
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Major Intersection<%=required%></td>
                                <td class="fieldHeading" >Subdivision</td>
                                <td width="55%"></td>
                             </tr>
                             <tr>
                            	<td><input type="text" size="30" maxlength="30" name="majorIntersection" value="<%=DispatchServlet.getAddress().getMajorIntersection() %>" <% if (f7Err.length()>0){%> class="textboxErr"<% } else { %> class="textbox"<%}%> class="textbox" /></td>
                                <td><input type="text" size="30" maxlength="30" name="subdivision" value="<%=DispatchServlet.getAddress().getSubdivision() %>" class="textbox" " class="textbox" /></td>
                                <td></td>
                             </tr>
                             <tr>
                             	<td class="fieldError"><%=f7Err%></td>
                                <td></td>
                                <td></td>
                             </tr>
                         </table>
                         <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="fieldHeading" >Street Suffix<%=required%></td>
                                <td class="fieldHeading" >Structure Type<%=required%></td>
                                <td width="50" class="fieldHeading" >Unit</td>
                                <td class="fieldHeading" >Building</td>
                                <td class="fieldHeading" >Floor</td>
                                 <td width="40%"></td>
                             </tr>  
                              
                            <tr>
                            	<td>
                                	<select name="streetSuffix" <% if (f8Err.length()>0){%> class="ddlErr"<% } else { %> class="ddl"<%}%>>
                                        <option value=""></option>
                                    	<option value="">street</option>
                                    </select>
                                </td>
                                <td>
                                	<select name="structureType" <% if (f9Err.length()>0){%> class="ddlErr"<% } else { %> class="ddl"<%}%>>
                                        <option value=""></option>
                                    	<option value="">apartment</option>
                                    </select>
                                </td>
                                <td><input type="text" size="5" maxlength="5" name="building" value="<%=DispatchServlet.getAddress().getBuilding() %>" class="textbox"  class="textbox" /></td>
                                <td><input type="text" size="5" maxlength="5" name="floor" value="<%=DispatchServlet.getAddress().getFloor() %>" class="textbox" class="textbox" /></td>
                                <td>
                                	<select name="suffix" class="ddl">
                                        <option value=""></option>
                                    	<option value="">1</option>
                                    </select>
                                </td>
                                <td></td>
                            </tr>   
                            <tr>
                             	<td class="fieldError"><%=f8Err%></td>
                                <td class="fieldError"><%=f9Err%></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                             </tr>                         
                        </table>  
                        
                         <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td width="5" class="fieldHeading" ><input type="checkbox" name="" value="Y"/></td>
                                <td class="fieldHeading" >Check if elevator access is available</td>
                            </tr> 
                            <tr>
                            	<td width="5" class="fieldHeading" ><input type="checkbox" name="" value="Y"/></td>
                                <td class="fieldHeading" >Check if community is gated</td>
                            </tr> 
                            <tr>
                            	<td colspan="2" class="fieldHeading" >Gate Instructions</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="fieldHeading" ><textarea class="area"></textarea></td>
                            </tr> 
                            
                         </table>
                         
                        <table>
                        <tr>
            				<td height="20" bgcolor="#FFFFFF"></td>
            			</tr>
                        </table>
                        
                        <hr class='dotted' />
                         <h1>Donation Details</h1>
                         
                         <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td width="5" class="fieldHeading" ><input type="checkbox" name="" value="Y"/></td>
                                <td class="fieldHeading" >Check if this donation is a special</td>
                            </tr> 
                         </table>
                        <table width="95%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                            	<td width="120" class="fieldHeading" >Call Requirements<%=required%></td>
                                <td class="fieldHeading" >
                                	<select name="suffix" class="ddl">
                                        <option value=""></option>
                                    	<option value="">asdfjsdlfjsdl</option>
                                    </select>
                                </td>
                            </tr>                           
                         </table>
                        </br>
                           <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td class="itemName">A/C</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Bedding</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Books</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Clothing</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Computer</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Desk</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Chest</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Armoire</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Dresser</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Mirror</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Nightstand</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Headboard</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Footboard</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Rails</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Lamp</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Lawn Furniture</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Mattress/Box Spring</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Misc Household Items</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                              <tr>
                            	<td class="itemName">Refridgerator</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Stove</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Recliner</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                               <tr>
                            	<td class="itemName">Sofa</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Loveseat</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Wall Unit</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                               <tr>
                            	<td class="itemName">Table</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Chair</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Television</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" onClick="javascript:alert('Please notify the donor that Faith Farm does not accept televisions that are more than 10 years old.  (The year can be located on the serial tag on the back of the televion.)');"/></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                               <tr>
                            	<td class="itemName">Electronics</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td class="itemName">Washer</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                          		<td class="itemName">Dryer</td>
                                <td class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                                <td></td>
                              </tr>
                              <tr><td colspan="6" height="1"></td></tr>
                               <tr>
                            	<td class="itemName">Exercise Equipment</td>
                                <td colspan="6" class="itemQuantity"><input type="text" size="2" maxlength="2" class="textbox" /></td>
                               </tr>
                               <tr><td colspan="6" height="1"></td></tr>
                               <tr>
                            	<td colspan="7" class="itemName">Special Notes
                                	</br>
                                	<textarea class="area"></textarea>
                                </td>
                               </tr>
                            </table>
                            
                            <table width="95%" cellpadding="0" cellspacing="0" border="0">
                        	<tr>
                            	<td width="5" class="fieldHeading" ><input type="checkbox" name="" value="Y"/></td>
                                <td class="fieldHeading" >
                                	I acknowledge that I have read Faith Farm's delivery/donation terms and policies to the customer.
                                </td>
                            </tr> 
                         </table>
                         
                         </br></br>
                         
                         <input type="submit" name="action" value="Save Ticket" class="imageButtonSave" title="Save Ticket" />
                         <input type="submit" name="action" value="Save & Print" class="imageButtonPrint" title="Save Ticket & Print" />
                          
               		
           	</td>
			</tr>
</form>			
			<tr>
				<td height="180" valign="bottom" align="center" bgcolor="#FFFFFF">
					<div id="footer">
					Faith Farm Ministries, 9538 U.S. 441, Boynton Beach, FL 33472. &copy;2013</br>
					(561) 737-2222 | (561) 735-0227 FAX</br></br>					
					</div>
				</td>
			</tr>
		</table>
</td>
<td width="20%"></td>
</tr>
</table>
	
</body>
</html>
