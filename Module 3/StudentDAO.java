import java.sql.*;

public class StudentDAO {
    private Connection connect() throws SQLException {
        return DriverManager.getConnection("jdbc:sqlite:students.db");
    }

    public void insertStudent(String name, int age) {
        String sql = "INSERT INTO students(name, age) VALUES(?, ?)";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setInt(2, age);
            pstmt.executeUpdate();
            System.out.println("Student inserted.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(int id, String name) {
        String sql = "UPDATE students SET name = ? WHERE id = ?";
        try (Connection conn = connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
            System.out.println("Student updated.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        StudentDAO dao = new StudentDAO();
        dao.insertStudent("Alice", 20);
        dao.updateStudent(1, "Alicia");
    }
}
