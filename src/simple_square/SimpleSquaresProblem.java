package simple_square;

import gps.api.GPSProblem;
import gps.api.GPSRule;
import gps.api.GPSState;

import java.util.ArrayList;
import java.util.List;

public class SimpleSquaresProblem implements GPSProblem {
	
	@Override
	public GPSState getInitState() {
		List<Block> blocks = new ArrayList<Block>();
		List<Arrow> arrows = new ArrayList<Arrow>(); 
		
		blocks.add(new Block (new Position (2,1), Direction.RIGHT, new Position (1,1)));
		blocks.add(new Block (new Position (2,3), Direction.LEFT, new Position (1,1)));
		blocks.add(new Block (new Position (3,2), Direction.UP, new Position (2,2)));
		
		return new SimpleSquaresState(blocks,arrows);
	}

	@Override
	public GPSState getGoalState() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GPSRule> getRules() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getHValue(GPSState state) {
		// TODO Auto-generated method stub
		return null;
	}

}
