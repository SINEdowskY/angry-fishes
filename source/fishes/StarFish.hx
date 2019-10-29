package fishes;


import fishes.Fish;
import flixel.system.FlxAssets;
import nape.phys.Material;


class StarFish extends Fish {
    private var _material:Material;
    private var _massOfFish:Float;
    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, widthFish:Int, heightFish:Int) {
        this._material = new Material(); //TODO ustalic material 
        super(positionX, positionY, fishGraphic, fishAnimation, this._material, widthFish, heightFish, this._massOfFish = 1.0);
            
            
            

        }
    public function accelerationAfterClick(){


    }
}