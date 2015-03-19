package simple_square;

import gps.GPSEngine;
import gps.SearchStrategy;

public class TestSquares {
	public static void main(String[] args) {
		long time = System.currentTimeMillis();
		GPSEngine engine = new SimpleSquaresEngine();
		
		engine.engine(new SimpleSquaresProblem(SearchStrategy.Greedy), SearchStrategy.Greedy);
		System.out.println("Total time in milis: " + ((System.currentTimeMillis() - time)));
	}
}
