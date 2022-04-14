import javax.swing.event.MouseInputAdapter;

public class FlowerPot {

    private boolean alive;

    private int minDailyWaterInMl;

    private int dailyWaterReceived = 0;


    public FlowerPot(int minDailyWaterInMl) {
        this.alive = true;
        this.minDailyWaterInMl = minDailyWaterInMl;
    }

    public int getMinDailyWaterInMl() {
        return minDailyWaterInMl;
    }

    public boolean isAlive() {
        return alive;
    }

    public void addWater(WaterSpray spray) {

        int water = Math.min(spray.getRemainingWaterInMl(), 5);
        spray.spray();
        water -= spray.getRemainingWaterInMl();
        dailyWaterReceived += water;

    }

    public void liveAnotherDay() {
        if (minDailyWaterInMl > dailyWaterReceived) {
            alive = false;
        }
        dailyWaterReceived = 0;
    }

}
