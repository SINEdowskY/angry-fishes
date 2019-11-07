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
    private var enemyHP:Float;
    private var enemyHPMax:Float;
    private var timer:Float;
    public function new(positionX:Float, positionY:Float, enemyGraphic:FlxGraphicAsset, enemyAnimation:Bool = true, enemyMaterial:Material, enemyWidth:Int = 32, enemyHeight:Int = 32, _enemyHP:Float){
        super();

        loadGraphic(enemyGraphic, enemyAnimation, enemyWidth, enemyHeight );
        createRectangularBody(enemyWidth, enemyHeight);
        body.setShapeMaterials(enemyMaterial);
        body.position.setxy(positionX,positionY);
        physicsEnabled = true;
        this.enemyHP = _enemyHP;
        this.enemyHPMax = _enemyHP;
        this.timer = 0;


    }
}