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
		
		public function SnakeBody() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			thisPiecesPosInLine = Level1.level1.numberOfUpdates + 1;
			addEventListener(Event.ENTER_FRAME, update);
			trace(thisPiecesPosInLine);
		}
		
		private function update(eventData : Event) : void
		{
		
			if(thisPiecesPosInLine != null)
			{
				if(this.x == Level1.level1.snakePosArray[thisPiecesPosInLine].x && this.y == Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					thisPiecesPosInLine += 1;
				}
				
				if(this.x > Level1.level1.snakePosArray[thisPiecesPosInLine].x)
				{
					//left
					this.x -= speed;
				}
				if(this.x < Level1.level1.snakePosArray[thisPiecesPosInLine].x)
				{
					//right
					this.x += speed;
				}
				if(this.y > Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					//down
					this.y -= speed;
				}
				if(this.y < Level1.level1.snakePosArray[thisPiecesPosInLine].y)
				{
					//up
					this.y += speed;
				}
			}
			else if(Level1.level1.snakePosArray[thisPiecesPosInLine] == null)
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
