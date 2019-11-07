package fishes;


import fishes.Fish;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxG;
import nape.geom.Vec2;
import flixel.FlxState;

class StarFish extends Fish {
    private var _material:Material;
    private var usedSkill:Bool;

    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, widthFish:Int, heightFish:Int, _typeOfFish:String, level:FlxState) {
        this._material = new Material(); //TODO ustalic material 
        super(positionX, positionY, fishGraphic, fishAnimation, this._material, widthFish, heightFish, _typeOfFish, level);
        usedSkill = false;
            
    }

    public function skillAcceleration():Void {
        body.applyImpulse(new Vec2(300, 150));
        usedSkill = true;
    }
    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        if(this.launched && FlxG.mouse.justPressed && !usedSkill ) {
            this.skillAcceleration();
        }
    }
}