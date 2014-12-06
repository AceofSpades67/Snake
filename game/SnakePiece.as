package game
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import scenes.Level1;
	import flash.ui.Keyboard;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	public class SnakePiece extends MovieClip 
	{
		private var velocity : Point = new Point();
		private var speed : Number = 5.0;
		private var frameCounter = 0;
		public  var movingLeft   = false;
		public  var movingRight  = true;
		public  var movingDown   = false;
		public  var movingUp     = false;
		public static var snakePiece;
		
		public function SnakePiece()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			snakePiece = this;
		}
		
		private function awake (eventData : Event) : void
		{
			velocity = new Point(speed, 0);
			addEventListener(Event.ENTER_FRAME, update);
			Root.theStage.addEventListener(KeyboardEvent.KEY_DOWN, onGameKeyPressed);
			Root.theStage.addEventListener(KeyboardEvent.KEY_UP, onGameKeyReleased);
			
		}
		
		private function update(eventData : Event) : void
		{
			hitTestPlayerVsApple(scenes.Level1.apple);
			this.x += velocity.x;
			this.y += velocity.y;
			/*
			frameCounter += 1;
			
			if(frameCounter == 3)
			{
				//scenes.Level1.level1.updateSnakePos(new Point(this.x, this.y));
				frameCounter = 0;
			}
			*/
			//trace("velocity is " + velocity);
		}
		
		private function onGameKeyPressed(eventData : KeyboardEvent) : void
		{
			switch(eventData.keyCode)
			{
				case Keyboard.LEFT :
				if(velocity.x != speed)
				{
					movingLeft  = true;
					movingRight = false;
					movingDown  = false;
					movingUp    = false;
					scenes.Level1.level1.updateSnakePos(new Point(this.x, this.y));
					velocity = new Point(-speed, 0);
				}
					break;
				case Keyboard.RIGHT :
				if(velocity.x != -speed)
				{
					movingLeft  = false;
					movingRight = true;
					movingDown  = false;
					movingUp    = false;
					scenes.Level1.level1.updateSnakePos(new Point(this.x, this.y));
					velocity = new Point(speed, 0);
				}
					break;
				case Keyboard.UP :
				if(velocity.y != speed)
				{
					movingLeft  = false;
					movingRight = false;
					movingDown  = false;
					movingUp    = true;
					scenes.Level1.level1.updateSnakePos(new Point(this.x, this.y));
					velocity = new Point(0, -speed);
				}
					break;
				case Keyboard.DOWN :
				if(velocity.y != -speed)
				{
					movingLeft  = false;
					movingRight = false;
					movingDown  = true;
					movingUp    = false;
					scenes.Level1.level1.updateSnakePos(new Point(this.x, this.y));
					velocity = new Point(0, speed);
				}
					break;
				default :
				trace("An unknown key was pressed");
				break;
			}

		}
		
		private function onGameKeyReleased(eventData : KeyboardEvent) : void
		{
			switch(eventData.keyCode)
			{
				case Keyboard.LEFT :
					//
					break;
				case Keyboard.RIGHT :
					//
					break;
				case Keyboard.UP :
					//
					break;
				case Keyboard.DOWN :
					//
					break;
				default :
				trace("An unknown key was released");
				break;
			}
		}
		
		private function hitTestPlayerVsApple(otherCollider : DisplayObject) : Boolean
		{
			var bounds : Rectangle = this.getBounds(root);
			
			if(otherCollider.hitTestPoint(bounds.left, bounds.top, true))
			{
				scenes.Level1.level1.spawnApple();
				scenes.Level1.level1.spawnSnakePiece();
				return true;
			}
			else if(otherCollider.hitTestPoint(bounds.right, bounds.top, true))
			{
				scenes.Level1.level1.spawnApple();
				scenes.Level1.level1.spawnSnakePiece();
				return true;
			}
			else if(otherCollider.hitTestPoint(bounds.left, bounds.bottom, true))
			{
				scenes.Level1.level1.spawnApple();
				scenes.Level1.level1.spawnSnakePiece();
				return true;
			}
			else if(otherCollider.hitTestPoint(bounds.right, bounds.bottom, true))
			{
				scenes.Level1.level1.spawnApple();
				scenes.Level1.level1.spawnSnakePiece();
				return true;
			}
			return false;
		}
	}
	
}
