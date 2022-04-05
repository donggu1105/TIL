package 알고리즘.연습;

import java.io.*;
import java.util.StringTokenizer;

public class Practice2 {

    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();
    // 중복 허용 ,순서 없음
    // 4개의 숫자중 2개로 이루어진 쌍을 구해라 여러번골라도되고, 순서도 없음  1, 1, 1, 2
    static int N, M;
    static int[] selected;

    static void input() {

        N = scan.nextInt();
        M = scan.nextInt();
        selected = new int[M + 1];

    }


    static void rec_func(int k) {

        if (k == M + 1) {
            for (int i = 1; i <= M; i++) sb.append(selected[i]).append(" ");
            sb.append("\n");
        } else {
            for (int cand = 1; cand <= N; cand++) {
                selected[k] = cand;
                rec_func(k + 1);
                selected[k] = 0;
            }
        }
    }

    public static void main(String[] args) {
        input();

        // 1부터 탐색해죠
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

