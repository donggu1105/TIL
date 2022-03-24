package 이론.알고리즘이론.정렬알고리즘몸풀기.이진탐색;

import java.util.ArrayList;

public class BinarySearch {

    public boolean searchFunc(ArrayList<Integer> dataList, Integer searchItem) {

        // exceptions
        if (dataList.size() == 0) {
            return false;
        }

        if (dataList.size() == 1 && searchItem == dataList.get(0)) {
            return true;
        }

        if (dataList.size() == 1 && searchItem != dataList.get(0)) {
            return false;
        }

        int medium = dataList.size() / 2;

        if (searchItem == dataList.get(medium)) {
            return true;
        } else {
            if (searchItem < dataList.get(medium)) {
                return this.searchFunc(new ArrayList<>(dataList.subList(0, medium)), searchItem);
            } else {
                return this.searchFunc(new ArrayList<>(dataList.subList(medium, dataList.size())), searchItem);

            }
        }

    }
}
