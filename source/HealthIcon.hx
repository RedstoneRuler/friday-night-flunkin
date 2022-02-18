package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic('assets/images/iconGrid.png', true, 150, 150);

		antialiasing = true;
		animation.add('bf', [0, 0], 0, false, isPlayer);
		animation.add('bf-car', [0, 0], 0, false, isPlayer);
		animation.add('bf-christmas', [0, 0], 0, false, isPlayer);
		animation.add('bf-pixel', [21, 21], 0, false, isPlayer);
		animation.add('spooky', [2, 2], 0, false, isPlayer);
		animation.add('pico', [4, 4], 0, false, isPlayer);
		animation.add('mom', [6, 6], 0, false, isPlayer);
		animation.add('mom-car', [6, 6], 0, false, isPlayer);
		animation.add('tankman', [8, 8], 0, false, isPlayer);
		animation.add('face', [10, 10], 0, false, isPlayer);
		animation.add('dad', [12, 12], 0, false, isPlayer);
		animation.add('senpai', [22, 22], 0, false, isPlayer);
		animation.add('senpai-angry', [22, 22], 0, false, isPlayer);
		animation.add('spirit', [23, 23], 0, false, isPlayer);
		animation.add('bf-old', [14, 14], 0, false, isPlayer);
		animation.add('gf', [16], 0, false, isPlayer);
		animation.add('parents-christmas', [17], 0, false, isPlayer);
		animation.add('monster', [19, 19], 0, false, isPlayer);
		animation.add('monster-christmas', [19, 19], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}
}
