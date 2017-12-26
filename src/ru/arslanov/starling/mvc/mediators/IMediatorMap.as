/**
 * Created by Artem-Home on 13.02.2017.
 */
package ru.arslanov.starling.mvc.mediators
{
	import ru.arslanov.starling.mvc.interfaces.*;
	import starling.display.DisplayObject;
	
	public interface IMediatorMap
	{
		function map(viewClass:Class):IMediateSetter;
		function unmap(mediatorClass:Class):void;
		function mediate(view:DisplayObject):void;
		function unmediate(view:DisplayObject):void;
		function hasMediator(mediatorClass:Class):Boolean;
		function addExtension(extensionClass:Class):void;
	}
}
