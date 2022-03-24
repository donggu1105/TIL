package 이론.알고리즘이론.그래프.최단거리알고리즘;

import lombok.ToString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.PriorityQueue;

@ToString
public class Edge implements Comparable<Edge> {

    public int distance;

    public String vertex;

    public Edge(int distance, String vertex) {
        this.distance = distance;
        this.vertex = vertex;
    }


    @Override
    public int compareTo(Edge edge) {
        return this.distance - edge.distance;
    }

    public static void main(String[] args) {
        PriorityQueue<Edge> priorityQueue = new PriorityQueue<>();
        priorityQueue.add(new Edge(2, "A"));
        priorityQueue.add(new Edge(5, "B"));
        priorityQueue.add(new Edge(1, "C"));
        priorityQueue.add(new Edge(7, "D"));

        System.out.println(priorityQueue);
        Edge edge1 = priorityQueue.poll();
        System.out.println(edge1);
        System.out.println(priorityQueue);


        HashMap<String, ArrayList<Edge>> graph = new HashMap<String, ArrayList<Edge>>();
        graph.put("A", new ArrayList<Edge>(Arrays.asList(new Edge(8, "B"), new Edge(1, "C"), new Edge(2, "D"))));
        graph.put("B", new ArrayList<Edge>());
        graph.put("C", new ArrayList<Edge>(Arrays.asList(new Edge(5, "B"), new Edge(2, "D"))));
        graph.put("D", new ArrayList<Edge>(Arrays.asList(new Edge(3, "E"), new Edge(5, "F"))));
        graph.put("E", new ArrayList<Edge>(Arrays.asList(new Edge(1, "F"))));
        graph.put("F", new ArrayList<Edge>(Arrays.asList(new Edge(5, "A"))));

        System.out.println(graph);

        for (String key : graph.keySet()) {

        }
    }
}
