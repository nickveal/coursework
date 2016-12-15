/**************************************************************************
* Sorting Selection Experiments                                           *
* Name: Nicholas Veal                                                     *
* Class:Dr.Prasad                                                         *
* Program: Sorts.java                                                     *                                   
* Description: A collection of all sorts required for the experiment.     *    
**************************************************************************/

package cschw3;

public class Sorts {

  public static int[] InsertionSort(int A[]){
	  
    for (int j = 1;j < A.length;j++){ //Algorithms p18 Iterates through array for keys
      int key = A[j]; 
	  int i = j-1;
	  
	  while (i >= 0 && A[i] > key){
	    A[i+1] = A[i]; // Swap values if A[i] > key
		i = i -1;}     // Reduces i index until i reaches first value or A[i] > key
	  A[i+1] = key;}   
    return A;
  }
  
  public static int[] InsertionSort(int A[],int p,int r){
	  
    for (int j = p + 1;j < r + 1;j++){ //Algorithms p18 Iterates through array for keys
	  int key = A[j]; 
      int i = j-1;
		  
	  while (i >= 0 && A[i] > key){
	    A[i+1] = A[i]; // Swap values if A[i] > key
	    i = i -1;}     // Reduces i index until i reaches first value or A[i] > key
	  A[i+1] = key;}   
	return A;
  }
  
  public static int[] CountingSort(int A[],int B[],int k){ 
    int [] C = new int[k]; //Creating Array for Prefix sum and Counts of values. A is input array, B is output array, k is range.
		  
	for (int y = 0; y < A.length; y++){
	  C[(A[y])] += 1 ;}          //Counting values in the input array
		  
	for (int z = 1; z < k; z++){
	    C[z] = C[z] + C[z-1];}   //Calculating the prefix sum
		 
	for (int b = (A.length)-1; b >= 0; b--){
	   B[C[A[b]]-1] = A[b];     //Assigning value from A in the right place derived from the prefix sum
	   C[A[b]] = C[A[b]]-1;}    //Decrementing sum index value in the prefix array	  
	return B;
  }
  
  public static int[] QuickSort1(int []A,int p,int r){
    if (p < r){
	  int q = QuickSortPart1(A,p,r); //Goes into partitioning program and returns q value for splitting
	  QuickSort1(A,p,q);			
	  QuickSort1(A,q+1,r);}
	return A;
  }
  
  public static int QuickSortPart1(int[]A,int p, int r){
	int n = 0;  //Temporary variable
    int x = A[p]; //First value in the array
    int i = p; //Index of first value
    int j = r; // Index of last value
	while (true){  // j to the left until a value is < x and i moves until A[i] > x
	  
	  while ((A[j] >= x)&&(i < j)){
	    j = j - 1;}
	  
	  while ((A[i] < x)&&(i < j)){ 
	    i = i + 1;}
	  
	  if (i < j){ //If i hasn't past j, it will swap A[i] and A[j]
	    n = A[i];
	    A[i] = A[j];
	    A[j] = n;}
	  else{
	    return j;}} 
  }
  
  public static int[] QuickSort1Random(int []A,int p,int r){
	if (p < r){
      int q = QuickSortPart1Random(A,p,r); //Goes in Random generation program and to Partition
	  QuickSort1Random(A,p,q);			
	  QuickSort1Random(A,q+1,r);}
	  return A;
			}
  
  public static int[] QuickSort1I(int []A,int p,int r){
    if (p < r){
      if (((r+1) - (p)) < 90){ //Checks to see if the length of the array is less than than the specified value. 
        InsertionSort(A,p,r);}
      else {
	    int q = QuickSortPart1(A,p,r); //Goes into partitioning program and returns q value for splitting
		QuickSort1I(A,p,q);			
		QuickSort1I(A,q+1,r);}}
    return A;
  }
  
  public static int[] QuickSort1IRandom(int []A,int p,int r){
    if (p < r){
	  if (((r+1) - (p)) < 90){ //Checks to see if the length of the array is less than than the specified value. 
	    InsertionSort(A,p,r);}
	    else {
		    int q = QuickSortPart1Random(A,p,r); //Goes into partitioning program and returns q value for splitting
			QuickSort1IRandom(A,p,q);			
			QuickSort1IRandom(A,q+1,r);}}
	    return A;
	  }
  
  public static int QuickSortPart1Random(int [] A, int p, int r){
    int ran =  (p + (int)(Math.random()*(r - p + 1 ))); //Except this takes a random value from Array A and swaps it with pivot position
	int temp = A[ran];
	A[ran] = A[p];
	A[p] = temp;
	return QuickSortPart1(A,p,r);
  }
  
  public static int[] QuickSort2(int []A,int p,int r){ //A similar variation of Partition 2 Quicksort from the book pg 171
	if (p < r){
	  int q = QuickSortPart2(A,p,r); //Goes into partitioning program and returns q value for splitting. Deals with the pivot in partition
	  QuickSort2(A,p,q-1);
	  QuickSort2(A,q+1,r);}
	return A;
  }
  
  public static int QuickSortPart2(int[]A,int p, int r){
	int n = 0; //Temporary Value
    int x = A[r]; // Takes last value of A as pivot
    int i = p - 1; //left hand of comparison path. All values at or before i are less than pivot.
	
    for (int j = p; j <= r - 1; j++){ //j right hand of comparison path. All values after pivot and at r are greater than pivot 
	  if (A[j] <= x){ //Increments i and swaps A[i] and A[j] if true
        i = i + 1;
        n = A[i];
        A[i] = A[j];
        A[j] = n;}}
	n = A[i+1]; //Swapping pivot with the spot it is supposed to be in, which is i+1
	A[i+1] = A[r];
	A[r] = n;
	return i+1;
  }
  
  public static int[] QuickSort2Random(int []A,int p,int r){
	if (p < r){
	  int q = QuickSortPart2Random(A,p,r); // Same as QuickSort 2
	  QuickSort2Random(A,p,q-1);
	  QuickSort2Random(A,q+1,r);}
	return A;
  }
  
  public static int QuickSortPart2Random(int [] A, int p, int r){
    int ran =  (p + (int)(Math.random()*(r - p + 1 ))); //Except this takes a random value from Array A and swaps it with pivot position
    int temp = A[ran];
    A[ran] = A[r];
    A[r] = temp;
    return QuickSortPart2(A,p,r);
  }
  
  public static int[] QuickSort2I(int []A,int p,int r){ //A similar variation of Partition 2 Quicksort from the book pg 171 with Insertion Sort
	if (p < r){
	  if (((r+1) - (p)) < 90){ //Checks to see if the length of the array is less than than the specified value. 
	    InsertionSort(A,p,r);}
	  else {
	    int q = QuickSortPart2(A,p,r); //Goes into partitioning program and returns q value for splitting. Deals with the pivot in partition
	    QuickSort2I(A,p,q-1);
	    QuickSort2I(A,q+1,r);}}
    return A;
  }
  
  public static int[] QuickSort2IRandom(int []A,int p,int r){ //A similar variation of Partition 2 Quicksort from the book pg 171 with Insertion Sort
	if (p < r){
	  if (((r+1) - (p)) < 90){ //Checks to see if the length of the array is less than than the specified value. 
	    InsertionSort(A,p,r);}
	  else {
		  int q = QuickSortPart2Random(A,p,r); //Same as QuickSort 2
		  QuickSort2IRandom(A,p,q-1);
		  QuickSort2IRandom(A,q+1,r);}}
    return A;
  }
  
}



