package ru.aa.game.screens.data
{
	import flash.events.Event;
	
	import ru.aa.game.collections.Files;
	import ru.aa.game.common.items.services.ItemsKindCollection;
	import ru.aa.game.core.utils.Assets;
	import ru.aa.game.hero.models.MoHero;
	import ru.aa.game.services.DataLoadService;
	import ru.aa.game.world.models.IWorld;
	import ru.aa.game.world.views.WorldMap;
	import ru.arslanov.starling.mvc.injection.IInjector;
	
	public class LoadWorldDataAction extends LoadingScreenAction
	{
		private var _injector:IInjector;
		private var _world:IWorld;
		
		public function LoadWorldDataAction(injector:IInjector, nextScreen:String)
		{
			_injector = injector;
			super(nextScreen);
		}
		
		override public function execute():void
		{
			var kindsCollection:ItemsKindCollection = _injector.getOf(ItemsKindCollection);
			
			var dataStorage:DataLoadService = _injector.getOf(DataLoadService);
			dataStorage.addEventListener(Event.COMPLETE, onItemsLoadComplete);
			dataStorage.verbose = true;
			dataStorage.load(Files.ITEMS_KIND, kindsCollection);
		}

        private function onItemsLoadComplete(event:Event):void
        {
	        var dataStorage:DataLoadService = event.target as DataLoadService;
	        dataStorage.removeEventListener(Event.COMPLETE, onItemsLoadComplete);
	        
	        
	        var hero:MoHero = _injector.getOf(MoHero);
	        _world = hero.position.world;
	        
	        dataStorage.addEventListener(Event.COMPLETE, onWorldLoadComplete);
	        dataStorage.verbose = true;
	        dataStorage.load(_world.dataURL, _world);
        }
		
		private function onWorldLoadComplete(event:Event):void {
			var dataStorage:DataLoadService = event.target as DataLoadService;
			dataStorage.removeEventListener(Event.COMPLETE, onWorldLoadComplete);
			
			trace("*execute* " + this + "::onWorldLoadComplete()");
			
			Assets.me.enqueueSingle(_world.imageURL, WorldMap.BACKGROUND);
			Assets.me.loadQueue(complete/*, null, progress*/);
			
//			complete();
		}
	}
}
