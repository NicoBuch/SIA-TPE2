package simple_square;

import gps.GPSEngine;
import gps.GPSNode;
import gps.SearchStrategy;

public class SimpleSquaresEngine extends GPSEngine {

	@Override
	public void addNode(GPSNode node) {
		if(strategy.equals(SearchStrategy.DFS)){
			open.add(0, node);
		}
		else if(strategy.equals(SearchStrategy.BFS)){
			open.add(node);
		}
	}

}
