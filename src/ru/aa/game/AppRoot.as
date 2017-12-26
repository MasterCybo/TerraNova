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
	import ru.aa.game.display.AppView;
	import ru.arslanov.starling.mvc.MVCStarling;
	import ru.arslanov.starling.mvc.extensions.FeathersMediatorMapExtension;
	import ru.arslanov.starling.mvc.context.IContext;
	
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
			var appView:AppView = new AppView();
			
			context = MVCStarling.createContext(appView)
					.install(FeathersMediatorMapExtension)
					.configure(ModelsConfig, MediatorsConfig, CommandsConfig, ServicesConfig);
			
			addChild(appView);
			
			context.dispatchEvent(new AppEvent(AppEvent.STARTUP_APPLICATION));
			
		}
	}
}
