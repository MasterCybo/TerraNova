package ru.aa.game.models.items
{
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
