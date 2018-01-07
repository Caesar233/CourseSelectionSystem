package bean;

public class Choose {

    private String sid;
    private Integer score;
    private String cid;
    private String cno;
    private String cname;
    private String credit;
    private String period;
    private String tid;
    private String tname;
    private String dept;
    private String capacity;
    private String csection;
    private String week;
    private String location;
    private String classes;
    private String grade;
    private String ctype;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

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

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getCsection() {
        return csection;
    }

    public void setCsection(String csection) {
        this.csection = csection;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    @Override
    public String toString() {
        return "Choose{" +
                "sid='" + sid + '\'' +
                ", score=" + score +
                ", cid='" + cid + '\'' +
                ", cno='" + cno + '\'' +
                ", cname='" + cname + '\'' +
                ", credit='" + credit + '\'' +
                ", period='" + period + '\'' +
                ", tid='" + tid + '\'' +
                ", tname='" + tname + '\'' +
                ", dept='" + dept + '\'' +
                ", capacity='" + capacity + '\'' +
                ", csection='" + csection + '\'' +
                ", week='" + week + '\'' +
                ", location='" + location + '\'' +
                ", classes='" + classes + '\'' +
                ", grade='" + grade + '\'' +
                ", ctype='" + ctype + '\'' +
                '}';
    }
}
