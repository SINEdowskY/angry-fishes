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
import flixel.addons.nape.FlxNapeSprite;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import nape.callbacks.*;
import Slingshot;


class MainSystemLevels extends FlxState  {

	private var slingshot:Slingshot;
	private var canvas:FlxSprite;
    private var timer:Float = 0;

    //! MAP
    private var backGround:FlxBackdrop;
    private var plants_BG1:FlxSprite;
    private var midGround_1:FlxSprite;
    private var plants_BG2:FlxSprite;
    private var midGround_2:FlxSprite;
    private var plants:FlxSprite;
    private var whiteLayer:FlxSprite;
    private var foreGround:FlxTilemap;
	private var _map:FlxOgmoLoader;
    //! MAP

    //! GROUPS
    private var _fishes:Array<Fish>;
    private var _enemies:Array<Enemy>;
    private var _blocks:Array<Block>;
    //! GROUPS

    //! FISHES 
    private var anglerFish:AnglerFish;
    private var pufferFish:PufferFish;
    private var starFish:StarFish;
    private var turtle:Turtle;
    //! FISHES

    //! BLOCKS
    private var ice:Ice;
    private var steel:Steel;
    private var wood:Wood;
    //! BLOCKS

    //! ENEMIES
    private var jellyFish:JellyFish;
    private var piranha:Piranha;
    //! ENEMIES

    private var collisionBeTweenFishEnemy:InteractionListener;
    private var fishCbType:CbType;
    private var enemyCbType:CbType;
    private var collisionDetected:Bool;

    public function new () {
        this.fishCbType = new CbType();
        this.enemyCbType = new CbType();
        this.collisionDetected = false;
        super();     
    }

    override public function create():Void {
        
        FlxNapeSpace.init();
		FlxNapeSpace.createWalls(0, 0, FlxG.width*3, FlxG.height - 38);
		FlxNapeSpace.space.gravity.setxy(0, 100);

		FlxG.plugins.add(new FlxMouseEventManager());
      
        this.slingshot = new Slingshot(150, FlxG.height - 170);          
        this.canvas = new FlxSprite();
		this.canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		this.slingshot.setCanvas(this.canvas);
        this.slingshot.setFish();
        
        this.collisionBeTweenFishEnemy = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, this.fishCbType, this.enemyCbType, handler);
		FlxNapeSpace.space.listeners.add(this.collisionBeTweenFishEnemy);

        
        backGroundCreate();
		add(this.slingshot);
		add(this.canvas);
        super.create();
    }
    private function backGroundCreate() {

        this.backGround = new FlxBackdrop(AssetPaths.bg__png, 0, 0, true, true);
        this.plants_BG1 = new FlxBackdrop(AssetPaths.rosliny_bg__png, 0.17, 1, true, false);
        this.midGround_1 = new FlxBackdrop(AssetPaths.mg1__png, 0.34, 1, true, false);
        this.plants_BG2 = new FlxBackdrop(AssetPaths.rosliny_bg2__png, 0.51, 1, true, false);
        this.midGround_2 = new FlxBackdrop(AssetPaths.mg2__png, 0.68, 1, true, false);
        this.plants = new FlxBackdrop(AssetPaths.rosliny__png, 0.85, 1, true, false);
        this.whiteLayer = new FlxBackdrop(AssetPaths.biala_warstwa__png, 1, 1, true, false);
        this._map = new FlxOgmoLoader(AssetPaths.terrain__oel);
		this.foreGround = _map.loadTilemap(AssetPaths.ziemia__png, 32, 32, "terrain");  
        
        add(this.backGround);
        // add(this.plants_BG1);
        // add(this.midGround_1);
        // add(this.plants_BG2);
        // add(this.midGround_2);
        // add(this.plants);
        // add(this.whiteLayer);
        add(this.foreGround);
    }
    private function LevelCreator() {
        
    }

    private function handler(col:InteractionCallback):Void {
    }
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
       

        if(FlxG.keys.justReleased.R) {
            FlxG.resetGame();
        }
		
	}
}