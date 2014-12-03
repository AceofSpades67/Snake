package 
{

	import flash.display.MovieClip;
	import scenes.MainMenu;
	import flash.display.Sprite;
	import scenes.Level1;
	
	public class Root extends Sprite 
	{
			public static var theStage = null;
			//SINGLETON
			public static var instance : Root = null;
		
			public var currentScene : MovieClip  = null;
		
		
		public function Root()
		{
			stage.focus = stage;
			instance = this;
			theStage = stage;
			loadScene("Main Menu");
		}
		
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
				case "Win Scene":
					//currentScene = new WinScene();
				break;
				case "Lose Scene":
					//currentScene = new LoseScene();
				break;
			}
			this.addChild(currentScene);
		}
	}
	
}
