package cschw1;

public class LinearJumpSearch {

	public static void main(String[] args) {
		int index = 0;         //The index that will be returned if the item is found
		boolean found = false; //A boolean to confirm that the item is in the array
		int n = 32768;       // Size of the Array
		int lith = 0;          //Left pointer for the jump search
		int rith = (int)(Math.floor(Math.cbrt(n))); //Right pointer for the jump search
		int ith = rith;        //The increment value for the jump search
		int searchitem = 16384;   // The value the program is searching for 
		int [] array1 = new int[n];
		
		for (int i = 0; i<n;i++){ //Initializing the Array
		  array1[i] = i;}
		
		long startTime = System.nanoTime(); ////Used from http://stackoverflow.com/questions/180158/how-do-i-time-a-methods-execution-in-java
		
		for (int z = 0;z<5000;z++){
		
		while (rith < n && found == false){
		  if (searchitem == array1[rith]){ //Case 1: Item is equal to value at index rith
			index = rith;
			found = true;
			break;}
		  else if (searchitem == array1[lith]){ //Case 2: Item is equal to value at index lith
			index = lith;
			found = true;
			break;}
		  else if (searchitem < array1[rith]){ //Case 3:Item is less than value at index rith
			for (int c = lith; c<rith;c++){   //So iterate through the partition from the left
		      if (array1[c] == searchitem){
				index = c;
			    found = true;
				break;}}}
		  else {
			//System.out.println ("rith Value is: "+rith + " and lith Value is:"+ lith); 
		    rith = rith + ith;
		    lith = lith + ith;}}}
		/*System.out.println ("index: " + index);*/
	 long endTime = System.nanoTime();
	    double duration = (double)(endTime - startTime) / (Math.pow(10, 9));
	    System.out.println("Index:"+ index +"Duration in seconds is: " + duration);}
	}
