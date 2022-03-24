package 이론.자료구조이론.힙;

import java.util.ArrayList;
import java.util.Collections;

public class Heap {
    public ArrayList<Integer> heapArray = null;

    public Heap(Integer data) {
        heapArray = new ArrayList<Integer>();
        // 계산복잡도를 덜기위해서
        heapArray.add(null);
        heapArray.add(data);
    }

    public boolean moveUp(Integer inserted_idx) {
        if (inserted_idx <= 1) {
            return false;
        } else {
            Integer parent_idx = inserted_idx / 2;
            if (this.heapArray.get(inserted_idx) > this.heapArray.get(parent_idx)) {
                return true;
            } else {
                return false;
            }
        }
    }
    public boolean insert(Integer data) {
        Integer inserted_idx, parent_idx;

        if (heapArray == null) {
            heapArray = new ArrayList<Integer>();
            // 계산복잡도를 덜기위해서
            heapArray.add(null);
            heapArray.add(data);
            return true;
        } else {
            heapArray.add(data);
            inserted_idx = this.heapArray.size() - 1;

            while (this.moveUp(inserted_idx)) {
                parent_idx = inserted_idx / 2;
                Collections.swap(this.heapArray, inserted_idx, parent_idx);
                inserted_idx = parent_idx;
            }

            return true;
        }
    }

    public Integer pop() {
        Integer returnedData, poppedIdx, leftChildPoppedIdx, rightChildPoppedIdx;
        if (this.heapArray == null) {
            return null;
        } else {
            returnedData = this.heapArray.get(1);
            // 마지막 노드로 set -> 루트노드만 마지막노드로 바뀜
            this.heapArray.set(1, this.heapArray.get(this.heapArray.size() - 1));
            this.heapArray.remove(this.heapArray.size() - 1);
            poppedIdx = 1;

            while (this.moveDown(poppedIdx)) {
                leftChildPoppedIdx = poppedIdx * 2;
                rightChildPoppedIdx = poppedIdx * 2 + 1;

                // case 2: 오른쪽 자식 노드만 없을떄
                if (rightChildPoppedIdx >= this.heapArray.size()) {
                    if (this.heapArray.get(poppedIdx) < this.heapArray.get(leftChildPoppedIdx)) {
                        Collections.swap(this.heapArray, poppedIdx, leftChildPoppedIdx);
                        poppedIdx = leftChildPoppedIdx;
                    }
                // case 3: 왼쪽/오른쪽 자식 노드가 있을때
                } else {
                    if (this.heapArray.get(leftChildPoppedIdx) > this.heapArray.get(rightChildPoppedIdx)) {
                        if (this.heapArray.get(poppedIdx) < this.heapArray.get(leftChildPoppedIdx)) {
                            Collections.swap(this.heapArray, poppedIdx, leftChildPoppedIdx);
                            poppedIdx = leftChildPoppedIdx;
                    } else {
                        if (this.heapArray.get(poppedIdx) < this.heapArray.get(rightChildPoppedIdx)) {
                            Collections.swap(this.heapArray, poppedIdx, rightChildPoppedIdx);
                            poppedIdx = rightChildPoppedIdx;
                    }}
                    }
                }

            }


            return returnedData;
        }

    }

    public boolean moveDown(Integer popped_idx) {
        Integer leftChildPoppedIdx, rightChildPoppedIdx;

        leftChildPoppedIdx = popped_idx * 2;
        rightChildPoppedIdx = popped_idx * 2 + 1;

        // case 1 : 왼쪽 자식 노드가 없을때 (자식 노드가 하나도 없을떄 )
        if (leftChildPoppedIdx >= this.heapArray.size()) {
            return false;
        // case 2: 오른쪽 자식 노드만 없을떄
        } else if (rightChildPoppedIdx >= this.heapArray.size()) {
            if (this.heapArray.get(popped_idx) < this.heapArray.get(leftChildPoppedIdx)) {
                return true;
            } else {
                return false;
            }
        // case 3: 왼쪽/오른쪽 자식노드가 모두 있을떄
        } else {
                if (this.heapArray.get(leftChildPoppedIdx) > this.heapArray.get(rightChildPoppedIdx)) {
                    if (this.heapArray.get(popped_idx) < this.heapArray.get(leftChildPoppedIdx)) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    if (this.heapArray.get(popped_idx) < this.heapArray.get(rightChildPoppedIdx)) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        }
    }
