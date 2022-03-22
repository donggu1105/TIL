package 알고리즘.그래프.크루스칼알고리즘;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class Edge implements Comparable<Edge>{

    public int weight; // 간선 거리
    public String nodeV; // 연결된 node 1
    public String nodeU; // 연결된 Node 2

    public Edge(int weight, String nodeV, String nodeU) {
        this.weight = weight;
        this.nodeV = nodeV;
        this.nodeU = nodeU;
    }

    @Override
    public String toString() {
        return "Edge{" +
                "weight=" + weight +
                ", nodeV='" + nodeV + '\'' +
                ", nodeU='" + nodeU + '\'' +
                '}';
    }

    @Override
    public int compareTo(Edge o) {
        return this.weight - o.weight;
    }

    public static void main(String[] args) {
        ArrayList<String> vetices = new ArrayList<String>(Arrays.asList("A", "B", "C", "D", "E", "F", "G"));
        ArrayList<Edge> myedges = new ArrayList<Edge>();
        myedges.add(new Edge(7, "A", "B"));
        myedges.add(new Edge(5, "A", "D"));
        myedges.add(new Edge(8, "B", "C"));
        myedges.add(new Edge(9, "B", "D"));
        myedges.add(new Edge(7, "D", "E"));
        myedges.add(new Edge(5, "C", "E"));
        myedges.add(new Edge(7, "B", "E"));
        myedges.add(new Edge(6, "D", "F"));
        myedges.add(new Edge(8, "E", "F"));
        myedges.add(new Edge(9, "E", "G"));
        myedges.add(new Edge(11, "F", "G"));

//        System.out.println(vetices);
//        System.out.println(myedges);




    }

}
