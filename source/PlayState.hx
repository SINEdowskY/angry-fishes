package;

import flixel.FlxState;
import levels.MainSystemLevels;
import flixel.FlxG;
import flixel.ui.Flxbutton;
import fishes.*;
import enemies.*;
import blocks.*;
import nape.phys.Material;
import flixel.addons.nape.*;


class PlayState extends FlxState
{
	private var firstLevel:MainSystemLevels;
	var _starFish:StarFish;
	private var _start:FlxButton;
	private var foreGround:FlxNapeTilemap;
	override public function create():Void
	{
		_start = new FlxButton(FlxG.width/2-50, FlxG.height/2, "START", onClick);
		_start.setGraphicSize(50,50);
		_start.setSize(50,50);

		foreGround = new FlxNapeTilemap();
		

		add(_start);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
	}
	function onClick() {
		firstLevel = new MainSystemLevels();
		_starFish = new StarFish(50, FlxG.height - 20, AssetPaths.gwiazdka32x32__png, true, 32, 32 );
		firstLevel.addFish(_starFish);
		FlxG.switchState(firstLevel);
	}
	
}
