/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.aa.game
{
	import ru.aa.game.commands.events.LoadGameDataEvent;
	import ru.aa.game.display.ContextView;
	import ru.arslanov.starling.mvc.MVCStarling;
	import ru.arslanov.starling.mvc.extensions.FeathersMediatorMapExtension;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class AppRoot extends Sprite
	{
		public function AppRoot()
		{
			super();
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void
		{
			var contextView:ContextView = new ContextView();
			
			var context:IContext = MVCStarling.createContext(contextView)
					.extend(FeathersMediatorMapExtension)
					.configurate(AppConfig);
			
			addChild(contextView);
		}
	}
}
