﻿package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	import flash.geom.Point;
	import game.SnakeBody;
	
	public class Level1 extends MovieClip
	{
		public static var snakeHead = null;
		public static var apple : Apple  = null;
		
		public static var level1 = null;
		
		public var snakePosArray    : Array = [];
		public var snakePiecesArray : Array = [];
		public var numberOfPieces   : int   = -1;
		public var lastTurnPos      : int   = 0;
		public var numberOfUpdates  : int   = 0;
		public var moveNumbersDown  : int   = 1;

		public function Level1() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			spawnApple();
			
			level1 = this;
			
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			addEventListener(Event.ENTER_FRAME, update);
			//Level1.level1.spawnSnakePiece();
			//snakePosArray.push(new Point(snakeHead.x, snakeHead.y));
			
			
		}
		
		private function update(eventData : Event) : void
		{
			while(snakePosArray[lastTurnPos] != null)
				{
					lastTurnPos += 1;
				}
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
			var posToSpawn   : int = 10;
			var whereToSpawn : Point = new Point(0, 0);
			
			//trace(numberOfPieces.toString());
			numberOfPieces += 1;
			
			
			
			
			if(numberOfPieces != 0)
			{
				posToSpawn = numberOfPieces * 10;
			}
			else
			{
				if(game.SnakePiece.snakePiece.movingLeft == true)
				{
					posToSpawn = 10;
				}
				if(game.SnakePiece.snakePiece.movingRight == true)
				{
					posToSpawn = -10;
				}
				if(game.SnakePiece.snakePiece.movingDown == true)
				{
					posToSpawn = 10;
				}
				if(game.SnakePiece.snakePiece.movingUp == true)
				{
					posToSpawn = -10;
				}
			}
			
			
			//trace(lastTurnPos);
			
			snakePiecesArray.push(new SnakeBody());
			//trace(snakePiecesArray[numberOfPieces].movingLeft);
			
			if(snakePiecesArray[numberOfPieces].movingLeft == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x + posToSpawn, game.SnakePiece.snakePiece.y);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(snakePiecesArray[numberOfPieces].movingRight == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x - posToSpawn, game.SnakePiece.snakePiece.y);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(snakePiecesArray[numberOfPieces].movingDown == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y - posToSpawn);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(snakePiecesArray[numberOfPieces].movingUp == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y + posToSpawn);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			
			this.addChild(snakePiecesArray[numberOfPieces]);
			
		}
		
		public function updateSnakePos(eventData : Point) : void
		{
			moveNumbersDown = numberOfUpdates;
			numberOfUpdates += 1;
			snakePosArray[numberOfUpdates] = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y);
			//trace(snakePosArray[numberOfUpdates] + numberOfUpdates);
			//trace(snakePosArray[4] + snakePosArray[5])
			/*if(numberOfUpdates != 30)
			{
				numberOfUpdates += 1;
			}
			else if(numberOfUpdates == 30)
			{
				numberOfUpdates = 0;
			}
			
			for(var i = 1; i < numberOfUpdates; i++)
			{
				
				var newPosNumber = moveNumbersDown + 1;
				snakePosArray[newPosNumber] = snakePosArray[moveNumbersDown];
				moveNumbersDown -= 1;
				trace("for");
			}*/
		}

	}
	
}
