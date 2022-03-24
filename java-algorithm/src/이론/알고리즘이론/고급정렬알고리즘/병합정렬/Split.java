package 이론.알고리즘이론.고급정렬알고리즘.병합정렬;

import java.util.ArrayList;
import java.util.Arrays;

public class Split {

    public static void main(String[] args) {

        Split split = new Split();

        split.splitFunc(new ArrayList<Integer>(Arrays.asList(4,1,3,2,5,6)));
    }

    public void splitFunc(ArrayList<Integer> dataList) {
        if (dataList.size() <= 1) {
            return;
        }

        int medium = dataList.size() / 2;

        ArrayList<Integer> leftArr = new ArrayList<Integer>();
        ArrayList<Integer> rightArr = new ArrayList<Integer>();

        // 0 부터 medium - 1 인덱스 번호까지 해당 배열 아이템을 서브배열
        leftArr = new ArrayList<Integer>(dataList.subList(0, medium));
        rightArr = new ArrayList<>(dataList.subList(medium, dataList.size()));

        System.out.println(leftArr);
        System.out.println(rightArr);
    }
}
