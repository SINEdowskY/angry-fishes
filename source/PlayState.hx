package;

import flixel.FlxState;
import Slingshot;
import flixel.FlxG;
import  flixel.addons.display.FlxBackdrop;
import fish.Fish;
import nape.phys.Material;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.addons.nape.FlxNapeSpace;
import flixel.FlxSprite;
import flixel.util.FlxColor;


class PlayState extends FlxState
{
	var slingshot:Slingshot;
	var backGround:FlxBackdrop;
	var fish:Fish;
	var loaded:Bool;
	private var canvas:FlxSprite;


	override public function create():Void
	{
		FlxNapeSpace.init();
		FlxNapeSpace.createWalls();
		FlxNapeSpace.space.gravity.setxy(0,100);
		FlxG.plugins.add(new FlxMouseEventManager());
		slingshot = new Slingshot(150, FlxG.height-228);
		fish = new Fish(100,FlxG.height-16,AssetPaths.zolwik__png, true, Material.wood() );
		backGround = new FlxBackdrop(AssetPaths.backGround__png,1,1,true,false);
		slingshot.setFish(fish);
		canvas = new FlxSprite();
		canvas.makeGraphic(FlxG.width,FlxG.height, FlxColor.TRANSPARENT,true);
		loaded = false;
		slingshot.setCanvas(canvas);

				
		add(backGround);
		add(slingshot);
		add(fish);
		add(canvas);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if(!loaded) {
			if(FlxG.mouse.pressed) {
				slingshot.loadAmmunition(fish);
				loaded = true;
			}
		}
	}
	
}
