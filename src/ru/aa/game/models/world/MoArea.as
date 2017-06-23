/**
 * Created by Artem-Home on 21.02.2017.
 */
package ru.aa.game.models.world
{
	import ru.aa.game.models.*;
	import ru.aa.game.core.data.MoEntity;
	
	public class MoArea extends MoEntity
	{
		private var _dataURL:String;
		
		private var _mission:MoMission;
		
		public function MoArea()
		{
			super();
		}
		
		public function get dataURL():String { return _dataURL; }
		
		public function get mission():MoMission { return _mission; }
		public function set mission(value:MoMission):void
		{
			_mission = value;
		}
		
		public function parse(params:Object):void
		{
			id = params.id || id;
			name = params.name;
			description = params.description;
			_dataURL = params.path;
		}
	}
}
