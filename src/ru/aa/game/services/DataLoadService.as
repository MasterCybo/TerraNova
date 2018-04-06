/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.services
{
	import flash.filesystem.File;
	
	import ru.aa.game.core.serialize.ISerializable;
	import ru.aa.game.core.services.FileService;
	
	public class DataLoadService extends FileService
	{
		/**
		 * Сервис загрузки игровых ресурсов
		 */
		public function DataLoadService()
		{
			super(File.applicationDirectory);
		}
		
		override public function save(path:String, serializableObject:ISerializable):void
		{
			throw new Error("This service can not save!");
		}
	}
}
