package game
{
	
	import flash.display.MovieClip;
	import flash.display.Shape;  
	import flash.display.Sprite;  
	import flash.events.Event;  
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Root;
	import scenes.Level1;
	
	public class Apple extends MovieClip 
	{
		trace("start");
		// speed, naturally  
		var speed:Number = 4;  
		// velocity along x  
		var vx:Number = speed;  
		// vlocity along y  
		var vy:Number = speed;  
		// area within which ball may move  
		var moveArea:Rectangle;
		
		
		
		public function Apple() 
		{
			//addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function init(eventData : Event):void  
		{  
			moveArea = new Rectangle(this.width, this.height, stage.stageWidth - this.width, stage.stageHeight - this.height);  
			//spawnEnemy();  
			addEventListener(Event.ENTER_FRAME, moveBall);  
			this.addEventListener(MouseEvent.CLICK, onClickApple);
		}  

		function onClickApple(eventData : MouseEvent) : void 
		{
			
			this.removeEventListener(MouseEvent.CLICK, onClickApple);		
			this.parent.removeChild(this);	
			//Root.instance.handleClick (eventData);
			//Root.instance.Level1 ();
			
		}
	
		function moveBall(e:Event):void  
		{  
			// change direction if ball moves out of allowed rectangle  
			if (this.x < moveArea.x)  
			{
				vx = speed;  
			}
			else if (this.x > moveArea.width)  
			{
				vx = -speed;
			}
			if (this.y < moveArea.y)
			{
				vy = speed;  
			}
			else if (this.y > moveArea.height) 
			{
				vy = -speed;  
			}
			this.x += vx;  
			this.y += vy;  
		}  

		
	}
	
}
