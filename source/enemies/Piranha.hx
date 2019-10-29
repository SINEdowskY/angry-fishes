package enemies;

import enemies.Enemy;
import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;

class JellyFish extends Enemy{
    var enemyHP:Float;
    public function new(){
        super(positionX:Float,positionY:Float,enemyGraphic:FlxGraphicAsset, enemyAnimation:Bool = true, enemyMaterial:Material);
        this.positionX = positionX;
        this.positionY = positionY;
        this.enemyGraphic = enemyGraphic;
        this.enemyAnimation = enemyAnimation;
        this.enemyMaterial = enemyMaterial;

        enemyHP = 3.0;
    }
}