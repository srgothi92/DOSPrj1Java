package com.ufl.threads;

import java.util.ArrayList;
import java.util.stream.IntStream;

public class PerfectSquare implements Runnable {
	    private int start;
		private int k;
		private int n;
		private Storage storage;

		public PerfectSquare(int n, int k, int start,Storage storage) {
	    	this.n = n;
	    	this.k = k;
	    	this.start = start;
	    	this.storage = storage;
	    }
		public void run() {
			storage.put(createWindow());
		}
		
		private ArrayList<int[]> createWindow() {
			ArrayList<int[]> output = new ArrayList<int[]>();
			while(this.start <= this.n) {
				int[] window = IntStream.range(this.start, this.start + this.k).toArray();
				if(isSumPerfectSqure(window)) {
					output.add(window);
				}
				this.start++;
			}
			return output;
		}
		
		private boolean isSumPerfectSqure(int[] window) {
			int sum = 0;
			for(int ind=0; ind< window.length; ind++){
				sum += window[ind]* window[ind];
			}
			return isPerfectSquare(sum);
		}

		private boolean isPerfectSquare(double x)  
	    { 
	          
	        // Find floating point value of 
	        // square root of x. 
	        double sr = Math.sqrt(x); 
	      
	        // If square root is an integer 
	        return ((sr - Math.floor(sr)) == 0); 
	    } 
}
