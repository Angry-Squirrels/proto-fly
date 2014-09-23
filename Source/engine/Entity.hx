package engine ;
import engine.constraint.Constraint;
import engine.geom.Vector2;
import openfl.display.Sprite;

/**
 * ...
 * @author Thomas B
 */
class Entity extends Sprite
{
	
	var mWorld : World;
	
	var mImpulses : Array<Vector2>;
	var mConstraints : Array<Constraint>;
	
	public var velocity : Vector2;
	public var position : Vector2; 
	
	public function new() 
	{
		super();
		
		mWorld = World.getI();
		
		mImpulses = new Array<Vector2>();
		mConstraints = new Array<Constraint>();
		
		velocity = new Vector2();
		position = new Vector2();
	}
	
	public function update(delta : Float) {
		position.addEq(velocity.mul(delta));
		
		while (mImpulses.length > 0)
			velocity.addEq(mImpulses.pop());
			
		for (constraint in mConstraints)
			constraint.resolve(delta);
			
		x = position.x;
		y = position.y;
	}
	
	public function applyImpulse(impulse : Vector2) {
		mImpulses.push(impulse);
	}
	
	public function addConstraint(constraint : Constraint) {
		mConstraints.push(constraint);
	}
	
}