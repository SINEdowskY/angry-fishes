package levels;

import enemies.*;
import fishes.*;
import blocks.*;
import flixel.FlxState;
import flixel.ui.Flxbutton;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.group.FlxGroup;
import levels.MainSystemLevels;
import sys.FileSystem;
import flixel.FlxSprite;


class Levels extends FlxState {
    static inline private var offsetBetweenButtonsX:Int = 120;
    static inline private var offsetBetweenButtonsY:Int = 110;
    
    //! BUTTONS - LEVELS
    private var levelsButtons:Array<FlxButtonPlus>;
    private var blocks:Array<String>;
    private var enemies:Array<String>;
    private var fishes:Array<String>;
    //! BUTTONS - LEVELS
    private var backGround:FlxSprite;
    public function new() {
        super();
    }

    override public function create():Void {
       
        this.levelsButtons = new Array<FlxButtonPlus>();
        var liczbaX:Int = 0;
        var liczbaY:Int = 0;
        this.blocks = FileSystem.readDirectory("assets/data/LevelsJSON/levelsBlocks/");
        this.enemies = FileSystem.readDirectory("assets/data/LevelsJSON/levelsEnemies/");
        this.fishes = FileSystem.readDirectory("assets/data/LevelsJSON/levelsFish/");
        for(index in 0...this.blocks.length) {
            if(index == 0 ) {
                this.levelsButtons.push(new FlxButtonPlus(FlxG.width/2 - 270 , FlxG.height/2 - 230, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , "assets/data/LevelsJSON/levelsFish/"+this.fishes[index] ));}, '${index+1}', 100, 100 ));
            } else {
                if(index < 3) {
                    this.levelsButtons.push(new FlxButtonPlus(this.levelsButtons[index-1].getPosition().x + offsetBetweenButtonsX, this.levelsButtons[index-1].getPosition().y, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , "assets/data/LevelsJSON/levelsFish/"+this.fishes[index] ));}, '${index+1}', 100, 100));
                } else {
                    this.levelsButtons.push(new FlxButtonPlus(this.levelsButtons[liczbaX++].getPosition().x , this.levelsButtons[liczbaY++].getPosition().y+ offsetBetweenButtonsY, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , "assets/data/LevelsJSON/levelsFish/"+this.fishes[index] ));}, '${index+1}', 100, 100));
                }
            }      
        }
        this.backGround = new FlxSprite(0, 0, AssetPaths.poziom_tlo__png);
        add(this.backGround);
        for(addButtonsOnScreen in this.levelsButtons ) {
            addButtonsOnScreen.loadButtonGraphic(new FlxSprite(0, 0).loadGraphic(AssetPaths.banka1__png, false, 100, 100), new FlxSprite(0, 0).loadGraphic(AssetPaths.banka3__png, false, 100, 100));
            add(addButtonsOnScreen);
        }
        super.create();
    } 

}