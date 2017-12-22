package ru.aa.game.configs
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.models.collections.ItemsKindCollection;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.Config;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class ModelsConfig extends Config
	{
		public function ModelsConfig(context:IContext)
		{
			super(context);
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			injector.map(ItemsKindCollection).asSingleton(ItemsKindCollection);
			injector.map(MoHero).asSingleton(MoHero);
			injector.map(IWorld).toValue(new MoWorld(Files.DEFAULT_WORLD));
		}
	}
}
