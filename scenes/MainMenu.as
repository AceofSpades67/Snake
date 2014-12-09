package scenes 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MainMenu extends MovieClip
	{
		private var playBtn  : PlayButton = null;
		
		// adding the animated intro to the scene
		private var titleAnimation : TitleContainer = null;
		
		public function MainMenu() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, awake);
		}
		
		private function awake (eventData : Event) : void
		{
			// creating the container to add to scene
			titleAnimation = new TitleContainer();
			this.addChild(titleAnimation);
			
			playBtn = new PlayButton();
			playBtn.x = stage.stageWidth / 2;
			playBtn.y = stage.stageHeight / 2;
			this.addChild(playBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayBtnClick);
		}
		
		private function onPlayBtnClick(eventData : MouseEvent) : void
		{
			playBtn.removeEventListener(MouseEvent.CLICK, onPlayBtnClick);
			
			// open the game scene.
			Root.instance.loadScene("Level 1");
		}

	}
	
}
