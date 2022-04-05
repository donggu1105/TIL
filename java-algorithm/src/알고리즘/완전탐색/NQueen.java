package 알고리즘.완전탐색;


import java.io.*;
import java.util.StringTokenizer;

// 유명한 백트래킹 문제
public class NQueen {
    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();
    // ======== 하나씩 N의 M 승 시간복잡도로 구현했을떄
    static int N, ans;
    static int[] col; // col[i] : i번 행의 퀸은 col[i]번 열에 놓았다느 기록

    static void input() {
        N = scan.nextInt();
        col = new int[N + 1];
    }

    static boolean attackable(int r1, int c1, int r2, int c2) {
        if (c1 == c2) return true;
        if (r1+c1 == r2+c2) return true;
        if (r1-c1 == r2-c2) return true;

        return false;
    }
    static boolean validity_check() {
        for (int i = 1; i <= N; i++) {
            // 좌표는 (i, col[i])
            for (int j = 1; j < i; j++) {
                // i 보다 위에있는 퀸들에 대해서
                if (attackable(i, col[i], j, col[j])) { // 공격 가능하면,
                    return false;
                }
            }
        }
    return true;
    }


    // row 번 ~ N 번 행에 대해서 가능한 퀸을 놓는 경우의 수 구하기
    static void rec_func(int row) {
        if (row == N + 1) { // 각행마다 잘 놓았다면,
                ans++;
        } else {
            for (int c = 1; c <= N; c++) {
                // valid check (row, c)
                boolean possible = true;
                for (int i = 1; i <= row - 1; i++) {
                    // (i, col[i]) 좌표
                    if (attackable(row, c, i, col[i])) {
                        possible = false;
                        break;
                    }
                }

                if (possible) {
                    col[row] = c;
                    rec_func(row + 1);
                    col[row] = 0;
                }
            }
        }
    }

    public static void main(String[] args) {
        input();
        rec_func(1);
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
