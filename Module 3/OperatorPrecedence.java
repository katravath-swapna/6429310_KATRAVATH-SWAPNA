// File: OperatorPrecedence.java

public class OperatorPrecedence {
    public static void main(String[] args) {
        int result1 = 10 + 5 * 2;
        int result2 = (10 + 5) * 2;

        System.out.println("Result without parentheses (10 + 5 * 2): " + result1); // 10 + (5*2) = 20
        System.out.println("Result with parentheses ((10 + 5) * 2): " + result2);   // (10+5)*2 = 30
    }
}
