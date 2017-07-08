#include <stdio.h>
//#include "../util.h"
//#include "cuda.h"
//#include "cutill_inline.h"
__global__ void matrixMul(float *A,float *B,float *C,int size,int width){
int bx=blockIdx.x;
int by=blockIdx.y;
int tx=threadIdx.x;
int ty=threadIdx.y;
int i;
int row=by*width+ty;
int column=bx*width+tx;
int temp;
temp=0;
for(i=0;i<size;i++){
	C[row*size+i]=A[row*size+i]+B[row*size+i];
}
}

int main(int argc , char **argv){
    int i,j;
    float* matrixA = NULL;
    float* matrixB = NULL;
   	float* matrixC = NULL;
   	int width;
   	int size,totalSize;
   	if(argc!=3){
		printf("format %s sizeofmatrix sizeofsmallmatrix\n",argv[0]);
		exit(1);	
	}
	size=atoi(argv[1]);
   	width=atoi(argv[2]);
   	printf("size=%d\n",size);
   	printf("width=%d\n",width);
   	totalSize= size*size;
   	printf("totalSize=%d\n",totalSize);
    float* data = (float*) malloc(totalSize*sizeof(float));
    (cudaMalloc( (void**) &matrixA, totalSize*sizeof(float)));
    (cudaMalloc( (void**) &matrixB, totalSize*sizeof(float)));
    (cudaMalloc( (void**) &matrixC, totalSize*sizeof(float)));
	//checkErrors("Memory allocation");
    for(i = 0; i < totalSize; ++i) 
    {
        data[i] = 1;//(int)(10 * rand()/32768.f);
    }
    for(i=0;i<size;i++){
    	for(j=0;j<size;j++){
    	 //printf("%f ", data[i*size+j]);
    	}
    //printf("\n ");
    }
	printf("\n ");
    //checkErrors("Memory copy 0");
    (cudaMemcpy( matrixA, data, sizeof(float)*totalSize, cudaMemcpyHostToDevice) );
    (cudaMemcpy( matrixB, data, sizeof(float)*totalSize, cudaMemcpyHostToDevice) );
    //checkErrors("Memory copy 1");
    dim3 dimBlock(width,width);
    dim3 dimGrid(size/width,size/width);
	//
	cudaEvent_t start_event, stop_event;
    cudaEventCreate(&start_event) ;
    cudaEventCreate(&stop_event) ;
    cudaEventRecord(start_event, 0);
	//
	matrixMul<<<dimGrid, dimBlock>>>(matrixA,matrixB,matrixC,size,width);
	cudaThreadSynchronize();
	//
    cudaEventRecord(stop_event, 0);
    cudaEventSynchronize(stop_event);
    float time_kernel; 
    cudaEventElapsedTime(&time_kernel, start_event, stop_event);
	printf("Total time %f\n", time_kernel);
	//
	(cudaMemcpy( data,matrixC, sizeof(float) * totalSize, cudaMemcpyDeviceToHost));
    //checkErrors("Memory copy 2"); 

    for(i=0;i<size;i++){
    	for(j=0;j<size;j++){
    		//printf("%f ", data[i*size+j]);
    	}
    		//printf("\n ");
    } 
	free(data);
    cudaFree( matrixA);
    cudaFree( matrixB);
    cudaFree( matrixC);
    return 0;
}
