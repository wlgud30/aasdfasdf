package com.techni.mgl.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		int value = 208;
		int total = 523;
		double rate = (double)((double)value/(double)total)*100;
		String dispPattern = "0";
		DecimalFormat form = new DecimalFormat(dispPattern);
		System.out.println(form.format(rate));
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		int c = 12;
		for(int i =1;i<=c;i++) {
			Map<String,String> n_map = new HashMap<String,String>();
			n_map.put("abc", i+"");
			System.out.println(i+"일번째");
			list.add(n_map);
			System.out.println(n_map.get("abc"));
			i++;
			System.out.println(i+"이번째");
			n_map.clear();
			n_map.put("abc", i+"");
			list.add(n_map);
			System.out.println(n_map.get("abc"));
			System.out.println("asdfsf");
			c--;
		}
		System.out.println(list);
		
	}

}
