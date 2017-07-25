/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.mediators
{
	import ru.aa.game.display.region.RegionTile;
	import ru.aa.game.display.screens.events.TileEvent;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	import starling.display.DisplayObject;
	
	public class RegionMapMediator extends Mediator
	{
		public function RegionMapMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:DisplayObject):void
		{
			super.initialize(displayObject);
			
			addViewListener(TileEvent.TAP, touchHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(TileEvent.TAP, touchHandler);
			super.destroy();
		}
		
		private function touchHandler(event:TileEvent):void
		{
			var tile:RegionTile = event.target as RegionTile;
			
			if (tile) {
				tile.open();
			}
		}
	}
}
