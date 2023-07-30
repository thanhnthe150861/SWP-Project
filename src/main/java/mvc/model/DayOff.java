package mvc.model;

import java.sql.Date;

public class DayOff {
    private int id;
    private int slot_id;
    private int doctor_id;
    private Date date;
    private String reason;
    private String note;
    private String status;
    private Slot slot = new Slot();
    private Doctor doctor = new Doctor();

    public DayOff() {
    }

    public DayOff(int id, int slot_id, int doctor_id, Date date, String reason, String note, String status, Slot slot, Doctor doctor) {
        this.id = id;
        this.slot_id = slot_id;
        this.doctor_id = doctor_id;
        this.date = date;
        this.reason = reason;
        this.note = note;
        this.status = status;
        this.slot = slot;
        this.doctor = doctor;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
