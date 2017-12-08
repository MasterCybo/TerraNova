/**
 * Created by Artem-Home on 17.02.2017.
 */
package ru.aa.game.models.items
{
	import ru.aa.game.core.data.ModelBase;
	
	/**
	 * Любой игровой предмет
	 */
	public class MoItem extends ModelBase implements IItemContent
	{
		private var _kind:MoItemKind;
		
		public function MoItem(kind:MoItemKind)
		{
			super();
			_kind = kind;
		}
		
		public function get kind():MoItemKind {return _kind;}
	}
}
