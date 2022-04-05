package 알고리즘.연습;


import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Practice {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();

    // 중복 O , 순서 X
    // 사람이 어떻게 모든원소를 탐색할수있을까 ?
    // 1,1,1  -> 1, 1, 2 ->

    // 만약 M 개를 전부 고름 => 조건에 맞는 탐색을 한가지 성공한 것
    // 아직 M 개를 고르지 않음 => k 번째부터 M번째 원소를 조건에 맞게 고르는 모든 방법을 시도한다.
    static int N, M;
    static int[] selected;

    static void input() {

        N = scan.nextInt();
        M = scan.nextInt();

        selected = new int[M + 1];
    }


    static void rec_func(int k) {

        if (k == M + 1) {
            // 다골랐다 -> 더 이상 탐색할 필요없다.
            // print selected
            for (int i = 1; i <= M; i++) sb.append(selected[i]).append(' ');
            sb.append('\n');
        } else {
            // 1 ~ N 까지를 k 번 원소로 한번씩 정하고,
            // 매번 k +1번부터 M 번 원소로 재귀호출 해주기
            for (int cand = 1; cand <= N; cand++) {
                selected[k] = cand;
                // k+1번 ~ M번을 모두 탐색할일이 남음
                rec_func(k + 1);
                // 지워주기
                selected[k] = 0;
            }
        }
    }

    public static void main(String[] args) {
        input();
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
