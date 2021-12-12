package 자료구조.해쉬테이블;

public class MyChaningHash {

    public Slot[] hashTable;

    public MyChaningHash(Integer size) {
        this.hashTable = new Slot[size];
    }

    /*
     * 해쉬 충돌을 막기위한 2가지 기법
     * 1. Chaning 기법 - 저장공간이 채워져있으면 , 링크드리스트로 연결
     * 2. Linear Probing 기법 - 폐쇄 해싱 , 저장공간이 있으면 다음 빈공간을 찾아서 넣어줌
     * */
    public class Slot {
        String key;
        String value;
        Slot next;

        Slot(String key, String value) {
            this.key = key;
            this.value = value;
            this.next = null;
        }
    }

    public Integer hashFunc(String key) {
        return (int) (key.charAt(0)) % this.hashTable.length;
    }

    public boolean saveData(String key, String value) {
        Integer address = this.hashFunc(key);

        // 해당 주소가 있다.
        if (this.hashTable[address] != null) {
            // head 부터 설정
            Slot findSlot = this.hashTable[address];
            Slot prevSlot = this.hashTable[address];

            while (findSlot != null) {
                if (findSlot.key.equals(key)) {
                    findSlot.value = value;
                    return true;
                } else {
                    prevSlot = findSlot;
                    findSlot = findSlot.next;
                }
            }
            prevSlot.next = new Slot(key, value);
        } else {
            // 주소가 없다.
            this.hashTable[address] = new Slot(key, value);

        }
        return true;
    }

    public String getData(String key) {
        Integer address = this.hashFunc(key);
        if (this.hashTable[address] != null) {
            // 주소가 있다.
            Slot findSlot = this.hashTable[address];
            while (findSlot != null) {
                if (findSlot.key.equals(key)) {
                    return findSlot.value;
                } else {
                    findSlot = findSlot.next;
                }
            }
            return null;
        } else {
            return null;
        }
    }
}


