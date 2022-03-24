package 이론.연습장;

import 이론.연습장.삽입정렬.InsertionSort1;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // 표본 데이터
        ArrayList<Integer> dataList = new ArrayList<>();

        for (int i = 0; i < 1000; i++) {
            dataList.add((int) (Math.random() * 1000));
        }


        System.out.println(dataList);
//        BubbleSort2.sort(dataList);
//        SelectionSort2.sort(dataList);
        InsertionSort1.sort(dataList);
        System.out.println(dataList);

    }
}
