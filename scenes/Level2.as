package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	import flash.geom.Point;
	import game.SnakeBody;
	import flash.events.MouseEvent;
	
	public class Level2 extends MovieClip
	{
		// level 2 is broken
		private var artLevel2 : Level2Art = null;
		// adding game over button to end
		private var gameOverBtn : GameOverBtn = null;
		
		public static var snakeHead = null;
		public static var apple : Apple  = null;
		
		public static var level2 = null;
		
		public var snakePosArray    : Array = [];
		public var snakePiecesArray : Array = [];
		public var numberOfPieces   : int   = -1;
		public var lastTurnPos      : int   = 0;
		public var numberOfUpdates  : int   = 0;
		public var moveNumbersDown  : int   = 1;

		public function Level2() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			Root.instance.activeScene = new String("Level"+2);
			artLevel2 = new Level2Art();
			this.addChild(artLevel2);
			// adding button
			gameOverBtn = new GameOverBtn();
			gameOverBtn.x = 72;
			gameOverBtn.y = 26;
			addChild(gameOverBtn);
			gameOverBtn.addEventListener(MouseEvent.CLICK, onGameOverClick);
			
			spawnApple();
			
			level2 = this;
			
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			//Level2.level2.spawnSnakePiece();
			
		}
		
		private function onGameOverClick(eventData : Event) : void
		{			
			gameOverBtn.removeEventListener(MouseEvent.CLICK, onGameOverClick);
			this.removeEventListener(Event.ADDED_TO_STAGE, awake);
			// takes us to Game Over
			Root.instance.loadScene("Win Scene");
		}
		
		public function spawnApple() : void
		{
			if(apple != null)
			{
				apple.parent.removeChild(apple);
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
			
			if(numberOfPieces != 0)
			{
				posToSpawn = numberOfPieces * 15;
			}
			else
			{
				posToSpawn = 15;
			}
			
			numberOfPieces += 1;
			
			snakePiecesArray.push(new SnakeBody());
			
			if(game.SnakePiece.snakePiece.movingLeft == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x + posToSpawn, game.SnakePiece.snakePiece.y);
				snakePiecesArray[numberOfPieces].x = whereToSpawn.x;
				snakePiecesArray[numberOfPieces].y = whereToSpawn.y;
			}
			if(game.SnakePiece.snakePiece.movingRight == true)
			{
				whereToSpawn = new Point(game.SnakePiece.snakePiece.x - posToSpawn, game.SnakePiece.snakePiece.y);
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
			//trace(whereToSpawn.toString());
			this.addChild(snakePiecesArray[numberOfPieces]);
		}
		
		public function updateSnakePos(eventData : Point) : void
		{
			moveNumbersDown = numberOfUpdates;
			numberOfUpdates += 1;
			snakePosArray[numberOfUpdates] = new Point(game.SnakePiece.snakePiece.x, game.SnakePiece.snakePiece.y);
		}
		
		private function deinitialize(eventData : Event) : void
		{
			apple = null;
			this.removeEventListener(Event.ADDED_TO_STAGE, awake);
		}

	}
	
}