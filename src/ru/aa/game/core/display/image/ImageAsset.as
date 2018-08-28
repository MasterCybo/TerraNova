/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.display.image
{
	import flash.filesystem.File;
	
	import ru.aa.game.core.utils.Assets;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class ImageAsset extends Image
	{
		private var _assets:Assets;
		
		private var _callbackComplete:Function;
		private var _textureName:String;
		
		private var _readjustWidth:Number;
		private var _readjustHeight:Number;
		
		/**
		 * По-умолчанию touchable = false
		 * @param textureName
		 */
		public function ImageAsset(texture:Texture = null)
		{
			super(texture);
			touchable = false;
		}
		
		override public function dispose():void
		{
			_assets = null;
			_callbackComplete = null;
			super.dispose();
		}
		
		public function set assetManager(value:Assets):void { _assets = value; }
		public function get assetManager():Assets { return _assets; }
		
		override public function set texture(value:Texture):void
		{
			super.texture = value;
			if (!isNaN(_readjustWidth) && !isNaN(_readjustHeight)) readjustSize(_readjustWidth, _readjustHeight);
		}
		
		public function autoReadjustSize(width:Number = -1, height:Number = -1):void
		{
			_readjustWidth = width;
			_readjustHeight = height;
		}
		
		/**
		 * Загрузка внешней картинки
		 * Обработчик onComplete принимает один параметр - экземпляр ImageAsset
		 * @param path
		 * @param onComplete
		 */
		public function load(path:String, onComplete:Function = null):void
		{
			_callbackComplete = onComplete;
			_textureName = _assets.getNameFromURL(path);
			
			if (!path) {
				applyTexture(null);
				return;
			}
			
			if (_assets.hasTexture(_textureName)) {
				if (_assets.verbose) trace(this, "Get texture from cache by name '" + _textureName + "'");
				applyTexture(_textureName);
			} else {
				var file:File = File.applicationDirectory.resolvePath(path);
				_assets.enqueue(file);
				_assets.loadQueue(onProgress);
			}
		}
		
		private function onProgress(ratio:Number):void
		{
			if (ratio == 1.0) applyTexture(_textureName);
		}
		
		private function applyTexture(name:String):void
		{
			texture = _assets.getTexture(name);
			
			if (_callbackComplete != null) {
				var callback:Function = _callbackComplete;
				_callbackComplete = null;
				if (callback.length == 0) {
					callback();
				} else {
					callback(this);
				}
			}
		}
	}
}
