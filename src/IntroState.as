package
{
	import org.flixel.*;
		
	public class IntroState extends FlxState
	{
		//Variables got here
		private var player:Player;
		private var bg:FlxSprite = new FlxSprite();
		private var hb:FlxSprite = new FlxSprite();
		private var it1:FlxSprite = new FlxSprite();
		private var it2:FlxSprite = new FlxSprite();
		private var it3:FlxSprite = new FlxSprite();
		private var it4:FlxSprite = new FlxSprite();
		private var it5:FlxSprite = new FlxSprite();
		private var t:FlxTimer = new FlxTimer();
		private var t2:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false;
		private var timerSet2:Boolean = false;
		private var shake:Boolean = false;
		private var crack:Boolean = false;
		private var count:int = 0;
		
		

		public function IntroState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.Intro1,.8);
			bg.loadGraphic(Registry.introBG,false,false,350,300);
			add(bg);
			hb.loadGraphic(Registry.halfblock,false,false,25,25);
			add(hb);
			hb.x = 150;
			hb.y = 50;
			loadText();
			player = new Player(-25,38);
			add(player);
			Registry.walking = true;
			Registry.intro = true;
		}
		
		override public function update():void
		{
			
			if(Registry.walking)
			{
				walkSound(1);
			}
			
			if(Registry.standing && count <=5)
			{
				delay(5);
			}
			
			switch(count)
			{
				case 1:
				{
					it1.visible = true;
					break;
				}
				case 2:
				{
					it2.visible = true;
					it1.visible = false;
					break;
				}
				case 3:
				{
					it3.visible = true;
					it2.visible = false;
					if(!shake)
					{
						shake = true;
						FlxG.shake(0.05,5);
						FlxG.play(Registry.quake,.4,false);
						FlxG.playMusic(Registry.Intro2,.8);
					}
					break;
				}
				case 4:
				{
					it4.visible = true;
					it3.visible = false;
					hb.y = 55;
					player.y = 43;
					break;
				}
				case 5:
				{
					if(!crack)
					{
						crack = true;
						FlxG.play(Registry.rock1,.8,false);
					}
					it5.visible = true;
					it4.visible = false;
					Registry.falling = true;
					Registry.standing = false;
					hb.velocity.y = 300;
					player.velocity.y = 100;
					it5.velocity.y = 100;
					break;
				}
					
			}
			
			if(player.y > 450)
			{
				it1.kill();
				it2.kill();
				it3.kill();
				it4.kill();
				it5.kill();
				hb.kill();
				bg.kill();
				count = 0;
				Registry.intro = false;
				FlxG.switchState(new PlayState());
			}
			
			
			super.update();
		}
		
		private function delay(howLong:int):void
		{	
			if(!timerSet)
				t.start(howLong);
			timerSet = true;
			//trace("t = "+FlxU.floor(t.timeLeft));
			if(t.finished)
			{
				t.stop();
				timerSet = false;
				count +=1;

			}			
		}
		
		private function walkSound(howLong:int):void
		{	
			if(!timerSet2)
				t2.start(howLong);
			timerSet2 = true;
			//trace("t = "+FlxU.floor(t.timeLeft));
			if(t2.finished)
			{
				t2.stop();
				timerSet2 = false;
				FlxG.play(Registry.walking2,.4);
			}			
		}
		
		private function loadText():void
		{
			it1.loadGraphic(Registry.introText1,false,false,95,23);
			add(it1);
			it1.x = 165;
			it1.y = 2;
			it1.visible = false;
			it2.loadGraphic(Registry.introText2,false,false,95,23);
			add(it2);
			it2.x = 165;
			it2.y = 2;
			it2.visible = false;
			it3.loadGraphic(Registry.introText3,false,false,95,23);
			add(it3);
			it3.x = 165;
			it3.y = 2;
			it3.visible = false;
			it4.loadGraphic(Registry.introText4,false,false,95,23);
			add(it4);
			it4.x = 165;
			it4.y = 2;
			it4.visible = false;
			it5.loadGraphic(Registry.introText5,false,false,95,23);
			add(it5);
			it5.x = 165;
			it5.y = 2;
			it5.visible = false;
		}
	}
}