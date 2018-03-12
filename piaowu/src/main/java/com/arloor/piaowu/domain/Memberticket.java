package com.arloor.piaowu.domain;


public class Memberticket {

  private long ticketid;
  private String uname;
  private String ticketname;
  private long used;
  private java.sql.Timestamp gettime;
  private String type;
  private String param0;
  private String param1;
  private String param2;


  public long getTicketid() {
    return ticketid;
  }

  public void setTicketid(long ticketid) {
    this.ticketid = ticketid;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getTicketname() {
    return ticketname;
  }

  public void setTicketname(String ticketname) {
    this.ticketname = ticketname;
  }


  public long getUsed() {
    return used;
  }

  public void setUsed(long used) {
    this.used = used;
  }


  public java.sql.Timestamp getGettime() {
    return gettime;
  }

  public void setGettime(java.sql.Timestamp gettime) {
    this.gettime = gettime;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getParam0() {
    return param0;
  }

  public void setParam0(String param0) {
    this.param0 = param0;
  }

  public String getParam1() {
    return param1;
  }

  public void setParam1(String param1) {
    this.param1 = param1;
  }

  public String getParam2() {
    return param2;
  }

  public void setParam2(String param2) {
    this.param2 = param2;
  }
}
