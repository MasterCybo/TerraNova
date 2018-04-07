package ru.aa.game.screens.data
{
	import flash.events.Event;
	
	import ru.aa.game.collections.Files;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.location.models.ILocation;
	import ru.aa.game.location.views.LocationMap;
	import ru.aa.game.services.DataLoadService;
	import ru.arslanov.starling.mvc.injection.IInjector;
	
	public class LoadLocationDataAction extends LoadingScreenAction
	{
		private var _injector:IInjector;
		private var _location:ILocation;
		
		public function LoadLocationDataAction(injector:IInjector, nextScreen:String)
		{
			_injector = injector;
			super(nextScreen);
		}
		
		override public function execute():void
		{
			var hero:MoHero = _injector.getOf(MoHero);
			_location = hero.position.region;
			
            var fileService:DataLoadService = _injector.getOf(DataLoadService);
            fileService.addEventListener(Event.COMPLETE, onLoadComplete);
            fileService.verbose = true;
            fileService.load(_location.dataURL, _location);
		}

        private function onLoadComplete(event:Event):void
        {
            var fileService:DataLoadService = event.target as DataLoadService;
            fileService.removeEventListener(Event.COMPLETE, onLoadComplete);
	
	        Assets.me.enqueue(Files.LOC_TILES_XML);
	        Assets.me.enqueue(Files.LOC_TILES_PNG);
	        Assets.me.enqueueWithName(_location.imageURL, LocationMap.TEX_BACKGROUND);
	        Assets.me.loadQueue(progress);
        }
	}
}
