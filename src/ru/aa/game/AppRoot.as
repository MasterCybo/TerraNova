/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.aa.game
{
	import ru.aa.game.commands.events.AppEvent;
	import ru.aa.game.configs.CommandsConfig;
	import ru.aa.game.configs.MediatorsConfig;
	import ru.aa.game.configs.ModelsConfig;
	import ru.aa.game.configs.ServicesConfig;
	import ru.aa.game.display.ScreenContainer;
	import ru.arslanov.starling.mvc.context.Context;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.extensions.FeathersBundle;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AppRoot extends Sprite
	{
		private var context:IContext;
		
		public function AppRoot()
		{
			super();
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void
		{
			var screenContainer:ScreenContainer = new ScreenContainer();
			addChild(screenContainer);
			
			context = new Context()
					.install(FeathersBundle)
					.configure(ModelsConfig, MediatorsConfig, CommandsConfig, ServicesConfig, screenContainer);
			
			context.dispatchEvent(new AppEvent(AppEvent.STARTUP_APPLICATION));
			
		}
	}
}
