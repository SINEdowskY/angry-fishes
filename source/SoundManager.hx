package;

import flixel.system.FlxSound;
import levels.MainSystemLevels;
import fishes.Fish;

class SoundManager extends FlxSound {
    var sound:FlxSound;
    var music:FlxSound;
    public function new() {
        super();
    }
    /**
     * Muzyka odtwarzana przy menu głównym
     */
    public function menuTheme(){
        music = new FlxSound();
        music.loadEmbedded(AssetPaths.menutheme__mp3, true, false);
        music.play(false,0.0);

    }
    /**
     * Muzyka odtwarzana w trakcie gry
     */
    public function gameTheme(){
        music = new FlxSound();
        music.loadEmbedded(AssetPaths.gametheme__mp3, true, false);
        music.play(false,0.0);
    }
    /**
     * Dźwięk wystrzalu z procy
     */
    public function swingshotSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.swingshot__wav, false,true);
        sound.play(false,0.0);

    }
    /**
     * Dźwięk uderzenia o drewno
     */
    public function woodHitSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.woodhit__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk uderzenia o metal
     */
    public function metalHitSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.metalhit__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk uderzenia o lód
     */
    public function iceHitSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.icehit__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk dla niszczączego się drewna
     */
    public function woodBreakingSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.woodbreaking__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk dla niszczączego się metalu
     */
    public function metalBreakingSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.metalbreaking__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk dla niszczączego się lodu
     */
    public function iceBreakingSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.icebreaking__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk śmierci piranii
     */
    public function piranhaDeath(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.piranhahit__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk śmierci meduzy
     */
    public function jellyfishDeath(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.jellyfishhit__wav, false,true);
        sound.play(false,0.0);
    }
    /**
     * Dźwięk dla przycisków menu
     */
    public function bubblePopSound(){
        sound = new FlxSound();
        sound.loadEmbedded(AssetPaths.bubblepop__wav, false,true);
        sound.play(false,0.0);
    }

}