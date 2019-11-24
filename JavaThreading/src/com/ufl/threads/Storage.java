package com.ufl.threads;

import java.util.ArrayList;

public class Storage {
	private ArrayList<int[]> output = new ArrayList<int[]>();
	private boolean available = false;

	public synchronized void put(ArrayList<int[]> perfectSquareList) {
		output.addAll(perfectSquareList);
	}
	
	public synchronized ArrayList<int[]> take() {
        return output;
    }

}
