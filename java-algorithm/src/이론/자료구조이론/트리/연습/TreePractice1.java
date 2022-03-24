package 이론.자료구조이론.트리.연습;

public class TreePractice1 {



    public static class NodeMgmt {
        Node head = null;

        public static class Node {
            int value;
            Node left;
            Node right;

            public Node(int data) {
                this.value = data;
                this.left = null;
                this.right = null;
            }
        }
        public Node search(int data) {
            System.out.println("Test");
            // case 1: head가 없을떄
            if (this.head == null) {
                return null;
            } else {
                // case 2: 노드가 하나 이상 있을떄
                Node findNode = this.head;
                while (findNode != null) {
                    if (findNode.value == data) {
                        return findNode;
                    } else {
                        if (data < findNode.value) {
                            findNode = findNode.left;
                        } else {
                            findNode = findNode.right;
                        }
                    }
                }
            }
            return null;
        }
        public boolean insertNode(int data) {
            // CASE 1 : head is null
            if (this.head == null) {
                this.head = new Node(data);
            } else {
                // CASE 2 : 왼쪽에 들어 갈때
                Node findNode = this.head;
                while (true) {
                    if (data < findNode.value) {
                        if (findNode.left == null) {
                            findNode.left = new Node(data);
                            break;
                        } else {
                            findNode = this.head.left;
                        }
                    // CASE 3: 오른쪽에 들어갈때
                    } else {
                        if (findNode.right == null) {
                            findNode.right = new Node(data);
                            break;
                        } else {
                            findNode = this.head.right;
                        }
                    }
                }


            }
            return true;
        }
    }


    public static void main(String[] args) {
        NodeMgmt nodeMgmt = new NodeMgmt();

        System.out.println(nodeMgmt.insertNode(1));
        nodeMgmt.insertNode(2);
        nodeMgmt.insertNode(4);
        nodeMgmt.insertNode(16);

        nodeMgmt.search(2);
//        System.out.println(findNode.value);

    }
}
