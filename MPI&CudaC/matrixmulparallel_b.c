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
#define NDIM 50
#define NFULL 2500

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
  int *btemp = (int*)malloc(sizerow);
  int *Ctemp = (int*)malloc(sizearray);
  int *colarray = (int*)malloc(sizerow);
   MPI_Request request;
  tag2= 201;
  tag1 = 210;
  double elapsedtime;

  
  MPI_Init (&argc, &argv);
  MPI_Comm_rank (MPI_COMM_WORLD, &id);
  MPI_Comm_size (MPI_COMM_WORLD, &p);
  
  if (id == 0){
    for( int a = 0; a<NFULL;a++){
      A[a] = (1);
      B[a] = (1);}}
	  
  MPI_Barrier(MPI_COMM_WORLD);
  elapsedtime = -MPI_Wtime();
  
      
	

  
	
  //Sending out the A Array Rows
  for (int b = 1;b<p;b++){
    if (id == 0){
	  MPI_Send(&A[b*NDIM],NDIM,MPI_INT,b,tag1,MPI_COMM_WORLD);}}
  if (id != 0 ){
    MPI_Recv(&atemp[0],NDIM,MPI_INT,0,tag1,MPI_COMM_WORLD,&status);}
 //Sending out the initial B Array Columns
  for (int c = 1;c<p;c++){
    if (id == 0){
      for (int a = 0;a<NDIM;a++){
	    colarray[a] = B[a*NDIM+c];}
	    MPI_Send(&colarray[0],NDIM,MPI_INT,c,tag2,MPI_COMM_WORLD);}}
  for (int k = 0;k<NDIM;k++){
    btemp[k] = B[NDIM*k];}
  if (id != 0){
     MPI_Recv(&btemp[0],NDIM,MPI_INT,0,tag2,MPI_COMM_WORLD,&status);}
	 
  
  MPI_Barrier(MPI_COMM_WORLD); 
  int m = 0;
  int offset = id;
  int n = 0;
	
  for (int q = 0;q < NDIM; q++){
    if (q > 0){
	  for (int l = 0;l < p; l++){
	    if (id == 0 && l == 0){
		  MPI_Isend(&btemp[0],NDIM,MPI_INT,p-1,tag2,MPI_COMM_WORLD,&request);}
		if (id == l && l > 0){
		  MPI_Isend(&btemp[0],NDIM,MPI_INT,l-1,tag2,MPI_COMM_WORLD,&request);}}
	  for (int k = 0; k < p;k++){
        if (id == p-1 && k == p-1){
          MPI_Recv(&btemp[0],NDIM,MPI_INT,0,tag2,MPI_COMM_WORLD,&status);}
		if (id == k && k != p-1){
		    MPI_Recv(&btemp[0],NDIM,MPI_INT,k+1,tag2,MPI_COMM_WORLD,&status);}}}
		 
	MPI_Barrier(MPI_COMM_WORLD); 
		  
		  
    
	for(i = id; i<p; i++){
      int ctemp = 0;
	    for (int j = 0; j<NDIM;j++){
		  if (n>(NDIM-1)){
		    n = 0;}
		  if(i == 0 && id == 0){
		    ctemp += A[n]*B[j*NDIM+m];}
		  if(i > 0 && id == i) {
		    ctemp += atemp[n]*btemp[n];}
          n += 1;}
		if (i == 0){
		  C[m] = ctemp;}

		if (i > 0 && id == i){
		  if (offset > NDIM-1){
		    offset = 0;}
		  Ctemp[offset] = ctemp;
		  offset++;}
	  ctemp = 0;}
    m += 1;
	  }
	  
  if (id != 0){	
    MPI_Send(&Ctemp[0],NDIM,MPI_INT,0,tag2,MPI_COMM_WORLD);}
		  
  for (int r = 1;r<p;r++){
    if (id == 0){
      MPI_Recv(&C[r*NDIM],NDIM,MPI_INT,r,tag2,MPI_COMM_WORLD,&status);}}
	
	
  MPI_Barrier(MPI_COMM_WORLD);
  elapsedtime += MPI_Wtime();
  
  if(id == 0){
  printf("Total elapsed time =%f\n",elapsedtime);
  fflush(stdout);}
		
	  


  if (id == 0){
    for (int t = 0;t < NFULL; t++){
      printf("%d ",C[t]);
	  if (t%NDIM == 0 && t != 0){
	    printf("\n");}}}
  MPI_Finalize();
  return 0;}
	
	
 


  
