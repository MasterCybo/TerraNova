/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.player.models
{
	import ru.aa.game.models.actors.IActor;
	
	public interface IPlayer extends IActor
	{
		function get hunger():Number;
		function set hunger(value:Number):void;
		
		function get thirst():Number;
		function set thirst(value:Number):void;
		
		function get energy():Number;
		function set energy(value:Number):void;
	}
}
