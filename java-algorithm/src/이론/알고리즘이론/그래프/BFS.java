package 이론.알고리즘이론.그래프;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

// Breadth First Search
public class BFS {

    public ArrayList<String> bfsFunc(HashMap<String, ArrayList<String>> graph, String startNode) {
        ArrayList<String> visited = new ArrayList<>();
        ArrayList<String> needVisit = new ArrayList<>();

        needVisit.add(startNode);
        int count = 0;
        while (needVisit.size() > 0) {
            count += 1;
            String node = needVisit.remove(0);
            // 방문했었냐
            if (!visited.contains(node)) {
                visited.add(node);
                needVisit.addAll(graph.get(node));
            }
        }
        System.out.println("count : "+ count);
        return visited;
    }
    public static void main(String[] args) {

        HashMap<String, ArrayList<String>> graph = new HashMap<>();

        graph.put("A", new ArrayList<String>(Arrays.asList("B", "C")));
        graph.put("B", new ArrayList<String>(Arrays.asList("A", "D")));
        graph.put("C", new ArrayList<String>(Arrays.asList("A", "G", "H", "I")));
        graph.put("D", new ArrayList<String>(Arrays.asList("B", "E", "F")));
        graph.put("E", new ArrayList<String>(Arrays.asList("D")));
        graph.put("F", new ArrayList<String>(Arrays.asList("D")));
        graph.put("G", new ArrayList<String>(Arrays.asList("C")));
        graph.put("H", new ArrayList<String>(Arrays.asList("C")));
        graph.put("I", new ArrayList<String>(Arrays.asList("C", "J")));
        graph.put("J", new ArrayList<String>(Arrays.asList("I")));


        System.out.println(graph);

        BFS bObject = new BFS();

        System.out.println(bObject.bfsFunc(graph, "A"));

    }
}
