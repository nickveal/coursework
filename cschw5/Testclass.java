package cschw5;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.PriorityQueue;



public class Testclass {

	public static void main(String[] args) {
		int numbervertices = 512;
		int numberedges = 512;
		int higher = 101;
		int lower = 1;
		int genweight;
		int specialindex1;
		int specialindex2;
		int iter = 100;
		Map <String,Vertex> vertexlist = new HashMap<String,Vertex>();
		PriorityQueue<Vertexedge> kqueue = new PriorityQueue<Vertexedge>(numberedges);

		for (int i = 0;i < numbervertices;i++){
			vertexlist.put(String.valueOf(i),new Vertex());
		}
		
		LinkedList<Vertexweight>[] graph = new LinkedList[numbervertices];
		for (int i = 0;i < numbervertices;i++){
			 graph[i] = new LinkedList<Vertexweight>();}
		
		int [] arrayset = new int [numbervertices];
		for (int i = 0;i < numbervertices;i++){
			arrayset[i] = i;
		}
		
		
		for (int h = 0;h < numbervertices-1;h++){
			genweight =	lower + (int)(Math.random()*(higher - lower + 1));
			
			Vertexweight j = new Vertexweight(h+1,genweight);
			graph[h].add(j);
			
			Vertexweight j2 = new Vertexweight(h,genweight);
			graph[h+1].add(j2);
			
			Vertexedge j1 = new Vertexedge(h,genweight,h+1);
			kqueue.add(j1);}
		
		for (int e = 0;e < numberedges-(numbervertices-1);e++){
			specialindex1 = 0 + (int)(Math.random()*(numbervertices - lower));
			specialindex2 = 0 + (int)(Math.random()*(numbervertices - lower));
			while (specialindex1 == specialindex2 || specialindex1 + 1 == specialindex2){
				specialindex1 = 0 + (int)(Math.random()*(numbervertices - lower));
				specialindex2 = 0 + (int)(Math.random()*(numbervertices - lower));}
			genweight = lower + (int)(Math.random()*(higher - lower + 1));
			
			Vertexweight k = new Vertexweight(specialindex2,genweight);
			graph[specialindex1].add(k);
			
			Vertexweight k2 = new Vertexweight(specialindex1,genweight);
			graph[specialindex2].add(k2);
			
			Vertexedge k1 = new Vertexedge(specialindex1,genweight,specialindex2);
			kqueue.add(k1);}
			
		PriorityQueue<Vertexedge> kqueue2 = new PriorityQueue<Vertexedge>(kqueue);
		int [] arrayset2 = arrayset.clone();
		LinkedList<Vertexweight>[] graph2 = graph.clone();


		/*for (int b = 0;b < numbervertices;b++){
			for (int a = 0;a <graph[b].size();a++){
				System.out.println(b + " Vertex: "+graph[b].get(a).getVertexNum()+ " "+graph[b].get(a).getWeight());
			}
		}*/
	//	System.out.println("Done");

		long starttime= System.nanoTime();
		for (int a = 0; a <iter;a++){
		Vertexedge.MSTKRUSKAL(kqueue,arrayset,numbervertices);
		kqueue = new PriorityQueue<Vertexedge>(kqueue2);
		arrayset = arrayset2.clone();
		}
		long endtime = System.nanoTime();

		/*System.out.println(result.size());
		Vertexedge i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());
		i = result.poll();
		System.out.println(i.getU()+" "+i.getWeight()+" "+i.getV());*/
	
		long starttime2= System.nanoTime();
		for (int a = 0; a <iter;a++){
		Vertex.MSTPRIM(graph,0);
		graph = graph2.clone();}
		long endtime2 = System.nanoTime();

		
		double duration = (double)(endtime - starttime) / (Math.pow(10, 9));
		double duration2 = (double)(endtime2 - starttime2) / (Math.pow(10, 9));
		System.out.println(duration);
		System.out.println(duration2);

		/*Vertex test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());
		test = h.pop();
		System.out.println(test.getNumber()+","+test.getKey()+","+test.getParent());*/








		 









	}
	}

