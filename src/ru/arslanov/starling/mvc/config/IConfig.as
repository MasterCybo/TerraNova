/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.config
{
	import ru.arslanov.starling.mvc.commands.ICommandMap;
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.injection.IInjector;
	import ru.arslanov.starling.mvc.mediators.IMediatorMap;
	
	public interface IConfig
	{
		function initialize():void;
		
		function get context():IContext;
		function get injector():IInjector;
		function get mediatorMap():IMediatorMap;
		function get commandMap():ICommandMap;
	}
}
