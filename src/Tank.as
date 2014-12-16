package  
{
	import events.ShootEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Jochem
	 */
	public class Tank extends BaseTank
	{
		
		
		
		public function Tank() 
		{
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void
		{
			var theEvent: ShootEvent = new ShootEvent(ShootEvent.SHOOT_BULLET);
			theEvent.shooter = this;
			dispatchEvent(theEvent);
			
		}		
		
	}

}