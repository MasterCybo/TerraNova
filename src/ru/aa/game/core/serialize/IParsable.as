package ru.aa.game.core.serialize
{
	/**
	 * Объект, которому передаётся объект данных и значения присваиваются свойствам.
	 * Используется для инициализирования экземпляра JSON-объектом
	 */
	public interface IParsable
	{
		function parse(data:Object):void;
	}
}
