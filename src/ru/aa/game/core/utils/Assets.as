/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.utils
{
	import starling.assets.AssetManager;
	import starling.textures.Texture;
	
	public class Assets extends AssetManager
	{
		private static const DEFAULT_TEXTURE:String = "nullTexture";
		
		private static var _instance:Assets;
		
		private var _isInited:Boolean;
		
		public function Assets(key:SingletonKey)
		{
			super();
		}
		
		public static function get me():Assets
		{
			if (!_instance) _instance = new Assets(new SingletonKey());
			return _instance;
		}
		
		public function init(scaleFactor:Number = 1, useMipmaps:Boolean = false):void
		{
			if (_isInited) return;
			
			if (!hasTexture(DEFAULT_TEXTURE)) addAsset(DEFAULT_TEXTURE, Texture.empty(20, 20));
			super.textureOptions.scale = scaleFactor;
			super.textureOptions.mipMapping = useMipmaps;
			_isInited = true;
		}
		
		override public function getTexture(name:String):Texture
		{
			if (!hasTexture(name)) name = DEFAULT_TEXTURE;
			return super.getTexture(name);
		}
		
		public function hasTexture(name:String):Boolean
		{
			var names:Vector.<String> = getTextureNames();
			return names.indexOf(name) != -1;
		}
		
		public function getNameFromURL(url:String):String
		{
			return super.getNameFromUrl(url);
		}
	}
}

internal class SingletonKey {}
