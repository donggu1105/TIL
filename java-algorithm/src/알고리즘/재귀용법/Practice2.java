package 알고리즘.재귀용법;

public class Practice2 {

    public static void main(String[] args) {

        Practice2 test = new Practice2();

        System.out.println(test.factorialFunc(10));
    }

    public int factorialFunc(int data) {
        if (data == 1) {
            return 1;
        } else if (data == 2) {
            return 2;
        } else if (data == 3) {
            return 4;
        }
        return this.factorialFunc(data - 1) + this.factorialFunc(data - 2) + this.factorialFunc(data - 3);
    }
}
