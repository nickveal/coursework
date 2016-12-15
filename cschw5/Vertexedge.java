package cschw5;

import java.util.Comparator;
import java.util.LinkedList;
import java.util.PriorityQueue;

public class Vertexedge implements Comparator<Vertexedge>,Comparable<Vertexedge>{
	private int u;
	private int weight;
	private int v;
	
	public Vertexedge(int vertex1,int weightinput,int vertex2){
		u = vertex1;
		weight = weightinput;
		v = vertex2;}
	
	public int getU(){
		return u;}
	
	public int getWeight(){
		return weight;}
	
	public int getV(){
		return v;}
	
	public int compareTo(Vertexedge d) {
		if (this.weight < d.weight) return -1;
		else if (this.weight > d.weight) return 1;
		else if (this.weight == d.weight) return 0;
		else return -2;
	}
	
	public int compare(Vertexedge a,Vertexedge b) {
		return b.getWeight() - a.getWeight();
	}
	
	public static int Findset(int vertexvalue,int [] parentset){
		while (vertexvalue != parentset[vertexvalue]){
			vertexvalue = parentset[vertexvalue];
		}
		return vertexvalue;	
	}
	
	public static LinkedList<Vertexedge> MSTKRUSKAL(PriorityQueue<Vertexedge> edgelist,int [] parentset,int numvertex){
		@SuppressWarnings("unchecked")
		LinkedList<Vertexedge> setarray = new LinkedList();
		while (edgelist.size() > 0){
			 Vertexedge a = edgelist.poll();
		//	 System.out.println("U and V "+a.u+" "+a.v);
			// System.out.println("Find Set Answers "+Findset(a.u,parentset)+" "+Findset(a.v,parentset));
		if (Findset(a.u,parentset) != Findset(a.v,parentset)){
			setarray.add(a);
			parentset[a.v] = a.u;}
		}
	//	for (int j = 0;j < numvertex;j++){
		//	System.out.println(parentset[j]);}
		return setarray;
	}
}
