package 알고리즘.완전탐색응용편;


import 알고리즘.완전탐색.완전탐색1;

import java.io.*;
import java.util.StringTokenizer;

public class 연산자끼워넣기 {

    static StringBuilder sb = new StringBuilder();

    static int N, max, min;

    //첫째 줄에 만들 수 있는 식의 결과의 최댓값을, 둘째 줄에는 최솟값을 출력한다.
    // 연산자를 어떻게 끼워넣어도 항상 -10억보다 크거나 같고, 10억보다 작거나 같은 결과가 나오는 입력만 주어진다. 또한, 앞에서부터 계산했을 때, 중간에 계산되는 식의 결과도 항상 -10억보다 크거나 같고, 10억보다 작거나 같다
    // int의 범위 -21 억 ~ 21억 -> int 형 변수를 쓰면된다.
    static int[] nums, operators, order;


    static void input() {
        FastReader scan = new FastReader();
        N = scan.nextInt();
        nums = new int[N + 1];
        operators = new int[5];
        order = new int[N + 1];
        for (int i = 1; i <= N; i++) nums[i] = scan.nextInt();
        for (int i = 1; i <= 4; i++) operators[i] = scan.nextInt();

        max = Integer.MAX_VALUE;
        min = Integer.MIN_VALUE;
    }


    static class FastReader {
        BufferedReader br;
        StringTokenizer st;

        public FastReader() {
            br = new BufferedReader(new InputStreamReader(System.in));
        }

        public FastReader(String s) throws FileNotFoundException {
            br = new BufferedReader(new FileReader(new File(s)));
        }

        String next() {
            while (st == null || !st.hasMoreElements()) {
                try {
                    st = new StringTokenizer(br.readLine());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return st.nextToken();
        }

        int nextInt() {
            return Integer.parseInt(next());
        }

        long nextLong() {
            return Long.parseLong(next());
        }

        double nextDouble() {
            return Double.parseDouble(next());
        }

        String nextLine() {
            String str = "";
            try {
                str = br.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return str;
        }
    }
    static int calculator() {
        // nums, order
        int value = nums[1];

        for (int i = 1; i <= N - 1; i++) {
            // nums + operators
            if (order[i] == 1) { // +
                value = value + nums[i+1];
            } else if (order[i] == 2) { // -
                value = value - nums[i + 1];
            } else if (order[i] == 3) { // *
                value = value * nums[i + 1];
            } else if (order[i] == 4) { // /
                value = value / nums[i + 1];
            }
        }
        return value;
    }


    // order[1....N-1]에 연산자들이 순서대로 저장될것입니다.
    static void rec_func(int k) {
        if (k == N) { // 모든 연산자들을 전부 나열하는 방법을 찾은 상태

            // 완성된 식에 맞게 계산을 해서 정답에 갱신하는 작업 -> 따로 함수로뺌
            int value = calculator();
            // 정한 연산자 순서대로 계산해서 정답을 갱신하기
            max = Math.max(max, value);
            min = Math.min(min, value);

        } else { // k 번째 연산자ㅏ는 무엇을 선택할 것인가?
            for (int cand = 1; cand <= 4; cand++) {

                // cand 번 연산자가 있는지 체크
                if (operators[cand] >= 1) {
                    // 사용했다 처리
                    operators[cand]--;
                    // k번재에 cand를 쓴다.
                    order[k] = cand;
                    // 4가지의 연산자들 중에 뭘 쓸 것인지 선택하고 재귀호출하기
                    rec_func(k + 1);

                    // 재귀함수 부르고 나서 다시 초기화
                    operators[cand]++;
                    order[k] = 0;
                }
            }
        }
    }

    public static void main(String[] args) {
        input();

        rec_func(1);

        sb.append(max).append("\n").append(min);
        System.out.println(sb.toString());


    }
}
