package 알고리즘.그래프.크루스칼알고리즘;

import java.util.HashMap;

public class UnionFind {
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
}
