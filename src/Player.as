package
{
	import org.flixel.*;
		
	public class Player extends FlxSprite
	{
		//Variables got here


		public function Player(X:Number, Y:Number)
		{	
			super(X,Y);
			loadGraphic(Registry.player,true,false,25,25,false);
			addAnimation("falling",[0,1,2],15,true);
			addAnimation("dead",[4],15,false);
			addAnimation("walking",[5,6,7],3,true);
			addAnimation("standing",[8],15,false);
			
			this.width = 21;
			this.height = 5;
			this.offset.x = 2;
			this.offset.y = 13;
		}
		
		override public function update():void
		{
			if(Registry.falling && !Registry.dead)
			{
				play("falling");
				if(!Registry.intro)
				{	
					if(FlxG.keys.justPressed("LEFT"))
					{
						if(this.x > 25)
						{
							this.x -= 25;
						}
					}
					if(FlxG.keys.justPressed("RIGHT"))
					{
						if(this.x < 300)
						{
							this.x += 25;
						}
					}
				}
			}

			if(Registry.dead)
			{
				play("dead");
			}
			
			if(Registry.walking)
			{
				play("walking");
				this.velocity.x = 20;
				if(this.x >= 150)
				{
					this.velocity.x = 0;
					Registry.walking = false;
					Registry.standing = true;
				}
			}
			
			if(Registry.standing)
			{
				play("standing");
			}

			super.update();
		}
	}
}