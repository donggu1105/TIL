package 이론.알고리즘이론.기본정렬알고리즘.삽입정렬;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        ArrayList<Integer> testData = new ArrayList<>();

        for (int index = 0; index < 1000; index++) {
            testData.add((int) (Math.random() * 1000));
        }

        System.out.println(testData);
        InsertionSort.sort(testData);
        System.out.println(testData);
    }
}
