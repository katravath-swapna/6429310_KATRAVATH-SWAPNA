import java.sql.*;

public class JDBCSelectExample {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/mydb";  // Update DB name if needed
        String user = "root";                             // Replace with your DB username
        String password = "password";                     // Replace with your DB password

        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Create a statement and execute the SELECT query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM students");

            // Display the result
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                System.out.println("ID: " + id + ", Name: " + name);
            }

            // Close connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
