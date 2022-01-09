package 알고리즘.고급정렬알고리즘.병합정렬;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;

public class MergeSort {

    public ArrayList<Integer> mergetSplitFunc(ArrayList<Integer> dataList) {
        if (dataList.size() <= 1) {
            return dataList;
        }

        int medium = dataList.size() / 2;
        ArrayList<Integer> leftArr = this.mergetSplitFunc(new ArrayList<>(dataList.subList(0, medium)));
        ArrayList<Integer> rightArr = this.mergetSplitFunc(new ArrayList<>(dataList.subList(medium, dataList.size())));

        return mergeFunc(leftArr, rightArr);
    }

    private ArrayList<Integer> mergeFunc(ArrayList<Integer> leftList, ArrayList<Integer> rightList) {

        ArrayList<Integer> mergedList = new ArrayList<>();
        int leftPoint = 0;
        int rightPoint = 0;

        // CASE1 : left/right 둘다 있을때
        while (leftList.size() > leftPoint && rightList.size() > rightPoint) {
            if (leftList.get(leftPoint) > rightList.get(rightPoint)) {
                mergedList.add(rightList.get(rightPoint));
                rightPoint += 1;
            } else {
                mergedList.add(leftList.get(leftPoint));
                leftPoint += 1;
            }
        }
        // CASE2 : right 데이터가 없을때
        while (leftList.size() > leftPoint) {
            mergedList.add(leftList.get(leftPoint));
            leftPoint += 1;
        }
        // CASE3 : left 데이터가 없을때
        while (rightList.size() > rightPoint) {
            mergedList.add(rightList.get(rightPoint));
            rightPoint += 1;
        }

        return mergedList;
    }

    public static void main(String[] args) {

        MergeSort mergeSort = new MergeSort();
        ArrayList<Integer> testData = new ArrayList<>();

        for (int index = 0; index < 100; index++) {
            testData.add((int)(Math.random() * 100));
        }
        ArrayList<Integer> mergedList = mergeSort.mergetSplitFunc(testData);

        System.out.println(mergedList);

    }
}
