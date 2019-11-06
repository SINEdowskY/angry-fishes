package fishes;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxState;


class Fish extends FlxNapeSprite{
    /**
     * Tworzy sojusznika.
     * Każda ryba ma swoją masę (massOfFish), która będzie liczbą obrażeń.
     * @param positionX Współrzędne X położenia sojusznika
     * @param positionY Współrzędne Y położenia sojusznika
     * @param fishGraphic Łącze do grafiki (Klasa AssetsPath)
     * @param fishAnimation = true Animacja umiejętności ryby (true/false)
     * @param fishMaterial Materiał ryby
     */
    public var launched:Bool;
    public var collisionDetectedFish:Bool;
    public var fishEnergy:Float;
    private var timer:Float;
    
    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, fishMaterial:Material, widthFish:Int, heightFish:Int){
        super();
        loadGraphic(fishGraphic, fishAnimation, widthFish, heightFish);
        createRectangularBody(widthFish, heightFish);
        body.setShapeMaterials(fishMaterial);
        body.position.setxy(positionX,positionY);
        physicsEnabled = false;
        this.launched = false;
        this.collisionDetectedFish = false;
        this.timer = 0;
        
    }
    override function update(elapsed:Float):Void {
        super.update(elapsed);
        if(this.collisionDetectedFish) {
            this.timer +=elapsed;
        }
        if(Math.round(this.timer) == 2) {
            this.kill();
            this.collisionDetectedFish = false;
        }

    }
    public function energyCalculation():Void {
        // mass * power(KinematicVel) and divide by 2 
        this.fishEnergy = (this.body.mass * Math.pow(this.body.kinematicVel.length, 2))/2;
    }
    
}