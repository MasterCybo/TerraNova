package ru.aa.game.screens.mediators
{
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.screens.views.LoadingScreen;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.events.Event;
	
	public class LoadingScreenMediator extends Mediator
	{
		public function LoadingScreenMediator(context:IContext)
		{
			super(context);
		}
		
		public function get view():LoadingScreen {return getView() as LoadingScreen;}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
			
			view.addEventListener(LoadingScreen.COMPLETE, completeHandler);
		}
		
		private function completeHandler(event:Event):void
		{
			view.removeEventListener(LoadingScreen.COMPLETE, completeHandler);
			dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, String(event.data)));
		}
		
	}
}
