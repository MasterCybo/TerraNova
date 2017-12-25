package ru.aa.game.configs
{
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import ru.aa.game.services.DataLoadService;
	import ru.aa.game.services.StateStorageService;
	
	public class ServicesConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		public function ServicesConfig()
		{
			super();
		}
		
		public function configure():void
		{
			injector.map(StateStorageService).toValue(new StateStorageService());
			injector.map(DataLoadService).toValue(new DataLoadService());
		}
	}
}
