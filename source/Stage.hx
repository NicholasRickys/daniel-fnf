package;

import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import PlayState;

class Stage extends FlxTypedGroup<FlxSprite> {
	public var curStage:String = 'stage';
	public var BF_COORDS = [0,0];
	public var GF_COORDS = [0,0];
	public var DAD_COORDS = [0,0];
	public var VISIBLE_GF = true;

	// since we arent using sprite group anymore we had to compensate in a way
	public var width:Float = 0;
	public var height:Float = 0;
	public function new(stageName:String) {
		super();
		switch (stageName) {
			default:
				var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('bg', 'poyo'));
				bg.antialiasing = true;
				add(bg);
				BF_COORDS[0] = 1480;
				BF_COORDS[1] = 500;
				DAD_COORDS[0] = 700;
				DAD_COORDS[1] = 240;
				GF_COORDS[0] = 919;
				GF_COORDS[1] = 200;
		}
		curStage = stageName;
		var xywh = returnStageXYWH();
		width = xywh[2];
		height = xywh[3];
	}

	public function returnStageXYWH():Array<Float> {
		var width:Float = 0;
		var height:Float = 0;
		var x:Float = 0;
		var y:Float = 0;
		forEachAlive(function(spr:FlxSprite) {
			if (spr.x < x) x = spr.x;
			if (spr.y < y) y = spr.y;
			if (spr.width > width) width = spr.width;
			if (spr.height > height) height = spr.height;
		});
		return [x, y, width, height];
	}

	public function setAlpha(newAlp:Float) {
		forEachAlive(function(spr:FlxSprite) {
			spr.alpha = newAlp;
		});
	}
}