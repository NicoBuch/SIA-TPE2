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
		
		blocks.add(new Block (new Position (1,1), Direction.RIGHT, new Position (2,3)));
		blocks.add(new Block (new Position (0,2), Direction.LEFT, new Position (1,2)));
		blocks.add(new Block (new Position (1,3), Direction.UP, new Position (2,1)));
		
		return new SimpleSquaresState(blocks,arrows);
	}

	@Override
	public GPSState getGoalState() {
		List<Block> blocks = new ArrayList<Block>();
		List<Arrow> arrows = new ArrayList<Arrow>();
		
		blocks.add(new Block (new Position (3,3), Direction.RIGHT, new Position (3,3)));
		blocks.add(new Block (new Position (2,2), Direction.LEFT, new Position (2,2)));
		blocks.add(new Block (new Position (3,1), Direction.UP, new Position (3,1)));
		return new SimpleSquaresState(blocks,arrows);
	}

	@Override
	public List<GPSRule> getRules() {
		List<GPSRule> rules = new ArrayList<GPSRule>();
		
		for (int i = 0; i < SimpleSquaresState.SIZE ; i++)
			for (int j = 0 ; j < SimpleSquaresState.SIZE; j++){
				rules.add(new SimpleSquaresRule(i,j,i+1,j));
				rules.add(new SimpleSquaresRule(i,j,i-1,j));
				rules.add(new SimpleSquaresRule(i,j,i,j+1));
				rules.add(new SimpleSquaresRule(i,j,i,j-1));
			}
		return rules;
	}

	@Override
	public Integer getHValue(GPSState state) {
		// TODO Auto-generated method stub
		return null;
	}

}
