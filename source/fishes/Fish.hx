package fishes;

import flixel.addons.nape.FlxNapeSprite;
import flixel.system.FlxAssets;
import nape.phys.Material;
import flixel.FlxState;
import flixel.FlxG;
import flixel.math.FlxPoint;


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
    public var typeOfFish:String;
    public var state:FlxState;
    private var timer:Float;
    
    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, fishMaterial:Material, widthFish:Int, heightFish:Int, _typeOfFish:String,level:FlxState){
        super();
        loadGraphic(fishGraphic, fishAnimation, widthFish, heightFish);
        createRectangularBody(widthFish, heightFish);
        body.setShapeMaterials(fishMaterial);
        body.position.setxy(positionX,positionY);
        physicsEnabled = false;
        this.launched = false;
        this.collisionDetectedFish = false;
        this.timer = 0;
        this.typeOfFish = _typeOfFish;
        this.state = level;
    }
    override function update(elapsed:Float):Void {
        super.update(elapsed);
        if(this.collisionDetectedFish) {
            this.timer += elapsed;
        }
        if(Math.round(this.timer) == 2) {
            this.kill();
            this.collisionDetectedFish = false;
            this.timer = 0;
        }

    }
    public function energyCalculation():Void {
        this.fishEnergy = Math.round((this.body.mass * Math.pow(this.body.velocity.length, 2))/2);
    }
    
}