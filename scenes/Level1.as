package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	
	public class Level1 extends MovieClip
	{
		public static var snakeHead = null;
		public static var apple : Apple  = null;
		
		public static var level1 = null;
		
		

		public function Level1() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			spawnApple();
			
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			
			level1 = this;
		}
		
		public function spawnApple() : void
		{
			if(apple != null)
			{
				this.removeChild(apple);
			}
			apple     = new Apple();
			apple.x = Math.random() * stage.stageWidth;
			apple.y = Math.random() * stage.stageHeight;
			this.addChild(apple);
		}
		
		public function spawnSnakePiece() : void
		{
			//
		}

	}
	
}
