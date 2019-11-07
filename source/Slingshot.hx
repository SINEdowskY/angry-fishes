package;

import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxG;
import nape.geom.Vec2;
using flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import fishes.*;


class Slingshot extends FlxSprite {

    private static inline var maxValue:Float = 70;
    private var currentValue:Vec2;
    private var startPointFish:Vec2;
    private var endPointFish:Vec2;
    private var _ammunition:Fish;
    private var aim:Bool;
    private var bodyPhysics:Bool;
    private var clickedFish:Bool;
    private var lineStyle:LineStyle;
    private var drawStyle:DrawStyle;
    private var _canvas:FlxSprite;
    private var positionObject:Vec2;
    private var result:Vec2;
    private var angleDiffrent:Float;
	public var loaded:Bool;


    public function new (positionX:Float, positionY:Float) {
        super(positionX, positionY);
        loadGraphic(AssetPaths.proca__png, false, 64, 128);
    }
    private function loadAmmunition(ammunition:Fish) {
        FlxTween.cubicMotion(ammunition, ammunition.getPosition().x+16, ammunition.getPosition().y+16, getPosition().x-30, getPosition().y+16-46, getPosition().x+30-5, getPosition().y+16-15, getPosition().x+30, getPosition().y+16, 2.3);  

        this.startPointFish = new Vec2(getPosition().x+30, getPosition().y+16);
        this.bodyPhysics = false;
        this.currentValue = new Vec2(0,0);
		this.loaded = false;
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
        this.aim = true;
        if (!this.clickedFish) {
            FlxG.mouse.visible = false;
        }
        this.clickedFish = true;

    }
    private function onMouseUp(_ammunitionMouse:Fish) {
        FlxG.mouse.visible = true;
        this.aim = false;
        if(!this._ammunition.launched) {
            this.bodyPhysics = true;
        }
        this._ammunition.launched = true;
        
    }
    private function dragFish() {
        
        this.endPointFish = new Vec2(FlxG.mouse.x, FlxG.mouse.y);            
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

        _canvas.drawLine(getPosition().x+12, getPosition().y, this._ammunition.x+16, this._ammunition.y+16, this.lineStyle, this.drawStyle );
        _canvas.drawLine(getPosition().x+50, getPosition().y, this._ammunition.x+16, this._ammunition.y+16, this.lineStyle, this.drawStyle );
             
    }   
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
        _canvas.fill(FlxColor.TRANSPARENT);
        
        if(!this.loaded) {
			if(FlxG.mouse.pressed) {
				loadAmmunition(_ammunition);
				this.loaded = true;
			}
		}

        if (!this._ammunition.launched) {
            if(this.aim) {
                dragFish();
            }      
        }  

        if (this.bodyPhysics) {
            this._ammunition.physicsEnabled = true;
            this._ammunition.body.applyImpulse(new Vec2(currentValue.x*-4.2, currentValue.y*-4.2));
            FlxG.camera.follow(this._ammunition, PLATFORMER, 2);
            this.bodyPhysics = false;
        }  
	}
    override public function destroy():Void
	{
		FlxMouseEventManager.remove(_ammunition);
		super.destroy();
	}
}