package 이론.연습장.선택정렬;

import java.util.ArrayList;
import java.util.Collections;

public class SelectionSort2 {

    public static ArrayList<Integer> sort(ArrayList<Integer> dataList) {
        int lowest;
        for (int stand = 0; stand < dataList.size() - 1; stand++) {
            lowest = stand;

            for (int index = stand + 1; index < dataList.size(); index++) {
                if (dataList.get(index) < dataList.get(lowest)) {
                    lowest = index;
                }
            }
            Collections.swap(dataList, stand, lowest);
        }
        return dataList;
    }
}
