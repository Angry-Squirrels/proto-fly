package engine;
import engine.geom.Vector2;

/**
 * ...
 * @author Thomas B
 */
class World
{
	
	static var mInstance : World;

	public static function getI() : World {
		if (mInstance == null)
			mInstance = new World();
		return mInstance;
	}
	
	function new() {
		gravity = new Vector2(0, 100);
	}
	
	public var gravity : Vector2;
	
}