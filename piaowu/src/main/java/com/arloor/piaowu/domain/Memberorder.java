package com.arloor.piaowu.domain;


public class Memberorder {

  private long oid;
  private String uname;
  private String pname;
  private String state;
  private long seatnum;
  private long seatarranged;
  private java.sql.Timestamp booktime;
  private long charge;
  private long pay;
  private String ticketname;


  public long getOid() {
    return oid;
  }

  public void setOid(long oid) {
    this.oid = oid;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
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


  public long getSeatarranged() {
    return seatarranged;
  }

  public void setSeatarranged(long seatarranged) {
    this.seatarranged = seatarranged;
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


  public String getTicketname() {
    return ticketname;
  }

  public void setTicketname(String ticketname) {
    this.ticketname = ticketname;
  }

}
