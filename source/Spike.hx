package;

import flixel.addons.nape.FlxNapeSprite;
import nape.phys.Material;
import flixel.math.FlxMath;

class Spike extends FlxNapeSprite{
    public function new(positionX:Float, positionY:Float, spikeMaterial:Material){
        super();
        loadGraphic(AssetPaths.kolec5x5__png,false,5,5);
        createRectangularBody(5,5);
        body.position.setxy(positionX,positionY);
        body.setShapeMaterials(spikeMaterial);
        physicsEnabled = true;

    }
}