package 이론.자료구조이론.시간복잡도;

public class Sum {


    public static int practice1(int n) {

        // n까지의 합
        int sum = 0;
        for (int i = 0; i <= n; i++) {
            sum += i;
        }

        return sum;
    }

    public static int practice2(int n) {
        return n * (n + 1) / 2;
    }

    public static void main(String[] args) {
        System.out.println(Sum.practice1(10));
        System.out.println(Sum.practice2(10));
    }
}
