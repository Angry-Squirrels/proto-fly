package engine.constraint;
import engine.Entity;
import engine.geom.Vector2;

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
	
	override public function resolve(delta : Float) 
	{	
		var dist = mEntityA.position.sub(mEntityB.position);
		var angle = dist.angle * Math.PI / 180;
		
		//mEntityA.velocity = (mEntityB.velocity);
		//if (dist.length > mDist) {
			var newX = mEntityB.position.x + Math.cos(angle) * mDist;
			var newY = mEntityB.position.y + Math.sin(angle) * mDist;
			
			var newPos = new Vector2(newX, newY);
			var diff = newPos.sub(mEntityA.position);
			diff.muleq(1 / delta);
			diff.muleq(0.1);
			mEntityA.applyImpulse(diff);
			
			mEntityA.position = newPos;
		//}
	}
	
}