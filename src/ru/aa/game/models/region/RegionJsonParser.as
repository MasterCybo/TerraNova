package ru.aa.game.models.region
{
	import ru.aa.game.models.collections.Grid;
	import ru.aa.game.models.region.enum.CellRegionState;
	import ru.aa.game.models.region.enum.CellRegionType;
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
			var type:CellRegionType;
			var cell:MoCellRegion;
			var state:CellRegionState;
			var cellCode:int;
			for (var i:int = 0; i < data.length; i++) {
				cellCode = data[i];
				
				type = Enum.getElementByValue(int(cellCode / 10), CellRegionType, CellRegionType.EMPTY) as CellRegionType;
				state = Enum.getElementByValue(cellCode % 10, CellRegionState, CellRegionState.LOCKED) as CellRegionState;
				col = i % grid.cols;
				row = i / grid.cols;
				
				trace(i + "add ", col, row, type);
				
				cell = new MoCellRegion(type, state);
				grid.addCellAt(col, row, cell);
			}
		}
	}
}
