package game
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import scenes.Level1;
	import flash.ui.Keyboard;
	
	public class SnakePiece extends MovieClip 
	{
		private var velocity : Point = new Point();
		private var speed : Number = 7.0;
		
		public function SnakePiece()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			
		}
		
		private function awake (eventData : Event) : void
		{
			addEventListener(Event.ENTER_FRAME, update);
			Root.theStage.addEventListener(KeyboardEvent.KEY_DOWN, onGameKeyPressed);
			Root.theStage.addEventListener(KeyboardEvent.KEY_UP, onGameKeyReleased);
		}
		
		private function update(eventData : Event) : void
		{
			this.x += velocity.x;
			this.y += velocity.y;
			//trace("velocity is " + velocity);
		}
		
		private function onGameKeyPressed(eventData : KeyboardEvent) : void
		{
			switch(eventData.keyCode)
			{
				case Keyboard.LEFT :
				if(velocity.x != speed)
				{
					velocity = new Point(-speed, 0);
				}
					break;
				case Keyboard.RIGHT :
				if(velocity.x != -speed)
				{
					velocity = new Point(speed, 0);
				}
					break;
				case Keyboard.UP :
				if(velocity.y != speed)
				{
					velocity = new Point(0, -speed);
				}
					break;
				case Keyboard.DOWN :
				if(velocity.y != -speed)
				{
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
	}
	
}
