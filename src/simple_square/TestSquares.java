package simple_square;

import java.io.IOException;

import gps.GPSEngine;
import gps.Heuristic;
import gps.SearchStrategy;

public class TestSquares {
	public static void main(String[] args) {
		long time = System.currentTimeMillis();
		GPSEngine engine = new SimpleSquaresEngine();

		String strat = args[1];
		Heuristic heuristic = Heuristic.DEFAULT;
		SearchStrategy strategy = SearchStrategy.BFS;
		String heur = "default";
		
		if (args.length > 2) {
			heur = args[2];
			if (heur.toString().equals("mindistance1")) {
				heuristic = Heuristic.MinDistance1;
				System.out.println("Min Distance -- first version (all distances)");
			}
			
			else if (heur.toString().equals("mindistance2")) {
				heuristic = Heuristic.MinDistance2;
				System.out.println("Min Distance -- second version (all distances + consider area)");
			}
			
			else if (heur.toString().equals("mindistance3")) {
				heuristic = Heuristic.MinDistance3;
				System.out.println("Min Distance -- third version (all distances + consider any block in the path)");
			}
			
			else if(heur.toString().equals("inpath")){
				heuristic = Heuristic.InPath;
				System.out.println("In Path");
			}
			else if(heur.toString().equals("admissiblemindistance")){
				heuristic = Heuristic.AdmissibleMinDistance;
				System.out.println("Admissible Min Distance");
			}
			else if(heur.toString().equals("admissibleinpath")){
				heuristic = Heuristic.AdmissibleInPath;
				System.out.println("Admissible In Path");
			}
			else if(heur.toString().equals("admissiblecombination")){
				heuristic = Heuristic.AdmissibleCombination;
				System.out.println("Combinación de Admissible's In path and Min Distance");
			}
			else if(heur.toString().equals("notadmissiblecombination")){
				heuristic = Heuristic.NotAdmissibleCombination;
				System.out.println("Combination of Min Distance 1 and In Path");
			}
			
		} else {
			heuristic = Heuristic.DEFAULT;
			System.out.println("Sin heurística");
		}

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

		try {
			engine.engine(new SimpleSquaresProblem(strategy, args[0], heuristic),
					strategy);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Total time in milis: "
				+ ((System.currentTimeMillis() - time)));
	}
}
