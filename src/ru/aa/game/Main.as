package ru.aa.game
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.palidor.PalidorBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import ru.aa.game.commands.events.AppEvent;
	
	import ru.aa.game.configs.CommandsConfig;
	import ru.aa.game.configs.MediatorsConfig;
	import ru.aa.game.configs.ModelsConfig;
	import ru.aa.game.configs.ServicesConfig;
	import ru.arslanov.starling.StarlingManager;
	
	[SWF(frameRate = "60")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			StarlingManager.create(AppRoot, stage);
			StarlingManager.showStats();
			
			const robotlegsContext:IContext = new Context();
			robotlegsContext.install(PalidorBundle);
			robotlegsContext.configure(ModelsConfig, MediatorsConfig, ServicesConfig, CommandsConfig, StarlingManager.starling);
			robotlegsContext.configure(new ContextView(this));
			
//			robotlegsContext.dispatchEvent(new AppEvent(AppEvent.STARTUP_APPLICATION));
		}
	}
}
