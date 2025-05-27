import java.lang.reflect.*;

public class ReflectionDemo {
    public void greet() {
        System.out.println("Hello via Reflection!");
    }

    public static void main(String[] args) {
        try {
            Class<?> cls = Class.forName("ReflectionDemo");
            Object obj = cls.getDeclaredConstructor().newInstance();

            Method[] methods = cls.getDeclaredMethods();
            for (Method m : methods) {
                System.out.println("Method: " + m.getName());
            }

            Method greetMethod = cls.getMethod("greet");
            greetMethod.invoke(obj);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
