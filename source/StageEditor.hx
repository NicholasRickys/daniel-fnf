package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;

class StageEditor extends FlxState
{
	var offsetText:FlxText;
	var dad:Character;
	var bf:Character;
	var bg:FlxSprite;
	var curSelected:Character;

	override function create()
	{
		FlxG.mouse.visible = true;
		add(bg = new FlxSprite(0, 0).loadGraphic(Paths.image('bg_0', 'shared')));
		bg.scale.set(0.5, 0.5);
		bg.updateHitbox();
		add(bf = new Character(0, 0, 'daniel', true));
		bf.flipX = false;
		add(dad = new Character(0, 0, 'jester', false));
		dad.flipX = false;
		curSelected = bf;
		FlxG.camera.follow(curSelected);
		add(offsetText = new FlxText(16, 0, FlxG.width, ''));
		offsetText.scrollFactor.set(0, 0);
		super.create();
	}

	override function update(elapsed:Float)
	{
		var xMove:Array<Float> = [-1, 0, 1, 0];
		var yMove:Array<Float> = [0, 1, 0, -1];
		var multiplier:Float = 1;
		var keys:Array<Bool> = [
			FlxG.keys.justPressed.LEFT,
			FlxG.keys.justPressed.DOWN,
			FlxG.keys.justPressed.RIGHT,
			FlxG.keys.justPressed.UP
		];
		if (FlxG.keys.pressed.SHIFT)
			multiplier = 4;
		for (keyNum in 0...keys.length)
		{
			var key:Bool = keys[keyNum];
			if (key)
			{
				curSelected.x += xMove[keyNum] * multiplier;
				curSelected.y += yMove[keyNum] * multiplier;
			}
		}

		if (FlxG.keys.justPressed.E)
		{
			if (curSelected == bf)
				curSelected = dad;
			else
				curSelected = bf;

			FlxG.camera.follow(curSelected);
		}

		offsetText.text = 'BF: $bf
       \nDAD: $dad';

		super.update(elapsed);
	}
}
