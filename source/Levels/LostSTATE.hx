package levels;

import flixel.FlxState;
import flixel.ui.Flxbutton;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.group.FlxGroup;
import levels.MainSystemLevels;
import flixel.text.FlxText;
import flixel.FlxSprite;
import levels.Levels;
import PlayState;


class LostSTATE extends FlxState {
    private var lost:FlxText;
    private var levelsButton:FlxButtonPlus;
    private var menuButton:FlxButtonPlus;
    private var backGround:FlxSprite;
    public function new() {
        super();
        this.lost = new FlxText(FlxG.width/2-100, 100, 250, "LOST", 80 );
        this.levelsButton = new FlxButtonPlus(100, 200, function level() { FlxG.switchState(new Levels());}, "Levels");
        this.menuButton = new FlxButtonPlus(450, 200, function level() { FlxG.switchState(new PlayState());}, "Menu");
        this.backGround = new FlxSprite(0, 0, AssetPaths.poziom_tlo__png);
        add(this.backGround);
        add(this.lost);
        add(this.levelsButton);
        add(this.menuButton);
    }


}