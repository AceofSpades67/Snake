package game 
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import scenes.Level1;
	import flash.geom.Point;
	
	
	public class SnakeBody extends MovieClip 
	{
		var speed : Number = 5.0;
		private var thisPiecesPosInLine = 0;
		
		public  var movingLeft   = false;
		public  var movingRight  = true;
		public  var movingDown   = false;
		public  var movingUp     = false;
		
		public static var snakeBodyPiece;
		
		public function SnakeBody() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			snakeBodyPiece = this;
			thisPiecesPosInLine = Level1.level1.numberOfUpdates + 1;
			addEventListener(Event.ENTER_FRAME, update);
			//trace(thisPiecesPosInLine);
		}
		
		private function update(eventData : Event) : void
		{
			if(Level1.level1.snakePosArray[thisPiecesPosInLine] != null)
			{
				if(this.x > Level1.level1.snakePosArray[thisPiecesPosInLine].x)
				{
					//left
					this.x -= speed;
					movingLeft  = true;
					movingRight = false;
					movingDown  = false;
					movingUp    = false;
				}
				if(this.x < Level1.level1.snakePosArray[thisPiecesPosInLine].x)
				{
					//right
					movingLeft  = false;
					movingRight = true;
					movingDown  = false;
					movingUp    = false;
					this.x += speed;
				}
				if(this.y > Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					//down
					movingLeft  = false;
					movingRight = false;
					movingDown  = false;
					movingUp    = true;
					this.y -= speed;
				}
				if(this.y < Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					//up
					movingLeft  = false;
					movingRight = false;
					movingDown  = true;
					movingUp    = false;
					this.y += speed;
				}
				if(this.x == Level1.level1.snakePosArray[thisPiecesPosInLine].x && this.y == Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					thisPiecesPosInLine += 1;
				}
			}
			else if(Level1.level1.snakePosArray[thisPiecesPosInLine] == null)
			{
				if(game.SnakePiece.snakePiece.movingLeft == true)
				{
					this.x -= speed;
					movingLeft  = true;
					movingRight = false;
					movingDown  = false;
					movingUp    = false;
				}
				if(game.SnakePiece.snakePiece.movingRight == true)
				{
					this.x += speed;
					movingLeft  = false;
					movingRight = true;
					movingDown  = false;
					movingUp    = false;
				}
				if(game.SnakePiece.snakePiece.movingDown == true)
				{
					this.y += speed;
					movingLeft  = false;
					movingRight = false;
					movingDown  = true;
					movingUp    = false;
				}
				if(game.SnakePiece.snakePiece.movingUp == true)
				{
					this.y -= speed;
					movingLeft  = false;
					movingRight = false;
					movingDown  = false;
					movingUp    = true;
				}
			}
			
			
			
				
			/*else
			{
				if(game.SnakePiece.snakePiece.movingLeft == true)
				{
					this.x -= speed;
				}
				if(game.SnakePiece.snakePiece.movingRight == true)
				{
					this.x += speed;
				}
				if(game.SnakePiece.snakePiece.movingDown == true)
				{
					this.y -= speed;
				}
				if(game.SnakePiece.snakePiece.movingUp == true)
				{
					this.y += speed;
				}
			}*/
		}
	}
	
}
