import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class ServiceRemove extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
			HttpSession session = request.getSession();
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
			String serviceid = (String)session.getAttribute("serviceid");

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
            String query = "DELETE FROM SERVICE WHERE SERVICEID='" + serviceid + "'";
			out.println(query + "<br>");
            Statement statement = null;
			boolean error = false;
            try {
                statement = connection.createStatement();
				statement.execute(query);
            } catch (SQLException e) {
                out.println("Error with MySQL statement.<br>");
                out.println(e.getMessage() + "<br>");
				out.println("Redirecting to home page in 3 seconds...");
				error = true;
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
			if(!error) {
				out.println("Service entry removed successfully!<br>");
			}
			response.setHeader("Refresh", "3; URL=home.jsp");
		}
		
}