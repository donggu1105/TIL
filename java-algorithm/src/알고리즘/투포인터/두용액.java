package 알고리즘.투포인터;

import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;

public class 두용액 {

    static StringBuilder sb = new StringBuilder();
    static FastReader scan = new FastReader();

    static int N;
    static int[] A;

    static void input() {
        N = scan.nextInt();
        A = new int[N + 1];
        for (int i = 1; i <= N; i++) {
            A[i] = scan.nextInt();
        }
    }

    static void pro() {
        // A에 대해 이분 탐색을 할 예정이니까 정렬을 미리 해주자
        Arrays.sort(A, 1, N + 1);

        int best_sum = Integer.MAX_VALUE;
        int v1 = 0, v2 = 0, L = 1, R = N;

        while (L < R) { // L == R 인 상황이면 용액이 한개 뿐인 것이므로 L < R 일때까지만 반복한다.
            int sum = A[L] + A[R];
            if (Math.abs(sum) < best_sum) {
                best_sum = Math.abs(sum);
                v1 = A[L];
                v2 = A[R];
            }

            if (sum > 0) {
                R--; // sum이 음수면 R을 볼 가치가 없었다.
            } else {
                L ++; // 그반대면 L을 볼 가치가 없었다.
            }

        }
        sb.append(v1).append(' ').append(v2);
        System.out.println(sb);

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

    public static void main(String[] args) {
        input();
        pro();
    }
}
