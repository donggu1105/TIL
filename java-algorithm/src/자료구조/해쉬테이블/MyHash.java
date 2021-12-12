package 자료구조.해쉬테이블;

public class MyHash {

    public Slot[] hashTable;

    public MyHash(Integer size) {
        this.hashTable = new Slot[size];
    }

    public class Slot {
        String value;

        Slot(String value) {
            this.value = value;
        }
    }

    public Integer hashFunc(String key) {
        return (int) (key.charAt(0)) % this.hashTable.length;
    }

    public boolean saveData(String key, String value) {
        Integer address = this.hashFunc(key);

        if (this.hashTable[address] != null) {
            this.hashTable[address].value = value;
        } else {
            this.hashTable[address] = new Slot(value);

        }
        return true;
    }

    public String getData(String key) {
        Integer address = this.hashFunc(key);
        if (this.hashTable[address] != null) {
            return this.hashTable[address].value;
        } else {
            return null;
        }
    }

    /*
    * 해쉬 충돌을 막기위한 2가지 기법
    * 1. Chaning 기법 - 저장공간이 채워져있으면 , 링크드리스트로 연결
    * 2. Linear Probing 기법 - 폐쇄 해싱 , 저장공간이 있으면 다음 빈공간을 찾아서 넣어줌
    * */


}


