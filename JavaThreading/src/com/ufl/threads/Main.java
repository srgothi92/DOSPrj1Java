package com.ufl.threads;

import java.util.ArrayList;
import java.util.Arrays;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long start = System.nanoTime();
        Storage storage = new Storage();
		execute(storage);
		long elapsedTime = System.nanoTime() - start;
		ArrayList<int[]> output = storage.take();
//		for (int[] p : output)
//		System.out.println("Pefect Square" + Arrays.toString(p));
       System.out.println(elapsedTime);
        
	}
	
	public static void execute(Storage storage) {
		int n = 100000000;
        int k = 24;
        int noOfThreads = 1000000;
        ArrayList<Thread> taskList = new ArrayList<Thread>();
        for(int ind = 0; ind < noOfThreads; ind++) {
        	int taskSize = n/noOfThreads;
            int taskEnd = taskSize * (ind + 1);
            int taskStart = taskEnd - taskSize + 1;
        	Thread task = new Thread(new PerfectSquare(taskEnd, k, taskStart,storage));
        	taskList.add(task);
        	task.start();
        }
        waitForThreadToFinish(taskList);
	}
	
	private static void waitForThreadToFinish(ArrayList<Thread> taskList) {
		for (Thread thread : taskList) {
		    try {
				thread.join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
