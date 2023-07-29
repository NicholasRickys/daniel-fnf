package;

import PlayState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;

class Stage extends FlxTypedGroup<FlxSprite>
{
	public var curStage:String = 'stage';
	public var BF_COORDS = [0, 0];
	public var GF_COORDS = [0, 0];
	public var DAD_COORDS = [0, 0];
	public var VISIBLE_GF = true;

	// since we arent using sprite group anymore we had to compensate in a way
	public var width:Float = 0;
	public var height:Float = 0;

	public function new(stageName:String)
	{
		super();
		switch (stageName)
		{
			default:
				var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bg_0', 'shared'));
				bg.antialiasing = true;
				bg.scale.set(0.5, 0.5);
				bg.updateHitbox();
				VISIBLE_GF = false;
				add(bg);
				BF_COORDS[0] = 356;
				BF_COORDS[1] = 300;
				DAD_COORDS[0] = 829;
				DAD_COORDS[1] = 362;
		}
		curStage = stageName;
		var xywh = returnStageXYWH();
		width = xywh[2];
		height = xywh[3];
	}

	public function returnStageXYWH():Array<Float>
	{
		var width:Float = 0;
		var height:Float = 0;
		var x:Float = 0;
		var y:Float = 0;
		forEachAlive(function(spr:FlxSprite)
		{
			if (spr.x < x)
				x = spr.x;
			if (spr.y < y)
				y = spr.y;
			if (spr.width > width)
				width = spr.width;
			if (spr.height > height)
				height = spr.height;
		});
		return [x, y, width, height];
	}

	public function setAlpha(newAlp:Float)
	{
		forEachAlive(function(spr:FlxSprite)
		{
			spr.alpha = newAlp;
		});
	}
}
