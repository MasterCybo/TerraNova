/**
 * Created by Artem-Home on 11.03.2017.
 */
package ru.aa.game.models.utils
{
	public class AreaRandomFactory
	{
		public function AreaRandomFactory()
		{
		}
		
		public static function getAreaData(id:String):Object
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
