package game.dragon;
import engine.constraint.DistConstraint;
import engine.Entity;
import engine.geom.Vector2;

/**
 * ...
 * @author Thomas B
 */
class Part extends Entity
{
	
	var mParent : Part;

	public function new(p : Part) 
	{
		super();
		draw();
		mParent = p;
		
		if (mParent != null) {
			addConstraint(new DistConstraint(this, p, 30));
		}
	}
	
	function draw() 
	{
		graphics.clear();
		graphics.beginFill(0x993333);
		graphics.drawEllipse(0, -10, 30, 20);
	}
	
	override public function update(delta : Float) {
		super.update(delta);
		
		if (mParent != null) {
			var diff = mParent.position.sub(position);
			rotation = diff.angle;
		}else {
			rotation = velocity.angle;
		}
	}
	
}