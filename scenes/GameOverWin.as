package scenes
{
	import flash.events.Event;
	import game.PlayButton;
	import flash.events.MouseEvent;
	
	public class GameOverWin extends MovieClip
	{
		private var gameOverWin = null;

		public function GameOverWin()
		{
			trace("loaded: WIN - Game Over");
		}
		
		private function initialize(eventData : Event) : void
		{
			var winArt : new GameOverW;
			winArt.x = stage.stageWidth / 2;
			winArt.y = stage.stageHeight / 2 - 50;
			this.addChild(winArt);
			
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
