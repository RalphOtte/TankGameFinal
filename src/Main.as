package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import events.ShootEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jochem
	 */
	public class Main extends Sprite 
	{
		private var tank:Tank;
		private var bullets:Array;
		private var input:Point = new Point();
		private var enemies:Array;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{		
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tank = new Tank();
			this.addChild(tank);
			tank.x = stage.stageWidth * 0.5;
			tank.y = stage.stageHeight * 0.5;
			
			
			
			tank.addEventListener(ShootEvent.SHOOT_BULLET, createBullet);
			
			enemies = new Array();
			for (var i:int = 0; i < 4; i++) 
			{
				var enemy:EnemyTank = new EnemyTank();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				enemy.addEventListener(ShootEvent.SHOOT_BULLET, createBullet);
				trace(enemies.length);
			}
			
			
			bullets = new Array();
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			
		}		
		private function createBullet(e:ShootEvent):void
		{
			var shooter:BaseTank = e.shooter;
			var bullet:Bullet = new Bullet(shooter.x,tank.y, shooter.turretRotation+tank.rotation, shooter.turretLength);
			bullets.push(bullet);
			addChild(bullet);
			bullet.scaleX = bullet.scaleY = tank.scaleX;
			
			//bullets.push(new Bullet());
			//addChild(bullets[bullets.length-1]);
		}
		private function loop(e:Event):void 
		{	
			for (var i:int = 0; i < bullets.length; i++ )
			{
				bullets[i].update();
			}
			
			//yas gebruik je de sin
			//xas gebruik je de cos
			//ymove = sin(rot);
			//xmove = cos(rot);
			//rot is een radian en geen angle
			//we moeten onze angle omzetten naar een radian
			//degrees * Math.PI / 180;
			//radians * 180 / Math.PI;
			
			tank.speed = input.y * 5;
			
			tank.rotation += input.x * 5;
			
			tank.update(mouseX, mouseY);
			trace(mouseX,mouseY)
			
			
			for (var i:int = 0; i < enemies.length; i++)
			{
				enemies[i].update(tank.x,tank.y);	
				
			}
		}
		private function onKeyDown(e:KeyboardEvent):void
		{			
			if (e.keyCode == Keyboard.D)
			{				
				input.x = 1;				
			}
			if (e.keyCode == Keyboard.A)
			{
				input.x = -1;
			}
			if (e.keyCode == Keyboard.W)
			{
				input.y = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				input.y = 1;
			}
		}
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.D)
			{
				input.x = 0;
			}
			if (e.keyCode == Keyboard.A)
			{
				input.x = 0;
			}
			if (e.keyCode == Keyboard.W)
			{
				input.y = 0;
			}
			if (e.keyCode == Keyboard.S)
			{
				input.y = 0;
			}
		}
	}
	
}