package
{
	import org.flixel.*;
		
	public class GameOverState extends FlxState
	{
		//Variables got here
		private var bgA:FlxSprite;
		private var bgB:FlxSprite;
		private var speed:int = 3;
		private var endText:FlxText;
		private var continueText:FlxText;

		public function GameOverState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.GameOver,.8);
			bgA = new FlxSprite();
			bgB = new FlxSprite();
			bgA.loadGraphic(Registry.bg1,false,false,350,300);
			bgB.loadGraphic(Registry.bg1,false,false,350,300);
			add(bgA);
			add(bgB);
			bgA.y = 0;
			bgB.y = bgA.y+300;
			
			endText = new FlxText(20,100,325,"You had fallen "+Registry.fallen+" ft. before \nplunging to your death.");
			endText.setFormat(null,10,0xf69c14,"center");
			add(endText);
			
			continueText = new FlxText(100,200,150,"Press [x] to fall again!");
			continueText.setFormat(null,10,0xf69c14,"center");
			add(continueText);
			
			
		}
		
		override public function update():void
		{
			
			bgA.y -= speed;
			bgB.y -= speed;
			
			if(bgA.y < -299)
			{
				bgA.y = bgB.y+300;
			}
			
			if(bgB.y < -299)
			{
				bgB.y = bgA.y+300;
			}
			
			if(FlxG.keys.justPressed("X"))
			{
				FlxG.switchState(new PlayState());
			}
			
			super.update();
		}
	}
}