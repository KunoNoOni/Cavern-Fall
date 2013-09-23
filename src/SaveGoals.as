package
{
	import org.flixel.*;
	
	public class SaveGoals
	{
		private static var _save:FlxSave; //The FlxSave instance
		private static var _temp2:Boolean = false; //Holds level data if bind() did not work. This is not persitent, and will be deleted when the application ends
		private static var _temp:int = 0;; //Holds level data if bind() did not work. This is not persitent, and will be deleted when the application ends
		private static var _loaded:Boolean = false; //Did bind() work? Do we have a valid SharedObject?
		
		/**
		 * Returns a True/False for goal 1
		 */
		public static function get setGoal1():Boolean
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.setGoal1;
			}
			else
			{
				return _temp2;
			}
		}
		
		/**
		 * Returns the total distance fell for Goal 2
		 */
		public static function get setGoal2():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.setGoal2;
			}
			else
			{
				return _temp;
			}
		}

		/**
		 * Returns the value of the increment variable
		 */
		public static function get setInc():int
		{
			//We only get data from _save if it was loaded properly. Otherwise, use _temp
			if (_loaded)
			{
				return _save.data.setInc;
			}
			else
			{
				return _temp;
			}
		}
		
		/**
		 * Sets a True/False for goal 1
		 */
		public static function set setGoal1(value:Boolean):void
		{
			if (_loaded)
			{
				_save.data.setGoal1 = value;
			}
			else
			{
				_temp2 = value;
			}
		}
		
		/**
		 * Sets the total distance fallen for goal 2
		 */
		public static function set setGoal2(value:int):void
		{
			if (_loaded)
			{
				_save.data.setGoal2 = value;
			}
			else
			{
				_temp = value;
			}
		}
		
		/**
		 * Sets the increment variable
		 */
		public static function set setInc(value:int):void
		{
			if (_loaded)
			{
				_save.data.setInc = value;
			}
			else
			{
				_temp = value;
			}
		}
		
		/**
		 * Setup SaveGoals
		 */
		public static function load():void
		{
			_save = new FlxSave();
			_loaded = _save.bind("myGoalData");
			if (_loaded && _save.data.setGoal1 == null) 
			{
				_save.data.setGoal1 = false;
			}
			else if (_loaded && _save.data.setGoal2 == null) 
			{
				_save.data.setGoal2 = 20000;
			}
			else if (_loaded && _save.data.setInc == null) 
			{
				_save.data.setInc = 1;
			}
		}
	}
}