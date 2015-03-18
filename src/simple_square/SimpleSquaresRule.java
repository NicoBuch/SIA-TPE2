package simple_square;

import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;

public class SimpleSquaresRule implements GPSRule {
	Position from;
	Position to;
	
	public SimpleSquaresRule(int xfrom, int yfrom, int xTo, int yTo) {
		from = new Position(xfrom, yfrom);
		to = new Position(xTo, yTo);
	}

	@Override
	public Integer getCost() {
		return 1;
	}

	@Override
	public String getName() {
		return "Move block from position: " + from.toString() + " to Position:" + to.toString();
	}

	@Override
	public GPSState evalRule(GPSState state) throws NotAppliableException {
		// TODO Auto-generated method stub
		return null;
	}

}
