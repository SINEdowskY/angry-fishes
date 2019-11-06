package blocks;

import blocks.Block;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Ice extends Block{
    private var _material:Material;
    private var _blockHP:Float;
    public function new(positionX:Float, posistionY:Float, blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, rotateBody:Float = 0){
        _material = new Material(0.3,0.03,0.1,0.9,0.0001);
        super(positionX, posistionY, blockGraphic, blockBreakingAnimation, blockWidth, blockHeight, _material, this._blockHP = 5000.0, rotateBody, "ice");
        
    }
}