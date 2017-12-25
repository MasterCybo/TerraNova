/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.interfaces
{
	public interface IConfig
	{
		function configure():void;
		
		function get context():IContext;
		function get injector():IInjector;
		function get mediatorMap():IMediatorMap;
		function get commandMap():ICommandMap;
	}
}
