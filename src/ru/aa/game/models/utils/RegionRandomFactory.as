/**
 * Created by Artem-Home on 12.03.2017.
 */
package ru.aa.game.models.utils
{
	public class RegionRandomFactory
	{
		public function RegionRandomFactory()
		{
		}
		
		public static function getRegionData(id:String):Object
		{
			return {
				image:"res/images/reg01.jpg",
				cols:5,
				rows:8,
				items:[],
				actors:[],
				traps:[],
				stashes:[]
			}
		}
	}
}
