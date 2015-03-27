package simple_square;

import javax.sql.rowset.CachedRowSet;

import org.omg.PortableServer.THREAD_POLICY_ID;

public class Block implements Cloneable{
	private Position position;
	private Position targetPosition;
	private Direction direction;
	
	public Block(Position position, Direction direction, Position targetPosition){
		this.position = position;
		this.direction = direction;
		this.targetPosition = targetPosition;
	}
	
	public Position getPosition() {
		return position;
	}

	public Position getTargetPosition() {
		return targetPosition;
	}
	
	public Direction getDirection() {
		return direction;
	}
	
	public void move(){
		this.position = position.move(direction);
	}
	
	public Position getNextPosition(Direction dir){
		return position.move(dir);	
	}
	
	public void move(Direction d){
		this.position = position.move(d);
	}
	
	public void rotate(Direction dir){
		this.direction = dir;
	}
	
	public boolean isInGoal(){
		if(targetPosition == null){
			return true;
		}
		return position.equals(targetPosition);
	}
	
	@Override
	public Block clone(){
		return new Block(this.position, this.direction, this.targetPosition);
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((direction == null) ? 0 : direction.hashCode());
		result = prime * result
				+ ((position == null) ? 0 : position.hashCode());
		result = prime * result
				+ ((targetPosition == null) ? 0 : targetPosition.hashCode());
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
		Block other = (Block) obj;
		if (direction != other.direction)
			return false;
		if (position == null) {
			if (other.position != null)
				return false;
		} else if (!position.equals(other.position))
			return false;
		if (targetPosition == null) {
			if (other.targetPosition != null)
				return false;
		} else if (!targetPosition.equals(other.targetPosition))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "direction: " + direction.toString() + ", position: " + position.toString() +  ", Objective: " + targetPosition.toString();
	}

	public double getDistanceToObjective() {
		if (targetPosition == null)
			return 0;
		return Math.sqrt(Math.pow(position.x - targetPosition.x, 2) + Math.pow(position.y - targetPosition.y, 2));
	}
	
	public int getManhattanDistanceToObjective() {
		if (targetPosition == null)
			return 0;
		return Math.abs(targetPosition.x - position.x) + Math.abs(targetPosition.y - position.y);
	}

	public boolean analyizeTotalArea(Block b) {
		Position from = b.getPosition();
		Position target = b.getTargetPosition();
		int difx = target.x - from.x;
		int dify = target.y - from.y;
		Direction direcICanMoveB = this.getDirection();
		
		//difx < 0 => from.x > target.x => target esta a la izquierda de b
		//dify < 0 => from.y > target.y => target esta arriba de b
	
		if(difx<0){
			// si el target de b esta arriba a la izquierda del bloque
			if(dify < 0){
				//si este bloque (this) esta abajo y  puede mover a b arriba o this esta a la derecha y puede mover a b la izq
				if((this.getPosition().isAtDownFrom(from) && direcICanMoveB.equals(Direction.UP)) || (this.getPosition().isAtRightFrom(from) && direcICanMoveB.equals(Direction.LEFT)))
					return true;
			}
			
			else if(dify == 0){
				// si this esta horizontalmente igual que b a la derecha y lo puede mover a la izquierda
				if(this.getPosition().isAtRightFrom(from) && direcICanMoveB.equals(Direction.LEFT))
					return true;
			}
			else if (dify > 0){
				if((this.getPosition().isAtUpFrom(from) && direcICanMoveB.equals(Direction.DOWN)) || (this.getPosition().isAtRightFrom(from) && direcICanMoveB.equals(Direction.LEFT)))
					return true;
			}
		}
		else if (difx == 0){
			if(dify > 0){
				if(this.getPosition().isAtUpFrom(from) && direcICanMoveB.equals(Direction.DOWN))
					return true;
			}
			else if (dify < 0){
				if(this.getPosition().isAtDownFrom(from) && direcICanMoveB.equals(Direction.UP))
					return true;
			}
			else if (dify == 0)
				return true;
		}
		else if (difx > 0){
			if(dify < 0){
				if((this.getPosition().isAtLeftFrom(from) && direcICanMoveB.equals(Direction.RIGHT)) || (this.getPosition().isAtDownFrom(from) && direcICanMoveB.equals(Direction.UP)))
					return true;
			}
			else if (dify == 0){
				if(this.getPosition().isAtLeftFrom(from) && direcICanMoveB.equals(Direction.RIGHT))
					return true;
			}
			else if (dify > 0){
				if((this.getPosition().isAtUpFrom(from) && direcICanMoveB.equals(Direction.DOWN)) || (this.getPosition().isAtLeftFrom(from) && direcICanMoveB.equals(Direction.RIGHT)))
					return true;
			}
		}
		return false;
	}

}
