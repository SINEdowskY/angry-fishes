package levels;

import enemies.*;
import fishes.*;
import blocks.*;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.addons.nape.FlxNapeSpace;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import Slingshot;


class MainSystemLevels extends FlxState  {

    private var _enemies:FlxTypedGroup<Enemy>;
    private var _fishes:FlxTypedGroup<Fish>;
    private var _starFish:StarFish;
	private var slingshot:Slingshot;
	private var backGround:FlxBackdrop;
	private var canvas:FlxSprite;


    var _block:Ice;
    var __enemy:Piranha;


    public function new () {
        super();
        this._fishes = new FlxTypedGroup<Fish>();
        this._enemies = new FlxTypedGroup<Enemy>();
        this._fishes.add(_starFish);
    }

    override public function create():Void {
        
        FlxNapeSpace.init();
		FlxNapeSpace.createWalls(0,0, FlxG.width*3, FlxG.height );
		FlxNapeSpace.space.gravity.setxy(0,100);
        
		FlxG.plugins.add(new FlxMouseEventManager());

        
        this.slingshot = new Slingshot(150, FlxG.height-128);
		this.backGround = new FlxBackdrop(AssetPaths.backGround__png, 1, 1, true, false);
		this.canvas = new FlxSprite();
		this.canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		this.slingshot.setCanvas(this.canvas);
		this._block = new Ice(FlxG.width - 40, FlxG.height-10, AssetPaths.lod16x32__png, false, 16, 32 );
		this.__enemy = new Piranha(this._block.body.position.x, this._block.body.position.y-10, AssetPaths.pirania__png );

        this.slingshot.setFish(this._starFish);
        
		add(this.backGround);
		add(this.slingshot);
        add(this._starFish);
        add(this.__enemy);        
        add(this._block);
		add(this.canvas);

        super.create();
    }

    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
    
        this._starFish.skillAcceleration();
        	
        if(FlxG.keys.justReleased.R) {
            FlxG.resetGame();
        }
		
	}
    
    public function addFish(_fish:StarFish):Void {
        // this._fishes.add(_fish);
        this._starFish = _fish;       
    }

    public function addEnemy(enemy:Enemy):Void {
        this._enemies.add(enemy);
    }
}