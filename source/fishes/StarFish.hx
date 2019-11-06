package fishes;


import fishes.Fish;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxG;
import nape.geom.Vec2;


class StarFish extends Fish {
    private var _material:Material;
    private var usedSkill:Bool;

    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, widthFish:Int, heightFish:Int) {
        this._material = new Material(); //TODO ustalic material 
        super(positionX, positionY, fishGraphic, fishAnimation, this._material, widthFish, heightFish);
        usedSkill = false;
            
    }

    public function skillAcceleration():Void {
        if(this.launched && FlxG.mouse.justPressed && !usedSkill ) {
            body.applyImpulse(new Vec2(300, 150));
            usedSkill = true;
        }
    }
}