/**
 * Created by Artem-Home on 11.03.2017.
 */
package ru.aa.game.location.utils
{
	public class LocationRandomFactory
	{
		public function LocationRandomFactory()
		{
		}
		
		public static function getRegionData(id:String):Object
		{
			return {
				id:id,
				name:"Название района",
				description:"Описание района",
				path:"res/reg01.json"
			}
		}
	}
}
