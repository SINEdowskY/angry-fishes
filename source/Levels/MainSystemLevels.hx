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
import flixel.group.FlxGroup;
import nape.callbacks.*;
import nape.phys.Material;
import json2object.JsonParser;
import sys.io.File;
import Slingshot;
using StringTools;


class MainSystemLevels extends FlxState  {
    static inline private var offsetOfElements:Int = 500;
    static inline private var offsetOfElementsY:Int = 20;
	private var slingshot:Slingshot;
	private var canvas:FlxSprite;
    private var timer:Float = 0;

    //! MAP
    private var backGround:FlxBackdrop;
    private var plants_BG1:FlxSprite;
    private var midGround_1:FlxSprite;
    private var midGround_2:FlxSprite;
    private var whiteLayer:FlxSprite;
    private var foreGround:FlxTilemap;
	private var _map:FlxOgmoLoader;
    //! MAP

    //! GROUPS
    private var _fishes:Array<Fish>;
    private var _enemies:FlxTypedGroup<Enemy>;
    private var _blocks:FlxTypedGroup<Block>;
    //! GROUPS

    private var enemyFile:String;
    private var blockFile:String;
    private var fishFile:String;
    


    public function new (_enemyFile:String, _blockFile:String, _fishFile:String) {
        this._fishes = new Array<Fish>();
        this._enemies = new FlxTypedGroup<Enemy>();
        this._blocks = new FlxTypedGroup<Block>();
        this.enemyFile = _enemyFile;
        this.blockFile = _blockFile;
        this.fishFile = _fishFile;
        super();     
    }
    override public function create():Void {
        
        FlxNapeSpace.init();
		FlxNapeSpace.createWalls(0, 0, FlxG.width*3, FlxG.height - 38, Material.sand());
		FlxNapeSpace.space.gravity.setxy(0, 100);

		FlxG.plugins.add(new FlxMouseEventManager());
      
        this.slingshot = new Slingshot(150, FlxG.height - 170);          
        this.canvas = new FlxSprite();
		this.canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		this.slingshot.setCanvas(this.canvas);
        
        
        FlxG.camera.zoom = 0.5;
        //!ADD section
        levelCreatorEnemy(this.enemyFile);
        levelCreatorBlocks(this.blockFile);
        levelCreatorFish(this.fishFile);
        this.slingshot.setFish(this._fishes[0]);
        backGroundCreate();
		add(this.slingshot);
		add(this.canvas);
        addOnScreenEnemy();
        addOnScreenBlocks();
        addOnScreenFishes();
        super.create();
    }
    private function backGroundCreate():Void {

        this.backGround = new FlxBackdrop(AssetPaths.bg__png, 0, 0, true, true);
        this.plants_BG1 = new FlxBackdrop(AssetPaths.rosliny__png, 0.17, 1, true, false);
        this.midGround_1 = new FlxBackdrop(AssetPaths.mg1__png, 0.34, 1, true, false);
        this.midGround_2 = new FlxBackdrop(AssetPaths.mg2__png, 0.68, 1, true, false);
        this.whiteLayer = new FlxBackdrop(AssetPaths.biala_warstwa__png, 1, 1, true, false);
        this._map = new FlxOgmoLoader(AssetPaths.terrain__oel);
		this.foreGround = _map.loadTilemap(AssetPaths.ziemia__png, 32, 32, "terrain");  
        
        add(this.backGround);
        add(this.midGround_1);
        add(this.midGround_2);
        add(this.plants_BG1);
        add(this.whiteLayer);
        add(this.foreGround);
    }
    private function levelCreatorEnemy(enemyFile:String):Void {
        var parser = new JsonParser<EnemiesStruct>();
        var contentEnemy = File.getContent(enemyFile);
        var enemiesStruct = parser.fromJson(contentEnemy, enemyFile);
        
        for(key in enemiesStruct.keys()) {
            if(StringTools.startsWith(key.toLowerCase(), "j")) {
                this._enemies.add(new JellyFish(enemiesStruct[key].positionX-offsetOfElements, enemiesStruct[key].positionY, AssetPaths.meduza31x19__png, true, 31, 19 ));
            } else if (StringTools.startsWith(key.toLowerCase(), "p")) {
                this._enemies.add(new Piranha(enemiesStruct[key].positionX-offsetOfElements, enemiesStruct[key].positionY, AssetPaths.pirania29x18__png, true, 28,18 ));
            }
        }

    }
    private function levelCreatorBlocks(blockFile:String):Void {
        var parser = new JsonParser<BlocksStruct>();
        var contentBlocks = File.getContent(blockFile);
        var blocksStruct = parser.fromJson(contentBlocks, blockFile);
        for(key in blocksStruct.keys()) {
            if(StringTools.startsWith(key.toLowerCase(), "i")) {
                if (blocksStruct[key].height == 16 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod16x16__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if(blocksStruct[key].height == 32 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod16x32__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 64 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod16x64__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 96 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod16x96__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 32 && blocksStruct[key].width == 32  ) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod32x32__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 64 && blocksStruct[key].width == 32  ) {
                    this._blocks.add(new Ice(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.lod32x64__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                }
            } else if (StringTools.startsWith(key.toLowerCase(), "w")) {
                if(blocksStruct[key].height == 32 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Wood(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.drewno16x32__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 64 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Wood(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.drewno16x64__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 80 && blocksStruct[key].width == 16) {
                    this._blocks.add(new Wood(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.drewno16x80__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 64 && blocksStruct[key].width == 32) {
                    this._blocks.add(new Wood(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY,AssetPaths.drewno32x64__png, true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                }
            } else if (StringTools.startsWith(key.toLowerCase(), "s")) {
                if(blocksStruct[key].height == 32) {
                    this._blocks.add(new Steel(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY, AssetPaths.kamien16x32__png , true, blocksStruct[key].width, blocksStruct[key].height,  blocksStruct[key].rotate ));
                } else 
                if (blocksStruct[key].height == 64) {
                    this._blocks.add(new Steel(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY, AssetPaths.kamien16x64__png , true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                } else if (blocksStruct[key].height == 96) {
                    this._blocks.add(new Steel(blocksStruct[key].positionX-offsetOfElements, blocksStruct[key].positionY+offsetOfElementsY, AssetPaths.kamien16x96__png , true, blocksStruct[key].width, blocksStruct[key].height, blocksStruct[key].rotate ));
                }
            }
        }
    }
    private function levelCreatorFish(fishFile:String):Void {
        var parser = new JsonParser<FishesStruct>();
        var contentFish = File.getContent(fishFile);
        var fishStruct = parser.fromJson(contentFish, fishFile);
        
        for(key in fishStruct.keys()) {
            if(StringTools.startsWith(key.toLowerCase(), "angler")) {
                this._fishes.unshift(new AnglerFish(fishStruct[key].positionX, fishStruct[key].positionY,AssetPaths.anglerfish__png ,true,32,32 ));
            } else if (StringTools.startsWith(key.toLowerCase(), "puffer")) {
               this._fishes.unshift(new PufferFish(fishStruct[key].positionX, fishStruct[key].positionY, AssetPaths.rozdymka31x28__png, true, 31, 28 ));
            } else if (StringTools.startsWith(key.toLowerCase(), "star")) {
               this._fishes.unshift(new StarFish(fishStruct[key].positionX, fishStruct[key].positionY, AssetPaths.gwiazdka32x32__png , true, 32, 32 ));
            } else if (StringTools.startsWith(key.toLowerCase(), "turtle")) {
               this._fishes.unshift(new Turtle(fishStruct[key].positionX, fishStruct[key].positionY, AssetPaths.zolwik30x26__png ,true, 30, 26 ));
            }
        }

    }
    private function addOnScreenEnemy() {
        for(enemyAdd in this._enemies) {
            enemyAdd.physicsEnabled = true;
        }
        add(this._enemies);
    }
    private function addOnScreenBlocks() {
        for(blocksAdd in this._blocks) {
            blocksAdd.physicsEnabled = true;
        }
        add(this._blocks);
    }
    private function addOnScreenFishes() {
        for(fishAdd in this._fishes) {
            add(fishAdd);
        }
        
    }
    
    override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
       
        if(FlxG.keys.justReleased.R) {
            FlxG.resetGame();
        }
		
	}
}
typedef EnemiesStruct = Map<String, {
    var positionX:Int;
    var positionY:Int;
}>;
typedef FishesStruct = Map<String, {
    var positionX:Int;
    var positionY:Int;
}>;
typedef BlocksStruct = Map<String, {
    var positionX:Int;
    var positionY:Int;
    var width:Int;
    var height:Int;
    var rotate:Float;
}>;