package ru.aa.game.configs
{
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import ru.aa.game.collections.Files;
	import ru.aa.game.models.collections.ItemsKindCollection;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
	
	public class ModelsConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		public function ModelsConfig()
		{
			super();
		}
		
		public function configure():void
		{
			injector.map(ItemsKindCollection).asSingleton(ItemsKindCollection);
			injector.map(MoHero).asSingleton(MoHero);
			injector.map(IWorld).toValue(new MoWorld(Files.DEFAULT_WORLD));
		}
	}
}
