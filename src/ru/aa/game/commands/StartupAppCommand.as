package ru.aa.game.commands
{
	import flash.events.Event;
	
	import ru.aa.game.collections.Files;
	
	import ru.aa.game.commands.events.InitFeathersEvent;
	import ru.aa.game.core.utils.Assets;
	
	import ru.arslanov.starling.mvc.commands.Command;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	
	public class StartupAppCommand extends Command
	{
		public function StartupAppCommand(context:IContext, event:Event)
		{
			super(context, event);
		}
		
		override public function execute():void
		{
			super.execute();
			
//			Assets.me.enqueue(Files.SPRITES_XML);
//			Assets.me.enqueue(Files.SPRITES_PNG);
//			Assets.me.loadQueue(loadingHandler);
			
			dispatchEvent(new InitFeathersEvent(InitFeathersEvent.INIT_FEATHERS));
		}
		
		private function loadingHandler(ratio:Number):void
		{
			if (ratio == 1.0) {
				dispatchEvent(new InitFeathersEvent(InitFeathersEvent.INIT_FEATHERS));
			}
		}
	}
}
