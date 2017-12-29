package ru.aa.game.configs
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.models.collections.ItemsKindCollection;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
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
