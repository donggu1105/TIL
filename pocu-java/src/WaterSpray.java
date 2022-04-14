public class WaterSpray {
    private static final int CAPACITY = 200;

    // 가장 중요한 상태 : 현재 남아있는 물의양
    private int remainingWaterInMl;

    public WaterSpray(int remainingWaterInMl) {
        this.remainingWaterInMl = remainingWaterInMl;
    }

    public int getRemainingWaterInMl() {
        return remainingWaterInMl;
    }

//    public void setRemainingWaterInMl(int remainingWaterInMl) {
//        set
//        this.remainingWaterInMl = remainingWaterInMl;
//    }

    public void addWater(int amountInMl) {
        //add
        this.remainingWaterInMl += amountInMl;
        this.remainingWaterInMl = Math.min(this.remainingWaterInMl, CAPACITY);
    }

    public void spray() {
        this.remainingWaterInMl -= Math.min(this.remainingWaterInMl, 5);
    }

//    public void sprayTo(FlowerPot pot) {
//        int amountSpray = Math.min(this.remainingWaterInMl, 5);
//        pot.addWater(amountSpray);
//        this.remainingWaterInMl -= amountSpray;
//    }
    public void fillUp() {
        // capacity란 상태가 있으니 충분히 해당 동작을 추가 가능
        // 가득 채운다는 의미에서 이름은 fillUp() 으로
        this.remainingWaterInMl = CAPACITY;
    }
}
