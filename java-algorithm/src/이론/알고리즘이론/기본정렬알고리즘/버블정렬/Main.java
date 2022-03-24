package 이론.알고리즘이론.기본정렬알고리즘.버블정렬;

import java.util.ArrayList;

/*
*
* 버블 정렬 (bubble sort) 란?
* 두 인접한 데이터를 비교해서, 앞에 있는 데이터가 뒤에 있는 데이터보다 크면, 자리를 바꾸는 정렬 알고리즘

* 직접 눈으로 보면 더 이해가 쉽다: https://visualgo.net/en/sorting
*
* */
public class Main {

    public static void main(String[] args) {

        ArrayList<Integer> dataList = new ArrayList<>();

        for (int i = 0; i < 100; i++) {
            dataList.add((int) (Math.random() * 100));
        }

        System.out.println(dataList);
        BubbleSort.sort(dataList);
        System.out.println(dataList);
    }
}
