package ru.aa.game.configs
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.common.items.services.ItemsKindCollection;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.world.models.IWorld;
	import ru.aa.game.world.models.MoWorld;
	import ru.arslanov.starling.mvc.config.Config;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class ModelsConfig extends Config
	{
		public function ModelsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function configure():void
		{
			super.configure();
			
			injector.map(ItemsKindCollection).asSingleton(ItemsKindCollection);
			injector.map(MoHero).asSingleton(MoHero);
			injector.map(IWorld).toValue(new MoWorld(Files.DEFAULT_WORLD));
		}
	}
}
