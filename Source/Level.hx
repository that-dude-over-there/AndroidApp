package;

import nme.geom.Point;
import nme.Lib;

class Level
{
	private var level:Array<Entity>;
	private var count:Int;
	
	public function new():Void
	{
		level=new Array<Entity>();
		count=0;
	}
	
	
	public function add(obj:Entity):Void
	{
		level[count++]=obj;
	}
	
	public function getLevel():Array<Entity>
	{
		return(level);
	}
	
	public function loadEnts():Void
	{
		for(i in 0...level.length)
		{
			if (level[i]!=null)
			{
				Lib.current.stage.addChild(level[i]);
			}
		}
	}
}