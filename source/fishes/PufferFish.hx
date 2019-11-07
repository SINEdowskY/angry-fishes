package fishes;

import fishes.Fish;
import flixel.system.FlxAssets;
import nape.phys.Material;
import nape.geom.Vec2;
import flixel.FlxState;
import flixel.FlxG;
import levels.MainSystemLevels;

class PufferFish extends Fish {
    private var _material:Material;
    private var usedSkill:Bool;
    private var _spike:Spike;
    private static var radius:Float = 32;
    private var radiusVec:Vec2;
    private var angleVecs:Float = 0;
    public function new(positionX:Float, positionY:Float, fishGraphic:FlxGraphicAsset, fishAnimation:Bool = true, widthFish:Int, heightFish:Int, _typeOfFish:String, level:FlxState) {
        this._material = new Material(); //TODO ustalic material 
        super(positionX, positionY, fishGraphic, fishAnimation, this._material, widthFish, heightFish, _typeOfFish, level);

        usedSkill = false;
            

        }
    public function shootingSpikesSkill(){

        for(step in 0...8)
        {
            radiusVec = new Vec2(radius,0);
            radiusVec.rotate(this.angleVecs);
            _spike = new Spike(this.body.position.x + radiusVec.x, this.body.position.y + radiusVec.y, Material.wood());
            _spike.body.isBullet = true;
            _spike.physicsEnabled = true;
            this.state.add(_spike);
            _spike.body.applyImpulse(new Vec2(_spike.body.position.x +0.001, _spike.body.position.y).rotate(this.angleVecs));
            this.angleVecs += 45;

        }
        angleVecs = 0;
        usedSkill = true;

    }
    override public function update(elapsed:Float):Void
     {
        super.update(elapsed);
        if (this.launched && FlxG.mouse.justPressed && !usedSkill && !this.collisionDetectedFish){
            this.shootingSpikesSkill();
        }
        
     }
}