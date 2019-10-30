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
	private var canvas:FlxSprite;


    private var backGround:FlxBackdrop;
    private var plants_BG1:FlxSprite;
    private var midGround_1:FlxSprite;
    private var plants_BG2:FlxSprite;
    private var midGround_2:FlxSprite;
    private var plants:FlxSprite;
    private var whiteLayer:FlxSprite;
    private var foreGround:FlxSprite;


    var _block:Ice;
    var __enemy:Piranha;


    public function new () {
        this._fishes = new FlxTypedGroup<Fish>();
        this._enemies = new FlxTypedGroup<Enemy>();
        this._fishes.add(_starFish);
        super();
     
    }

    override public function create():Void {
        
        FlxNapeSpace.init();
		FlxNapeSpace.createWalls(0,0, FlxG.width*3, FlxG.height );
		FlxNapeSpace.space.gravity.setxy(0,100);

		FlxG.plugins.add(new FlxMouseEventManager());

        
        this.slingshot = new Slingshot(150, FlxG.height-128);   
        
        this.canvas = new FlxSprite();
		this.canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		this.slingshot.setCanvas(this.canvas);
		this._block = new Ice(FlxG.width - 40, FlxG.height-10, AssetPaths.lod16x32__png, false, 16, 32 );
		this.__enemy = new Piranha(this._block.body.position.x, this._block.body.position.y-10, AssetPaths.pirania29x18__png, 29, 18 );

        this.slingshot.setFish(this._starFish);
        backGroundCreate();
		add(this.slingshot);
        add(this._starFish);
        add(this.__enemy);        
        add(this._block);
		add(this.canvas);


        super.create();
    }
    private function backGroundCreate() {
        //! WORKING 
        this.backGround = new FlxBackdrop(AssetPaths.bg__png, 0, 0, true, true);
        this.plants_BG1 = new FlxBackdrop(AssetPaths.rosliny_bg__png, 0.25, 1, true, false);
        this.midGround_1 = new FlxBackdrop(AssetPaths.mg1__png, 0.50, 1, true, false);
        this.plants_BG2 = new FlxBackdrop(AssetPaths.rosliny_bg2__png, 0.75, 1, true, false);
        this.midGround_2 = new FlxBackdrop(AssetPaths.mg2__png, 0.50, 1, true, false);
        this.plants = new FlxBackdrop(AssetPaths.rosliny__png, 0.25, 1, true, false);
        this.whiteLayer = new FlxBackdrop(AssetPaths.biala_warstwa__png, 0.25, 1, true, false);
        // this.foreGround = new FlxBackdrop(AssetPaths.fg__png, 1, 1, true, false);
        
        add(this.backGround);
        add(this.plants_BG1);
        add(this.midGround_1);
        add(this.plants_BG2);
        add(this.midGround_2);
        add(this.plants);
        add(this.whiteLayer);
        // add(this.foreGround);
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