/**
 * Created by Artem-Home on 16.02.2017.
 */
package ru.aa.game.services
{
	import flash.filesystem.File;
	
	import ru.aa.game.core.services.FileService;
	
	public class GameStateService extends FileService
	{
		/**
		 * Сервис загрузки и сохранения текущего состояния игры
		 */
		public function GameStateService():void
		{
			super(File.applicationStorageDirectory);
		}
	}
}
