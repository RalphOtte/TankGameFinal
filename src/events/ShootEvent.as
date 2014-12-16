package events 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jochem
	 */
	public class ShootEvent extends Event 
	{
		public static const SHOOT_BULLET = "ShootBullet";
		public var shooter:BaseTank;
		public function ShootEvent(event:String) 
		{
			super(event);
		}
		
	}

}