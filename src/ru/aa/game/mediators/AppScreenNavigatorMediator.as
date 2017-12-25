/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.aa.game.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import ru.aa.game.AppScreenNavigator;
	import ru.aa.game.display.screens.events.ScreenEvent;
	
	public class AppScreenNavigatorMediator extends StarlingMediator
	{
		[Inject]
		public var view:AppScreenNavigator;
		
		[Inject]
		public var event:ScreenEvent;
		
		public static const MAX_HISTORY:int = 5;
		
		private var _history:Vector.<String> = new Vector.<String>();
		
		public function AppScreenNavigatorMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			trace("*execute* " + this + "::initialize()");
			addContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			addContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
		}
		
		override public function destroy():void
		{
			removeContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			removeContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
			super.destroy();
		}
		
		private function showScreenHandler(event:ScreenEvent):void
		{
			trace("*execute* " + this + "::showScreenHandler()");
			switch (event.type) {
				case ScreenEvent.SHOW_SCREEN:
					showScreen(event.name, event.data);
					break;
				case ScreenEvent.SHOW_PREVIOUS:
					showScreen(popFromHistory());
					break;
			}
		}
		
		private function showScreen(name:String, properties:Object = null):void
		{
			if (!name || name == view.activeScreenID) return;
			if (properties) view.getScreen(name).properties.data = properties;
			view.showScreen(name);
			pushToHistory(name);
		}
		
		private function pushToHistory(name:String):void
		{
			if (_history.length >= MAX_HISTORY) _history.shift();
			_history.push(name);
		}
		
		private function popFromHistory():String
		{
			if (_history.length < 2) return null;
			
			_history.pop();
			return _history.pop();
		}
	}
}
