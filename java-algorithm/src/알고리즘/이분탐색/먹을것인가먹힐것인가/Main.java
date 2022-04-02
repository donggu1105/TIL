package 알고리즘.이분탐색.먹을것인가먹힐것인가;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;

public class Main {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();

    static int T, N, M;

    static int[] A;
    static int[] B;

    static void input() {

        T = scan.nextInt();
        N = scan.nextInt();
        M = scan.nextInt();

        A = new int[N+1];
        B = new int[M+1];

        for (int i = 1; i <= N; i++) A[i] = scan.nextInt();
        for (int i = 1; i <= M; i++) B[i] = scan.nextInt();
    }

    static int lower_bound(int[] A, int L, int R, int X) {
        // A[L...R]에서 X 미만의 수 (X보다 작은 수) 중 제일 오른쪽 인덱스를 return 하는 함수
        // 그런게 없다면 L - 1을 return 한다.
        int result = L-1;
        while (L <= R) {
            int mid = (L + R) / 2;
            if (A[mid] < X) {
                result = mid;
                L = mid + 1;
            } else if (A[mid] >= X) {
                R = mid - 1;
            }
        }
        return result;
    }
    static void pro() {
        // B 배열에 대해 이분탐색을 하예정이니까 , 정렬을 해주자
        // TODO: b 정렬
        Arrays.sort(B, 1, M +1);

        int ans = 0;

        for (int i = 1; i <= N; i++) {
            // A[i] 를 선택했을떄, B에서는 A[i]보다 작은게 몇개나 있는지 count 하기
            ans += lower_bound(B, 1, M, A[i]);
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
