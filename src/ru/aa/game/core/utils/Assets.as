/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.core.utils
{
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Assets extends AssetManager
	{
		private var _nullName:String = "nullTexture";
		
		public function Assets(scaleFactor:Number = 1, useMipmaps:Boolean = false)
		{
			super(scaleFactor, useMipmaps);
			addTexture(_nullName, Texture.empty(20, 20));
		}
		
		override public function getTexture(name:String):Texture
		{
			if (!hasTexture(name)) name = _nullName;
			return super.getTexture(name);
		}
		
		public function hasTexture(name:String):Boolean
		{
			var names:Vector.<String> = getTextureNames();
			return names.indexOf(name) != -1;
		}
		
		public function getNameFromUrl(url:String):String
		{
			return getBasenameFromUrl(url);
		}
	}
}
