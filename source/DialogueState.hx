package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxSubState;
import flixel.addons.display.FlxBackdrop;
import Character;
import Paths;

class DialogueState extends MusicBeatSubstate
{
    var background:FlxBackdrop;
    var textbox:FlxText;
    public var isDone = false;
    public var line:Int = 0;

    public function new(dad:Character, bf:Character, dialogue:Array<String>, camera)
    {
        super();
        var bg:FlxBackdrop = new FlxBackdrop(Paths.image('DIALOGUELOL'), flixel.util.FlxAxes.X);
        add(bg);
        bg.scrollFactor.set(0,0);
    }
}