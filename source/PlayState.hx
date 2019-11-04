package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.Flxbutton;
import levels.Levels;
import flixel.group.FlxGroup;
import fishes.*;
import blocks.*;


class PlayState extends FlxState
{

	private var _start:FlxButton;
	private var _levels:FlxButton;
	override public function create():Void
	{
		
		this._start = new FlxButton(FlxG.width/2-50, FlxG.height/2-40, "START", onClick);
		this._start.setGraphicSize(50,50);
		this._start.setSize(50,50);
		this._levels = new FlxButton(this._start.getPosition().x, this._start.getPosition().y+55, "LEVELS", onClickLevels);
		this._levels.setGraphicSize(50,50);
		this._levels.setSize(50,50);
		add(this._start);
		add(this._levels);
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
				
	}
	function onClick() {
	
	}
	function onClickLevels() {
		FlxG.switchState(new Levels() );
	}
	
}
