package simple_square;

import gps.api.GPSState;

import java.util.ArrayList;
import java.util.List;

public class SimpleSquareState implements GPSState {
	
	List<Block> blocks = new ArrayList<Block>();
	List<Arrow> arrows = new ArrayList<Arrow>(); 
	
	@Override
	public boolean compare(GPSState state) {
		// TODO Auto-generated method stub
		return false;
	}

}
