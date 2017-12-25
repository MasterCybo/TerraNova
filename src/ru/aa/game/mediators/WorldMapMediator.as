/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.mediators
{
	import robotlegs.bender.extensions.palidor.starlingIntegration.starlingViewMap.impl.StarlingMediator;
	
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.events.TileEvent;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.display.world.WorldTile;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.player.models.MoHero;
	
	public class WorldMapMediator extends StarlingMediator
	{
		[Inject]
		public var hero:MoHero;
		
		[Inject]
		public var view:WorldMap;
		
		public function WorldMapMediator()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			hero.position.clearRegion();
			
			addViewListener(TileEvent.TAP, touchHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(TileEvent.TAP, touchHandler);
			super.destroy();
		}
		
		private function touchHandler(event:TileEvent):void
		{
			if (view.isScrolling) return;
			
			var tile:WorldTile = event.target as WorldTile;
			
			if (tile) {
				var world:IWorld = hero.position.world;
				
				hero.position.region = world.getRegion(tile.name);
				
				eventDispatcher.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BRIEFING));
			}
		}
	}
}
