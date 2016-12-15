package cschw1;

public class LinearSearch {

	public static void main(String[] args){
	    int counter = 0;
		int index = 0;
		boolean found = false;
		int n = 33554432;
		int searchitem = 24554432;
		int [] array1 = new int[n];
		
		for (int i = 0; i<n;i++){
		  array1[i] = i;}
		
	    long startTime = System.nanoTime(); //Used from http://stackoverflow.com/questions/180158/how-do-i-time-a-methods-execution-in-java
				
		for (int z = 0;z<5000;z++){
		
		  for (int a = 0; a<n;a++){
		    if (array1[a] == searchitem){
			  index = a;
			  found = true;
			  break;}}
		
		//Error testing code
		/*if (found){
			System.out.println("Value: "+searchitem+" found at index: "+index);}
		else {
			System.out.println("Value is not in the array");}*/}
	
	    long endTime = System.nanoTime();
	    double duration = (double)(endTime - startTime) / (Math.pow(10, 9));
	    System.out.println("Duration in seconds is: " + duration);}}
