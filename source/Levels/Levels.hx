package levels;

import enemies.*;
import fishes.*;
import blocks.*;
import flixel.FlxState;
import flixel.ui.Flxbutton;
import flixel.FlxG;
import flixel.group.FlxGroup;
import levels.MainSystemLevels;
import haxe.Json;
import sys.FileSystem;



class Levels extends FlxState {
    static inline private var offsetBetweenButtons:Int = 75;
    static inline private var offsetBetweenFishes:Int = 25;
    
    //! BUTTONS - LEVELS
    private var firstLevelButton:FlxButton;
    private var secondLevelButton:FlxButton;
    //TODO another level/levels
    //! BUTTONS - LEVELS

   

    private var createLevel:MainSystemLevels;
    public function new() {
        this._enemies = new Array<Enemy>();
        this._fishes = new Array<Fish>();
        this._blocks = new Array<Block>();
        super();
    }

    override public function create():Void {
        this.firstLevelButton = new FlxButton(FlxG.width/2-300, FlxG.height/2-120, "First Level", firstLevel);
		this.firstLevelButton.setGraphicSize(70,50);
		this.firstLevelButton.setSize(70,50);

        this.secondLevelButton = new FlxButton(this.firstLevelButton.getPosition().x + offsetBetweenButtons, this.firstLevelButton.getPosition().y, "Second Level", secondLevel);
		this.secondLevelButton.setGraphicSize(70,50);
		this.secondLevelButton.setSize(70,50);

        add(this.firstLevelButton);
        add(this.secondLevelButton);
        super.create();
    } 
    function firstLevel() {
        trace("Pierwszy poziom");
        
        


        
        FlxG.switchState(new MainSystemLevels() );
    }
    function secondLevel() {
        trace("Drugi poziom");
		

        FlxG.switchState(new MainSystemLevels() );
    }

}