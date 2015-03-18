package simple_square;

import gps.GPSEngine;
import gps.SearchStrategy;
import gps.api.GPSProblem;

public class TestSquares {
	public static void main(String[] args) {
		GPSEngine engine = new SimpleSquaresEngine();
		engine.engine(new SimpleSquaresProblem(), SearchStrategy.BFS);
	}
}
