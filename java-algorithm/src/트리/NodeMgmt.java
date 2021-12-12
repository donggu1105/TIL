package 트리;

public class NodeMgmt {
    Node head = null;

    public class Node {
        int value;
        Node left;
        Node right;

        public Node(int value) {
            this.value = value;
            this.left = null;
            this.right = null;
        }
    }

    public boolean insertNode(int data) {
        // Case 1 : node가 하나도 없을때
        if (this.head == null) {
            this.head = new Node(data);
        } else {
            // Case 2: node가 하나 이상 들어가 있을때
            Node findNode = this.head;
            while (true) {
                // Case 2-1 : 현재 node의 왼쪽에 들어가야할 경우
                if (data < findNode.value) {
                    if (findNode.left != null) {
                        findNode = findNode.left;
                    } else {
                        findNode.left = new Node(data);
                        break;
                    }
                } else {
                // Case 2-2 : 현재 node의 오른쪽에 들어가야할 경우
                    if (findNode.right != null) {
                        findNode = findNode.right;
                    } else {
                        findNode.right = new Node(data);
                        break;
                    }
                }
            }
        }
        return true;
    }

    public Node search(int data) {

        // Case 1: node 가 하나도 없을때
        if (this.head == null) {
            return null;
        // Case 2: node 가 하나 이상 있을떄
        } else {
            Node findNode = this.head;
            while (findNode != null) {
                if (findNode.value == data) {
                    return findNode;
                } else {
                    if (findNode.value > data) {
                        findNode = findNode.left;
                    } else {
                        findNode = findNode.right;
                    }
                }
            }
            return null;
        }
    }

    public boolean delete(int value) {

        boolean searched = false;

        Node currParentNode = this.head;
        Node currNode = this.head;

        // 예외 케이스 1: node 가 하나도 없을떄
        if (this.head == null) {
            return false;
        // 예외 케이스 2: node 가 단지 하나만 있고 해당 node 가 삭제할 node 일때
        } else {
            if (this.head.value == value && this.head.left == null && this.head.right == null) {
                this.head = null;
                return true;
            }
            }

        while (currNode != null) {
            if (currNode.value == value) {
                searched = true;
                break;
            } else if (value < currNode.value) {
                currParentNode = currNode;
                currNode = currNode.left;
            } else {
                currParentNode = currNode;
                currNode = currNode.right;
            }
        }

        if (!searched) {
            return false;
        }
        // 찾은 노드가 leaf node 일 경우
        if (currNode.left == null && currNode.right == null) {
            if (value < currParentNode.value) {
                currParentNode.left = null;
                currNode = null;
            } else {
                currParentNode.right = null;
                currNode = null;
            }
            return true;
            // 삭제할 node가 childNode를 한개라도 가지고 있을 경우
        } else if (currNode.left != null && currNode.right == null) {
            // 왼쪽에 있을경우
            if (value < currParentNode.value) {
                currParentNode.left = currNode.left;
                currNode = null;
            } else {
                currParentNode.right = currNode.left;
                currNode = null;
            }
            return true;
        } else if (currNode.left == null && currNode.right != null) {
            // 오른쪽에 있을경우
            if (value < currParentNode.value) {
                currParentNode.left = currNode.right;
                currNode = null;
            } else {
                currParentNode.right = currNode.left;
                currNode = null;
            }
            return true;
            // 삭제할 노드가 child node를 두개 가지고있을 경우
            // 전략 : 삭제할 Node의 오른쪽 자식 중, 가장 작은 값을 삭제할 Node의 Parent Node가 가리키도록 한다.
        } else {
            // 삭제할 노드가 왼쪽일떄
            if (value < currParentNode.value) {
                Node changeNode = currNode.right;
                Node changeParentNode = currNode.right;
                while (changeNode.left != null) {
                    changeParentNode = changeNode;
                    changeNode = changeNode.left;
                }

                // 여기까지 실행되면 , changeNode에는 삭제할 node의 오른쪽 node중에서 , 가장 작은값을 가진 Node가 들어있음
                // changeNode의 childeNode가 있을떄
                if (changeNode.right != null) {
                    changeParentNode.left = changeNode.right;
                // changeNode의 childeNode가 없을떄
                } else {
                    changeParentNode.left = null;
                }

                // currParentNode 의 왼쪽이 child Node에 삭제할 node의 오른쪽 자식중, 가장 작은 값을가진 changeNode를 연결
                currParentNode.left = changeNode;
                // parentNode 의 왼쪽 Child Node 가 현재 changeNode이고 changeNode의 왼쪽 오른쪽 childNode를 모두 삭제하고 currNoide
                changeNode.left = currNode.left;
                changeNode.right = currNode.right;

                currNode = null;
            // 삭제할 노드가 오른쪽일때
            } else {

                Node changeNode = currNode.right;
                Node changeParentNode = currNode.right;
                while (changeNode.left != null) {
                    changeParentNode = changeNode;
                    changeNode = changeNode.left;
                }

                // 여기까지 실행되면 , changeNode에는 삭제할 node의 오른쪽 node중에서 , 가장 작은값을 가진 Node가 들어있음
                // changeNode의 childeNode가 있을떄
                if (changeNode.right != null) {
                    changeParentNode.left = changeNode.right;
                    // changeNode의 childeNode가 없을떄
                } else {
                    changeParentNode.left = null;
                }


                // currParentNode 의 오른쪽이 child Node에 삭제할 node의 오른쪽 자식중, 가장 작은 값을가진 changeNode를 연결
                currParentNode.right = changeNode;
                // parentNode 의 왼쪽 Child Node 가 현재 changeNode이고 changeNode의 왼쪽 오른쪽 childNode를 모두 삭제하고 currNoide
                changeNode.left = currNode.left;
                changeNode.right = currNode.right;

                currNode = null;

            }

        }
        return true;
    }
}
