package engine.constraint;
import engine.Entity;

/**
 * ...
 * @author Thomas B
 */
class DistConstraint extends Constraint
{
	
	var mDist : Float;

	public function new(a : Entity, b : Entity, dist : Float) 
	{
		super(a, b);
		mDist = dist;
	}
	
	override public function resolve() 
	{	
		var dist = mEntityA.position.sub(mEntityB.position);
		var angle = dist.angle * Math.PI / 180;
		
		if(dist.length > mDist){
			mEntityA.position.x = mEntityB.position.x + Math.cos(angle) * mDist;
			mEntityA.position.y = mEntityB.position.y + Math.sin(angle) * mDist;
			mEntityA.velocity.subEq(mEntityB.velocity);
		}
	}
	
}