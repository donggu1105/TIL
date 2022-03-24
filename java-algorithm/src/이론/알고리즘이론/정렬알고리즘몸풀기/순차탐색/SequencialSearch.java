package 이론.알고리즘이론.정렬알고리즘몸풀기.순차탐색;

import java.util.ArrayList;

public class SequencialSearch {

    public int search(ArrayList<Integer> dataList, int searchItem) {

        for (int index = 0; index < dataList.size(); index++) {
            if (searchItem == dataList.get(index)) {
                return index;
            }
        }
        return -1;
    }

    public static void main(String[] args) {

        SequencialSearch sequencialSearch = new SequencialSearch();

        ArrayList<Integer> testData = new ArrayList<>();

        for (int index = 0; index < 10; index++) {
            testData.add((int) (Math.random() * 10));
        }
        System.out.println(testData);
        System.out.println(sequencialSearch.search(testData, 8));
    }
}
