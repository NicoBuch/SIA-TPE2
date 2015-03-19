package simple_square;

public class Position{
	int x;
	int y;
	
	public Position(int x, int y){
		this.x = x;
		this.y = y;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + x;
		result = prime * result + y;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Position other = (Position) obj;
		if (x != other.x)
			return false;
		if (y != other.y)
			return false;
		return true;
	}


	public boolean isAtLeftFrom(Position pos){
		if(this.y <= pos.y){
			return true;
		}
		return false;
	}
	public boolean isAtUpFrom(Position pos){
		if(this.x <= pos.x){
			return true;
		}
		return false;
	}
	public boolean isAtRightFrom(Position pos){
		if(this.y >= pos.y){
			return true;
		}
		return false;
	}
	public boolean isAtDownFrom(Position pos){
		if(this.x >= pos.x){
			return true;
		}
		return false;
	}

	public Position move(Direction dir){
		Position pos = new Position(x, y);
		if(dir == Direction.LEFT){
			pos.y -= 1; 
		}
		if(dir == Direction.RIGHT){
			pos.y += 1; 
		}
		if(dir == Direction.UP){
			pos.x -= 1; 
		}
		if(dir == Direction.DOWN){
			pos.x += 1; 
		}
		return pos;
		
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}
	
	@Override
	public String toString() {
		return "(" + x + ", " + y + ")";
	}
}
