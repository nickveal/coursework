/**************************************************************************
* Parallel and Distributed Computing Computing Assignment Take Home PB    *
* Name: Nicholas Veal                                                     *
* Class:Dr.Prasad                                                         *
* Program: Merge Sort                                                     *                                   
* Description: Elements from every process are merged and sorted in a temp*    
* matrix that is copied into B and sent to C array to be sorted again     *
**************************************************************************/
#include <math.h>
#include<string.h>
#include<stdio.h>
#include<stdlib.h> 
#include "mpi.h"




//Size of array
#define NFULL 64
//For the dimension of the hypercube
#define D 4
  
//Main MPI program
int main (int argc, char *argv[]){
  MPI_Status status;
  const int sizearray = NFULL*sizeof(int);
  int i;  
  int id; /*Process Rank*/
  int p; /*Number of processors*/
  int tag1,tag2;
  int *B = (int*)malloc(sizearray);
  int *C = (int*)malloc(sizearray);
  int *temp = (int*)malloc(sizearray);
  int bcounter;
  int ccounter; 
  int tempcounter;
  
  MPI_Request request;
  tag2= 201;
  tag1 = 210;
  double elapsedtime;

  
  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &id);
  MPI_Comm_size (MPI_COMM_WORLD, &p);
  
  for (i = id; i < p; i++){
    if (id == i){
      for( int a = 0; a<D;a++){
        B[a] = (a+4*i);}}}
		
  
  int offset = D*1;
  MPI_Barrier(MPI_COMM_WORLD);
	
  for (int b = D-1; b >= 0 ; b--){
    for (int z = id; z < p ; z++){
	  if (id == z){
		int partner = id ^ (int)exp2(b);
		MPI_Isend(&B[0],offset,MPI_INT,partner,tag2,MPI_COMM_WORLD,&request);
		MPI_Recv(&C[0],offset,MPI_INT,partner,tag2,MPI_COMM_WORLD,&status);

		MPI_Barrier(MPI_COMM_WORLD);
		 
        tempcounter = 0;
		bcounter = 0;
		ccounter = 0;
		  
		while (bcounter < offset || ccounter < offset){
	      if (bcounter == offset && ccounter < offset){
		    temp[tempcounter] = C[ccounter];
			tempcounter++;
			ccounter++;}
		  else if (ccounter == offset && bcounter < offset){
			temp[tempcounter] = B[bcounter];
			tempcounter++;
			bcounter++;}
	      else {
		    if (B[bcounter] < C[ccounter]){
			  temp[tempcounter] = B[bcounter];
			  tempcounter++;
		      bcounter++;}
		    else if (C[ccounter] < B[bcounter]){
			  temp[tempcounter] = C[ccounter];
			  tempcounter++;
			  ccounter++;}
			else{
			  temp[tempcounter] = B[bcounter];
			  ++tempcounter;
			  temp[tempcounter] = C[ccounter];
			  ccounter++;
			  bcounter++;
			  tempcounter++;}}}
				  
		for (int l = 0;l < offset*D;l++){
		  B[l] = temp[l];}}}
	  offset*=2;}
	
  if (id == 15){
    for (int d = 0;d<NFULL;d++){
      printf("%d ",B[d]);}
      printf("\n");}
		
    

   

 
		
  MPI_Finalize();}
  


  