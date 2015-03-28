package simple_square;

import gps.api.GPSState;

import java.util.ArrayList;
import java.util.List;

public class SimpleSquaresState implements GPSState {
	
	List<Block> blocks = new ArrayList<Block>();
	List<Arrow> arrows = new ArrayList<Arrow>(); 
	
	public SimpleSquaresState(List<Block> blocks, List<Arrow> arrows){
		this.blocks = blocks;
		this.arrows = arrows;
	}
	
	@Override
	public boolean compare(GPSState state) {
		for( int i=0; i<blocks.size(); i++)
			if(!blocks.get(i).equals(state.getBlocks().get(i)))
				return false;
		
		return true;
	}

	@Override
	public List<Block> getBlocks() {
		return blocks;
	}

	@Override
	public List<Arrow> getArrows() {
		return arrows;
	}

	@Override
	public Block getBlockAt(Position at) {
		for(Block b : blocks){
			if(b.getPosition().equals(at))
				return b;
		}
		return null;
	}
	
	public Arrow getArrowAt(Position at){
		for(Arrow b : arrows){
			if(b.getPos().equals(at))
				return b;
		}
		return null;
	}
	
	@Override
	public GPSState clone(){
		List<Block> cloned_blocks = new ArrayList<Block>();
		for(Block b : blocks){
			cloned_blocks.add(b.clone());
		}
		return new SimpleSquaresState(cloned_blocks, arrows);
	}
	
	@Override
	public String toString() {
		String s = "" + '\n';
		s += "En este estado los bloques son:\n";
		for(Block b : blocks){
			s += "posicion: " + b.getPosition().x + ", " + b.getPosition().y + " direccion: " + b.getDirection() + '\n';
		}
		return s;
	}
	
	public int getPath(Block b){
		if(b.isInGoal()){
			return 0;
		}
		int value = getPath(null, null,b.getPosition(), b.getDirection(), b.getTargetPosition());
		if(value == Integer.MAX_VALUE){
			return b.getManhattanDistanceToObjective();
		}
		return value;
	}
	
	private int getPath(Position initial,Direction initialDirection ,Position pos, Direction dir, Position target){
		if(pos.equals(initial) && initialDirection.equals(dir)){
			return Integer.MAX_VALUE;
		}
		if(initial == null){
			initial = pos;
			initialDirection = dir;
		}
		if(dir.equals(Direction.UP) && pos.isAtDownFrom(target)){
			return pos.x - target.x;
		}
		if(dir.equals(Direction.LEFT) && pos.isAtRightFrom(target)){
			return pos.y - target.y;
		}
		if(dir.equals(Direction.DOWN) && pos.isAtUpFrom(target)){
			return target.x - pos.x;
		}
		if(dir.equals(Direction.RIGHT) && pos.isAtLeftFrom(target)){
			return target.y - pos.y;
		}
		for(Arrow a : arrows){
			if(a.getDir().equals(Direction.UP) && pos.isAtDownFrom(a.getPos())){
				return (pos.x - a.getPos().x) + getPath(initial, initialDirection,a.getPos(), a.getDir(), target);
			}
			if(a.getDir().equals(Direction.LEFT) && pos.isAtRightFrom(a.getPos())){
				return (pos.y - a.getPos().y) + getPath(initial, initialDirection, a.getPos(), a.getDir(), target);
			}
			if(a.getDir().equals(Direction.DOWN) && pos.isAtUpFrom(a.getPos())){
				return (a.getPos().x - pos.x) + getPath(initial, initialDirection, a.getPos(), a.getDir(), target);
			}
			if(a.getDir().equals(Direction.RIGHT) && pos.isAtLeftFrom(a.getPos())){
				return (a.getPos().y - pos.y) + getPath(initial, initialDirection, a.getPos(), a.getDir(), target);
			}
		}
		return Integer.MAX_VALUE;
	}

	@Override
	public String getName() {
		String name="";
		for(Block b: blocks){
			name += b.getDirection() + "" + b.getPosition().x + b.getPosition().y;
		}
		return name;
	}

	@Override
	public String getPrintableName() {
		String name="";
		for(Block b: blocks){
			name += "(" + b.getPosition().x +", " + b.getPosition().y + ", " + b.getDirection() + ")";
		}
		return name;
	}
	
}
