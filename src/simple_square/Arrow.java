package simple_square;

public class Arrow {
	private Position pos;
	private Direction dir;
	
	public Arrow(Position pos, Direction dir){
		this.pos = pos;
		this.dir = dir;
	}
	
	public Position getPos() {
		return pos;
	}

	public Direction getDir() {
		return dir;
	}

	public Arrow clone(){
		return new Arrow(this.pos, this.dir);
	}
}
