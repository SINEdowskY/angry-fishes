package levels;

import flixel.FlxState;
import flixel.ui.Flxbutton;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.group.FlxGroup;
import levels.MainSystemLevels;
import sys.FileSystem;
import flixel.text.FlxText;
import flixel.FlxSprite;
import levels.Levels;
import PlayState;


class WinState extends FlxState {
    private var win:FlxText;
    private var levelsButton:FlxButtonPlus;
    private var menuButton:FlxButtonPlus;
    private var backGround:FlxSprite;
    public function new() {
        super();
        this.win = new FlxText(FlxG.width/2-80, 100, 250, "WIN", 80 );
        this.levelsButton = new FlxButtonPlus(100, 200, function level() { FlxG.switchState(new Levels());}, "Levels");
        this.menuButton = new FlxButtonPlus(450, 200, function level() { FlxG.switchState(new PlayState());}, "Menu");
        this.backGround = new FlxSprite(0, 0, AssetPaths.poziom_tlo__png);
        add(this.backGround);
        add(this.win);
        add(this.levelsButton);
        add(this.menuButton);
    }


}