package scenes
{
	import flash.display.MovieClip;
	import game.Player;
	import flash.events.Event;
	
	public class Level2 extends MovieClip
	{
		private var player : Player = null;

		public function Level2()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake(eventData : Event) : void
		{
			player = new Player();
			player.x = stage.stageWidth / 2;
			player.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			
		}
	}
	
}
