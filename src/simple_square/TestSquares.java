package simple_square;

import gps.GPSEngine;
import gps.Heuristic;
import gps.SearchStrategy;

import java.util.Scanner;

public class TestSquares {
	public static void main(String[] args) {
		long time = System.currentTimeMillis();
		GPSEngine engine = new SimpleSquaresEngine();

		// Scanner s = new Scanner(System.in);
		// while(true){
//		System.out.println("Ingrese una estrategia:");
		// String strat = s.nextLine();
		String strat = args[0];
		String heur = args[1];
		Heuristic heuristic = Heuristic.DEFAULT;
		SearchStrategy strategy = SearchStrategy.BFS;
		
		if (strat.toLowerCase().equals("bfs")) {
			strategy = SearchStrategy.BFS;
		} else if (strat.toLowerCase().equals("dfs")) {
			strategy = SearchStrategy.DFS;
		} else if (strat.toLowerCase().equals("astar")) {
			strategy = SearchStrategy.AStar;
		} else if (strat.toLowerCase().equals("deepiteration")) {
			strategy = SearchStrategy.DeepIteration;
		} else if (strat.toLowerCase().equals("greedy")) {
			strategy = SearchStrategy.Greedy;
		} else if (strat.toLowerCase().equals("quit")) {
			return;
		} else {
			System.out.println("No se encontró estrategia con ese nombre");
		}
		
		if(heur.toString().equals("mindistance")){
			heuristic = Heuristic.MinDistance;
		}else {
			heuristic = Heuristic.DEFAULT;
		}

		engine.engine(new SimpleSquaresProblem(strategy, args[2], heuristic), strategy);
		System.out.println("Total time in milis: "
				+ ((System.currentTimeMillis() - time)));
	}
	// }
}
