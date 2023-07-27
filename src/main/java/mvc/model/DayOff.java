package mvc.model;

public class DayOff {
    private int id;
    private int slot_id;

    private Slot slot = new Slot();

    public DayOff() {
    }

    public DayOff(int id, int slot_id, Slot slot) {
        this.id = id;
        this.slot_id = slot_id;
        this.slot = slot;
    }

    public Slot getSlot() {
        return slot;
    }

    public void setSlot(Slot slot) {
        this.slot = slot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(int slot_id) {
        this.slot_id = slot_id;
    }
}
