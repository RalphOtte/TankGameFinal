package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jochem
	 */
	public class BaseTank extends MovieClip
	{	
		public var turretRotation:Number;
		public var speed:Number = 0;
		protected var tankBodyArt:MovieClip;
		protected var tankTurretArt:TankTurretArt;
		public var turretLength:Number;
		public var targetX:int;
		public var targetY:int;
		
		public function BaseTank() 
		{
			this.scaleX = this.scaleY = 0.2;
			tankBodyArt = new TankBodyArt();//instantieren van de Class
			this.addChild(tankBodyArt);
			tankTurretArt = new TankTurretArt();
			this.addChild(tankTurretArt);
			turretLength = tankTurretArt.width * scaleX;
			
		}
		
		public function update(targetX:int,targetY:int):void
			{
				//dit is voor het rijden
				
				var radians:Number = this.rotation * Math.PI / 180;
				var xMove:Number = Math.cos(radians);
				var yMove:Number = Math.sin(radians);
				
				this.x += xMove * -speed;
				this.y += yMove * -speed;
				
				
				//dit is draaien van turret
				var diffX:Number = targetX - this.x;
				var diffy:Number = targetY - this.y;
				radians = Math.atan2(diffy, diffX);
				var degrees:Number = radians * 180 / Math.PI - rotation;
				
				tankTurretArt.rotation = degrees;
				turretRotation = degrees;
			}
		
	}

}