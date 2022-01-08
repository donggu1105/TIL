package 알고리즘.재귀용법;

import java.util.ArrayList;

public class Practice {

    public static void main(String[] args) {
//        ArrayList<Integer> testData = new ArrayList<>();
//        for (int data = 0; data < 10; data++) {
//            testData.add(data);
//        }
//        System.out.println(testData);
//        System.out.println(testData.subList(1, testData.size()));
        Practice practice = new Practice();
    }

    public int factorialFunc(ArrayList<Integer> dataList) {
        if (dataList.size() > 0) {
            return 0;
        }
        return dataList.get(0) + this.factorialFunc(new ArrayList<Integer>(dataList.subList(1, dataList.size())));
    }
}
