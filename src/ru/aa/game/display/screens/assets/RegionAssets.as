/**
 * Created by Artem-Home on 25.02.2017.
 */
package ru.aa.game.display.screens.assets
{
	import ru.aa.game.core.utils.Assets;
	
	public class RegionAssets extends Assets
	{
		public const SPRITES_XML:String = "res/atlases/sprites.xml";
		public const SPRITES_PNG:String = "res/atlases/sprites.png";
		public var backgroundURL:String;
		
		public function RegionAssets(scaleFactor:Number = 1, useMipmaps:Boolean = false)
		{
			super(scaleFactor, useMipmaps);
		}
	}
}
