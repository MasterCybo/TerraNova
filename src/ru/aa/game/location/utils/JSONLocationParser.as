package ru.aa.game.location.utils
{
	import ru.aa.game.location.enum.CellLocationState;
	import ru.aa.game.location.models.MoCellLocation;
	import ru.aa.game.location.models.MoLocation;
	import ru.arslanov.core.enum.Enum;
	
	public class JSONLocationParser
	{
		public function JSONLocationParser()
		{
		}
		
		public static function parseMapArray(region:MoLocation, data:Array):void
		{
			var col:int;
			var row:int;
			var cell:MoCellLocation;
			var state:CellLocationState;
			var cellCode:int;
			for (var i:int = 0; i < data.length; i++) {
				cellCode = data[i];
				
				state = Enum.getElementByValue(cellCode % 10, CellLocationState, CellLocationState.LOCKED) as CellLocationState;
				col = i % region.cols;
				row = i / region.cols;
				
				trace(i + "add ", col, row);
				
				cell = new MoCellLocation(state);
				cell.addToRegion(region, col, row);
			}
		}
	}
}
