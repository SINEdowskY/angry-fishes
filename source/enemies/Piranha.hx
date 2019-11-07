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
        super(positionX, positionY, enemyGraphic, enemyAnimation, _material, enemyWidth, enemyHeight, this._enemyHP = 1500.0);
        animation.add("fullHP",[0],1);
        animation.add("lowHP",[1],1);
        animation.add("dead",[2],1);
    }
    override function update(elapsed:Float):Void {
       super.update(elapsed);
       if(this.enemyHP/this.enemyHPMax*100 >= 85) {
            animation.play("fullHP");
        } else if (this.enemyHP/this.enemyHPMax*100 <= 45  ) {
            animation.play("lowHP");
        }
        if(this.enemyHP <= 0) {
            this.timer += elapsed;
            animation.play("dead");
            if(Math.round(this.timer) == 2 ) {
                this.kill();
                this.timer = 0;
            }
        }
    }
    
}