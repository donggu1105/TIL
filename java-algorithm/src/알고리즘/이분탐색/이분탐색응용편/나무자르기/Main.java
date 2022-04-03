package 알고리즘.이분탐색.이분탐색응용편.나무자르기;

import java.io.*;
import java.util.StringTokenizer;
public class Main {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();
    // 나무의 수 N , 나무의 길이 M
    static int N, M;
    // 나무의 높이들
    static int[] trees;

    static void input() {

        N = scan.nextInt();
        M = scan.nextInt();
        trees = new int[N+1];

        for (int i = 1; i <= N; i++) trees[i] = scan.nextInt();

    }

    static boolean determination(int H) {
        // H 높이로 나무들을 잘랐을 떄, M 만큼을 얻을수 있으면 , true 없으면 false를 return 하는함수
        long sum = 0; // important: long으로 설정하는게 진짜 중요!!!!!!!!!!!!!!!!!!

        for (int i = 1; i <= N; i++) {
            if (trees[i] > H) {
                sum += trees[i] - H;
            }
        }
        return sum >= M;
    }


    static void pro() {
        // 즉, 계산 과정주의 변수타입은 long 으로
        // 설정할수있느 높이의 최댓값 -> 매개변수 정렬이 아닐까?! (parametric search)

        // 매개변수를 만들어야함, 조건과 타겟을 뒤집는다.
        // 원래문제: 원한는 길이 M 만큼을 얻을수있는 최대높이는 얼마인가? -> 어떤 높이로 잘랐는데 원하는 길이 M 만큼을 얻을수있는가 ?

        long L = 0, R = 2000000000, ans = 0;
        // [L.....R] 범위안에 정답이 존재한다.
        // 이분 탐색과 determination 문제를 이용해서 answer를 빠르게 구하자.
        while (L <= R) {
            long mid = (L + R) / 2;
            if (determination((int) mid)) {
                ans = mid;
                L = mid + 1;
            } else {
                R = mid - 1;
            }
        }

        System.out.println(ans);
    }

    public static void main(String[] args) {
        input();
        pro();
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
}
