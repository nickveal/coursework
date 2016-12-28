import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Login extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                System.out.println("Where is your MySQL JDBC Driver?");
                e.printStackTrace();
                return;
            }

            response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			// Get parameters of user and password input
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			
			// Get session object, set session attributes
			//////////////////////////////
			//		START TESTING		//
			//////////////////////////////
			// Probably only pass username after verification from MySQL, 	
			// But for now testing by pushing both user and pass 			
			// To session attributes 										
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			session.setAttribute("pass", pass);

            String host = "localhost";
            String database = "autorepair";
            String url = "jdbc:mysql://" + host + "/" + database;

            String dbuser = "default";
            String dbpass = "autorepair";

            Connection connection = null;

            try {
                connection = DriverManager.getConnection(url, dbuser, dbpass);
            } catch (SQLException e) {
                out.println("Connection Failed! Check output console.<br>");
                e.printStackTrace();
                return;
            }

            out.println("Connection to database successful!<br>");

            out.println("Verifying username and password...<br>");

            String query = "SELECT * FROM EMPLOYEE WHERE USERNAME=\'" + user + "\'";

            Statement statement = null;

            String so_user = null, so_pass = null;

            try {
                statement = connection.createStatement();

                ResultSet rs = statement.executeQuery(query);

                while(rs.next()) {
                    String sid = rs.getString("LOGINID");
                    so_user = rs.getString("USERNAME");
                    so_pass = rs.getString("PASSWORD");
                    String output = sid + ", " + so_user + ", " + so_pass;
                    out.println(output + "<br>");
                }

            } catch (SQLException e) {
                out.println("Error with MySQL statement, ");
                out.println(e.getMessage() + "<br>");
            } finally {
                try {
                    if(statement != null) {
                        statement.close();
                    }
                } catch (SQLException e) {
                    out.println("Error closing statement.");
                }

                try {
                    if(connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("Error closing statement.");
                }
            }

			// Test debug output
			out.println("User: " + user + "<br>");
			out.println("Pass: " + pass + "<br>");

            boolean userCheck = user.equals(so_user);
            boolean passCheck = pass.equals(so_pass);

            if(userCheck && passCheck) {
                out.println("Username and password are correct!<br>");
				out.println("Redirecting in 3 seconds...");
				response.setHeader("Refresh", "3; URL=home.jsp");
            } else {
                out.println("Username or password are incorrect!<br>");
				out.println("Redirecting in 3 seconds...");
				response.setHeader("Refresh", "3; URL=login.jsp");
            }

		}
}