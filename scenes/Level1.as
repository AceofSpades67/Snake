package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	
	public class Level1 extends MovieClip
	{
		var snakeHead = null;
		var apple : Apple  = null;

		public function Level1() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			apple     = new Apple();
			apple.x = 75;
			apple.y = 75;
			this.addChild(apple);
		}

	}
	
}
