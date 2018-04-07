/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.world.commands
{
	import flash.events.Event;
	
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.services.DataLoadService;
	import ru.aa.game.world.events.StartWorldEvent;
	import ru.aa.game.world.models.IWorld;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
	/**
	 * Первая команда старта нового мира
	 */
	public class StartWorldCommand extends Command
	{
		public function StartWorldCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		private function get event():StartWorldEvent { return getEvent() as StartWorldEvent; }
		
		override public function execute():void
		{
			super.execute();
			
			var hero:MoHero = injector.getOf(MoHero);
			var world:IWorld = hero.position.world;
			
			var dataStorage:DataLoadService = injector.getOf(DataLoadService);
			dataStorage.addEventListener(Event.COMPLETE, onLoadComplete);
			dataStorage.verbose = true;
			dataStorage.load(world.dataURL, world);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var dataStorage:DataLoadService = event.target as DataLoadService;
			dataStorage.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
		}
	}
}
