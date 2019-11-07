package fishes;


import fishes.Fish;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxState;


class Turtle extends Fish {
    private var _material:Material;
    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, widthFish:Int, heightFish:Int, _typeOfFish:String, level:FlxState) {
        this._material = new Material(); //TODO ustalic material 
        super(positionX, positionY, fishGraphic, fishAnimation, this._material, widthFish, heightFish, _typeOfFish, level);

    }
    // passive skill which allowed to destroy every block
}