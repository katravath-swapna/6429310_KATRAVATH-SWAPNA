public class PatternMatchingSwitch {
    public static void typeChecker(Object obj) {
        switch (obj) {
            case Integer i -> System.out.println("Integer value: " + i);
            case String s -> System.out.println("String value: " + s);
            case Double d -> System.out.println("Double value: " + d);
            default -> System.out.println("Unknown type");
        }
    }

    public static void main(String[] args) {
        typeChecker("Hello");
        typeChecker(42);
        typeChecker(3.14);
    }
}
