import java.util.*;

public class LambdaSortExample {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Zara", "Anna", "Mike", "Bob");

        Collections.sort(names, (s1, s2) -> s1.compareTo(s2));

        System.out.println("Sorted names:");
        names.forEach(System.out::println);
    }
}
