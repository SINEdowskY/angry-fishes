package enemies;

import enemies.Enemy;
import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;

class Piranha extends Enemy{
    /**
     *
     */
    private var _material:Material;
    private var _enemyHP:Float;
    public function new(positionX:Float, positionY:Float, enemyGraphic:FlxGraphicAsset, enemyAnimation:Bool = true, enemyWidth:Int = 32, enemyHeight:Int = 32){
       _material = new Material(); //TODO ustalić materiał piranii 
       super(positionX, positionY, enemyGraphic, enemyAnimation, _material, enemyWidth, enemyHeight, this._enemyHP = 2.0);

    }
    
}