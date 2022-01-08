package 알고리즘.동적계획법과분할정복;

public class Dynamic {
    // 동적 계획 법
    public int dynamicFunc(int data) {
        Integer[] cache = new Integer[data + 1];
        // 제일 작은 값 저장
        cache[0] = 0;
        cache[1] = 1;
        // 배열로 저장
        for (int index = 2; index < data + 1; index++) {
            cache[index] = cache[index - 1] + cache[index - 2];
        }

        return cache[data];
    }

    public static void main(String[] args) {

    }
}
