import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class CarEdit extends HttpServlet {
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
			
			String make = request.getParameter("make");
			String model = request.getParameter("model");
			String year = request.getParameter("year");
			String color = request.getParameter("color");
			String license = request.getParameter("license");
			String state = request.getParameter("state");
			String vin = request.getParameter("VIN");

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

            String query = "UPDATE CAR SET MAKE='" + make + "',MODEL='" + model + "',YEAR=" + year + ",COLOR='" + color + "',LICENSE='" + license + "',STATE='" + state + "' WHERE VIN='" + vin + "'";

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
				out.println("Entry successfully added! Redirecting in 3 seconds...");
			}
			response.setHeader("Refresh", "3; URL=home.jsp");
		}
}