package;

import flixel.FlxState;
import Level;
import flixel.FlxG;
import fishes.*;
import enemies.*;
import blocks.*;
import nape.phys.Material;

class PlayState extends FlxState
{
	private var firstLevel:Level;
	var _turtle:Turtle;
	override public function create():Void
	{
		firstLevel = new Level();
		_turtle = new Turtle(100, FlxG.height-10, AssetPaths.zolwik__png, false, Material.wood());
		firstLevel.addFish(_turtle);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.mouse.pressed) {
			FlxG.switchState(firstLevel);

		}
		
		
	}
	
}
