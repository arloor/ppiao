package com.arloor.piaowu.model;

public class TocheckVenues {
    private String vname;
    private String vpasswd;
    private String vstatus;
    private String vaddr;
    private String vinfo;
    private String seats;

    public String getVstatus() {
        return vstatus;
    }

    public void setVstatus(String vstatus) {
        this.vstatus = vstatus;
    }

    public String getVpasswd() {
        return vpasswd;
    }

    public void setVpasswd(String vpasswd) {
        this.vpasswd = vpasswd;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getVaddr() {
        return vaddr;
    }

    public void setVaddr(String vaddr) {
        this.vaddr = vaddr;
    }

    public String getVinfo() {
        return vinfo;
    }

    public void setVinfo(String vinfo) {
        this.vinfo = vinfo;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }
}
