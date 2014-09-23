package game.dragon;
import engine.geom.Vector2;
import flash.events.Event;
import openfl.events.KeyboardEvent;
import openfl.geom.Point;
import openfl.Lib;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Thomas B
 */
class Head extends Part
{
	
	var mUpDown : Bool;
	var mDownDown : Bool;
	
	public function new() 
	{
		super(null);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKUp);
	}
	
	override function draw() 
	{
		graphics.clear();
		graphics.beginFill(0x993333);
		graphics.drawEllipse(0, -10, 30, 20);
	}
	
	override public function update(delta:Float) 
	{
		super.update(delta);
		
		if (mUpDown)
			velocity.angle-=10;
		if (mDownDown)
			velocity.angle+=10;
	}
	
	function onKUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.UP)
			mUpDown = false;
		if (e.keyCode == Keyboard.DOWN)
			mDownDown = false;
	}
	
	function onKDown(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.UP)
			mUpDown = true;
		if (e.keyCode == Keyboard.DOWN)
			mDownDown = true;
	}
}