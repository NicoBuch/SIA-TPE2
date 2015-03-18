package simple_square;

import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;

public class SimpleSquaresRule implements GPSRule {
	Position from;
	
	public SimpleSquaresRule(int xfrom, int yfrom, int xTo, int yTo) {
		from = new Position(xfrom, yfrom);
	}

	@Override
	public Integer getCost() {
		return 1;
	}

	@Override
	public String getName() {
		return "Move block in position: " + from.toString();
	}

	@Override
	public GPSState evalRule(GPSState state) throws NotAppliableException {
		Block b = state.getBlockAt(from);
		if( b == null)
			throw new NotAppliableException();
		
		while(b != null){
			Block aux= state.getBlockAt(b.getNextPosition());
			b.move();
		}
	}

}
