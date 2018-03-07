package com.arloor.piaowu;

public class Test {
    public static void main(String args[]){
        System.out.println(Integer.parseInt("0000027"));
        int index=27;
        //27->0000027
        String str = String.format("%7d", index).replace(" ", "0");
        System.out.println(str);
    }
}
