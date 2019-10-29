package fishes;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Fish extends FlxNapeSprite{
    var fish:FlxNapeSprite;
    /**
     * Tworzy sojusznika.
     * Każda ryba ma swoją masę (massOfFish), która będzie liczbą obrażeń.
     * @param positionX Współrzędne X położenia sojusznika
     * @param positionY Współrzędne Y położenia sojusznika
     * @param fishGraphic Łącze do grafiki (Klasa AssetsPath)
     * @param fishAnimation = true Animacja umiejętności ryby (true/false)
     * @param fishMaterial Materiał ryby
     */
    public function new(positionX:Float,positionY:Float,fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, fishMaterial:Material){
        super();
        loadGraphic(fishGraphic,fishAnimation,32,32);
        createRectangularBody(32,32);
        body.setShapeMaterials(fishMaterial);
        body.position.setxy(positionX,positionY);
        physicsEnabled = false;
    }
}