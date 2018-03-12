package com.arloor.piaowu;

public class Test {
    public static void main(String args[]){
        System.out.println(Integer.parseInt("0000027"));
        int index=27;
        //27->0000027
        String str = String.format("%7d", index).replace(" ", "0");
        System.out.println(str);

        System.out.println("2017-12-15".compareTo("2018-03-25"));;//前<后 -1
    }
}
