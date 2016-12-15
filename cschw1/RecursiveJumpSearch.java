package cschw1;

public class BinarySearch {

  public static void main(String[] args) {

    int lith = 0;          //Left pointer for the jump search
    int rith = (int)(Math.floor(Math.cbrt(n))); //Right pointer for the jump search
    int n = 1048576; 

   long endTime = System.nanoTime();
      double duration = (double)(endTime - startTime) / (Math.pow(10, 9));
      System.out.println("Index:"+ index +"Duration in seconds is: " + duration);
  }

  public boolean recursive_search(int[] theArray, int value, lith, rith)
  {
    int ith = rith;        //The increment value for the jump search

    if ( theArray[lith] == value ) 
      return true;
    else if ( theArray[ith] == value )
    {
      return true;
    }

    if ( value > theArray[ith] )
    {
      return recursive_search(theArray, value, lith + ith, rith + ith);
    }

  }
}
