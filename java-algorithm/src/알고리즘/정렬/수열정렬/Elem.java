package 알고리즘.정렬.수열정렬;

import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Elem implements Comparable<Elem> {

    static FastReader scan = new FastReader();
    static StringBuilder sb = new StringBuilder();

    /**
     * @param idx A 배열의 idx 위치를 기억하는 변수
     * @param num A[idx]의 원래 값
     */
    public int num, idx;

    @Override
    public int compareTo(Elem other) {
        // ToDo
        // 정렬 조건에 맞게 정렬하기
        // 1. num의 비내림 차순
        // 2. num이 같으면 idx 오름차순

//        if (num != other.num) return num - other.num;

        // 같으면 idx 순서로 오름차순
        // java 라서 팀 sort? 그게되서 따로 비교 필요없음
//        return idx - other.idx;

        return num - other.num;

    }

    static int N;
    static int[] P;
    static Elem[] B;
    static void input() {
        N = scan.nextInt();
        B = new Elem[N];
        P = new int[N];

        for (int i = 0; i < N; i++) {
            B[i] = new Elem();
            // TODO: Elem의 정의에 맞게 B[i]에 값을 넣어주기
            B[i].num = scan.nextInt();
            B[i].idx = i;
        }
    }

    static void pro() {
        // ToDo : B 배열 정렬하기
        Arrays.sort(B);

        // ToDo : B 배열의 값을 이용해서 P배열 채우기
        for (int b_idx = 0; b_idx < N; b_idx++) {
            P[B[b_idx].idx] = b_idx;
        }
        // ToDo : P 배열 출력하기
        for (int i = 0; i < N; i++) {
            sb.append(P[i]).append(" ");
        }

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


