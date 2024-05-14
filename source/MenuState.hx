package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var selectText:FlxText;
	var curTextofSelect:String = "";
	var curIntSelctText:Int = 0;

	override function create()
	{
		super.create();
		FlxG.cameras.bgColor = 0xffaaaaaa;

		selectText = new FlxText(15, FlxG.height - 20, 0, curTextofSelect, 18, false);
		selectText.setFormat(null, 18, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		add(selectText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		selectText.text = curTextofSelect;

		switch (curIntSelctText)
		{
			case 0:
				curTextofSelect = "Play";
			case 1:
				curTextofSelect = "Options";
			case 2:
				curTextofSelect = "Exit";
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			trace(curIntSelctText);
			curIntSelctText = (curIntSelctText - 1) % 3;
			if (curIntSelctText < 0)
				curIntSelctText = 2;
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			trace(curIntSelctText);
			curIntSelctText = (curIntSelctText + 1) % 3;
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			switch (curIntSelctText)
			{
				case 0:
					trace("move to select level");
				case 1:
					trace("open config level");
				case 2:
					trace("exit game");
					FlxG.save.flush();
					Sys.exit(0);
			}
		}
	}
}