/**********************************************************************
* Parallel and Distributed Computing Computing Assignment Take Home PA*
* Name: Nicholas Veal                                                 *
* Class:Dr.Prasad                                                     *
* Program: All-Gather                                                 *                                   
* Description: Elements from each matrix in each process's memory     *
* will be shared among all processes will have every element in its   *
* matrix                                                              *
**********************************************************************/
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
  int *A = (int*)malloc(sizearray);

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
        A[a] = (i);}}}
		
  
    int offset = D*1;
    MPI_Barrier(MPI_COMM_WORLD);
	
	for (int b = D-1; b >= 0 ; b--){
      for (int z = id; z < p ; z++){
	    if (id == z){
		  int partner = id ^ (int)exp2(b);
		  MPI_Isend(&A[0],offset,MPI_INT,partner,tag2,MPI_COMM_WORLD,&request);
		  MPI_Recv(&A[offset],offset,MPI_INT,partner,tag2,MPI_COMM_WORLD,&status);}}
		offset*=2;}
        MPI_Barrier(MPI_COMM_WORLD);

    if (id == 14){
	  for (int d = 0;d<NFULL;d++){
        printf("%d",A[d]);}}
    

 
		
  MPI_Finalize();}
  


  