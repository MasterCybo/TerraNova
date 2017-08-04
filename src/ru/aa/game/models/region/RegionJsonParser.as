package ru.aa.game.models.region
{
	import ru.aa.game.models.collections.Grid;
	import ru.aa.game.models.region.enum.RegionState;
	import ru.aa.game.models.region.enum.RegionType;
	import ru.arslanov.core.enum.Enum;
	
	public class RegionJsonParser
	{
		public function RegionJsonParser()
		{
		}
		
		public static function parseMapArray(grid:Grid, data:Array):void
		{
			var col:int;
			var row:int;
			var type:RegionType;
			var cell:MoRegionCell;
			var state:RegionState;
			var cellCode:int;
			for (var i:int = 0; i < data.length; i++) {
				cellCode = data[i];
				type = Enum.getElementByValue(cellCode / 10, RegionType, RegionType.EMPTY) as RegionType;
				state = Enum.getElementByValue(cellCode % 10, RegionState, RegionState.LOCKED) as RegionState;
				col = i % grid.cols;
				row = i / grid.cols;
				
				trace("add " + i, col, row, type);
				
				cell = new MoRegionCell(type, state);
				grid.addCellAt(col, row, cell);
			}
		}
	}
}
