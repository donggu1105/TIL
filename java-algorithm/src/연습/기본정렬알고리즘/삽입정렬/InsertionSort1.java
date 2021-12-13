package 연습.기본정렬알고리즘.삽입정렬;

import java.util.ArrayList;
import java.util.Collections;

public class InsertionSort1 {

    public static ArrayList<Integer> sort (ArrayList<Integer> dataList) {

        for (int index = 0; index < dataList.size() - 1; index++) {

            for (int index2 = index + 1; index2 > 0; index2--) {
                if (dataList.get(index2) < dataList.get(index2 - 1)) {
                    Collections.swap(dataList, index2, index2 - 1);
                } else {
                    break;
                }
            }
        }
        return dataList;
    }
}
