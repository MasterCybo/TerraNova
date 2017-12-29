/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.arslanov.starling.mvc.mediators
{
	import ru.arslanov.starling.mvc.extensions.IExtension;
	
	public interface IMediatorMapExtension extends IExtension
	{
		function initialize(displayObject:*, onComplete:Function):Boolean;
	}
}
