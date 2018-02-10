package com.arloor.piaowu.domain;


public class Member {

  private String email;
  private String uname;
  private String passwd;
  private String role;
  private String paykey;
  private long balance;
  private long bonus;
  private long paynum;
  private java.sql.Timestamp timesign;
  private java.sql.Timestamp timecancel;
  private String pin;
  private long pinindex;


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }


  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }


  public String getPaykey() {
    return paykey;
  }

  public void setPaykey(String paykey) {
    this.paykey = paykey;
  }


  public long getBalance() {
    return balance;
  }

  public void setBalance(long balance) {
    this.balance = balance;
  }


  public long getBonus() {
    return bonus;
  }

  public void setBonus(long bonus) {
    this.bonus = bonus;
  }


  public long getPaynum() {
    return paynum;
  }

  public void setPaynum(long paynum) {
    this.paynum = paynum;
  }


  public java.sql.Timestamp getTimesign() {
    return timesign;
  }

  public void setTimesign(java.sql.Timestamp timesign) {
    this.timesign = timesign;
  }


  public java.sql.Timestamp getTimecancel() {
    return timecancel;
  }

  public void setTimecancel(java.sql.Timestamp timecancel) {
    this.timecancel = timecancel;
  }


  public String getPin() {
    return pin;
  }

  public void setPin(String pin) {
    this.pin = pin;
  }


  public long getPinindex() {
    return pinindex;
  }

  public void setPinindex(long pinindex) {
    this.pinindex = pinindex;
  }

}
