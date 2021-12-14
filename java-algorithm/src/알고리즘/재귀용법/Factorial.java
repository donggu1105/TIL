package 알고리즘.재귀용법;

import java.util.ArrayList;

public class Factorial {

    public int factorialFunc(int n) {
        // 규칙 찾기
        // n! = n * (n-1)!

        if (n > 1) {
            return n * this.factorialFunc(n - 1);
        } else {
            return 1;
        }
    }

    public int factorialFunc2(int n) {

        if (n <= 1) {
            return 1;
        } else {
            return n * this.factorialFunc(n - 1);
        }
    }

    public int factiorialFunc3(ArrayList<Integer> dataList) {
        if (dataList.size() <= 0) {
            return 0;
        } else {
            return dataList.get(0) + this.factiorialFunc3(new ArrayList<Integer>(dataList.subList(1, dataList.size())));
        }
    }
}
