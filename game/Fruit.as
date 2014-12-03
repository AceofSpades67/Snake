package  {
	
	import flash.display.MovieClip;
	import flash.display.Shape;  
	import flash.display.Sprite;  
	import flash.events.Event;  
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Root;
	
	public class Fruit extends MovieClip {
		
		// speed, naturally  
var speed:Number = 7;  
// velocity along x  
var vx:Number = speed;  
// vlocity along y  
var vy:Number = speed;  
// area within which ball may move  
var moveArea:Rectangle;
		
		
		
		public function Fruit() {
			// constructor code
			
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function init(e:Event):void  
{  
    moveArea = new Rectangle(this.width, this.height, stage.stageWidth - this.width, stage.stageHeight - this.height);  
   //spawnEnemy();  
    addEventListener(Event.ENTER_FRAME, moveBall);  
	this.addEventListener(MouseEvent.CLICK, onClickFruit);
	
}  

function onClickFruit(eventData : MouseEvent) : void 
		
		{
			
			this.removeEventListener(MouseEvent.CLICK, onClickFruit);		
			this.parent.removeChild(this);	
	//		Root.instance().GameLevel();
			Root.instance.handleClick (eventData);
			Root.instance.GameLevel ();
			
		}
	
	function moveBall(e:Event):void  
{  
    // change direction if ball moves out of allowed rectangle  
    if (this.x < moveArea.x)  
        vx = speed;  
    else if (this.x > moveArea.width)  
        vx = -speed;  
    if (this.y < moveArea.y)  
        vy = speed;  
    else if (this.y > moveArea.height)  
        vy = -speed;  
  
    this.x += vx;  
    this.y += vy;  
}  

		
	}
	
}
