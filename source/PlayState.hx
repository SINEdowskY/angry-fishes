package;

import flixel.FlxState;
import Level;
import flixel.FlxG;
import fishes.*;
import enemies.*;
import blocks.*;
import nape.phys.Material;
import flixel.ui.Flxbutton;


class PlayState extends FlxState
{
	private var firstLevel:Level;
	var _starFish:StarFish;
	private var _start:FlxButton;
	override public function create():Void
	{
		_start = new FlxButton(FlxG.width/2-50, FlxG.height/2, "START", onClick);
		_start.setGraphicSize(50,50);
		_start.setSize(50,50);

		firstLevel = new Level();
		_starFish = new StarFish(50, FlxG.height - 20, AssetPaths.gwiazdka__png, true, 32, 32 );
		firstLevel.addFish(_starFish);
		
		add(_start);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
	}
	function onClick() {
		FlxG.switchState(firstLevel);
	}
	
}
