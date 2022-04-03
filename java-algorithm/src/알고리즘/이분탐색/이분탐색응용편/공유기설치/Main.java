package 알고리즘.이분탐색.이분탐색응용편.공유기설치;

import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();

    // N 집의 개수 , C 공유기의 개수
    static int N, C;
    static int[] A;

    static void input() {

        N = scan.nextInt();
        C = scan.nextInt();
        A = new int[N+1];

        for (int i = 1; i <= N; i++) A[i] = scan.nextInt();

    }

    static boolean determination(int D) {
        // D 만큼의 거리 차이를 둔다면 C개 만큼의 공유기를 설치할 수 있는가 ?

        // 제일 왼쪽 집부터 가능한 많이 설치해보자!
        // D만큼의 거리를 두면서 최대로 설치한 개수와 C를 비교하자 .
        int cnt = 1, last = A[1]; // 1번집 설치
        for (int i = 2; i <= N; i++) {
            // 이번에 A[i] 번째 설치하려고해 설치가능한가?
            if (A[i] - last >= D) {
                cnt++;
                last = A[i];
            }
        }

        return cnt >= C;

    }


    static void pro() {
        // 원래문제 : C개의 공유기를 설치했을떄, 최대 인접 거리는 얼마인가 ?
        // 어떤 거리 만큼은 거리를 둘때 공유기 C개를 설치할수있는가?

        // determination을 빠르게 하기 위해서 정렬해주자.
        Arrays.sort(A, 1, N + 1);


        int L = 0, R = 1000000000, ans = 0;

        while (L <= R) {
            int mid = (L + R) / 2;

            if (determination(mid)) {
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
