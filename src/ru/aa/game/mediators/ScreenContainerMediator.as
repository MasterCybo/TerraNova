/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.aa.game.mediators
{
	import ru.aa.game.display.ScreenContainer;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	public class ScreenContainerMediator extends Mediator
	{
		public static const MAX_HISTORY:int = 5;
		
		private var _history:Vector.<String> = new Vector.<String>();
		
		public function ScreenContainerMediator(context:IContext)
		{
			super(context);
		}
		
		public function get view():ScreenContainer {return getView() as ScreenContainer;}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
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
