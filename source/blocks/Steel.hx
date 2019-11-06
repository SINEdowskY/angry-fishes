package blocks;

import blocks.Block;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Steel extends Block {
    private var _material:Material;
    private var _blockHP:Float;
    public function new(positionX:Float, posistionY:Float, blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, rotateBody:Float = 0){
        this._material = new Material(0.2,0.57,0.74,7.8,0.001);
        super(positionX, posistionY, blockGraphic, blockBreakingAnimation, blockWidth, blockHeight, this._material, this._blockHP = 15000.0, rotateBody, "steel");
        
    }
}