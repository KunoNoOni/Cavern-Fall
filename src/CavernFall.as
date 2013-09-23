package
{
	import org.flixel.*;
	
	[SWF(width="700", height="600", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class CavernFall extends FlxGame
	{
		public function CavernFall()
		{
			super(350,300,TitleState,2,60,60);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}