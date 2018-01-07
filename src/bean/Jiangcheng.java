package bean;

public class Jiangcheng {

    private String sid;
    private String jiangcheng;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getJiangcheng() {
        return jiangcheng;
    }

    public void setJiangcheng(String jiangcheng) {
        this.jiangcheng = jiangcheng;
    }

    @Override
    public String toString() {
        return "Jiangcheng{" +
                "sid='" + sid + '\'' +
                ", jiangcheng='" + jiangcheng + '\'' +
                '}';
    }

}
