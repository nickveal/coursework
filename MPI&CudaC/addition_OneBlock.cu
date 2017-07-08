#include <stdio.h>


__global__ void matrixMul(int *A,int *B,int *C,int size){
int tx=threadIdx.x;
int ty=threadIdx.y;
int i;
int temp;
temp=0;
for(i=0;i<size;i++){
	C[tx+ty*size]=A[tx+ty*size]+B[tx+ty*size];
}
printf("cuda");
}

int main(int argc , char **argv){
    int i,j;
    int* matrixA = NULL;
    int* matrixB = NULL;
   	int* matrixC = NULL;
   	int size,totalSize;
    if(argc!=2){
		printf("format:%s sizeofmatrix\n",argv[0]);
		exit(1);
	}
  	size=atoi(argv[1]);
   	totalSize= size*size;
    //allocate host memory
    int* data = (int*) malloc(totalSize*sizeof(int));
    //allocate device memory
    (cudaMalloc( (void**) &matrixA, sizeof(int)*totalSize));
    (cudaMalloc( (void**) &matrixB, sizeof(int)*totalSize));
    (cudaMalloc( (void**) &matrixC, sizeof(int)*totalSize));
	
    for(i = 0; i < totalSize; i++) 
    {
        data[i] = 1;//(int)(10 * rand()/32768.f);
    }
    for(i=0;i<size;i++){
    	for(j=0;j<size;j++){
    	 printf("%d ", data[i*size+j]);
    	}
    printf("\n ");
    }
	printf("\n ");
    //copy data from memory to device memory
    (cudaMemcpy( matrixA, data, sizeof(int)*totalSize, cudaMemcpyHostToDevice) );
    (cudaMemcpy( matrixB, data, sizeof(int)*totalSize, cudaMemcpyHostToDevice) ); 
   
    dim3 dimBlock(size,size);
    dim3 dimGrid(1,1);
    //timing
	cudaEvent_t start_event, stop_event;
    cudaEventCreate(&start_event) ;
    cudaEventCreate(&stop_event) ;
    cudaEventRecord(start_event, 0);
	//Call kernel(global function)
	matrixMul<<<dimGrid, dimBlock>>>(matrixA,matrixB,matrixC,size);
	cudaThreadSynchronize();
	//
    cudaEventRecord(stop_event, 0);
    cudaEventSynchronize(stop_event);
    float time_kernel; 
    cudaEventElapsedTime(&time_kernel, start_event, stop_event);
	printf("Total time %f\n", time_kernel);
	//copy data from device memory to memory
	(cudaMemcpy( data,matrixC, sizeof(int)*totalSize, cudaMemcpyDeviceToHost));


    for(i=0;i<size;i++){
    	for(j=0;j<size;j++){
    	 	printf("%d ", data[i*size+j]);
    	}
    	printf("\n");
    } 
	free(data);
    cudaFree( matrixA);
    cudaFree( matrixB);
    cudaFree( matrixC);
    return 0;
}
