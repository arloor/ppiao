package com.arloor.piaowu.domain;


public class Seat {

  private String pname;
  private String stype;
  private String row;
  private String col;
  private long orderid;
  private String status;


  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }


  public String getStype() {
    return stype;
  }

  public void setStype(String stype) {
    this.stype = stype;
  }


  public String getRow() {
    return row;
  }

  public void setRow(String row) {
    this.row = row;
  }


  public String getCol() {
    return col;
  }

  public void setCol(String col) {
    this.col = col;
  }


  public long getOrderid() {
    return orderid;
  }

  public void setOrderid(long orderid) {
    this.orderid = orderid;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

}
