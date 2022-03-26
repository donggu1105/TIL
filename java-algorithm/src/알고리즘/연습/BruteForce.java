// https://www.acmicpc.net/problem/15651
package 알고리즘.연습;

import com.sun.org.apache.xpath.internal.operations.String;

import java.io.*;
import java.util.StringTokenizer;


/*
* 문제
자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

1부터 N까지 자연수 중에서 M개를 고른 수열
같은 수를 여러 번 골라도 된다.  -> 중복가능
입력
첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

출력
한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

수열은 사전 순으로 증가하는 순서로 출력해야 한다.
*
* input 4 2
*
* output
* 1 1
* 1 2
* 1 3
* 1 4
* 2 1
* */
public class BruteForce {
    static StringBuilder sb = new StringBuilder();

    static void input() {
        FastReader scan = new FastReader();
        N = scan.nextInt();
        M = scan.nextInt();
        selected = new int[M + 1];
    }

    static int N, M;
    static int[] selected;

    static void rec_func(int k) {
        if (k == N + 1) { // N번째 다써서 이제 출력해야함
            for (int i = 1; i <=M; i++) sb.append(selected[i]).append(" ");
            sb.append("\n");

        } else {
            for (int i = 1; i <= N; i++) {
                selected[k] = i;
                rec_func(k+1);
                selected[k] = 0;

            }
        }
    }

    public static void main(String[] args) {
        // input
        input();

        // recursive function
        rec_func(1);
        // output
        System.out.println(sb.toString());


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
