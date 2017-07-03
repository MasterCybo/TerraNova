/**
 * Created by User on 03.07.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.commands.events.LoadGameDataEvent;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class NewGameCommand extends Command
	{
		public function NewGameCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
			dispatchEvent(new LoadGameDataEvent(LoadGameDataEvent.LOAD_GAME_DATA));
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.WORLD_MAP));
		}
	}
}
