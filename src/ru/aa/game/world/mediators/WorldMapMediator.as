/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.world.mediators
{
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.screens.ScreenName;
	import ru.aa.game.screens.events.ScreenEvent;
	import ru.aa.game.screens.events.TileEvent;
	import ru.aa.game.world.models.IWorld;
	import ru.aa.game.world.views.WorldMap;
	import ru.aa.game.world.views.WorldTile;
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
