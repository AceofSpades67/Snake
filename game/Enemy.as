package game 
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class Enemy extends MovieClip 
	{
		private var startPos = new Point(0, 0);
		private var endPos   = new Point(0, 0);
		
		private var speed : int = 5;
		
		public function Enemy() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			addEventListener(Event.ENTER_FRAME, update);
			startPos = new Point(this.x, this.y);
			endPos   = new Point(this.x + 5, this.y);
		}
		
		private function update(eventData : Event) : void
		{
			this.rotation = 10;
			if(this.x == startPos.x)
			{
				this.x += speed;
			}
			
		}
	}
	
}
