package scenes
{
	import flash.display.MovieClip;
	import game.SnakePiece;
	import flash.events.Event;
	
	public class Level3 extends MovieClip
	{
		public static var snakeHead = null;

		public function Level3()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			this.addEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}
		
		private function awake(eventData : Event) : void
		{
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			
			
		}
		
		private function deinitialize(eventData : Event) : void
		{
			
		}
	}
	
}
