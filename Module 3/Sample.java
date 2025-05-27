public class Sample {
    private String message;

    public Sample(String message) {
        this.message = message;
    }

    public void printMessage() {
        System.out.println("Message: " + message);
    }

    public static void main(String[] args) {
        Sample s = new Sample("Hello, Decompiler!");
        s.printMessage();
    }
}
