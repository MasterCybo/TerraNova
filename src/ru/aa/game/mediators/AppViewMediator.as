/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.aa.game.mediators
{
	import ru.aa.game.collections.Files;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.display.AppView;
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	
	public class AppViewMediator extends Mediator
	{
		public static const MAX_HISTORY:int = 5;
		
		private var _view:AppView;
		private var _history:Vector.<String> = new Vector.<String>();
		
		public function AppViewMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			_view = displayObject as AppView;
			
//			Assets.me.init();
//			Assets.me.enqueue(Files.SPRITES_XML);
//			Assets.me.enqueue(Files.SPRITES_PNG);
//			Assets.me.loadQueue(loadingHandler);
			
			showScreen(ScreenName.MAIN_MENU);
			
			addContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			addContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
		}
		
		override public function destroy():void
		{
			removeContextListener(ScreenEvent.SHOW_SCREEN, showScreenHandler);
			removeContextListener(ScreenEvent.SHOW_PREVIOUS, showScreenHandler);
			super.destroy();
			_view = null;
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
			if (!name || name == _view.activeScreenID) return;
			if (properties) _view.getScreen(name).properties.data = properties;
			_view.showScreen(name);
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
