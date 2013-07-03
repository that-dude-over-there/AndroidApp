package;

import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.geom.Point;
import nme.Lib;

class Button extends Sprite
{
	private var pressed:Bool;
	public var pos:Point;
	private var img:Bitmap;
	
	public function new(img:Bitmap,pos:Point):Void
	{
		super();
		
		this.img=img;
		this.pos=pos;
		pressed=false;
		addChild(img);
		x=pos.x;
		y=pos.y;
		addEventListener(TouchEvent.TOUCH_BEGIN,touchPress);
		addEventListener(TouchEvent.TOUCH_END,touchRelease);
	}
	
	private function touchPress(e:TouchEvent):Void
	{
		pressed=true;
	}
	
	private function touchRelease(e:TouchEvent):Void
	{
		pressed=false;
	}
	
	public function isPressed():Bool
	{
		return(pressed);
	}
}