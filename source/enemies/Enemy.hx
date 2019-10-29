package enemies;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;

class Enemy extends FlxNapeSprite{
    /**
     * Klasa tworzy orzeciwnika. Każdy przeciwnik ma punkty życia (enemyHP)
     * @param positionX Współrzędne X położenia przeciwnika
     * @param positionY Współrzędne Y położenia przeciwnika
     * @param enemyGraphic Łącze do grafiki (Klasa AssetsPath)
     * @param enemyAnimation Animacja przeciwnika (True/False)
     * @param enemyMaterial Materiał przeciwnika
     */
    public function new(positionX:Float,positionY:Float,enemyGraphic:FlxGraphicAsset, enemyAnimation:Bool = true, enemyMaterial:Material){
        super();
        loadGraphic(enemyGraphic,enemyAnimation,enemyWidth,enemyHeight);
        createRectangularBody(32,32);
        body.setShapeMaterials(enemyMaterial);
        body.position.setxy(positionX,positionY);



    }
}