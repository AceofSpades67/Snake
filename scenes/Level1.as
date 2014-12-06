package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	import flash.geom.Point;
	
	public class Level1 extends MovieClip
	{
		public static var snakeHead = null;
		public static var apple : Apple  = null;
		
		public static var level1 = null;
		
		public var snakePosArray    : Array = [];
		public var snakePiecesArray : Array = [];
		public var numberOfPieces   : int = -1;

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
			
			snakePosArray.push(new Point(snakeHead.x, snakeHead.y));
			
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
			var posToSpawn   : int = 0;
			var whereToSpawn : Point = new Point(0, 0);
			numberOfPieces += 1;
			posToSpawn = numberOfPieces * 15;
			
			snakePiecesArray.push(new SnakePiece());
			if(game.SnakePiece.snakePiece.movingLeft == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x - posToSpawn, game.SnakePiece.snakePiece.y);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(game.SnakePiece.snakePiece.movingRight == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x + posToSpawn, game.SnakePiece.snakePiece.y);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(game.SnakePiece.snakePiece.movingDown == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y - posToSpawn);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(game.SnakePiece.snakePiece.movingUp == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y + posToSpawn);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			this.addChild(snakePiecesArray[numberOfPieces]);
		}
		
		public function updateSnakePos(eventData : Point) : void
		{
			snakePosArray.push(eventData);
			trace(snakePosArray.toString());
		}

	}
	
}
