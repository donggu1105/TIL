package 알고리즘.탐욕알고리즘;

import java.util.Arrays;
import java.util.Comparator;

public class FractionalKnapsack {

    public void knsapSackFunc(Integer[][] objectList, double capacity) {
        double totalValue = 0.0;
        double fraction = 0.0;

        Arrays.sort(objectList, new Comparator<Integer[]>() {
            @Override
            public int compare(Integer[] o1, Integer[] o2) {
                return (o2[1] / o2[0]) - (o1[1] / o1[0]);
            }
        });

        for (int index = 0; index < objectList.length; index++) {
            if (capacity - (double) objectList[index][0] > 0) {
                capacity -= (double) objectList[index][0];
                totalValue += objectList[index][0];
                System.out.println("무게 :" + objectList[index][0] + "가치 : " + objectList[index][1]);
            } else {
                fraction = capacity / (double) objectList[index][0];
                totalValue += (double) objectList[index][0] * fraction;
                System.out.println("무게 :" + objectList[index][0] + " 가치 : " + objectList[index][1] + "비율 : " + fraction);
                break;
            }
        }
        System.out.println("총 담을수있는 가치" + totalValue);
    }

    public static void main(String[] args) {

        // 2차원 배열
        Integer[][] objectList = {{10, 10}, {15, 12}, {20, 10}, {25, 8}, {30, 5}};

        // 무게대비 가치가 높은것으로 정렬
        // 정렬을 위해서는 정렬 기준이 있어야함
        // 객체간 정렬을 위해서는 정렬 기준을 먼저 정의해줘야함

        FractionalKnapsack fk = new FractionalKnapsack();

        fk.knsapSackFunc(objectList, 30.0);



        // 하나씩 빼서  배낭무게에 빼가면서 최선의 물건을 넣을수있도록 설계
    }
}
