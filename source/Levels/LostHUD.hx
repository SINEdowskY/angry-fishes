package levels;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.Flxbutton;
using flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import PlayState;


class LostHUD extends FlxTypedGroup<FlxSprite>
{
    private var _sprBack:FlxSprite;
    private var lost:FlxText;
    private var goMenuButton:FlxButton;
    private var restartButton:FlxButton;
    private var state:FlxState;
    public function new() {
        super();
        this._sprBack = new FlxSprite().makeGraphic(300, 300, FlxColor.BLACK);
        this._sprBack.setPosition(FlxG.width/2-100, FlxG.height/2-100);
        this.lost = new FlxText(this._sprBack.x+95, this._sprBack.y+20, 150, "LOST", 40 );
        this.goMenuButton = new FlxButton(this._sprBack.x + 20, this._sprBack.y + 200, "MENU", function menu() {FlxG.switchState(new PlayState());} );
		this.restartButton = new FlxButton(this._sprBack.x + 200, this._sprBack.y + 200, "RESET", function menu() {FlxG.switchState(this.state);} );
        add(this._sprBack);
        add(this.lost);
        add(this.goMenuButton);
        add(this.restartButton);
    }
   
}