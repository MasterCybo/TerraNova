/**
 * Created by User on 27.06.2017.
 */
package ru.aa.game.location.mediators
{
	import ru.aa.game.display.screens.events.TileEvent;
	import ru.aa.game.location.models.MoCellLocation;
	import ru.aa.game.location.views.LocationTile;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	public class LocationMapMediator extends Mediator
	{
		public function LocationMapMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
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
			var tile:LocationTile = event.target as LocationTile;
			var cell:MoCellLocation = tile.cell;
			
			if (tile) {
				if (cell.available()) {
					cell.opened = true;
					tile.open();
				} else {
					tile.busy();
				}
			}
		}
	}
}
