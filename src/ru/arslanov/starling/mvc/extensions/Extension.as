package ru.arslanov.starling.mvc.extensions
{
	import ru.arslanov.starling.mvc.context.IContext;
	
	public class Extension implements IExtension
	{
		private var _context:IContext;
		
		public function Extension(context:IContext)
		{
			_context = context;
		}
		
		public function initialize():void
		{
		}
		
		public function afterInitialize(handler:Function):IExtension
		{
			return this;
		}
	}
}
