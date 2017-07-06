/**
 * Created by User on 03.07.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.commands.events.StartWorldEvent;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.models.world.MoWorld;
	import ru.aa.game.player.models.MoHero;
	
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
			
			var hero:MoHero = getOf(MoHero);
			var world:IWorld = getOf(IWorld);
			hero.position.world = world;
			
			dispatchEvent(new StartWorldEvent(StartWorldEvent.START_WORLD));
		}
	}
}
