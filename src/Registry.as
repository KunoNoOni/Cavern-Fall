package
{
	import org.flixel.*;
	
	public class Registry
	{
		public static var timerSet:Boolean = false;
		public static var deathTimerSet:Boolean = false;
		public static var intro:Boolean = false;
		public static var dead:Boolean = false;
		public static var falling:Boolean = false;
		public static var walking:Boolean = false;
		public static var standing:Boolean = false;
		public static var fell999Ft:Boolean = false;
		public static var osetArray:Array = ["null","oset1","oset2","oset3","oset4"];
		public static var fallen:int = 0;
		public static var distanceGoal:int = 20000;
		public static var distance:int = 0;
		
		[Embed(source = 'Sprites/background.png')] static public var bg1:Class;
		[Embed(source = 'Sprites/buildTiles.png')] static public var buildTiles:Class;
		[Embed(source = 'Sprites/player.png')] static public var player:Class;
		[Embed(source = 'Sprites/blood.png')] static public var blood:Class;
		[Embed(source = 'Sprites/rock.png')] static public var rock:Class;
		[Embed(source = 'Sprites/introBackground.png')] static public var introBG:Class;
		[Embed(source = 'Sprites/halfBlock.png')] static public var halfblock:Class;
		[Embed(source = 'Sprites/introText1.png')] static public var introText1:Class;
		[Embed(source = 'Sprites/introText2.png')] static public var introText2:Class;
		[Embed(source = 'Sprites/introText3.png')] static public var introText3:Class;
		[Embed(source = 'Sprites/introText4.png')] static public var introText4:Class;
		[Embed(source = 'Sprites/introText5.png')] static public var introText5:Class;
		

		[Embed(source = 'Sprites/Obstacles/mapCSV_Obstacle1_Map1.csv', mimeType = 'application/octet-stream')] static public var oset1:Class;
		[Embed(source = 'Sprites/Obstacles/mapCSV_Obstacle2_Map1.csv', mimeType = 'application/octet-stream')] static public var oset2:Class;
		[Embed(source = 'Sprites/Obstacles/mapCSV_Obstacle3_Map1.csv', mimeType = 'application/octet-stream')] static public var oset3:Class;
		[Embed(source = 'Sprites/Obstacles/mapCSV_Obstacle4_Map1.csv', mimeType = 'application/octet-stream')] static public var oset4:Class;
		
		
		[Embed(source = 'sounds/rock1.mp3')] static public var rock1:Class;
		[Embed(source = 'sounds/quake.mp3')] static public var quake:Class;
		[Embed(source = 'sounds/walking.mp3')] static public var walking2:Class;
		[Embed(source = 'sounds/impale.mp3')] static public var impale:Class;
		[Embed(source = 'sounds/DST-AngryMod.mp3')] static public var TitleGame:Class;
		[Embed(source = 'sounds/DST-StoryLoop.mp3')] static public var Intro1:Class;
		[Embed(source = 'sounds/DST-TheMagiciansArmy.mp3')] static public var Intro2:Class;
		[Embed(source = 'sounds/DST-Warned.mp3')] static public var GameOver:Class; 
		
		//[Embed(source="../assets/celtic-bitty.ttf", fontFamily="Celtic", embedAsCFF="false")] static public var fntCeltic:String;
		
		
		public function Registry()
		{
		}
	}
}