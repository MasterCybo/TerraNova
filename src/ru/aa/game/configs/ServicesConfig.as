package ru.aa.game.configs
{
	import ru.aa.game.services.GameDataStorage;
	import ru.aa.game.services.GameStateStorage;
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class ServicesConfig extends Config
	{
		public function ServicesConfig(context:IContext)
		{
			super(context);
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			map(GameStateStorage).toValue(new GameStateStorage());
			map(GameDataStorage).toValue(new GameDataStorage());
		}
	}
}
