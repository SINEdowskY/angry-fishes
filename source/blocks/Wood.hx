package blocks;

import blocks.Block;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Wood extends Block {
    private var _material:Material;
    private var _blockHP:Float;
    public function new(positionX:Float, posistionY:Float, blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, blockMaterial:Material ){
        _material = new Material(0.4, 0.2, 0.38, 0.7, 0.005);
        super(positionX, posistionY, blockGraphic, blockBreakingAnimation, blockWidth, blockHeight, _material, this._blockHP = 2.0);
        
    }
}