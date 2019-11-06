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
    private var blockHP:Float;
    public function new(positionX:Float, positionY:Float, blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, blockMaterial:Material, _blockHP:Float, rotateBody:Float = 0){
        super();
        loadGraphic(blockGraphic, blockBreakingAnimation, blockWidth, blockHeight );
        
        createRectangularBody(blockWidth, blockHeight );
        body.position.setxy(positionX, positionY);
        body.setShapeMaterials(blockMaterial);
        physicsEnabled = false;
        body.rotation = rotateBody;
        this.blockHP = _blockHP;

    }
}

