public class WaterSpray {

    // 가장 중요한 상태 : 현재 남아있는 물의양
    private int remainingWaterInMl;

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
    }

    public void spray() {
        this.remainingWaterInMl -= Math.min(this.remainingWaterInMl, 5);
    }
}
