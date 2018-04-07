/**
 * Created by User on 03.07.2017.
 */
package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.data.LoadWorldDataAction;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.world.models.IWorld;
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.context.IContext;
	
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
			
			var loadingAction:LoadWorldDataAction = new LoadWorldDataAction(injector, ScreenName.WORLD_MAP);
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.LOADING_SCREEN, loadingAction));
		}
	}
}
