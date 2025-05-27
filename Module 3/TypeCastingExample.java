// File: TypeCastingExample.java

public class TypeCastingExample {
    public static void main(String[] args) {
        // Implicit and explicit casting
        double doubleValue = 9.78;
        int intValue = (int) doubleValue; // Explicit casting

        int newInt = 10;
        double newDouble = newInt; // Implicit casting

        System.out.println("Original double: " + doubleValue);
        System.out.println("After casting to int: " + intValue);
        System.out.println("Original int: " + newInt);
        System.out.println("After casting to double: " + newDouble);
    }
}
