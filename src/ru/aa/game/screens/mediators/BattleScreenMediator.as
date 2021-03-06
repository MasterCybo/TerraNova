/**
 * Created by Artem-Home on 15.02.2017.
 */
package ru.aa.game.screens.mediators
{
	import ru.arslanov.starling.mvc.context.IContext;
	import ru.arslanov.starling.mvc.mediators.Mediator;
	
	public class BattleScreenMediator extends Mediator
	{
		public function BattleScreenMediator(context:IContext)
		{
			super(context);
		}
		
		override public function initialize(displayObject:Object):void
		{
			trace("*execute* " + this + "::initialize()");
			super.initialize(displayObject);
		}
	}
}
