package servlets;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author ken
 */
public class registerUser extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        System.out.println("Checking admin login");
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "project_3";
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbUser = "Nick";
        String dbPass = "ne9346915";
        String username = "";
        String userpass = "";
        String lastname = "";
        String firstname = "";
        String email = "";
        String account_id = "";
        String strQuery0 = "";
        String strQuery1 = "";
        String strQuery2 = "";
        String uaddress = "";
        String ucity = "";
        String ustate = "";
        String uzip = "";
        String user_id = "";
        
        int count;
        Statement st = null;
        ResultSet rs;
        HttpSession session = req.getSession(true);
        try {
            Class.forName(dbDriver).newInstance();
            conn = DriverManager.getConnection(url + dbName, dbUser, dbPass);
            if (req.getParameter("username") != null && req.getParameter("username") != ""
                    && req.getParameter("password1") != null && req.getParameter("password1") != ""
                    && req.getParameter("fname") != null && req.getParameter("fname") != ""
                    && req.getParameter("lname") != null && req.getParameter("lname") != ""
                    && req.getParameter("email") != null && req.getParameter("email") != ""
                    && req.getParameter("address") != null && req.getParameter("address") != ""
                    && req.getParameter("city") != null && req.getParameter("city") != ""
                    && req.getParameter("state") != null && req.getParameter("state") != ""
                    && req.getParameter("zip") != null && req.getParameter("zip") != ""){
                	
                	//All the parameters from the POST are gathered from the req object
                	username = req.getParameter("username").toString();
                	userpass = req.getParameter("password1").toString();
                	lastname = req.getParameter("lname").toString();
                	firstname = req.getParameter("fname").toString();
                	email = req.getParameter("email").toString();
                	uaddress = req.getParameter("address").toString();
                	ucity = req.getParameter("city").toString();
                	ustate = req.getParameter("state").toString();
                	uzip = req.getParameter("zip").toString();


                	//initialize statement object so sql queries can be sent.
                	st = conn.createStatement();
                	strQuery0 = "SELECT user_name from tbl_accounts where user_name='" + username + "'";
                	
                    rs = st.executeQuery(strQuery0);
                    System.out.println(strQuery0);
                    
                    //rs has the results of strQuery0, which checks whether there exists any usernames = to username from the POST
                    //Count records how many copies there are. If it is > 0, then the program will redirect to a page and stop.
                    count = 0;
                    while (rs.next()){
                      count++;}
                    
                    System.out.println(count);
                    
                    if (count > 0){
                    	pw.println("Account Name is Taken already!");
                    	conn.close();
                    	System.exit(0);}
                
                    //The insert for the tbl_account
                    strQuery1 = "INSERT INTO tbl_accounts (account_id,user_name,user_password) VALUES (NULL,'"+username+"', '"+ userpass+"')";
                    st.executeUpdate(strQuery1);
                    
                    //A select from tbl_accounts in order to insert account_id into tbl_users
                    strQuery1 = "SELECT account_id from tbl_accounts where user_name='" + username + "' and  user_password='" + userpass + "'";
                    rs = st.executeQuery(strQuery1);
                    
                    //This is getting the account_id from rs which contains a results string array from strquery1
                    while (rs.next()) {
                        account_id = rs.getString(1);}
                    
                    //The insert for the tbl_users
                    System.out.println(account_id);
                    strQuery2 = "INSERT INTO tbl_users (user_id,last_name,first_name,email,account_id) VALUES (NULL,'"+lastname+"', '"+ firstname+"','"+ email+"','"+ account_id+"')";
                    st.executeUpdate(strQuery2);
                    
                    //The select for the user_id for tbl_addresses
                    strQuery1 = "SELECT user_id from tbl_users where account_id ='" + account_id + "'";
                    rs = st.executeQuery(strQuery1);
                    while (rs.next()) {
                    	user_id = rs.getString(1);}
                    
                    //The insert for the tbl_addresses
                    strQuery2 = "INSERT INTO tbl_addresses (address_id,address,city,state,shipping_or_billing,zip,user_id) VALUES (NULL,'"+uaddress+"', '"+ ucity+"','"+ ustate+"',NULL,'"+uzip+"','"+user_id+"')";
                    st.executeUpdate(strQuery2);


                    
                    res.sendRedirect("index.jsp");
                } else {
                    res.sendRedirect("index.jsp");
                }
                System.out.println("Connected to the database");
                conn.close();
                System.out.println("Disconnected from database");
            } catch (Exception e) {
                throw new ServletException("Login failed", e);
            }
        }

        /** 
         * Returns a short description of the servlet.
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo() {
            return "Short description";
        }// </editor-fold>
}