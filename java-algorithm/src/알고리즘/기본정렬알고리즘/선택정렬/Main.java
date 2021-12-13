package 알고리즘.기본정렬알고리즘.선택정렬;

import java.io.OutputStream;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {
        ArrayList<Integer> dataList = new ArrayList<>();


        for (int i = 0; i < 100; i++) {
            dataList.add((int) (Math.random() * 100));
        }

        System.out.println(dataList);
        SelectionSort.sort(dataList);
        System.out.println(dataList);
    }
}
