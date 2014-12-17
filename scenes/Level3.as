package scenes
{
	import flash.display.MovieClip;
	import game.SnakePiece;
	import flash.events.Event;
	import game.Apple;
	import game.Enemy;
	import game.SnakeBody;
	import flash.geom.Point;
	
	public class Level3 extends MovieClip
	{
		public static var     snakeHead  = null;
		private var apple       : Apple  = null;
		public static var enemy : Enemy  = null;
		
		public var snakePosArray    : Array = [];
		public var snakePiecesArray : Array = [];
		public var numberOfPieces   : int   = -1;
		public var lastTurnPos      : int   = 0;
		public var numberOfUpdates  : int   = 0;
		public var moveNumbersDown  : int   = 1;
		public var numberOfEnemies  : int   = 0;

		public function Level3()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			this.addEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}
		
		private function awake(eventData : Event) : void
		{
			snakeHead = new SnakePiece();
			snakeHead.x = stage.stageWidth / 2;
			snakeHead.y = stage.stageHeight / 2;
			this.addChild(snakeHead);
			stage.focus = stage;
			Root.instance.activeScene = new String("Level"+3);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(eventData : Event) : void
		{
			spawnEnemy();
		}
		
		private function deinitialize() : void
		{
			//
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
		
		public function spawnEnemy() : void
		{
			
			/*if(enemy != null)
			{
				enemy.parent.removeChild(enemy);
			}
			enemy     = new Enemy();
			enemy.x = 100;
			enemy.y = 100;
			this.addChild(enemy);*/
			
			if(enemy == null)
			{
				//enemy.parent.removeChild(enemy);
				enemy   = new Enemy();
				enemy.x = 75;
				enemy.y = 75;
				//enemy.x = Math.random() * stage.stageWidth;
				//enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
			}
			if(Root.instance.score == 20 && numberOfEnemies == 1)
			{
				enemy   = new Enemy();
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
				numberOfEnemies += 1;
			}
			if(Root.instance.score == 40 && numberOfEnemies == 2)
			{
				enemy   = new Enemy();
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
				numberOfEnemies += 1;
			}
			if(Root.instance.score == 60 && numberOfEnemies == 3)
			{
				enemy   = new Enemy();
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
				numberOfEnemies += 1;
			}
			if(Root.instance.score == 80 && numberOfEnemies == 4)
			{
				enemy   = new Enemy();
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
				numberOfEnemies += 1;
			}
			if(Root.instance.score == 100 && numberOfEnemies == 5)
			{
				enemy   = new Enemy();
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				this.addChild(enemy);
				numberOfEnemies += 1;
			}
			
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
			//trace(snakePosArray);
		}
	}
	
}
