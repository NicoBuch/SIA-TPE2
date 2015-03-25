package simple_square;

import gps.GPSEngine;
import gps.GPSNode;
import gps.SearchStrategy;

import java.util.LinkedList;
import java.util.PriorityQueue;

public class SimpleSquaresEngine extends GPSEngine {

	@Override
	public void addNode(GPSNode node) {
		if(strategy.equals(SearchStrategy.DFS)){
			LinkedList<GPSNode> aux = (LinkedList<GPSNode>) open;
			aux.add(0, node);
		}
		else if(strategy.equals(SearchStrategy.BFS)){
			LinkedList<GPSNode> aux = (LinkedList<GPSNode>) open;
			aux.add(node);
		}
		else if(strategy.equals(SearchStrategy.DeepIteration)){
			LinkedList<GPSNode> aux = (LinkedList<GPSNode>) open;
			aux.add(0, node);
		}
		else if(strategy.equals(SearchStrategy.AStar) ){
			PriorityQueue<GPSNode> aux = (PriorityQueue<GPSNode>) open;
			aux.add(node);
		}
//		else if(strategy.equals(SearchStrategy.Greedy)){
//			LinkedList<GPSNode> aux = (LinkedList<GPSNode>) open;
//			aux.add(0, node);
//		}
	}

}
