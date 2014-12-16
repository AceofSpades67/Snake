package scenes
{
	import flash.events.Event;
	import game.PlayButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class GameOverWin extends MovieClip
	{
		private var menuBtn : MainMenuButton = null;

		public function GameOverWin()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
			this.addEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}
		
		private function initialize(eventData : Event) : void
		{
			var winArt = new GameOverW();
			winArt.x = 0;
			winArt.y = 0;
			this.addChild(winArt);
			
			menuBtn = new MainMenuButton();
			menuBtn.x = stage.stageWidth / 2;
			menuBtn.y = stage.stageHeight / 2;
			this.addChild(menuBtn);
			
			menuBtn.addEventListener(MouseEvent.CLICK, onMenuBtnClick);
		}
		
		private function onMenuBtnClick(eventData : MouseEvent) : void
		{
			menuBtn.removeEventListener(MouseEvent.CLICK, onMenuBtnClick);
			
			//load to desired scene from win
			Root.instance.loadScene("Main Menu");
		}
		
		private function deinitialize(eventData : Event) : void
		{
			menuBtn.removeEventListener(MouseEvent.CLICK, onMenuBtnClick);
			this.removeEventListener(Event.ADDED_TO_STAGE, initialize);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}

	}
	
}
