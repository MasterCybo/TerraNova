/**
 * Created by Artem on 02.04.2016.
 */
package ru.aa.game.core.services
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import ru.aa.game.core.serialize.ISerializable;
	
	public class FileService extends EventDispatcher
	{
		public var verbose:Boolean;
		
		private var _file:File;
		private var _fileStream:FileStream = new FileStream();
		private var _textData:String;
		
		public function FileService(file:File)
		{
			super();
			_file = file;
		}
		
		public function get textData():String {return _textData;}
		
		public function load(path:String, serializableObject:ISerializable = null):void
		{
			_textData = null;
			
			var file:File = _file.resolvePath(path);
			
			if (file.exists) {
				_fileStream.open(file, FileMode.READ);
				_textData = _fileStream.readUTFBytes(file.size);
				_fileStream.close();
				
				
				if (_textData != "") {
					traceDebug("Load successful :)");
					if (serializableObject) serializableObject.deserialize(_textData);
					dispatchEvent(new Event(Event.COMPLETE));
				} else {
					traceDebug("Load error :(");
					dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
				}
				traceDebug("Loaded data :\n" + _textData);
			} else {
				traceDebug(this, "ERROR! File " + file.nativePath + " not found!");
			}
		}
		
		public function save(path:String, serializableObject:ISerializable):void
		{
			var textData:String = serializableObject.serialize();
			
			var file:File = _file.resolvePath(path);
			_fileStream.open(file, FileMode.WRITE);
			_fileStream.writeUTFBytes(textData);
			_fileStream.close();
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function traceDebug(...message):void
		{
			if (!verbose) return;
			trace.apply(null, message);
		}
	}
}
