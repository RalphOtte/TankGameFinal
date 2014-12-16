package  
{
	import events.ShootEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jochem
	 */
	public class EnemyTank extends BaseTank
	{
		private var shotTimer:Timer;
		public function EnemyTank()
		{
			shotTimer = new Timer(3000 + Math.random() * 1000);
			shotTimer.addEventListener(TimerEvent.TIMER, tick);
			shotTimer.start();
		}
		
		private function tick(e:TimerEvent):void 
		{
			var theEvent: ShootEvent = new ShootEvent(ShootEvent.SHOOT_BULLET);
			theEvent.shooter = this;
			dispatchEvent(theEvent);
		}
		
	}

}