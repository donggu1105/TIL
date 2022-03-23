package 알고리즘.그래프.크루스칼알고리즘;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

public class Edge implements Comparable<Edge>{

    public int weight; // 간선 거리
    public String nodeV; // 연결된 node 1
    public String nodeU; // 연결된 Node 2

    // union-find 알고리즘
    HashMap<String, String> parent = new HashMap<>();
    HashMap<String, Integer> rank = new HashMap<>();


    public String find(String node) {

        // 최상위루트 return 하기
        if (parent.get(node) != node) {
            parent.put(node, find(parent.get(node)));
        }

        return parent.get(node);
    }


    public void union(String nodeV, String nodeU) {
        String root1 = find(nodeV);
        String root2 = find(nodeU);

        // union-by-rank 기법 : 1. 높이가 다르면 큰쪽에 붙어라. / 2. 높이가 같으면 한쪽을 높이고 붙혀라
        if (rank.get(root1) > rank.get(root2)) {
            // root1이 랭크가 더 높을떄
            parent.put(root2, root1);
        } else {
            parent.put(root1, root2);

            if (rank.get(root1) == rank.get(root2)) {
                rank.put(root2, rank.get(root2) + 1);
            }
        }
    }

    public void makeSet(String node) {
        parent.put(node, node);
        rank.put(node, 0);
    }

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

    public ArrayList<Edge> kruskalFunc(ArrayList<String> vetices, ArrayList<Edge> edges) {
        ArrayList<Edge> mst = new ArrayList<Edge>();
        Edge currentEdge;
        int weight;
        String nodeV, nodeU;

        // init
        for (int index = 0; index < vetices.size(); index++) {
            makeSet(vetices.get(index));
        }

        // 간선 weight 기반, sorting
        Collections.sort(edges);

        for (int index = 0; index < edges.size(); index++) {
            currentEdge = edges.get(index);
            if (find(currentEdge.nodeV) != find(currentEdge.nodeU)) {
                union(currentEdge.nodeU, currentEdge.nodeV);
                mst.add(currentEdge);
            }
        }
        return mst;
    }

}
