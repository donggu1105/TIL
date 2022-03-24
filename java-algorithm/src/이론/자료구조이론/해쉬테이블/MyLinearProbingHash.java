package 이론.자료구조이론.해쉬테이블;

public class MyLinearProbingHash {

    public Slot[] hashTable;

    public MyLinearProbingHash(Integer size) {
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

        Slot(String key, String value) {
            this.key = key;
            this.value = value;
        }
    }

    public Integer hashFunc(String key) {
        return (int) (key.charAt(0)) % this.hashTable.length;
    }

    public boolean saveData(String key, String value) {
        Integer address = this.hashFunc(key);

        // 해당 주소가 있다.
        if (this.hashTable[address] != null) {
            if (this.hashTable[address].key.equals(key)) {
                this.hashTable[address].value = value;
                return true;
            } else {
                Integer currAddress = address + 1;
                // slot 있는지 확인
                while (this.hashTable[currAddress] != null) {
                    if (this.hashTable[currAddress].key
                    .equals(key)) {
                        this.hashTable[currAddress].value = value;
                        return true;
                    } else {
                        currAddress++;
                        // 마지막까지 훑었을떄
                        if (currAddress >= this.hashTable.length) {
                            return false;
                        }
                    }
                }
                this.hashTable[currAddress] = new Slot(key, value);
                return true;
            }
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
            if (this.hashTable[address].key.equals(key)) {
                return this.hashTable[address].value;
            } else {
                Integer currAddress = address + 1;
                while (this.hashTable[currAddress] != null) {
                    if (this.hashTable[currAddress].key.equals(key)) {
                        return this.hashTable[currAddress].value;
                    } else {
                        currAddress++;
                        if (currAddress >= this.hashTable.length) {
                            return null;
                        }
                    }
                }
                // 해당 데이터는 검색 되지 않는다.
                return null;
            }
        } else {
            return null;
        }
    }
}


