package;

import flixel.FlxState;
import flixel.FlxG;
import levels.Levels;
import flixel.FlxSprite;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.*;


class PlayState extends FlxState
{

	private var gameLogo:FlxSprite;
	private var _levels:FlxButtonPlus;
	override public function create():Void
	{
		
		this.gameLogo = new FlxSprite(0, 0, AssetPaths.logo__png);
		this._levels = new FlxButtonPlus(FlxG.width/2 - 80, FlxG.height/2 + 50, onClickLevels, null);
		this._levels.loadButtonGraphic(new FlxSprite(0, 0).loadGraphic(AssetPaths.banka1__png, false, 100, 100), new FlxSprite(0, 0).loadGraphic(AssetPaths.banka3__png, false, 100, 100));
		add(this.gameLogo);
		add(this._levels);
		
		super.create();
		
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
				
	}
	function onClickLevels() {
		FlxG.switchState(new Levels() );
	}
	
}
