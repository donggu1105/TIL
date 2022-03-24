package 이론.알고리즘이론.탐욕알고리즘;

import java.util.Arrays;
import java.util.Comparator;

public class DTOSort {


    public static void main(String[] args) {
        //  ** 보통 정렬하는 방법
//        Integer[] iArray = new Integer[]{1, 10, 4, 3, 2};
//        Arrays.sort(iArray);

        Edge edge1 = new Edge(10, "A");
        Edge edge2 = new Edge(15, "A");
        Edge edge3 = new Edge(12, "A");
        Edge[] edges = new Edge[]{edge1, edge2, edge3};

        Arrays.sort(edges, new Comparator<Edge>() {
            @Override
            public int compare(Edge o1, Edge o2) {
                return o2.distance - o1.distance;
            }
        });
        for (int index = 0; index < edges.length; index++) {
            System.out.println(edges[index].distance);
        }
    }

    public static class Edge implements Comparable<Edge> {
        public Integer distance;
        public String vertex;

        public Edge(Integer distance, String vertex) {
            this.distance = distance;
            this.vertex = vertex;
        }

        @Override
        public int compareTo(Edge e) {
            return this.distance - e.distance;
        }
    }
}
