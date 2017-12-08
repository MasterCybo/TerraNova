/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.services
{
	import flash.filesystem.File;
	
	import ru.aa.game.core.services.FileService;
	
	public class GameStateStorage extends FileService
	{
		/**
		 * Сервис загрузки и сохранения текущего состояния игры
		 */
		public function GameStateStorage():void
		{
			super(File.applicationStorageDirectory);
		}
	}
}
