/**
 * Created by Artem-Home on 11.02.2017.
 */
package ru.arslanov.starling.mvc.extensions
{
	import feathers.FEATHERS_VERSION;
	import feathers.core.FeathersControl;
	import feathers.events.FeathersEventType;
	
	import flash.utils.Dictionary;
	
	import ru.arslanov.starling.mvc.mediators.IMediatorMapExtension;
	
	import starling.events.Event;
	
	use namespace FEATHERS_VERSION;
	
	public class FeathersMediatorMapExtension implements IMediatorMapExtension
	{
		private var _mapCallbacks:Dictionary = new Dictionary(true);
		
		public function FeathersMediatorMapExtension()
		{
		}
		
		public function initialize(displayObject:*, onComplete:Function):Boolean
		{
			var feathersControl:FeathersControl = displayObject as FeathersControl;
			if (!feathersControl) return false;
			
			_mapCallbacks[feathersControl] = onComplete;
			
			feathersControl.addEventListener(FeathersEventType.INITIALIZE, onInitialized);
			
			return true;
		}
		
		private function onInitialized(event:Event):void
		{
			callComplete(event);
		}
		
		private function callComplete(event:Event):void
		{
			var feathersControl:FeathersControl = event.target as FeathersControl;
			feathersControl.removeEventListener(FeathersEventType.INITIALIZE, onInitialized);
			
			trace("Feathers VERSION: " + FEATHERS_VERSION);
			
			var callback:Function = _mapCallbacks[feathersControl];
			if (callback != null) {
				trace(this + " Call callback");
				delete _mapCallbacks[feathersControl];
				callback(feathersControl);
			}
		}
	}
}
