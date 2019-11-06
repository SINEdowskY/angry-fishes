package blocks;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Block extends FlxNapeSprite{
    /**
     * Klasa tworzy blok fizyczny który jest przeszkodą. Bloki mają swoje punkty wytrzymałości (blockHP).
     * @param positionX Współrzędne X położenia bloku
     * @param positionY Współrzędne Y położenia bloku
     * @param blockGraphic Łącze do grafiki
     * @param blockBreakingAnimation Animacja niszczenia bloku (true/false)
     * @param blockWidth Szerokość ciała fizyczengo bloku (Najlepiej szerokość grafiki)
     * @param blockHeight Wysokość ciała fizyczengo bloku (Najlepiej wysokość grafiki)
     * @param blockMaterial Materiał bloku
     * @param rotateBody Rotacja bloku, default: `rotate` = 0
     */
    private var maxBlockHP:Float;
    private var blockHP:Float;
    private var typeOfBlock:String;
    private var blockWidth:Int;
    private var blockHeight:Int;
    public function new(positionX:Float, positionY:Float, blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, _blockWidth:Int, _blockHeight:Int, blockMaterial:Material, _blockHP:Float, rotateBody:Float = 0, _typeOfBlock:String){
        super();
        loadGraphic(blockGraphic, blockBreakingAnimation, _blockWidth, _blockHeight );
        animation.add("fullHP",[0],1);
        animation.add("highHP",[1],1);
        animation.add("lowHP",[2,3],1);
        createRectangularBody(_blockWidth, _blockHeight );
        body.position.setxy(positionX, positionY);
        body.setShapeMaterials(blockMaterial);
        physicsEnabled = false;
        body.rotation = rotateBody;
        this.maxBlockHP = _blockHP;
        this.blockHP = _blockHP;
        this.typeOfBlock = _typeOfBlock;
        this.blockWidth = _blockWidth;
        this.blockHeight = _blockHeight;
    }
    override function update(elapsed:Float):Void {
        super.update(elapsed);
        if(this.blockHP/this.maxBlockHP*100 >= 85) {
            animation.play("fullHP");
        }else if (this.blockHP/this.maxBlockHP*100 < 85 && this.blockHP/this.maxBlockHP*100 >= 45 ) {
            animation.play("highHP");
        } else if (this.blockHP/this.maxBlockHP*100 < 45  ) {
            animation.play("lowHP");
        }
        if(this.blockHP <= 0) {
            this.kill();
        }
        
    }
    // private function animationForBlocks():Void {
    //     if(this.typeOfBlock == "ice" ) {
    //             if (this.blockHeight  == 16 && this.blockWidth == 16) {

    //             } else if(this.blockHeight  == 32 && this.blockWidth == 16) {
    //             } else if (this.blockHeight  == 64 && this.blockWidth == 16) {
    //             } else if (this.blockHeight  == 96 && this.blockWidth == 16) {
    //             } else if (this.blockHeight  == 32 && this.blockWidth == 32  ) {
    //             } else if (this.blockHeight  == 64 && this.blockWidth == 32  ) {
    //             }
    //         } else if (this.typeOfBlock == "wood") {
    //             if(this.blockHeight  == 32 && this.blockWidth== 16) {
    //             } else if (this.blockHeight  == 64 && this.blockWidth == 16) {
    //             } else if (this.blockHeight  == 80 && this.blockWidth == 16) {
    //             } else if (this.blockHeight  == 64 && this.blockWidth == 32) {
    //             }
    //         } else if (this.typeOfBlock == "steel")) {
    //             if(this.blockHeight  == 32) {
    //             } else 
    //             if (this.blockHeight  == 64) {
    //             } else if (this.blockHeight  == 96) {
                
    //         }
    //     }
    // }

}

