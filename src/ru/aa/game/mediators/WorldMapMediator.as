/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.mediators
{
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.world.AreaTile;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.models.MoGame;
	import ru.aa.game.models.world.IWorld;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class WorldMapMediator extends Mediator
	{
		public function WorldMapMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			addViewListener(TouchEvent.TOUCH, touchHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(TouchEvent.TOUCH, touchHandler);
			super.destroy();
		}
		
		private function get view():WorldMap { return getView() as WorldMap; }
		
		private function touchHandler(event:TouchEvent):void
		{
			if (view.isScrolling) return;
			
			var touch:Touch = event.touches[0];
			
			if (touch.phase == TouchPhase.ENDED) {
				var area:AreaTile = event.target as AreaTile;
				var world:IWorld = getOf(IWorld);
				var game:MoGame = getOf(MoGame);
				game.currentArea = world.getArea(area.name);
				dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BRIEFING));
			}
		}
	}
}
