package 알고리즘.완전탐색.완전탐색응용편;

import java.io.*;
import java.util.StringTokenizer;

public class 부분수열의합 {
    static StringBuilder sb = new StringBuilder();
    static FastReader scan = new FastReader();

    static int N, S, ans;
    static int[] nums;

    static void input() {
        N = scan.nextInt();
        S = scan.nextInt();
        nums = new int[N + 1];
        for (int i = 1; i <= N; i++) nums[i] = scan.nextInt();

    }
    // k번째 원소를 포함시킬지 정하는 함수
    // value:= k-1번째 원소까지 골라진 원소들의 합
    static void rec_func(int k, int value) {
        if (k == N + 1) { // 부분수열을 하나 완성시킨 상태
            // value 가 S랑 같은 지 확인하기
            if (value == S) ans++;
        } else {
            // k번째 원소를 포함시킬지 결정하고 재귀호출하기

            // 포함시키고 싶을떄
            rec_func(k + 1, value + nums[k]);
            // 포함시키고 싶지않을떄
            rec_func(k + 1, value);

        }

    }



    public static void main(String[] args) {
        input();
        // 1번째 원소부터 M번쟤 원소를 조건에 맞게 고르는 모든 방법을 탐색해줘
        rec_func(1, 0);
        // ans 가 정말 "진 부분집합" 만 다루는지 확인하기
        // 진부분집합이란 전체집합의 부분집합 중에서 자기 자신의 지합을 제외한 나머지 부분집합을 말한다.
          if (S == 0) {
            ans --;
        }
        System.out.println(ans);

    }


    static class FastReader {
        BufferedReader br;
        StringTokenizer st;

        public FastReader() {
            br = new BufferedReader(new InputStreamReader(System.in));
        }

        public FastReader(java.lang.String s) throws FileNotFoundException {
            br = new BufferedReader(new FileReader(new File(s)));
        }

        java.lang.String next() {
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

        java.lang.String nextLine() {
            java.lang.String str = "";
            try {
                str = br.readLine();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return str;
        }
    }

}
