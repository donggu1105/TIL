package 알고리즘.완전탐색;

// https://www.acmicpc.net/problem/15651
import java.io.*;
import java.util.StringTokenizer;
// 중복허용안하고 수열
public class 완전탐색2 {
    static StringBuilder sb = new StringBuilder();

    static void input() {
        FastReader scan = new FastReader();
        N = scan.nextInt();
        M = scan.nextInt();
        selected = new int[M + 1];
    }

    static int N, M;
    static int[] selected, used;
    // 4, 3
    static void rec_func(int k) {
        if (k == M + 1) { // 다 골랐다.
            // selected[1...M] 배열이 새롭게 탐색된 결과
            for (int i = 1; i <= M; i++) sb.append(selected[i]).append(' ');
            sb.append("\n");
        } else {

            // ====== for 문 추가해서 하는거 =====
            // 1 ~ N 까지를 k번 원소로 한번씩 정하고
            // 매번 k+1 번부터 M번 원소로 재귀호출 해주기
//            for (int cand = 1; cand <= N; cand++) {
//
//                // 중복허용안함 -> 중복있는지 확인하는 코드 (이렇게하면 for문이 하나늘어남)
//                boolean isUsed = false;
//                for (int i = 0; i < k; i++) {
//                    if (cand == selected[i]) {
//                        isUsed = true;
//                    }
//                }
//
//                if (!isUsed) {
//                    selected[k] = cand;
//                    // k+1번  ~ M 번 을 모두 탐색하는 일을 해야하는 상황
//                    rec_func(k+1);
//                    selected[k] = 0;
//                }
            // ======

            // used라는 배열하나 생성 (인덱스의 0 이나 1로 쓰였는지 안쓰였는지 구분)
            for (int cand = 1; cand <= N; cand++) {
                if (used[cand] == 1) continue;
                // k번째에 cand가 올수 있으면
                selected[k] = cand; used[cand] = 1;

                rec_func(k + 1);
                // used[cand] = 0; 이거하는걸 자주 까먹음 항상 재귀호출할때는 하기전과 하기후에 사용한것과 안한것에대한 처리가 분명해야함
                selected[k] = 0;    used[cand] = 0;

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
