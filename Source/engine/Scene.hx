package engine ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * ...
 * @author Thomas B
 */
class Scene extends Sprite
{
	
	var mEntities : Array<Entity>;
	var mEntitiesToRemove : Array<Entity>;
	
	var mLastTime : Float;
	
	var mWorld : World;

	public function new() 
	{
		super();
		
		mEntities = new Array<Entity>();
		mEntitiesToRemove = new Array<Entity>();
		
		mWorld = World.getI();
		
		mLastTime = Lib.getTimer();
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e:Event):Void 
	{
		var time = Lib.getTimer();
		var deltaTime = (time - mLastTime) / 1000;
		mLastTime = time;
		
		while (mEntitiesToRemove.length > 0) 
			mEntities.remove(mEntitiesToRemove.pop());
		
		for (ent in mEntities) {
			ent.applyImpulse(mWorld.gravity);
			ent.update(deltaTime);
		}
		
		update(deltaTime);
	}
	
	public function update(delta : Float) {
		
	}
	
	public function add(ent : Entity) {
		mEntities.push(ent);
		addChild(ent);
	}
	
	public function remove(ent : Entity) {
		mEntitiesToRemove.push(ent);
		removeChild(ent);
	}
	
}