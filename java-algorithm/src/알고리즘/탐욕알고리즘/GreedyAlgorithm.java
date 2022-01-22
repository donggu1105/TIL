package 알고리즘.탐욕알고리즘;

import java.awt.image.AreaAveragingScaleFilter;
import java.util.ArrayList;
import java.util.Arrays;

public class GreedyAlgorithm {


    public Integer coinFunc(Integer price, ArrayList<Integer> coinList) {
        Integer totalCoinCount = 0;
        Integer coinNum = 0;

        ArrayList<Integer> details = new ArrayList<Integer>();

        for (int index = 0; index < coinList.size(); index++) {
            coinNum = price / coinList.get(index);
            totalCoinCount += coinNum;
            price -= coinNum * coinList.get(index);
            details.add(coinNum);
        }

        return totalCoinCount;

    }

    public static void main(String[] args) {

        ArrayList<Integer> coinList = new ArrayList<>(Arrays.asList(500, 100, 50, 20));

        GreedyAlgorithm g = new GreedyAlgorithm();

        Integer result = g.coinFunc(5000, coinList);

        System.out.println(result);

    }
}
