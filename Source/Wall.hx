package;

import nme.Assets;
import nme.geom.Point;
import nme.display.Bitmap;

class Wall extends Entity
{
	public function new(pos:Point,img:Bitmap,solid:Bool):Void
	{
		super(pos,img,solid);
		
		x=pos.x;
		y=pos.y;
	}
}