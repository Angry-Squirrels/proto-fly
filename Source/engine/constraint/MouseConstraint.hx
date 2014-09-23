package engine.constraint;
import engine.Entity;
import engine.geom.Vector2;
import openfl.Lib;

/**
 * ...
 * @author Thomas BAUDON
 */
class MouseConstraint extends Constraint
{
	
	var mPrevPos : Vector2;

	public function new(target : Entity) 
	{
		super(target, null);
		
		mPrevPos = new Vector2();
	}
	
	override public function resolve(delta : Float) 
	{
		
		var x = Lib.current.stage.mouseX;
		var y = Lib.current.stage.mouseY;
		var newPos = new Vector2(x, y);
		var vit = newPos.sub(mPrevPos).muleq(1 / delta);
		mEntityA.velocity = vit;
		mPrevPos = newPos;
		mEntityA.position.x = x;
		mEntityA.position.y = y;
		
	}
	
}