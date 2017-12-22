/**
 * Created by User on 03.07.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.collections.Files;
	
	import ru.aa.game.commands.events.StartWorldEvent;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.models.collections.ItemsKindCollection;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.DataLoadService;
	import ru.aa.game.services.ResourceLoader;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class BeginNewGameCommand extends Command
	{
		public function BeginNewGameCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = injector.getOf(MoHero);
			var world:IWorld = injector.getOf(IWorld);
			hero.position.world = world;
			
			var resLoader:ResourceLoader = new ResourceLoader(context);
			injector.map(ResourceLoader).toValue(resLoader);
//			resLoader.start();
			
			var kindsCollection:ItemsKindCollection = injector.getOf(ItemsKindCollection);
			
			var dataStorage:DataLoadService =injector. getOf(DataLoadService);
			dataStorage.addEventListener(Event.COMPLETE, onLoadComplete);
			dataStorage.verbose = true;
			dataStorage.load(Files.ITEMS_KIND, kindsCollection);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var dataStorage:DataLoadService = event.target as DataLoadService;
			dataStorage.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new StartWorldEvent(StartWorldEvent.START_WORLD));
		}
	}
}
