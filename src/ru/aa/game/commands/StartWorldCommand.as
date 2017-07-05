/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.commands.events.StartWorldEvent;
	
	import ru.aa.game.core.services.FileService;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.services.GameDataService;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
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
			
			var moWorld:IWorld = getOf(IWorld);
			
			var fileService:GameDataService = getOf(GameDataService);
			fileService.addEventListener(Event.COMPLETE, onLoadComplete);
			fileService.verbose = true;
			fileService.load("res/world01.json", moWorld);
		}
		
		private function onLoadComplete(event:Event):void
		{
			var fileService:GameDataService = event.target as GameDataService;
			fileService.removeEventListener(Event.COMPLETE, onLoadComplete);
			
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
		}
	}
}
