package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var bgA:FlxSprite;
		private var bgB:FlxSprite;
		private var speed:int = 3;
		private var Obstacle1:FlxTilemap;
		private var Obstacle2:FlxTilemap;
		private var Obstacle3:FlxTilemap;
		private var Obstacle4:FlxTilemap;
		private var t:FlxTimer = new FlxTimer();
		private var setSelection1:int = 0;
		private var setSelection2:int = 0;
		private var setSelection3:int = 0;
		private var setSelection4:int = 0;
		private var time:int = 4; 
		private var logo:FlxText;
		private var logoShadow:FlxText;
		private var instruct:FlxText;
		private var instructShadow:FlxText;
		private var credits:FlxText;
		private var creditsShadow: FlxText;
		private var instruct2:FlxText;
		private var instruct2Shadow:FlxText;
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.TitleGame,.8);
			Registry.timerSet = false;
			loadBackground();
			loadSet();
			loadTitle();
		}
		
		override public function update():void
		{
			bgA.y -= speed;
			bgB.y -= speed;
			
			if(Obstacle1 != null)
				Obstacle1.y -= speed;
			if(Obstacle2 != null)
				Obstacle2.y -= speed;
			if(Obstacle3 != null)
				Obstacle3.y -= speed;
			if(Obstacle4 != null)
				Obstacle4.y -= speed;
			
			delay(time);
			
			if(bgA.y < -299)
			{
				bgA.y = bgB.y+300;
			}
			
			if(bgB.y < -299)
			{
				bgB.y = bgA.y+300;
			}
			
			if(Obstacle1 != null && Obstacle1.y < -76)
			{
				Obstacle1.kill();
			}
			if(Obstacle2 != null && Obstacle2.y < -76)
			{
				Obstacle2.kill();
			}
			if(Obstacle3 != null && Obstacle3.y < -76)
			{
				Obstacle3.kill();
			}
			if(Obstacle4 != null && Obstacle4.y < -76)
			{
				Obstacle4.kill();
			}
			
			if(FlxG.keys.justPressed("X"))
				FlxG.switchState(new PlayState());
			
			if(FlxG.keys.justPressed("Q"))
			{
				SaveGoals.load();
				SaveGoals.setGoal1 = false;
				SaveGoals.setGoal2 = 20000;
				SaveGoals.setInc = 1;
				FlxG.switchState(new IntroState());
			}
	
			super.update();
		}
		
		private function loadTitle():void
		{
			logoShadow = new FlxText(FlxG.width*0.5-198,FlxG.height*0.5-108, 400, "Cavern Fall");
			logoShadow.setFormat(null,50,0x615e00, "center");
			add(logoShadow);
			logoShadow.scrollFactor.x = logoShadow.scrollFactor.y = 0;
			
			logo = new FlxText(FlxG.width*0.5-200,FlxG.height*0.5-110, 400, "Cavern Fall");
			logo.setFormat(null,50,0x958f33, "center");
			add(logo);
			logo.scrollFactor.x = logo.scrollFactor.y = 0;

			instructShadow = new FlxText(FlxG.width*0.5-98,FlxG.height-98, 200, "PRESS [X] TO START");
			instructShadow.setFormat(null,15,0x615e00, "center");
			add(instructShadow);
			instructShadow.scrollFactor.x = instructShadow.scrollFactor.y = 0;
			
			instruct = new FlxText(FlxG.width*0.5-100,FlxG.height-100, 200, "PRESS [X] TO START");
			instruct.setFormat(null,15,0x958f33, "center");
			add(instruct);
			instruct.scrollFactor.x = instruct.scrollFactor.y = 0;
			
			instruct2Shadow = new FlxText(FlxG.width*0.5-143,FlxG.height-78, 290, "PRESS [Q] TO ERASE SAVE DATA\n+ START");
			instruct2Shadow.setFormat(null,15,0x615e00, "center");
			add(instruct2Shadow);
			instruct2Shadow.scrollFactor.x = instruct2Shadow.scrollFactor.y = 0;
			
			instruct2 = new FlxText(FlxG.width*0.5-145,FlxG.height-80, 290, "PRESS [Q] TO ERASE SAVE DATA\n+ START");
			instruct2.setFormat(null,15,0x958f33, "center");
			add(instruct2);
			instruct2.scrollFactor.x = instruct2.scrollFactor.y = 0;
			
			
			creditsShadow = new FlxText(FlxG.width*0.5-201,FlxG.height-28, 400, "(C)2013 KunoNoOni   Music By DST");
			creditsShadow.setFormat(null,15,0x615e00, "center");
			add(creditsShadow);
			creditsShadow.scrollFactor.x = creditsShadow.scrollFactor.y = 0;
			
			credits = new FlxText(FlxG.width*0.5-203,FlxG.height-30, 400, "(C)2013 KunoNoOni   Music By DST");
			credits.setFormat(null,15,0x958f33, "center");
			add(credits);
			credits.scrollFactor.x = credits.scrollFactor.y = 0;
			
		}
		
		private function loadBackground():void
		{
			bgA = new FlxSprite();
			bgB = new FlxSprite();
			bgA.loadGraphic(Registry.bg1,false,false,350,300);
			bgB.loadGraphic(Registry.bg1,false,false,350,300);
			add(bgA);
			add(bgB);
			bgA.y = 0;
			bgB.y = bgA.y+300;
		}
		
		private function loadSet():void
		{
			Obstacle1 = new FlxTilemap();
			Obstacle1.loadMap(new Registry[Registry.osetArray[1]],Registry.buildTiles,25,25,0,0,1,2);
			add(Obstacle1);
			Obstacle1.x = 25;
			Obstacle1.y = 300;
			Obstacle1.kill();
			
			Obstacle2 = new FlxTilemap();
			Obstacle2.loadMap(new Registry[Registry.osetArray[2]],Registry.buildTiles,25,25,0,0,1,2);
			add(Obstacle2);
			Obstacle2.x = 100;
			Obstacle2.y = 300;
			Obstacle2.kill();
			
			Obstacle3 = new FlxTilemap();
			Obstacle3.loadMap(new Registry[Registry.osetArray[3]],Registry.buildTiles,25,25,0,0,1,2);
			add(Obstacle3);
			Obstacle3.x = 175;
			Obstacle3.y = 300;
			Obstacle3.kill();
			
			Obstacle4 = new FlxTilemap();
			Obstacle4.loadMap(new Registry[Registry.osetArray[4]],Registry.buildTiles,25,25,0,0,1,2);
			add(Obstacle4);
			Obstacle4.x = 250;
			Obstacle4.y = 300;
			Obstacle4.kill();
		}
		
		private function displaySet():void
		{
			if(setSelection1 == 1 || setSelection1 == 3)
			{
				Obstacle1.reset(25,300);
				add(Obstacle1);
			}
			
			if(setSelection2 == 1 || setSelection2 == 3)
			{
				Obstacle2.reset(100,300);
				add(Obstacle2);
			}
			
			if(setSelection3 == 1 || setSelection3 == 3)
			{
				Obstacle3.reset(175,300);
				add(Obstacle3);
			}
			
			if(setSelection4 == 1 || setSelection4 == 3)
			{
				Obstacle4.reset(250,300);
				add(Obstacle4);
			}
		}
		
		private function selectSet():void
		{
			var tmpRnd:int = 0;
			var tmpRnd2:int = 0;
			
			setSelection1 = FlxG.random()*3+1;
			setSelection2 = FlxG.random()*3+1;
			setSelection3 = FlxG.random()*3+1;
			setSelection4 = FlxG.random()*3+1;

			if(setSelection1 == 1 || setSelection1 == 3)
				if(setSelection2 == 1 || setSelection2 == 3)
					if(setSelection3 == 1 || setSelection3 == 3)
						if(setSelection4 == 1 || setSelection4 == 3)
						{
							tmpRnd = FlxG.random()*4+1;
							switch(tmpRnd)
							{
								case 1:
								{
									setSelection1 = 0;
									
									break;
								}
								case 2:
								{
									setSelection2 = 0;
									break;
								}
								case 3:
								{
									setSelection3 = 0;
									break;
								}
								case 4:
								{
									setSelection4 = 0;
									break;
								}
							}
						}
			
			if(setSelection1 == 2 && setSelection2 == 2 && setSelection3 == 2 && setSelection4 == 2)
			{
				tmpRnd2 = FlxG.random()*4+1;
				switch(tmpRnd2)
				{
					case 1:
					{
						setSelection1 = 1;
						break;
					}
					case 2:
					{
						setSelection2 = 1;
						break;
					}
					case 3:
					{
						setSelection3 = 1;
						break;
					}
					case 4:
					{
						setSelection4 = 1;
						break;
					}
				}
			}
			displaySet();
		}	
		private function delay(howLong:int):void
		{	
			if(!Registry.timerSet)
				t.start(howLong);
			Registry.timerSet = true;
			if(t.finished)
			{
				t.stop();
				Registry.timerSet = false;
				selectSet();
			}			
		}
	}
}