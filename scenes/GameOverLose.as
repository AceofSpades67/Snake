﻿package scenes
{
	import flash.events.Event;
	import game.PlayButton;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class GameOverLose extends MovieClip
	{
		private var menuBtn : MainMenuButton = null;

		public function GameOverLose()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
			this.addEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}
		
		private function initialize(eventData : Event) : void
		{
			//var loseArt = new GameOverL();
			//loseArt.x = stage.stageWidth / 2;
			//loseArt.y = stage.stageHeight / 4;
			//this.addChild(loseArt);
			
			menuBtn = new MainMenuButton();
			menuBtn.x = stage.stageWidth / 2;
			menuBtn.y = stage.stageHeight / 2;
			this.addChild(menuBtn);
			
			menuBtn.addEventListener(MouseEvent.CLICK, onMenuBtnClick);
		}
		
		private function onMenuBtnClick(eventData : MouseEvent) : void
		{
			menuBtn.removeEventListener(MouseEvent.CLICK, onMenuBtnClick);
			
			//load to desired scene from game over
			Root.instance.loadScene("Main Menu");
		}
		
		private function deinitialize(eventData : Event) : void
		{
			trace("deinitializing GameOverLose");
			menuBtn.removeEventListener(MouseEvent.CLICK, onMenuBtnClick);
			
			this.removeEventListener(Event.ADDED_TO_STAGE, initialize);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, deinitialize);
		}

	}
	
}