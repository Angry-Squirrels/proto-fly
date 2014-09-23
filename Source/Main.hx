package;

import game.dragon.Head;
import game.TestScene;
import openfl.display.Sprite;

class Main extends Sprite {
	
	public function new () {
		
		super ();
		
		var scene = new TestScene();
		addChild(scene);
	}
	
}