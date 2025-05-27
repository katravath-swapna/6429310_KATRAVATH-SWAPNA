import java.util.concurrent.*;
import java.util.*;

public class ExecutorCallableDemo {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(3);
        List<Callable<String>> tasks = new ArrayList<>();

        tasks.add(() -> "Result from Task 1");
        tasks.add(() -> "Result from Task 2");
        tasks.add(() -> "Result from Task 3");

        try {
            List<Future<String>> results = executor.invokeAll(tasks);
            for (Future<String> result : results) {
                System.out.println(result.get());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            executor.shutdown();
        }
    }
}
