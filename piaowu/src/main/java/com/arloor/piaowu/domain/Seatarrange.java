package com.arloor.piaowu.domain;


public class Seatarrange {

  private long seatarrangeid;
  private long seatindex;
  private String part;
  private long row;
  private long colum;


  public long getSeatarrangeid() {
    return seatarrangeid;
  }

  public void setSeatarrangeid(long seatarrangeid) {
    this.seatarrangeid = seatarrangeid;
  }


  public long getSeatindex() {
    return seatindex;
  }

  public void setSeatindex(long seatindex) {
    this.seatindex = seatindex;
  }


  public String getPart() {
    return part;
  }

  public void setPart(String part) {
    this.part = part;
  }


  public long getRow() {
    return row;
  }

  public void setRow(long row) {
    this.row = row;
  }


  public long getColum() {
    return colum;
  }

  public void setColum(long colum) {
    this.colum = colum;
  }

}
