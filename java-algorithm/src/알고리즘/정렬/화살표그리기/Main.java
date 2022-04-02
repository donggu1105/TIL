package 알고리즘.정렬.화살표그리기;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;

public class Main {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();

    static int N;
    static ArrayList<Integer>[] a;

    static void input() {
        N = scan.nextInt();
        a = new ArrayList[N + 1];


        for (int color = 1; color <= N; color++) {
            a[color] = new ArrayList<Integer>();
        }

        for (int i = 1; i <= N; i++) {
            int coord, color;
            coord = scan.nextInt();
            color = scan.nextInt();
            // TODO: color인 색깔의 점이 coord에 놓여있음
            a[color].add(coord);
        }

    }

    static int toLeft(int color, int idx) {
        // TODO
        // 색깔이 color 인 점의 idx 번째에 있는 점이 왼쪽으로 화살표를 그린다면
        // 화살표의 길이를 return 하는 함수. 왼쪽에 점이 없다면 무한대를 return
        if (idx == 0) return Integer.MAX_VALUE;

        return a[color].get(idx) - a[color].get(idx - 1);
    }

    static int toRight(int color, int idx) {
        // TODO
        // 색깔이 color 인 점의 idx 번째에 있는 점이 오른쪽으로 화살표를 그린다면
        // 화살표의 길이를 return 하는 함수. 왼쪽에 점이 없다면 무한대를 return
        if (idx + 1 == a[color].size()) return Integer.MAX_VALUE;

        return a[color].get(idx) - a[color].get(idx + 1);

    }

    static void pro() {
        // TODO: 색깔별로 정렬하기
        for (int color = 1; color <= N; color++) {
            Collections.sort(a[color]);

        }
        int ans = 0;

        for (int color = 1; color <= N; color++) {
            // TODO: 색깔 별로, 각 점마다 가장 가까운 점 찾아주기
            for (int i = 0; i < a[color].size(); i++) {
                // 왼쪽점까지의 거리
                int left = toLeft(color, i);
                // 오른쪽 점 까지의 거리
                int right = toRight(color, i);

                ans += Math.min(left, right);
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
