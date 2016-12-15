/**************************************************************************
* Sorting Selection Experiments                                           *
* Name: Nicholas Veal                                                     *
* Class:Dr.Prasad                                                         *
* Program: TestingSort.java                                               *                                   
* Description: Testing class for the experiments.                         *    
**************************************************************************/

package cschw3;

import java.util.Arrays;

  
  public class TestingSort {

	public static void main(String[] args) {
		
	  int n = 32768;
	  int upper = 20000;
	  int lower = 0;
	  int iter = 100;
	  int gen = 0;
	  
	  int [] Main = new int[n];
	  int [] Main2 = new int [n]; // For sorts that alter the input array
	  //int [] Main3 = new int [n];
	  //int [] Main4 = new int [n];
	  //int [] Result1 = new int[n];
	  //int [] Result2 = new int[n];
	  //int [] CountingArray = new int[n];
	  //int [] InsertingArray = new int[n];
	  //int [] QuicksortArray = new int[n];
	  
	  for (int i = 0; i<n;i++){
		gen = lower + (int)(Math.random()*(upper - lower + 1));
		Main[i] = gen;
		Main2[i] = gen;
		//Main3[i] = gen;
		//Main4[i] = gen;
		}
	  
	  long starttime = System.nanoTime(); //Used from http://stackoverflow.com/questions/180158/how-do-i-time-a-methods-execution-in-java
	  
	  for (int a = 0; a <iter;a++){
	    Sorts.QuickSort1(Main,0,Main.length-1);
	    Main = Main2.clone();
	    }
	  
	  long endtime = System.nanoTime();
	  
	  long starttime2 = System.nanoTime();

      for (int b = 0; b <iter;b++){
	    Sorts.QuickSort1Random(Main,0,Main.length-1);
	    Main = Main2.clone();
	    } 		 
      
	  long endtime2 = System.nanoTime();

	  long starttime3 = System.nanoTime();

	  for (int c = 0; c <iter;c++){  
	    Sorts.QuickSort1I(Main,0,Main.length-1);
	    Main = Main2.clone();
	    }
	  
	  long endtime3 = System.nanoTime();
	  
	  long starttime4 = System.nanoTime();
	  
	  for (int d = 0; d <iter;d++){  
        Sorts.QuickSort1IRandom(Main,0,Main.length-1);
	    Main = Main2.clone();
	    }
	  
	  long endtime4 = System.nanoTime();

	  long starttime5 = System.nanoTime();
	  
	  for (int e = 0; e <iter;e++){  
	    Sorts.QuickSort2(Main,0,Main.length-1);
		Main = Main2.clone();}  
	
	  long endtime5 = System.nanoTime();
	  
	  long starttime6 = System.nanoTime();
	  
	  for (int f = 0; f <iter;f++){  
	    Sorts.QuickSort2Random(Main,0,Main.length-1);
	    Main = Main2.clone();}
	  
	  long endtime6 = System.nanoTime();
	  
	  long starttime7 = System.nanoTime();

	  for (int g = 0; g <iter;g++){  
	    Sorts.QuickSort2I(Main,0,Main.length-1);
		Main = Main2.clone();}
	 
	  long endtime7 = System.nanoTime();
	  
	  long starttime8 = System.nanoTime();
	  
	  for (int h = 0; h <iter;h++){  
		Sorts.QuickSort2IRandom(Main,0,Main.length-1);
	    Main = Main2.clone();}
	  
	  long endtime8 = System.nanoTime();

	  double duration = (double)(endtime - starttime) / (Math.pow(10, 9));
	  double duration2 = (double)(endtime2 - starttime2) / (Math.pow(10, 9));
	  double duration3 = (double)(endtime3 - starttime3) / (Math.pow(10, 9));
	  double duration4 = (double)(endtime4 - starttime4) / (Math.pow(10, 9));
	  double duration5 = (double)(endtime5 - starttime5) / (Math.pow(10, 9));
	  double duration6 = (double)(endtime6 - starttime6) / (Math.pow(10, 9));
	  double duration7 = (double)(endtime7 - starttime7) / (Math.pow(10, 9));
	  double duration8 = (double)(endtime8 - starttime8) / (Math.pow(10, 9));

	  System.out.println((duration/iter));
	  System.out.println((duration2/iter));
	  System.out.println((duration3/iter));
	  System.out.println((duration4/iter));
	  System.out.println((duration5/iter));
	  System.out.println((duration6/iter));
	  System.out.println((duration7/iter));
	  System.out.println((duration8/iter));
	
	//Sorts.InsertionSort(Main);
	//Sorts.QuickSort2IRandom(Main2,0,Main2.length-1);
	//Sorts.QuickSort2I(Main3,0,Main3.length-1);
  
	//for (int c = 0; c<n;c++){
		//System.out.println("Index Insertion "+c+": "+ Main[c]+"    Index Quick1 "+c+": "+ Main2[c] + "    Index Quick1I "+c+": "+ Main3[c]);}
	}
  
	
  }
	    

