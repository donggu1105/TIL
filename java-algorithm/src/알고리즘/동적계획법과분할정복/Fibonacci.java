package 알고리즘.동적계획법과분할정복;

public class Fibonacci {

    public static void main(String[] args) {
        Fibonacci fibonacci = new Fibonacci();
        System.out.println(fibonacci.factorialFunc(10));
    }

    public int factorialFunc(int data) {

        if (data == 0) {
            return 0;
        } else if (data == 1) {
            return 1;
        }

        return this.factorialFunc(data - 1) + this.factorialFunc(data - 2);
    }

}
