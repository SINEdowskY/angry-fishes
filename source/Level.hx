package;

import enemies.*;
import fishes.*;
import flixel.FlxState;
import flixel.group.FlxGroup;
import Slingshot;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.addons.nape.FlxNapeSpace;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import nape.callbacks.*;
import nape.callbacks.CbType;
import blocks.*;

import nape.phys.Material;

class Level extends FlxState  {

    private var _enemies:FlxTypedGroup<Enemy>;
    private var _fishes:FlxTypedGroup<Fish>;
	private var slingshot:Slingshot;
	private var backGround:FlxBackdrop;
	private var canvas:FlxSprite;

    var __fish:CbType;
    var __enemy__:CbType;
    var _listener:InteractionListener;
    var _block:Ice;
    var __enemy:Piranha;
    var kolizja:Bool = false;
    var timer:Float = 0;
    var iloscEnemy:Int;


    public function new () {
        super();
        this._fishes = new FlxTypedGroup<Fish>();
        this._enemies = new FlxTypedGroup<Enemy>();
    }

    override public function create():Void {
        
        FlxNapeSpace.init();
		FlxNapeSpace.createWalls();
		FlxNapeSpace.space.gravity.setxy(0,100);
		FlxG.plugins.add(new FlxMouseEventManager());

        __fish = new CbType();
        __enemy__ = new CbType();

        
        this.slingshot = new Slingshot(150, FlxG.height-128);
		this.backGround = new FlxBackdrop(AssetPaths.backGround__png, 1, 1, true, false);
		this.canvas = new FlxSprite();
		this.canvas.makeGraphic(FlxG.width,FlxG.height, FlxColor.TRANSPARENT,true);
		this.slingshot.setCanvas(this.canvas);
		this._block = new Ice(FlxG.width - 40, FlxG.height-10, AssetPaths.lod16x32__png, false, 16, 32, Material.ice() );
		this.__enemy = new Piranha(this._block.body.position.x, this._block.body.position.y-10, AssetPaths.pirania__png, Material.rubber() );
        this.__enemy.body.cbTypes.add(this.__enemy__);
        this.slingshot.setFish(_fishes.getFirstAlive());
        this._fishes.getFirstAlive().body.cbTypes.add(this.__fish);
        _listener = new InteractionListener(CbEvent.BEGIN, InteractionType.COLLISION, this.__fish, this.__enemy__, handler);
        FlxNapeSpace.space.listeners.add(_listener);
        iloscEnemy = 1;

		add(this.backGround);
		add(this.slingshot);
        add(this._fishes);
        add(this.__enemy);        
        add(this._block);
		add(this.canvas);

        super.create();
    }

    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
        if(this.kolizja ) {
            this.timer +=elapsed;
        }
        if(Math.round(this.timer) == 3.0 ) {
            this._fishes.remove(this._fishes.getFirstAlive());
            kolizja = false;
            timer = 0;
            // this.__enemy.destroy();
            this.__enemy = null;
        }	
        if(this.__enemy == null) {
            iloscEnemy--;
        }	
        if(iloscEnemy == 0) {
            FlxG.resetGame();
        }
		
	}
    
    public function addFish(_fish:Fish):Void {
        this._fishes.add(_fish);
    }

    public function addEnemy(enemy:Enemy):Void {
        this._enemies.add(enemy);
    }

    function handler(col:InteractionCallback):Void {
        if(!this.kolizja) {
            this.__enemy.animation.add("dead", [0,1,2], 3, false);
            this.__enemy.animation.play("dead",false);
        }

        this.kolizja = true;
        
    }

}