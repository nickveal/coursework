/*******************************************************************
* Parallel and Distributed Computing Computing Assignment 4        *
* Name: Nicholas Veal                                              *
* Class:Dr.Prasad                                                  *
* Program: Matrix Multiplication                                   *                                   
* Description: Matrix multiplication will be done with p processors*
* with NxN matrices by sending rows of A to the processors and     *
* all of Matrix B to every processor                               *                   *
*******************************************************************/


#include<stdio.h>
#include <stdlib.h> 
#include "mpi.h"


//For the dimensions of the matrices
#define NDIM 4
#define NFULL 16

//Main MPI program
int main (int argc, char *argv[]){
  MPI_Status status;
  const int sizearray = NFULL*sizeof(int);
  const int sizerow = NDIM*sizeof(int);
  int i;  
  int id; /*Process Rank*/
  int p; /*Number of processors*/
  int tag1,tag2;
  int *C = (int*)malloc(sizearray);
  int *B = (int*)malloc(sizearray);
  int *A = (int*)malloc(sizearray);
  int *atemp = (int*)malloc(sizerow);
  int *Ctemp = (int*)malloc(sizearray);
  tag2= 201;
  tag1 = 210;
  double elapsedtime;

  
  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &id);
  MPI_Comm_size (MPI_COMM_WORLD, &p);
  
  if (id == 0){
    for( int a = 0; a<NFULL;a++){
      A[a] = (a+1);
      B[a] = (a+17);}}
	  
  MPI_Barrier(MPI_COMM_WORLD);
  elapsedtime = -MPI_Wtime();
  
      
	

  
  MPI_Bcast(&B[0],NFULL,MPI_INT,0,MPI_COMM_WORLD);
  
	
  
  for (int b = 1;b<p;b++){
    if (id == 0){
	  MPI_Send(&A[b*NDIM],NDIM,MPI_INT,b,tag1,MPI_COMM_WORLD);}}
	if (id != 0 ){
	  MPI_Recv(&atemp[0],NDIM,MPI_INT,0,tag1,MPI_COMM_WORLD,&status);}
	  

	
	
	
  for(i =id; i<p; i++){
    int ctemp = 0;
    int n = 0;
      for (int a = 0;a<NDIM;a++){
        for (int m = 0; m <NDIM;m++){
		
	      if(i == 0){
	        if (n>(NDIM-1)){
		      n = 0;}
		  ctemp += A[n]*B[m*NDIM+a];
          n++;}
		   
		  if(i > 0) {
		    if (n>(NDIM-1)){
		      n = 0;}
	     //printf("A: %d\n",atemp[n]);
		 //printf("B: %d\n",B[m*NDIM+a]);
		  ctemp += atemp[n]*B[m*NDIM+a];
          n++;
		  //printf("%d\n",ctemp);
		  }}
		if (i == 0){
		  C[a] = ctemp;}
		if (i > 0){
		  Ctemp[a] = ctemp;}
		ctemp = 0;}
		
      if (i != 0 && id != 0){		
        MPI_Send(&Ctemp[0],NDIM,MPI_INT,0,tag2,MPI_COMM_WORLD);}
      }
  for (i = 1;i<p;i++){
  if (id == 0){
    MPI_Recv(&C[i*NDIM],NDIM,MPI_INT,i,tag2,MPI_COMM_WORLD,&status);}}
	
  MPI_Barrier(MPI_COMM_WORLD);
  elapsedtime += MPI_Wtime();
  
  if(id == 0){
  printf("Total elapsed time =%f\n",elapsedtime);
  fflush(stdout);}
		
	  
 //Print Statements
if (id == 0){
for (int t = 0;t < NFULL; t++){
    printf("Array C: %d\n",C[t]);}}
  MPI_Finalize();
  return 0;}
	
	
 


  
