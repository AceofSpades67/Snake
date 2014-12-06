package 
{

	import flash.display.MovieClip;
	import scenes.MainMenu;
	import flash.display.Sprite;
	import scenes.Level1;
	import scenes.GameOverWin;
	import scenes.GameOverLose;
	import scenes.Level2;
	import scenes.Level3;
	
	public class Root extends Sprite 
	{
		public static var theStage = null;
		//SINGLETON
		public static var instance : Root = null;
		
		public var currentScene : MovieClip  = null;
		
		public var score : int = 0;
		
		
		public function Root()
		{
			instance = this;
			theStage = stage;
			
			loadScene("Main Menu");
		}
		
		
		// Baqir's Script for Scoring Below:
		// may need EDITS for refinement to suit SNAKE
		
		

		public function Test()
		{
			//creating my text field
			
		}

		public function addScore():void
		{
			//adding 10 to score
			score += 10;

			//setting the txt text field to score
			Level1.level1.txt.text = score.toString();
		}
		// End of Scoring Script */
		
		
		public function loadScene (name : String) : void
		{
			trace("Loading", name);
			if(currentScene != null)
				currentScene.parent.removeChild(currentScene);
			
			
			switch(name)
			{
				case "Main Menu":
					currentScene = new MainMenu();
				break;
				case "Level 1":
					currentScene = new Level1();
				break;
				case "Level 2":
					currentScene = new Level2();
				break;
				case "Level 3":
					currentScene = new Level3();
				break;
				case "Win Scene":
					currentScene = new GameOverWin();
				break;
				case "Lose Scene":
					currentScene = new GameOverLose();
				break;
			}
			this.addChild(currentScene);
		}
	}
	
}
