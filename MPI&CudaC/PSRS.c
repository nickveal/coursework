/*******************************************************************
* Parallel and Distributed Computing Computing Assignment          *
* Name: Nicholas Veal                                              *
* Class:Dr.Prasad                                                  *
* Program: Parallel Sorting by Random Sampling                     *                                   
* Description: Matrix multiplication will be done with p processors*
* with NxN matrices by sending rows of A to the processors and     *
* all of Matrix B to every processor                               *                   
*******************************************************************/

#include <stdint.h>
#include<stdio.h>
#include <stdlib.h> 
#include "mpi.h"

int cmpfunc (const void * a, const void * b);

// Used from http://www.tutorialspoint.com/c_standard_library/c_function_qsort.htm
int cmpfunc (const void * a, const void * b)
{return ( *(int*)a - *(int*)b );}


int main (int argc, char *argv[]){
  MPI_Status status;
  MPI_Request request;
  int i,arraylength,p,arraysizefinal,tag1,pivotcounter,tag2,id; /*Process Rank*/
  int *allray;
  
  tag1 = 200;
  tag2 = 201;
  arraylength = atoi(argv[1]);
  const int sizearray = arraylength*sizeof(int);
  int *A = (int*)malloc(sizearray);
  float pivotcal;
  int pivotcalindex;
  
  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &id);
  MPI_Comm_size (MPI_COMM_WORLD, &p);
  
  //Step one, setting up main array and sending out partitions of the main array 
  if (id == 0){
    for( int a = 0; a<arraylength;a++){
      A[a] = arraylength-a;}}
	  
  //Variable set ups	  
  int arraylengthp = arraylength/(p);
  const int sizearrayp = arraylengthp*sizeof(int);
  
  int *temparray = (int*)malloc(sizearrayp);
  int *pivotp = (int*)malloc(sizearrayp);
  pivotcal = ((float)arraylength/(float)(2*p*p));
  int *pivotmain = (int*)malloc(sizeof(int)*p*p);
  int *final = (int*)malloc(arraylength);
  int *scount = (int*)malloc(sizeof(int)*p);
  int *rcount = (int*)malloc(sizeof(int)*p);
  int *sdisp = (int*)malloc(sizeof(int)*p);
  int *rdisp = (int*)malloc(sizeof(int)*p);
  int *totalfinal = (int*)malloc(sizeof(int)*(p-1));
  int *displacements = (int*)malloc(sizeof(int)*(p-1));
  
  for (int a = 0;a<p;a++){
	    rcount[a] = arraylength;}
  
  
  //Setting up 0's temparray and sending out arrays
  if (id == 0){
	  for (int a = 0;a<arraylengthp;a++){
	    temparray[a] = A[a];}}
  
  for (int b = 1;b<p;b++){
    if (id == 0){
	  MPI_Send(&A[(b)*arraylengthp],arraylengthp,MPI_INT,b,tag1,MPI_COMM_WORLD);}}
    if (id != 0 ){
    MPI_Recv(&temparray[0],arraylengthp,MPI_INT,0,tag1,MPI_COMM_WORLD,&status);}
	
  MPI_Barrier(MPI_COMM_WORLD);	
  
  //Step 2, locally sorting the arrays in each process
  for (int b = 0;b<p;b++){
    if (id == b){
	  qsort(temparray, arraylengthp, sizeof(int), cmpfunc);}}
	  
  //Step 3, making sample pivots arrays, sending them and receiving them.
  for (int b = 0;b<p;b++){
    if (id == b){
	  for (int n = 0;n < p; n++){
	    if (n > 0){
		  pivotcal += ((float)arraylength/(float)(p*p));}
		pivotcalindex = (int)pivotcal;
		pivotp[n] = temparray[pivotcalindex];}}}
		
  if (id !=0){
     MPI_Send(&pivotp[0],p,MPI_INT,0,tag1,MPI_COMM_WORLD);}
  if (id == 0){
    for (int c = 0;c < p; c++){
	  pivotmain[c] = pivotp[c];
	  if (c > 0){
	  MPI_Recv(&pivotmain[c*p],p,MPI_INT,c,tag1,MPI_COMM_WORLD,&status);}}}
  
  //Step 4,Sorting the sample array in p0
  if (id == 0){
     qsort(pivotmain, p*p, sizeof(int), cmpfunc);}
	 
  //Step 5,Choosing sample pivots from the pivot main array
  if (id == 0){
    for (int m = 1; m < p;m++){
	  pivotp[m-1] = pivotmain[p*m-1];}
	for (int n = 1; n < p;n++){
	  MPI_Send(&pivotp[0],p-1,MPI_INT,n,tag1,MPI_COMM_WORLD);}}
  if (id != 0){
    MPI_Recv(&pivotp[0],p-1,MPI_INT,0,tag1,MPI_COMM_WORLD,&status);}
   
  //Step 6-7

  for (i = 0; i < p; i++){
    scount[i] = 0;}

	int counter = 0;
  	for (int a = 0; a < p; a++){
	  if (id == a){
        for (int d = 0; d < p-1; d++){		
          for (i = counter; i < arraylengthp; i++){
	        if (temparray[i] <= pivotp[d]){
	          scount[d]++;
			  counter++;}
	        else if (temparray[i] > pivotp[d] && d == p-2){
	          scount[d+1]++;
			  counter++;}}}}}

	sdisp[0] = 0;
	for (int a = 0; a < p; a++){
	  if (id == a){
        for (i = 1; i < p; i++){
          sdisp[i] = sdisp[i-1] + scount[i-1];}}}

    MPI_Alltoall(scount,1,MPI_INT,rcount,1,MPI_INT,MPI_COMM_WORLD);
    	
    rdisp[0] = 0;
	
	for (int b = 0;b<p;b++){
	  if (id == b){
	  for (i = 1; i < p; i++){
	    rdisp[i] = rdisp[i-1] + rcount[i-1];}}}
    
	MPI_Alltoallv(temparray,scount,sdisp,MPI_INT,final,rcount,rdisp,MPI_INT,MPI_COMM_WORLD);
			 
    MPI_Barrier(MPI_COMM_WORLD);	
	
	int total; 
	int *totalpointer = (int*)malloc(sizeof(int)*(1));
	
	for (int b = 0;b<p;b++){
    total = 0;
	if (id == b){
	for (i = 0; i < p; i++){
	  total += rcount[i];}
	  totalpointer[0] = total;
	  qsort(final, total, sizeof(int), cmpfunc);}}
    
	MPI_Gather((void*)(intptr_t)totalpointer,1,MPI_INT,(void*)(intptr_t)totalfinal,1,MPI_INT, 
				0,MPI_COMM_WORLD);
	
	if (id == 0){
	displacements[0] = 0;
	for (i = 1;i < p;i++){
	  displacements[i] = displacements[i-];}}
	
	
  if (id == 0){
    for (int t = 0;t < arraylength; t++){
      printf("%d ",allray[t]);}}

  MPI_Finalize();}
  
  