/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.common.items.models
{
	import ru.aa.game.core.data.ModelBase;
	
	/**
	 * Модель игрового предмета
	 */
	public class MoItem extends ModelBase implements IItemContent
	{
		private var _kind:MoItemKind; // прототип предмета с базовыми характеристиками
		
		public function MoItem(kind:MoItemKind)
		{
			super();
			_kind = kind;
		}
		
		public function get kind():MoItemKind {return _kind;}
	}
}
