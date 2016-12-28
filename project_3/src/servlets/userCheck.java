package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class userCheck extends HttpServlet {

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
        String strQuery = "";
        Statement st = null;
        ResultSet rs = null;
        HttpSession session = req.getSession(true);
        try {
            Class.forName(dbDriver).newInstance();
            conn = DriverManager.getConnection(url + dbName, dbUser, dbPass);
            if (req.getParameter("usrnm") != null && req.getParameter("username") != ""
                    && req.getParameter("pwd") != null && req.getParameter("password") != "") {
                username = req.getParameter("usrnm").toString();
                userpass = req.getParameter("pwd").toString();
                strQuery = "select * from tbl_accounts where user_name='" + username + "' and  user_password='" + userpass + "'";
                System.out.println(strQuery);
                st = conn.createStatement();
                rs = st.executeQuery(strQuery);
                int count = 0;
                while (rs.next()) {
                	System.out.println(rs.getString(2)+" count: "+count);
                    session.setAttribute("account_id", rs.getString(1));
                    session.setAttribute("account_name", rs.getString(2));
                    count++;
                }
                if (count > 0) {
                    res.sendRedirect("CandyShop.jsp");
                } else {
                    res.sendRedirect("index.jsp");
                }
            } else {
                res.sendRedirect("login.jsp");
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
