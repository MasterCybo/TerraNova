package ru.arslanov.starling.mvc.context
{
	import flash.events.EventDispatcher;
	
	public class StageObserver extends EventDispatcher
	{
		private var _context:IContext;
		
		public function StageObserver(context:IContext)
		{
			super();
			_context = context;
		}
	}
}
