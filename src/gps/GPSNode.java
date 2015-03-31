package gps;

import simple_square.SimpleSquaresProblem;
import gps.api.GPSState;

public class GPSNode implements Comparable<GPSNode>{

	private GPSState state;

	private GPSNode parent;

	private Integer cost;

	public GPSNode(GPSState state, Integer cost) {
		super();
		this.state = state;
		this.cost = cost;
	}

	public GPSNode getParent() {
		return parent;
	}

	public void setParent(GPSNode parent) {
		this.parent = parent;
	}

	public GPSState getState() {
		return state;
	}

	public Integer getCost() {
		return cost;
	}

	@Override
	public String toString() {
		return state.toString();
	}

	public String getSolution() {
		if (this.parent == null) {
			return this.state.toString();
		}
		return this.parent.getSolution() + "\n" + this.state;
	}
	
	public String getName(){
		return state.getName();
	}
	

	@Override
	public int compareTo(GPSNode o) {
		Integer heuristicValue = SimpleSquaresProblem.getHValue(this.state);
		Integer otherHeuristicValue = SimpleSquaresProblem.getHValue(o.state);
		if(heuristicValue.equals(Integer.MAX_VALUE))
			GPSEngine.paintNode(this, "red");
		if(SimpleSquaresProblem.getStrategy().equals(SearchStrategy.AStar)){
			return (heuristicValue + cost ) - (otherHeuristicValue + o.cost);
		}else{
			return heuristicValue - otherHeuristicValue;
		}
	}

	public String getPrintableName() {
		return state.getPrintableName();
	}
}
