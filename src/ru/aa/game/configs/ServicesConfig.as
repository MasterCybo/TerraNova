package ru.aa.game.configs
{
	import ru.aa.game.services.DataLoadService;
	import ru.aa.game.services.StateStorageService;
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
			
			injector.map(StateStorageService).toValue(new StateStorageService());
			injector.map(DataLoadService).toValue(new DataLoadService());
		}
	}
}
