package cschw5;

import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.PriorityQueue;

public class Vertex implements Comparator<Vertex>, Comparable<Vertex>{
	private int number;
	private int key;
	private int parent;

public Vertex(){
	key = 10000000;
	parent = -1;}

public Vertex(int n,int k,int p){
	number = n;
	key = k;
	parent = p;}

public int getKey(){
	return key;}

public int getNumber(){
	return number;}

public int getParent(){
	return parent;}

public void setParent(int n){
	parent = n;}

public void setKey(int h){
	key = h;
}

public int compareTo(Vertex d) {
	if (this.key < d.key) return -1;
	else if (this.key > d.key) return 1;
	else if (this.key == d.key) return 0;
	else return -2;
}

public int compare(Vertex a,Vertex b) {
	return b.getKey() - a.getKey();
}


public static LinkedList<Vertex> MSTPRIM(LinkedList<Vertexweight>[] oringraph,int root){
	Map <String,Vertex> vertexlist = new HashMap<String,Vertex>();
	LinkedList<Vertex> G = new LinkedList<Vertex>();

	for (int i = 0;i < oringraph.length;i++){
		if (i == root){
			vertexlist.put(String.valueOf(i),new Vertex(root,0,-1));}
		else {
			vertexlist.put(String.valueOf(i),new Vertex(i,10000000,-1));}}
	
	PriorityQueue<Vertex> Q = new PriorityQueue<Vertex>(oringraph.length);
	
	for (int a = 0;a < oringraph.length;a++){
	Q.offer(vertexlist.get(""+a));}
	
	while (Q.size() > 0){
		Vertex h = Q.poll(); //Root 
		int y = h.getNumber(); //0
		for (int b = 0;b < oringraph[y].size();b++){
			Vertexweight j = oringraph[y].get(b); 
			Vertex j2 = vertexlist.get(""+j.getVertexNum());
			if (Q.contains(j2)){
				Vertex testtemp = vertexlist.get(""+j.getVertexNum());
				if (j.getWeight() < testtemp.key){
					Q.remove(testtemp);
					testtemp.setKey(j.getWeight());
					testtemp.setParent(h.number);
					Q.add(testtemp);
					vertexlist.put(String.valueOf(testtemp.getNumber()),testtemp);
			}}
		} G.add(h);
		}
	
	return G;
}
}

