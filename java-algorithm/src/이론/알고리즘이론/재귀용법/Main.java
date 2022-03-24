package 이론.알고리즘이론.재귀용법;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {
        Factorial factorial = new Factorial();
//        System.out.println(factorial.factorialFunc(5));
//        System.out.println(factorial.factorialFunc2(5));
//    }


    ArrayList<Integer> testData = new ArrayList<>();

        for (int data = 0; data < 10; data++) {
            testData.add(data);
        }

        System.out.println(testData);
        int result = factorial.factiorialFunc3(testData);
        System.out.println(result);
        }
}
