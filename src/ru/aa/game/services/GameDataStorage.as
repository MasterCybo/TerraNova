/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.services
{
	import flash.filesystem.File;
	
	import ru.aa.game.core.serialize.ISerializable;
	
	import ru.aa.game.core.services.FileService;
	
	public class GameDataStorage extends FileService
	{
		/**
		 * Сервис загрузки игровых ресурсов
		 */
		public function GameDataStorage()
		{
			super(File.applicationDirectory);
		}
		
		override public function save(path:String, serializableObject:ISerializable):void
		{
			throw new Error("This service can not save!");
		}
	}
}
