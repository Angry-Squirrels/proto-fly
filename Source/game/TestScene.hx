package game;
import engine.Scene;
import engine.World;
import game.dragon.Head;
import game.dragon.Part;

/**
 * ...
 * @author Thomas B
 */
class TestScene extends Scene
{
	
	var mHero : Head;

	public function new() 
	{
		super();
		
		mHero = new Head();
		add(mHero);
		
		var lastPart : Part = mHero;
		for (i in 0 ... 25)
		{
			var a = new Part(lastPart);
			lastPart = a;
			add(a);
		}
	}
	
	override public function update(delta : Float) {
		super.update(delta);
		
		x = -mHero.x + 400;
		y = -mHero.y + 240;
	}
	
}