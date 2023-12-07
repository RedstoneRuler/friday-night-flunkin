package;

import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import io.newgrounds.components.ScoreBoardComponent.Period;
import io.newgrounds.objects.Medal;
import io.newgrounds.objects.Score;
import io.newgrounds.objects.ScoreBoard;
import io.newgrounds.objects.events.Response;
//import io.newgrounds.objects.events.Result.GetCurrentVersionResult;
//import io.newgrounds.objects.events.Result.GetVersionResult;
import lime.app.Application;
import openfl.display.Stage;

using StringTools;

// There's nearly nothing left in here, this code does not work anymore but this mod ain't going on NG anyway.
class NGio
{
	public static var isLoggedIn:Bool = false;
	public static var scoreboardsLoaded:Bool = false;

	public static var scoreboardArray:Array<Score> = [];

	public static var ngDataLoaded(default, null):FlxSignal = new FlxSignal();
	public static var ngScoresLoaded(default, null):FlxSignal = new FlxSignal();

	public static var GAME_VER:String = "";
	public static var GAME_VER_NUMS:String = '';
	public static var gotOnlineVer:Bool = false;

	public static function noLogin(api:String)
	{
		/*
		trace('INIT NOLOGIN');
		GAME_VER = "v" + Application.current.meta.get('version');

		NG.create(api);

		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			var call = NG.core.calls.app.getCurrentVersion(GAME_VER).addDataHandler(function(response:Response<GetCurrentVersionResult>)
			{
				if (response.result != null)
				{
					GAME_VER = response.result.data.currentVersion;
					GAME_VER_NUMS = GAME_VER.split(" ")[0].trim();
					trace('CURRENT NG VERSION: ' + GAME_VER);
					trace('CURRENT NG VERSION: ' + GAME_VER_NUMS);
					gotOnlineVer = true;
				}
		});
			call.send();
		});
		*/
	}

	public function new(api:String, encKey:String, ?sessionId:String)
	{
	}

	function onNGLogin()
	{
	}

	// --- MEDALS
	function onNGMedalFetch():Void
	{
		/*
			// Reading medal info
			for (id in NG.core.medals.keys())
			{
				var medal = NG.core.medals.get(id);
				trace('loaded medal id:$id, name:${medal.name}, description:${medal.description}');
			}

			// Unlocking medals
			var unlockingMedal = NG.core.medals.get(54352);// medal ids are listed in your NG project viewer
			if (!unlockingMedal.unlocked)
				unlockingMedal.sendUnlock();
		 */
	}

	// --- SCOREBOARDS
	function onNGBoardsFetch():Void
	{
		/*
			// Reading medal info
			for (id in NG.core.scoreBoards.keys())
			{
				var board = NG.core.scoreBoards.get(id);
				trace('loaded scoreboard id:$id, name:${board.name}');
			}
		 */
		// var board = NG.core.scoreBoards.get(8004);// ID found in NG project view

		// Posting a score thats OVER 9000!
		// board.postScore(FlxG.random.int(0, 1000));

		// --- To view the scores you first need to select the range of scores you want to see ---

		// add an update listener so we know when we get the new scores
		// board.onUpdate.add(onNGScoresFetch);
		trace("shoulda got score by NOW!");
		// board.requestScores(20);// get the best 10 scores ever logged
		// more info on scores --- http://www.newgrounds.io/help/components/#scoreboard-getscores
	}

	inline static public function postScore(score:Int = 0, song:String)
	{
		if (isLoggedIn)
		{
			for (id in NG.core.scoreBoards.keys())
			{
				var board = NG.core.scoreBoards.get(id);

				if (song == board.name)
				{
					board.postScore(score, "Uhh meow?");
				}

				// trace('loaded scoreboard id:$id, name:${board.name}');
			}
		}
	}

	function onNGScoresFetch():Void
	{
		scoreboardsLoaded = true;

		ngScoresLoaded.dispatch();
		/* 
			for (score in NG.core.scoreBoards.get(8737).scores)
			{
				trace('score loaded user:${score.user.name}, score:${score.formatted_value}');

			}
		 */

		// var board = NG.core.scoreBoards.get(8004);// ID found in NG project view
		// board.postScore(HighScore.score);

		// NGio.scoreboardArray = NG.core.scoreBoards.get(8004).scores;
	}

	inline static public function logEvent(event:String)
	{
		NG.core.calls.event.logEvent(event).send();
		trace('should have logged: ' + event);
	}

	inline static public function unlockMedal(id:Int)
	{
		if (isLoggedIn)
		{
			var medal = NG.core.medals.get(id);
			if (!medal.unlocked)
				medal.sendUnlock();
		}
	}
}
