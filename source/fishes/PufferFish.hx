package fishes;

import fishes.Fish;
import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxG;

class PufferFish extends fishes.Fish {
    var massOfFish:Float;
    public function new(){
        super(positionX:Float,positionY:Float,fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, fishMaterial:Material);
            this.positionX = positionX;
            this.positionY = positionY;
            this.fishAnimation = fishAnimation;
            this.fishGraphic = fishGraphic;
            this.fishMaterial = fishMaterial;
            massOfFish = 2.0;
            

        }
    public function skill(){

    }
}