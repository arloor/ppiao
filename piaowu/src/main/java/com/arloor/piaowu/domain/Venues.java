package com.arloor.piaowu.domain;


public class Venues {

  private long vid;
  private String vname;
  private String vpasswd;
  private String vaddr;
  private String vstatus;
  private String vinfo;
  private String role;


  public long getVid() {
    return vid;
  }

  public void setVid(long vid) {
    this.vid = vid;
  }


  public String getVname() {
    return vname;
  }

  public void setVname(String vname) {
    this.vname = vname;
  }


  public String getVpasswd() {
    return vpasswd;
  }

  public void setVpasswd(String vpasswd) {
    this.vpasswd = vpasswd;
  }


  public String getVaddr() {
    return vaddr;
  }

  public void setVaddr(String vaddr) {
    this.vaddr = vaddr;
  }


  public String getVstatus() {
    return vstatus;
  }

  public void setVstatus(String vstatus) {
    this.vstatus = vstatus;
  }


  public String getVinfo() {
    return vinfo;
  }

  public void setVinfo(String vinfo) {
    this.vinfo = vinfo;
  }


  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

}
