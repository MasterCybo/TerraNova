package ru.aa.game.models.region
{
	import ru.aa.game.models.region.enum.CellRegionState;
	import ru.arslanov.core.enum.Enum;
	
	public class RegionJsonParser
	{
		public function RegionJsonParser()
		{
		}
		
		public static function parseMapArray(region:MoRegion, data:Array):void
		{
			var col:int;
			var row:int;
			var cell:MoCellRegion;
			var state:CellRegionState;
			var cellCode:int;
			for (var i:int = 0; i < data.length; i++) {
				cellCode = data[i];
				
				state = Enum.getElementByValue(cellCode % 10, CellRegionState, CellRegionState.LOCKED) as CellRegionState;
				col = i % region.cols;
				row = i / region.cols;
				
				trace(i + "add ", col, row);
				
				cell = new MoCellRegion(state);
				cell.addToRegion(region, col, row);
			}
		}
	}
}
