/**
 * Created by Artem-Home on 21.02.2017.
 */
package ru.aa.game.models
{
	import ru.aa.game.core.data.MoEntity;
	
	public class MoMission extends MoEntity
	{
		public function MoMission()
		{
			super();
			
			name = "Сложное задание";
			description = "Обследовать район";
		}
	}
}
