/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	import ru.aa.game.commands.events.StartWorldEvent;
	
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
	import ru.aa.game.services.DataLoadService;
	
	import starling.events.EventDispatcher;
	
	/**
	 * Первая команда старта нового мира
	 */
	public class StartWorldCommand extends Command
	{
		[Inject]
		public var event:StartWorldEvent;
		
		[Inject]
		public var hero:MoHero;
		
		[Inject]
		public var dataStorage:DataLoadService;
		
		[Inject]
		public var eventDispatcher:EventDispatcher;
		
		
		public function StartWorldCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			
			var world:IWorld = hero.position.world;
			
			dataStorage.addEventListener(Event.COMPLETE, onLoadComplete);
			dataStorage.verbose = true;
			dataStorage.load(world.dataURL, world);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var dataStorage:DataLoadService = event.target as DataLoadService;
			dataStorage.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
		}
	}
}
