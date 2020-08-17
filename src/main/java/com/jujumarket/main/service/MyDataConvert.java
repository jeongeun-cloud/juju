package com.jujumarket.main.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class MyDataConvert {

     /**
      * cat u.data | cut -f1,2,3 |tr "\\t" ","
      * @throws IOException
      */

	 public static void main(String[] args) throws IOException {
	
		 BufferedReader br = new BufferedReader(new FileReader("data/customer.data"));
		 BufferedWriter bw = new BufferedWriter(new FileWriter("data/customerData.csv"));
		 
		 String line;
	
		 while((line = br.readLine()) != null) {
	
			 String[] values = line.split("\\t", -1);
			 System.out.println(values[0]);
			 
			 bw.write(values[0] + "\n");
	
         }                       
         br.close();
         bw.close();
	 }

}