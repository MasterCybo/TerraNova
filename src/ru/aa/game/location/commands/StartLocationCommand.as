/**
 * Created by Artem-Home on 24.02.2017.
 */
package ru.aa.game.location.commands
{
	import flash.events.Event;
	
	import ru.aa.game.location.events.StartLocationEvent;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.data.LoadLocationDataAction;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class StartLocationCommand extends Command
	{
		public function StartLocationCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		private function get event():StartLocationEvent { return getEvent() as StartLocationEvent; }
		
		override public function execute():void
		{
			super.execute();
			
			var loadingAction:LoadLocationDataAction = new LoadLocationDataAction(injector, ScreenName.LOCATION_MAP);
			
            dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.LOADING_SCREEN, loadingAction));
		}
	}
}
