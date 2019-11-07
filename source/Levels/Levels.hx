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



class Levels extends FlxState {
    static inline private var offsetBetweenButtonsX:Int = 95;
    static inline private var offsetBetweenButtonsY:Int = 30;
    
    //! BUTTONS - LEVELS
    private var levelsButtons:Array<FlxButtonPlus>;
    private var blocks:Array<String>;
    private var enemies:Array<String>;
    //! BUTTONS - LEVELS
    public function new() {
        super();
    }

    override public function create():Void {
        this.levelsButtons = new Array<FlxButtonPlus>();
        var liczbaX:Int = 0;
        var liczbaY:Int = 0;
        this.blocks = FileSystem.readDirectory("assets/data/LevelsJSON/levelsBlocks/");
        this.enemies = FileSystem.readDirectory("assets/data/LevelsJSON/levelsEnemies/");

        for(index in 0...this.blocks.length) {
            if(index == 0 ) {
                this.levelsButtons.push(new FlxButtonPlus(FlxG.width/2-200, FlxG.height/2-120, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , AssetPaths.levelFirstFishes__json ));}, '${index+1}', 50 ));
            } else {
                if(index < 5) {
                    this.levelsButtons.push(new FlxButtonPlus(this.levelsButtons[index-1].getPosition().x + offsetBetweenButtonsX, this.levelsButtons[index-1].getPosition().y, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , AssetPaths.levelFirstFishes__json ));}, '${index+1}', 50));
                } else {
                    this.levelsButtons.push(new FlxButtonPlus(this.levelsButtons[liczbaX++].getPosition().x , this.levelsButtons[liczbaY++].getPosition().y+ offsetBetweenButtonsY, function level() { FlxG.switchState(new MainSystemLevels("assets/data/LevelsJSON/levelsEnemies/"+this.enemies[index],"assets/data/LevelsJSON/levelsBlocks/"+this.blocks[index] , AssetPaths.levelFirstFishes__json ));}, '${index+1}', 50));
                }
            }      
        }
        for(addButtonsOnScreen in this.levelsButtons ) {
            add(addButtonsOnScreen);
        }
        super.create();
    } 

}