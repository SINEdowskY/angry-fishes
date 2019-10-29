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
     * @param blockHeight Wyskość ciała fizyczengo bloku (Najlepiej wysokość grafiki)
     * @param blockMaterial Materiał bloku
     */
    public function new(positionX:Float,positionY:Float,blockGraphic:FlxGraphicAsset, blockBreakingAnimation:Bool = true, blockWidth:Int, blockHeight:Int, blockMaterial:Material){
            super();
            loadGraphic(blockGraphic,blockBreakingAnimation,blockWidth,blockHeight);
            createRectangularBody(blockWidth,blockHeight);
            body.setShapeMaterials(blockMaterial);
            body.position.setxy(positionX,positionY);

    }
}

