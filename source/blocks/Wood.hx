package blocks;

import blocks.Block;

class Wood extends Block {
    var blockHP:Float;
    public function new() {
        super(positionX:Float,positionY:Float,blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, blockMaterial:Material);

        this.positionX = positionX;
        this.positionY = positionY;
        this.blockGraphic = blockGraphic;
        this.blockBreakingAnimation = blockBreakingAnimation;
        this.blockWidth = blockWidth;
        this.blockHeight = blockHeight;
        this.blockMaterial = blockMaterial;

        blockHP = 2;

    }
}