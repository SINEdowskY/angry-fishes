package fish; 

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;


class Fish extends FlxNapeSprite {

    public function new(positionX:Float = 0, positionY:Float = 0, fishGraphic:FlxGraphicAsset, fishAnimated:Bool = true, fishMaterial:Material) {
        super();
        loadGraphic(fishGraphic, fishAnimated, 32,32 );
        createRectangularBody(32,32);
        body.setShapeMaterials(fishMaterial);
        body.position.setxy(positionX, positionY);
        physicsEnabled = false;
        
    }
    

    
}