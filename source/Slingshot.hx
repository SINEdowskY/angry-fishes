package;

import flixel.FlxSprite;
import fish.Fish;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxG;
import nape.geom.Vec2;
using flixel.util.FlxSpriteUtil.DrawStyle;
using flixel.util.FlxSpriteUtil.LineStyle;
using flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;


class Slingshot extends FlxSprite {

    private static inline var maxValue:Float = 70;
    private var currentValue:Vec2;
    private var startPointFish:Vec2;
    private var endPointFish:Vec2;
    private var _ammunition:Fish;
    private var aim:Bool;
    private var bodyPhysics:Bool;
    private var launched:Bool;
    private var clickedFish:Bool;
    private var lineStyle:LineStyle;
    private var drawStyle:DrawStyle;
    private var _canvas:FlxSprite;
    private var fishPosition:Vec2;
    private var positionObject:Vec2;
    private var result:Vec2;
    private var angleDiffrent:Float;


    public function new (positionX:Float, positionY:Float) {
        super(positionX, positionY);
        loadGraphic(AssetPaths.proca__png,false,64,128);
        this.currentValue = new Vec2(0,0);
        this.fishPosition = new Vec2(0,0);  

    }
    public function loadAmmunition(ammunition:Fish) {
        ammunition.setPosition(getPosition().x+30, getPosition().y+16);
        this.startPointFish = new Vec2(getPosition().x+30, getPosition().y+16);
        this.bodyPhysics = false;
        this.launched = false;
    }
    public function setFish(ammunition:Fish) {
        this._ammunition = ammunition;
        FlxMouseEventManager.add(this._ammunition, onMouseDown, onMouseUp, null, null);

    }
    public function setCanvas(canvas:FlxSprite) {
        this._canvas = canvas;
        this.lineStyle = {color: FlxColor.RED, thickness: 2, };
        this.drawStyle = {smoothing: true};

    }

    private function onMouseDown(_ammunitionMouse:Fish) {
        trace("Kliknieta"); 
        this.aim = true;
        if (!this.clickedFish) {
            FlxG.mouse.visible = false;
        }
        this.clickedFish = true;

    }
    private function onMouseUp(_ammunitionMouse:Fish) {
        trace("Puszczona");   
        FlxG.mouse.visible = true;
        this.aim = false;
        if(!launched) {
            this.bodyPhysics = true;
        }
        launched = true;
        
    }
    private function dragFish() {
        
        this.endPointFish = new Vec2(FlxG.mouse.x, FlxG.mouse.y);
              
        this._canvas.drawCircle(this.startPointFish.x, this.startPointFish.y, maxValue,FlxColor.TRANSPARENT, this.lineStyle, drawStyle);
        this.currentValue.setxy((endPointFish.x - startPointFish.x), (endPointFish.y - startPointFish.y));        

        if ( Math.round(this.currentValue.length) >= maxValue  ) {
            this.angleDiffrent = this.currentValue.angle - this.endPointFish.angle;
            this.endPointFish.rotate(angleDiffrent);
            this.positionObject = this.endPointFish;
            this.positionObject.length = 1*maxValue;
            
            this.result = new Vec2(getPosition().x+30+this.positionObject.x, getPosition().y+16+this.positionObject.y);
                    
            this._ammunition.setPosition( this.result.x, this.result.y);
        } else {
            this._ammunition.setPosition(FlxG.mouse.getPosition().x, FlxG.mouse.getPosition().y);    
        }        
    }
    
    

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
        _canvas.fill(FlxColor.TRANSPARENT);
        if (!this.launched) {
            if(this.aim) {
                dragFish();
            }      
        }  

        if (this.bodyPhysics) {
            this._ammunition.physicsEnabled = true;
            this._ammunition.body.applyImpulse(new Vec2(currentValue.x*-1.6, currentValue.y*-1.6));
            FlxG.camera.follow(this._ammunition,LOCKON,1);
            this.bodyPhysics = false;
        }  
	}
    override public function destroy():Void
	{
		FlxMouseEventManager.remove(_ammunition);
		super.destroy();
	}
}