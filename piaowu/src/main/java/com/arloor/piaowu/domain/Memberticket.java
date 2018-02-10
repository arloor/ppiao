package com.arloor.piaowu.domain;


public class Memberticket {

  private long ticketid;
  private String uname;
  private String ticketname;
  private long used;
  private java.sql.Timestamp gettime;
  private java.sql.Timestamp usetime;


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


  public java.sql.Timestamp getUsetime() {
    return usetime;
  }

  public void setUsetime(java.sql.Timestamp usetime) {
    this.usetime = usetime;
  }

}
