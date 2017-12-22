package ru.arslanov.starling.mvc
{
	import ru.arslanov.starling.mvc.interfaces.ICommandMap;
	import ru.arslanov.starling.mvc.interfaces.IConfig;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.interfaces.IInjector;
	import ru.arslanov.starling.mvc.interfaces.IMediatorMap;
	
	/**
	 * Конфигурация архитектуры приложения.
	 * В нём описываются все взаимосвязи между основными объекми архитектуры.
	 * @author Artem Arslanov
	 */
	public class Config implements IConfig
	{
		private var _context:IContext;
		
		public function Config(context:IContext)
		{
			_context = context;
		}
		
		public function initialize():void
		{
			trace(this + "::initialize()");
			// override me
		}
		
		public function get context():IContext { return _context }
		public function get injector():IInjector { return _context.injector; }
		public function get mediatorMap():IMediatorMap { return _context.mediatorMap; }
		public function get commandMap():ICommandMap { return _context.commandMap; }
	}
}