package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var bgA:FlxSprite;
		private var bgB:FlxSprite;
		private var speed:int = 3;
		private var Obstacle1:FlxTilemap;
		private var Obstacle2:FlxTilemap;
		private var Obstacle3:FlxTilemap;
		private var Obstacle4:FlxTilemap;
		private var t:FlxTimer = new FlxTimer();
		private var t2:FlxTimer = new FlxTimer();
		private var setSelection1:int = 0;
		private var setSelection2:int = 0;
		private var setSelection3:int = 0;
		private var setSelection4:int = 0;
		private var time:int = 4; 
		private var fallenText:FlxText;
		private var goal1:FlxText;
		private var goal2:FlxText;
		private var movementText1:FlxText;
		private var movementText2:FlxText;
		private var player:Player;
		private var oldX:int = 0;
		private var oldY:int = 0;
		private var slow:Boolean = false;
		private var emitter:FlxEmitter;
		private var emitter2:FlxEmitter;
		private var emitter3:FlxEmitter;
		private var emitter4:FlxEmitter;
		private var slidingSound:Boolean = false;
		private var pVineInc:Boolean = false;
		private var initGoals:Boolean = false;
		private var inc:int;
		
		override public function create():void
		{	
			SaveGoals.load();
			Registry.fell999Ft = SaveGoals.setGoal1;
			Registry.distance = SaveGoals.setGoal2;
			inc = SaveGoals.setInc;
			Registry.timerSet = false;
			Registry.deathTimerSet = false;
			Registry.dead = false;
			Registry.falling = false;
			Registry.fallen = 0;
			player = new Player(175,50)
			player.x = 175;
			player.y = 50;
			loadBackground();
			loadSet();
			displayGoals();
			loadHud();
			Registry.falling = true;
			add(player);
			FlxG.playMusic(Registry.TitleGame,.8);
			movementText1 = new FlxText(75,150,200,"Left Arrow Key to move Left");
			movementText1.setFormat(null,10,0xFFFFFF, "center");
			add(movementText1);
			movementText1.scrollFactor.x = movementText1.scrollFactor.y = 0;
			movementText2 = new FlxText(75,165,200,"Right Arrow Key to move Right");
			movementText2.setFormat(null,10,0xFFFFFF, "center");
			add(movementText2);
			movementText2.scrollFactor.x = movementText2.scrollFactor.y = 0;
		}	
		
		override public function update():void
		{
			if(!Registry.dead)
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
				
				Registry.fallen += speed;
				fallenText.text = Registry.fallen+" ft.";
				
				delay(time);
			}
			
			if(Registry.dead)
			{
				deathTimer(3);
			}
			
			if(bgA.y < -299)
			{
				bgA.y = bgB.y+300;
			}
			
			if(bgB.y < -299)
			{
				bgB.y = bgA.y+300;
			}
			
			if(Obstacle1 != null && Obstacle1.y < -75)
			{
				Obstacle1.kill();
			}
			if(Obstacle2 != null && Obstacle2.y < -75)
			{
				Obstacle2.kill();
			}
			if(Obstacle3 != null && Obstacle3.y < -75)
			{
				Obstacle3.kill();
			}
			if(Obstacle4 != null && Obstacle4.y < -75)
			{
				Obstacle4.kill();
			}

			FlxG.overlap(player,Obstacle1,death);
			FlxG.overlap(player,Obstacle2,death);
			FlxG.overlap(player,Obstacle3,death);
			FlxG.overlap(player,Obstacle4,death);
			
			super.update();
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
			
			movementText1.kill();
			movementText2.kill();
			
			goal1.kill();
			goal2.kill();
			displayGoals();			
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
		
		private function selectSet():void
		{
			var tmpRnd:int = 0;
			var tmpRnd2:int = 0;
			var total:int = 0;
			
			setSelection1 = FlxG.random()*3+1;
			setSelection2 = FlxG.random()*3+1;
			setSelection3 = FlxG.random()*3+1;
			setSelection4 = FlxG.random()*3+1;
			
			total = setSelection1 + setSelection2 + setSelection3 + setSelection4;
			
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

		private function loadHud():void
		{
			fallenText = new FlxText(180,1,200,Registry.fallen+" ft");
			fallenText.setFormat(null,15,0xFFFFFF, "center");
			add(fallenText);
			fallenText.scrollFactor.x = fallenText.scrollFactor.y = 0;
		}
		
		private function delay(howLong:int):void
		{	
			if(!Registry.timerSet)
				t.start(howLong);
			Registry.timerSet = true;
			//trace("t = "+FlxU.floor(t.timeLeft));
			if(t.finished)
			{
				t.stop();
				Registry.timerSet = false;
				setSpeed();
				selectSet();
			}			
		}
		
		private function deathTimer(howLong:int):void
		{	
			if(!Registry.deathTimerSet)
				t2.start(howLong);
			Registry.deathTimerSet = true;
			if(t2.finished)
			{
				t2.stop();
				Registry.deathTimerSet = false;
				FlxG.switchState(new GameOverState());
			}			
		}

		private function death(player:FlxSprite,e:FlxTilemap):void
		{
			if(!Registry.dead)
			{
				if(!Registry.fell999Ft && Registry.fallen == 999)
				{
					Registry.fell999Ft = true;
					displayGoals();
				}
				speed = 0;
				Registry.dead = true;
				FlxG.play(Registry.impale,.8);
				emitter = new FlxEmitter(player.x+12,player.y+23);
				emitter.setXSpeed(-15,15);
				emitter.setYSpeed(-100,-50);
				emitter.gravity = 150;
				emitter.makeParticles(Registry.blood,50,0,true,.5);
				add(emitter);
				emitter.start(true,3);
				emitter2 = new FlxEmitter(player.x+8,player.y+23);
				emitter2.setXSpeed(-15,15);
				emitter2.setYSpeed(-100,-50);
				emitter2.gravity = 150;
				emitter2.makeParticles(Registry.blood,50,0,true,.5);
				add(emitter2);
				emitter2.start(true,3);
				emitter3 = new FlxEmitter(player.x+16,player.y+23);
				emitter3.setXSpeed(-15,15);
				emitter3.setYSpeed(-100,-50);
				emitter3.gravity = 150;
				emitter3.makeParticles(Registry.blood,50,0,true,.5);
				add(emitter3);
				emitter3.start(true,3);
			}
		}

		private function setSpeed():void
		{
			if(Registry.fallen < 20000)
			{
				speed = 3;
			}
			
			if(Registry.fallen >= 20000)
			{
				speed = 4;
				time = 3;
			}
		}
		
		private function displayGoals():void
		{
			var temp:int=0;

			if(!initGoals)
			{
				initGoals = true;
				goal1 = new FlxText(1,285,100,"Goal: Fall 999ft");
				goal1.setFormat(null,10,0xFFFFFF, "left");
				goal1.scrollFactor.x = goal1.scrollFactor.y = 0;
				
				goal2 = new FlxText(170,285,200,"Goal: Reach "+Registry.distanceGoal*inc+" ft");
				goal2.setFormat(null,10,0xFFFFFF, "left");
				goal2.scrollFactor.x = goal2.scrollFactor.y = 0;
			}
			
			
			/**
			 *Goal #1 Fall exactly 999ft 
			 **/
			
			goal1.reset(1,285);
			
			if(Registry.fell999Ft)
			{
				goal1.setFormat(null,10,0x00FF00, "left");
				SaveGoals.setGoal1 = true;
			}
			else
			{
				goal1.setFormat(null,10,0xFFFFFF, "left");
			}

			add(goal1);
			
			
			/**
			 *Goal #2 Fall X number of distance 
			 **/
			
			if(Registry.fallen > (Registry.distanceGoal*inc))
			{
				if(Registry.distanceGoal*inc > Registry.distance)
				{
					Registry.distance = Registry.distanceGoal*inc;
					inc++;
					SaveGoals.setGoal2 = Registry.distance;
					SaveGoals.setInc = inc;
				}
				else
				{
					inc++;
					SaveGoals.setInc = inc;
				}
			}

			goal2 = new FlxText(170,285,200,"Goal: Reach "+Registry.distanceGoal*inc+" ft");
			goal2.setFormat(null,10,0xFFFFFF, "left");
			goal2.scrollFactor.x = goal2.scrollFactor.y = 0;
			add(goal2);
		}
	}
}
