package 이론.알고리즘이론.기본정렬알고리즘.버블정렬;

import java.util.ArrayList;
import java.util.Collections;

public class BubbleSort {

    public static ArrayList<Integer> sort(ArrayList<Integer> dataList) {
        // test가 n-1 번 반복
        for (int index = 0; index < dataList.size() - 1; index++) {
            // 한번이라도 반복됬으면 안할라고 변수 지정
            boolean swap = false;
            // 한줄안에서 둘이 비교하는 행동을 몇번 하느냐
            // - index은 한번할때마다 뒤에 하나 씩 줄어드니까 할필요없음
            for (int index2 = 0; index2 < dataList.size() - 1 - index; index2++) {
                if (dataList.get(index2) > dataList.get(index2 + 1)) {
                    Collections.swap(dataList, index2, index2 + 1);
                    swap = true;
                }
            }
            if (!swap) {
                break;
            }
        }
        return dataList;
    }
}
