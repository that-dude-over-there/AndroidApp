package;

import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.geom.Point;
import nme.geom.Rectangle;
import nme.Lib;
import nme.Assets;

class Entity extends Sprite
{
	private var img:Bitmap;
	private var pos:Point;
	private var hitbox:Rectangle;
	private var solid:Bool;
	
	private var vspeed:Float;
	private var hspeed:Float;
	private var maxVspeed:Float;
	private var maxHspeed:Float;
	private var grav:Float;
	
	public function new(pos:Point,img:Bitmap,solid:Bool=false):Void
	{
		super();
		
		this.pos=pos;
		this.img=img;
		solid=false;
		x=pos.x;
		y=pos.y;
		maxVspeed=32;
		vspeed=0;
		hspeed-0;
		addChild(img);
		
		hitbox=new Rectangle(pos.x,pos.y,img.width,img.height);
	}
	
	public function update():Void
	{
		checkGrav();
		
		//See if we can move the full length of hspeed.
		/*for(i in 0...Math.floor(hspeed))
		{
			if (checkLevel(pos.add(new Point(hspeed-i,0)),App.level.getLevel())==null)
			{
				pos.x+=hspeed-i;
			}
		}*/
		
		if (checkLevel(pos.clone().add(new Point(hspeed,0)),App.level.getLevel())==null)
		{
			pos.x+=hspeed;
		}
		
		//See if we can move the full length of vspeed.
		for(i in 0...Math.ceil(vspeed))
		{
			if (checkLevel(pos.clone().add(new Point(0,vspeed-(i*(Std.int(vspeed/Math.abs(vspeed)))))),App.level.getLevel())==null)
			{
				pos.y+=vspeed-i;
			}
		}
		
		x=pos.x;
		y=pos.y;
		hitbox.x=x;
		hitbox.y=y;
	}
	
	public function checkCol(offset:Point,obj:Entity):Entity
	{
		hitbox.x+=offset.x;
		hitbox.y+=offset.y;
		
		if (hitbox.intersects(obj.hitbox))
		{
			hitbox.x=x;
			hitbox.y=y;
			return(obj);
		}
		else
		{
			hitbox.x=x;
			hitbox.y=y;
			return(null);
		}
	}
	
	public function checkGrav():Void
	{
		if (grav!=0)
		{
			vspeed+=maxVspeed*grav;
		}
		if (Math.abs(vspeed)>maxVspeed)
		{
			vspeed=maxVspeed*(Std.int(vspeed/Math.abs(vspeed)));
		}
	}
	
	public function checkLevel(offset:Point,obj:Array<Entity>):Entity
	{
		for(i in 0...obj.length)
		{
			if (obj[i]==null)
				continue;
				
			if (checkCol(offset,obj[i])!=null)
			{
				return(obj[i]);
			}
		}
		return(null);
	}
}