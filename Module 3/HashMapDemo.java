import java.util.HashMap;
import java.util.Scanner;

public class HashMapDemo {
    public static void main(String[] args) {
        HashMap<Integer, String> students = new HashMap<>();
        Scanner scanner = new Scanner(System.in);

        students.put(101, "Alice");
        students.put(102, "Bob");
        students.put(103, "Charlie");

        System.out.print("Enter student ID to search: ");
        int id = scanner.nextInt();

        if (students.containsKey(id)) {
            System.out.println("Student Name: " + students.get(id));
        } else {
            System.out.println("Student not found.");
        }
    }
}
