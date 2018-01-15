/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.mediators
{
	import ru.aa.game.display.screens.ScreenName;
	import ru.aa.game.display.screens.events.ScreenEvent;
	import ru.aa.game.display.screens.events.TileEvent;
	import ru.aa.game.display.world.WorldMap;
	import ru.aa.game.display.world.WorldTile;
	import ru.aa.game.models.world.IWorld;
	import ru.aa.game.player.models.MoHero;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	public class WorldMapMediator extends Mediator
	{
		public function WorldMapMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
		{
			super.initialize(displayObject);
			
			var hero:MoHero = injector.getOf(MoHero);
			hero.position.clearRegion();
			
			addViewListener(TileEvent.TAP, touchHandler);
		}
		
		override public function destroy():void
		{
			removeViewListener(TileEvent.TAP, touchHandler);
			super.destroy();
		}
		
		private function get view():WorldMap { return getView() as WorldMap; }
		
		private function touchHandler(event:TileEvent):void
		{
			if (view.isScrolling) return;
			
			var tile:WorldTile = event.target as WorldTile;
			
			if (tile) {
				var hero:MoHero = injector.getOf(MoHero);
				var world:IWorld = hero.position.world;
				
				hero.position.region = world.getRegion(tile.name);
				
				dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, ScreenName.BRIEFING));
			}
		}
	}
}
