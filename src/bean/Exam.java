package bean;

import java.sql.Timestamp;

public class Exam {

    private String cid;
    private String cno;
    private String etype;
    private Timestamp etime;
    private String duration;
    private String location;

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getEtype() {
        return etype;
    }

    public void setEtype(String etype) {
        this.etype = etype;
    }

    public Timestamp getEtime() {
        return etime;
    }

    public void setEtime(Timestamp etime) {
        this.etime = etime;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "cid='" + cid + '\'' +
                ", cno='" + cno + '\'' +
                ", etype='" + etype + '\'' +
                ", etime=" + etime +
                ", duration='" + duration + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
