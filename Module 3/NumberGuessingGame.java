// File: NumberGuessingGame.java

import java.util.Scanner;
import java.util.Random;

public class NumberGuessingGame {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Random rand = new Random();

        int targetNumber = rand.nextInt(100) + 1;
        int guess;
        int attempts = 0;

        System.out.println("Guess the number between 1 and 100!");

        do {
            System.out.print("Enter your guess: ");
            guess = input.nextInt();
            attempts++;

            if (guess < targetNumber) {
                System.out.println("Too low!");
            } else if (guess > targetNumber) {
                System.out.println("Too high!");
            } else {
                System.out.println("Correct! You guessed it in " + attempts + " tries.");
            }
        } while (guess != targetNumber);

        input.close();
    }
}
