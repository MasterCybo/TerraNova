package ru.arslanov.starling.mvc.commands
{
	import flash.events.Event;
	
	import ru.arslanov.starling.mvc.interfaces.ICommand;
	import ru.arslanov.starling.mvc.interfaces.ICommandMap;
	import ru.arslanov.starling.mvc.interfaces.IContext;
	import ru.arslanov.starling.mvc.interfaces.IInjector;
	import ru.arslanov.starling.mvc.interfaces.IMediatorMap;
	
	/**
	 * Команда - инициализируется по событию, отправленному через контекст.
	 * Создание и запуск команд происходит в классе CommandMap
	 * @author Artem Arslanov
	 */
	public class Command implements ICommand
	{
		public var verbose:Boolean = false; // Выводить запуск команды в trace
		
		private var _context:IContext;
		private var _event:Event;
		
		public function Command(context:IContext, event:Event)
		{
			_context = context;
			_event = event;
		}
		
		public function execute():void
		{
			if (!verbose) trace("[Command " + this + "] execute");
		}
		
		public function destruct():void
		{
			_event = null;
			_context = null;
		}
		
		public function getEvent():Event { return _event }
		
		/*
		 * For fast access
		 */
		public function get context():IContext { return _context; }
		public function get injector():IInjector { return _context.injector; }
		public function get mediatorMap():IMediatorMap { return _context.mediatorMap; }
		public function get commandMap():ICommandMap { return _context.commandMap; }

		public function dispatchEvent(event:Event):Boolean { return _context.dispatchEvent(event); }
	}

}