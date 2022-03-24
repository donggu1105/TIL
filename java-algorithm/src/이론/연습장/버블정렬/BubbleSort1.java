package 이론.연습장.버블정렬;

import java.util.ArrayList;
import java.util.Collections;

public class BubbleSort1 {

    public static ArrayList<Integer> sort(ArrayList<Integer> dataList) {

        for (int index = 0; index < dataList.size() - 1; index++) {
            boolean swap = false;

            for (int index2 = 0; index2 < dataList.size() - 1 - index; index2++) {
                if (dataList.get(index2) > dataList.get(index2 + 1)) {
                    Collections.swap(dataList, index2, index2 + 1);
                    swap = true;
                }

                if (swap) {
                    break;
                }
            }
        }
        return dataList;
    }
}
