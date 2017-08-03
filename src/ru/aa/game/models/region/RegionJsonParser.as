package ru.aa.game.models.region
{
	import ru.aa.game.core.data.ModelBase;
	import ru.aa.game.models.collections.Grid;
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
			var cell:ModelBase;
			for (var i:int = 0; i < data.length; i++) {
				type = Enum.getElementByValue(data[i], RegionType, RegionType.EMPTY) as RegionType;
				col = i % grid.cols;
				row = i / grid.cols;
				
				trace("add " + i, col, row, type);
				
				cell = new MoRegionCell(type);
				grid.addObjectAt(col, row, cell);
			}
		}
	}
}
