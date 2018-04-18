package ru.aa.game.common.items.models
{
	import ru.aa.game.common.items.services.ItemsCollection;
	
	/**
	 * Контейнер с предметами
	 */
	public class MoItemsContainer extends MoItem
	{
		private var _content:ItemsCollection = new ItemsCollection();
		
		public function MoItemsContainer(kind:MoItemKind)
		{
			super(kind);
		}
		
		public function get content():ItemsCollection
		{
			return _content;
		}
	}
}
