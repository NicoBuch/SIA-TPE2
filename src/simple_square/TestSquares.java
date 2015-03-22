package simple_square;

import gps.GPSEngine;
import gps.SearchStrategy;

import java.util.Scanner;

public class TestSquares {
	public static void main(String[] args) {
		long time = System.currentTimeMillis();
		GPSEngine engine = new SimpleSquaresEngine();
		
		Scanner s = new Scanner(System.in);
		while(true){
		System.out.println("Ingrese una estrategia:");
		String strat = s.nextLine();
		SearchStrategy strategy = SearchStrategy.BFS;
		if(strat.toLowerCase().equals("bfs")){
			strategy = SearchStrategy.BFS;
		}else if(strat.toLowerCase().equals("dfs")){
			strategy = SearchStrategy.DFS;
		}else if(strat.toLowerCase().equals("astar")){
			strategy = SearchStrategy.AStar;
		}else if(strat.toLowerCase().equals("deepiteration")){
			strategy = SearchStrategy.DeepIteration;
		}else if(strat.toLowerCase().equals("greedy")){
			strategy = SearchStrategy.Greedy;
		}else if(strat.toLowerCase().equals("quit")){
			return;
		}else{
			System.out.println("No se encontró estrategia con ese nombre");
		}
		
		engine.engine(new SimpleSquaresProblem(strategy), strategy);
		System.out.println("Total time in milis: " + ((System.currentTimeMillis() - time)));
		}
	}
}
