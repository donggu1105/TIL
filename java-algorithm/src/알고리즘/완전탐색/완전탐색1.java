package 알고리즘.완전탐색;

// https://www.acmicpc.net/problem/15651
import java.io.*;
import java.util.StringTokenizer;

public class 완전탐색1 {
    static StringBuilder sb = new StringBuilder();

    static void input() {
        FastReader scan = new FastReader();
        N = scan.nextInt();
        M = scan.nextInt();
        selected = new int[M + 1];
    }

    static int N, M;
    static int[] selected;
    // N = 4, M = 2

    // 11 12
    static void rec_func(int k) {
        if (k == M + 1) { // 다 골랐다.
            // selected[1...M] 배열이 새롭게 탐색된 결과
            for (int i = 1; i <= M; i++) sb.append(selected[i]).append(' ');
            sb.append("\n");
        } else {
            // 1 ~ N 까지를 k번 원소로 한번씩 정하고
            // 매번 k+1 번부터 M번 원소로 재귀호출 해주기
            for (int cand = 1; cand <= N; cand++) {
                selected[k] = cand;
                // k+1번  ~ M 번 을 모두 탐색하는 일을 해야하는 상황
                rec_func(k+1);
                selected[k] = 0;

            }
        }
    }

    public static void main(String[] args) {
        // 입력을 받는 함수
        input();
        // 문제를 푸는 함수로 나눔
        // 1번째 원소부터 M번째 원소를 조건에 맞는 모든 방법을 찾아줘
        rec_func(1);
        System.out.println(sb.toString());


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
