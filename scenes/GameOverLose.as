package scenes
{
	
	public class GameOverLose
	{
		private var gameOverLose = null;

		public function GameOverLose()
		{
			trace("loaded: LOSE - game over");
		}
		
		private function initialize(eventData : Event) : void
		{
			var loseArt : new GameOverL;
			loseArt.x = stage.stageWidth / 2;
			loseArt.y = stage.stageHeight / 2 - 50;
			this.addChild(loseArt);
			
			playBtn = new PlayButton();
			playBtn.x = stage.stageWidth / 2;
			playBtn.y = stage.stageHeight / 2 + 50;
			this.addChild(playBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayBtnClick);
		}
		
		private function onPlayBtnClick(eventData : MouseEvent) : void
		{
			playBtn.removeEventListener(MouseEvent.CLICK, onPlayBtnClick);
			
			trace("Game Over button clicked");
			
			//load to desired scene--probably main menu (or level 1)
			Root.loadScene("Level 1");
		}
		
		private function deinitialize(eventData : Event) : void
		{
			trace("deinitializing GameOverWin");
			playBtn.removeEventListener(MouseEvent.CLICK, onPlayBtnClick);
		}

	}
	
}