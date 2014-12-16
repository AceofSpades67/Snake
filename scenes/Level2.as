package scenes
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import game.SnakePiece;
	import game.Apple;
	import flash.geom.Point;
	import game.SnakeBody;
	import game.Enemy;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class Level2 extends MovieClip
	{
		// level 2 is broken
		private var artLevel2 : Level2Art = null;
		
		/* didn't work...
		// adding collision
		public var collisionLevel2 : CollisionsLevel2 = null;
		// to activate level 3 or win scene
		private var goalWinBtn : WinBtn = null;
		// what's keeping it from working?! */
		
		// adding game over button to end
		private var gameOverBtn : GameOverBtn = null;
		
		public static var snakeHead      = null;
		public static var apple : Apple  = null;
		public static var enemy : Enemy  = null;
		
		public static var level2 = null;
		
		public var snakePosArray    : Array = [];
		public var snakePiecesArray : Array = [];
		public var numberOfPieces   : int   = -1;
		public var lastTurnPos      : int   = 0;
		public var numberOfUpdates  : int   = 0;
		public var moveNumbersDown  : int   = 1;
		public var numberOfEnemies  : int   = 0;

		public function Level2() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
			this.addEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}
		
		private function awake (eventData : Event) : void
		{
			stage.focus = stage;
			Root.instance.activeScene = new String("Level"+2);
			artLevel2 = new Level2Art();
			this.addChild(artLevel2);
			addEventListener(Event.ENTER_FRAME, update);
			
			// adding collision
			/* fail
			collisionLevel2 = new CollisionsLevel2();
			collisionLevel2.x = 278;
			collisionLevel2.y = 199;
			this.addChild(collisionLevel2);
			
			// how to??? put this goal in a timer to pair with 10, 9, 8... countdown
			// or create private timer and do automatic scene switch to level 3?
			goalWinBtn = new WinBtn();
			goalWinBtn.x = stage.stageWidth / 2;
			goalWinBtn.y = stage.stageHeight / 2;
			this.addChild(goalWinBtn);
			// failed */
			
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
		
		private function update(eventData : Event) : void
		{
			winCondition();
			spawnEnemy();
		}
		
		private function winCondition()
		{
			if(Root.instance.score == 300)
			{
				deinitialize();
				Root.instance.loadScene("Level 3");
			}
		}
		
		// working on collision
		/* FAIL
		public function hitTestCollision(object : MovieClip) : Boolean
		{
			return hitCheck(object, this.collisionLevel2);
			trace("hitCheck");
		}
		
		public function hitTestGoal(object : MovieClip) : Boolean
		{
			return hitCheck(object, this.goalWinBtn);
		}
		
		private function hitCheck(SnakePiece : MovieClip, object2 : MovieClip) : Boolean
		{
			var bounds : Rectangle = SnakePiece.getBounds(root);
			
			if(object2.hitTestPoint(bounds.left, bounds.top, true))
				return true;
			else if(object2.hitTestPoint(bounds.right, bounds.top, true))
				return true;
			else if(object2.hitTestPoint(bounds.right, bounds.bottom, true))
				return true;
			else if(object2.hitTestPoint(bounds.left, bounds.bottom, true))
				return true;
			
			return false;
		} */
		
		
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
		
		private function deinitialize() : void
		{
			apple = null;
			this.removeEventListener(Event.ADDED_TO_STAGE, awake);
			this.removeEventListener(Event.ENTER_FRAME, update);
			game.SnakePiece.snakePiece.deinitialize();
		}

	}
	
}