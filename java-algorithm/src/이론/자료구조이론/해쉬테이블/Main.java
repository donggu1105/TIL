package 이론.자료구조이론.해쉬테이블;

public class Main {

    public static void main(String[] args) {

        MyLinearProbingHash mainObject = new MyLinearProbingHash(20);

        mainObject.saveData("KDH", "1");
        mainObject.saveData("KYS", "12323");
        mainObject.saveData("SJY", "2");
        mainObject.saveData("JYH", "3");

        System.out.println(mainObject.getData("JYH"));
        System.out.println(mainObject.getData("KDH"));
        System.out.println(mainObject.getData("KYS"));
        System.out.println(mainObject.getData("SJY"));
    }
}
