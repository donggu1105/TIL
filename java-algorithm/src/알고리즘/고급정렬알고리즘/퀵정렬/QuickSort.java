package 알고리즘.고급정렬알고리즘.퀵정렬;

import java.util.ArrayList;
import java.util.Arrays;

public class QuickSort {

    public ArrayList<Integer> splitFunc(ArrayList<Integer> dataList) {

        if (dataList.size() <= 1) {
            return dataList;
        }

        int pivot = dataList.get(0);

        ArrayList<Integer> leftArr = new ArrayList<>();
        ArrayList<Integer> rightArr = new ArrayList<>();

        // pivot 이 0번쨰이니까 1부터 탐색
        for (int index = 1; index < dataList.size(); index++) {
            if (dataList.get(index) > pivot) {
                rightArr.add(dataList.get(index));
            } else {
                leftArr.add(dataList.get(index));
            }
        }


        ArrayList<Integer> mergedArr = new ArrayList<>();
        mergedArr.addAll(this.splitFunc(leftArr));
        mergedArr.addAll(Arrays.asList(pivot));
        mergedArr.addAll(this.splitFunc(rightArr));

        return mergedArr;
    }


    public static void main(String[] args) {

        ArrayList<Integer> dataList = new ArrayList<>();
        for (int index = 0; index < 100; index++) {
            dataList.add((int) (Math.random() * 100));
        }

        QuickSort quickSort = new QuickSort();
        System.out.println(quickSort.splitFunc(dataList));

    }
}
