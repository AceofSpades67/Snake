package game
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class SnakePiece extends MovieClip 
	{
		
		
		public function SnakePiece() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			this.addEventListener(Event.ADDED_TO_STAGE, update);
		}
		
		private function awake (eventData : Event) : void
		{
			//
		}
		
		private function update (eventData : Event) : void
		{
			
		}
	}
	
}
