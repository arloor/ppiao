package com.arloor.piaowu.domain;


public class Memberorder {

  private String uname;
  private long placeid;
  private long eventid;
  private String state;
  private long seatnum;
  private long seatarrange;
  private java.sql.Timestamp booktime;
  private long charge;
  private long pay;
  private long ticketid;


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public long getPlaceid() {
    return placeid;
  }

  public void setPlaceid(long placeid) {
    this.placeid = placeid;
  }


  public long getEventid() {
    return eventid;
  }

  public void setEventid(long eventid) {
    this.eventid = eventid;
  }


  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }


  public long getSeatnum() {
    return seatnum;
  }

  public void setSeatnum(long seatnum) {
    this.seatnum = seatnum;
  }


  public long getSeatarrange() {
    return seatarrange;
  }

  public void setSeatarrange(long seatarrange) {
    this.seatarrange = seatarrange;
  }


  public java.sql.Timestamp getBooktime() {
    return booktime;
  }

  public void setBooktime(java.sql.Timestamp booktime) {
    this.booktime = booktime;
  }


  public long getCharge() {
    return charge;
  }

  public void setCharge(long charge) {
    this.charge = charge;
  }


  public long getPay() {
    return pay;
  }

  public void setPay(long pay) {
    this.pay = pay;
  }


  public long getTicketid() {
    return ticketid;
  }

  public void setTicketid(long ticketid) {
    this.ticketid = ticketid;
  }

}
